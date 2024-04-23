class Video < Content
    has_many_attached :videos

    validates :title, :description, :videos, presence: true
    validate :videos_content_type

    private
    
    def videos_content_type
        videos.each do |video|
            unless video.content_type.in?(%w(video/mp4))
                errors.add(:videos, "must be MP3 file")
            end
        end
    end
end