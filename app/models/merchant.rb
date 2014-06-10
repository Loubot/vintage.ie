# == Schema Information
#
# Table name: merchants
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  phone      :integer
#  logo       :string(255)
#  url        :string(255)
#  address    :text
#  email      :text
#  created_at :datetime
#  updated_at :datetime
#

class Merchant < ActiveRecord::Base
	has_many :photos, as: :imageable
	has_many :shops
	validates :email, confirmation: true, uniqueness: { case_sensitive: false }
  validates :email_confirmation, presence: true
end
