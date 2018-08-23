# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  place_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Like < ApplicationRecord
#direct
belongs_to :user
belongs_to :place

 validates :place_id, uniqueness: { scope: :user_id,
    message: "You already like this" }

end
