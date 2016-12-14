class MakersBnb < Sinatra::Base

	get '/listings/new' do
		erb :'listings/new'
	end

	post '/listings/add' do
		@listing = Listing.create(name: params[:name],
								description: params[:description],
								price: params[:price],
								city: params[:city],
								country: params[:country],
								available_from: params[:available_from],
								available_until: params[:available_until])
		redirect '/users/listings'

	end

	get '/listings' do
		@listings = Listing.all
		erb :'listings/index'
	end

	get '/listings/:id' do
		@listing = Listing.first( id: params[:id] )
		erb :'listings/detail'
	end

	post '/listings/:id/request' do

		@request = Request.create(user_id: current_user.id, listing_id: 1 )
		redirect '/users/requests'
	end

end
