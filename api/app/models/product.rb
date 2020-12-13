class Product < ApplicationRecord
    validates :price, :name, presence: true
    mount_uploader :picture, ProductPictureUploader
    mount_base64_uploader :picture, ProductPictureUploader
end