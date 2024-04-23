class Image < Content
    has_many_attached :images

    validates :images, presence: true
    validate :image_content_type

    private
    
    def image_content_type
        images.each do |image|
            unless image.content_type.in?(%w(image/jpg image/jpeg image/png))
                errors.add(:base, "must be image")
            end
        end
    end
end