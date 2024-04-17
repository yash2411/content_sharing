namespace :db do
    desc "reset the database and reset the session"
    task reset_and_clear_session: :environment do
        Rake::Task["db:reset"].invoke
        Rails.logger.info "Database reset complete."
    end
end
