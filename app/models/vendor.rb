# == Schema Information
#
# Table name: vendors
#
#  id             :integer          not null, primary key
#  category       :string
#  comments_count :integer
#  description    :text
#  geography      :string
#  name           :string
#  website        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Vendor < ApplicationRecord
  has_many(:comments, { :class_name => "Comment", :foreign_key => "vendor_id", :dependent => :destroy })
  has_many(:bookmarks, { :class_name => "Bookmark", :foreign_key => "vendor_id", :dependent => :destroy })
end
