class Attachment < ActiveRecord::Base

  mount_uploader :file, FileUploader

  belongs_to :project
  
  attr_accessible :file, :file_cache

end