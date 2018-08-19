# == Schema Information
#
# Table name: places
#
#  id          :integer          not null, primary key
#  name        :string
#  address     :string
#  description :text
#  lat         :float
#  lng         :float
#  owner_id    :integer
#  city        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Place < ApplicationRecord

#direct
belongs_to :owner, :class_name => "User"
has_many :likes, :dependent => :destroy

#indirect
has_many :followers, :through => :owner, :source => :following
has_many :fans, :through => :likes, :source => :user

end
