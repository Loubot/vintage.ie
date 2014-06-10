# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  price       :decimal(8, 2)
#  description :text
#  name        :string(255)
#  size        :float
#  created_at  :datetime
#  updated_at  :datetime
#

class Item < ActiveRecord::Base
	has_many :photos, as: :imageable
	belongs_to :shop
end
