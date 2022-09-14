class User < ApplicationRecord
    mount_uploader :file, UserUploader
    serialize :file, JSON
end
