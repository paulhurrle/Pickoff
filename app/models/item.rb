class Item < ActiveRecord::Base
	belongs_to :user
	after_create :expires

	private

	def expires
		item = Item.last
		
		item.update_attribute(:expires_at, item.created_at + 7.days)
	end
end
