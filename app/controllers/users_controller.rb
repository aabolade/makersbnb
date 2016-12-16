class MakersBnb < Sinatra::Base

  get "/users/new" do
    if current_user
      redirect "/listings"
    else
      erb :'users/sign_up'
    end
  end

  post "/users" do
    user = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirm] )
      #require 'pry';binding.pry
    if user.id == nil
      flash.next[:sign_up_error] = "Passwords do not match Please try again."
      redirect '/users/new'
    else
      redirect '/listings'
    end
  end

  get "/users/requests" do
    @renter_bookings = current_user.bookings
    @owner_bookings = current_user.listings.bookings
    erb :'users/requests'
  end

end
