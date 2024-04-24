class Video < Content
    has_many_attached :videos

    validates :title, :description, :videos, presence: true
    validates :title, length: {maximum: 255}
    validates :description, length: {maximum: 1000}
    validate :videos_content_type
    validate :videos_limit

    private
    
    def videos_content_type
        videos.each do |video|
            unless video.content_type.in?(%w(video/mp4))
                errors.add(:videos, "must be MP3 file")
            end
        end
    end

    def videos_limit
        if videos.attached? && videos.count > 5
            errors.add(:videos, "can't exceed 5 uploads")
        end
    end
end