class Image < ActiveRecord::Base

  has_attached_file :avatar,
 :storage => :dropbox,
:dropbox_credentials => "#{Rails.root}/config/dropbox_config.yml",
:default_url => ":styles/missing.jpg",
 :styles => { :medium => "300x300" , :thumb => "100x100>"},
:dropbox_options => {
:path => proc { |style| "#{Rails.env}/#{style}/#{id}_#{avatar.original_filename}"},:unique_filename => true
  }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


end
