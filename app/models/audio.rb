class Audio < Content
    has_many_attached :audios

    validates :title, :description, :audios, presence: true
    validate :audios_content_type

    private
    
    def audios_content_type
        audios.each do |audio|
            unless audio.content_type.in?(%w(audio/mpeg))
                errors.add(:audios, "must be MP3 file")
            end
        end
    end

end