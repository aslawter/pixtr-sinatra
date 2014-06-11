require "sinatra"
require "active_record"
require "pg"

ActiveRecord::Base.establish_connection(
	adapter: "postgresql",
	database: "photo_gallery"
	)

class Gallery < ActiveRecord::Base
end

get "/" do
	@galleries = Gallery.all
	erb :index
end

get "/:gallery_name" do
	cat_images_in_app_rb = ["colonel_meow.jpg", "grumpy_cat.png"]
	dog_images_in_app_rb = ["dogs.png"]
	
	gallery_name = params[:gallery_name]
		erb(gallery_name.to_sym, {
		locals: {
			cat_images: cat_images_in_app_rb,
			dog_images: dog_images_in_app_rb
		}
	})
end

