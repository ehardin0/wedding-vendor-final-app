# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#  vendor_id  :integer
#
class Comment < ApplicationRecord
  belongs_to(:author, { :required => true, :class_name => "User", :foreign_key => "author_id" })
  belongs_to(:subject, { :required => true, :class_name => "Vendor", :foreign_key => "vendor_id", :counter_cache => true })
end
