class Document < Content
    has_many_attached :files

    validates :title, :description, :files, presence: true
    validates :title, length: {maximum: 255}
    validates :description, length: {maximum: 1000}
    validate :files_content_type
    validate :files_limit

    belongs_to :user

    private
    
    def files_content_type
        files.each do |audio|
            unless audio.content_type.in?(%w(audio/mpeg))
                errors.add(:files, "must be MP3 file")
            end
        end
    end

    def files_limit
        if files.attached? && files.count > 5
            errors.add(:files, "can't exceed 5 uploads")
        end
    end
end