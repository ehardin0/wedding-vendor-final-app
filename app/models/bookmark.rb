# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fan_id     :integer
#  vendor_id  :integer
#
class Bookmark < ApplicationRecord
  belongs_to(:fan, { :required => true, :class_name => "User", :foreign_key => "fan_id", :counter_cache => true })
  belongs_to(:vendor, { :required => true, :class_name => "Vendor", :foreign_key => "vendor_id" })
end
