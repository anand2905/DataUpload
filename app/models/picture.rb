class Picture < ApplicationRecord
  belongs_to :user
  has_attached_file :file_image, styles: { image_index: "250x350>",
    image_show: "350x475>" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :file_image, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :file_image, content_type: /^image\/(png|gif|jpeg|jpg)/
end
