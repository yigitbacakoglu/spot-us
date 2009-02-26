# == Schema Information
# Schema version: 20090218144012
#
# Table name: networks
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Network < ActiveRecord::Base
  validates_presence_of :name, :display_name
  validates_format_of   :name, :with => /^[a-z0-9|-]+$/i

  has_many :categories, :attributes => true, :discard_if => Proc.new {|category| category.name.blank? }
end
