# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  bookmarks_count :integer
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:comments, { :class_name => "Comment", :foreign_key => "author_id", :dependent => :destroy })
  has_many(:bookmarks, { :class_name => "Bookmark", :foreign_key => "fan_id", :dependent => :destroy })
end
