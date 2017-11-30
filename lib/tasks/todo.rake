namespace :todo do
  desc "deletes any item not marked as 'complete' after 7 days of creation"
  task delete_items: :environment do
	  Item.where('expires_at <= ?', Time.now).destroy_all
  end

end
