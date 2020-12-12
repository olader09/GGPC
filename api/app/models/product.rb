class Product < ApplicationRecord
    mount_uploader :picture, ProductPictureUploader
    mount_base64_uploader :picture, ProductPictureUploader
end