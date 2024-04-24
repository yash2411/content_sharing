class Audio < Content
    has_many_attached :audios

    validates :title, :description, :audios, presence: true
    validates :title, length: {maximum: 255}
    validates :description, length: {maximum: 1000}
    validate :audios_content_type
    validate :audios_limit

    belongs_to :user

    private
    
    def audios_content_type
        audios.each do |audio|
            unless audio.content_type.in?(%w(audio/mpeg))
                errors.add(:audios, "must be MP3 file")
            end
        end
    end

    def audios_limit
        if audios.attached? && audios.count > 5
            errors.add(:audios, "can't exceed 5 uploads")
        end
    end
end