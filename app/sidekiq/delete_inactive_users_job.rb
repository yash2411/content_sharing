class DeleteInactiveUsersJob
  include Sidekiq::Job

  def perform(*args)
    users = User.where("created_at < ?", Time.now - 1.day)
    users.each do |user|
      if user.profile.nil?
        user.destroy
      end
    end
  end
end
