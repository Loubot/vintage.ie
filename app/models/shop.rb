# == Schema Information
#
# Table name: shops
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  url         :string(255)
#  merchant_id :integer
#  address     :text
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Shop < ActiveRecord::Base
	has_many :photos, as: :imageable
end
