class Upload < ActiveRecord::Base

  belongs_to :user

  has_attached_file :attachment
  validates_attachment_content_type :attachment, content_type: 'application/octet-stream'
  validates_attachment_file_name :attachment, matches: [/dat\Z/]

end
