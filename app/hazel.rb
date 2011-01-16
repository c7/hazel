require "./hazel/helpers.rb"

module Hazel
  class App < Sinatra::Base
    get '/' do
      haml :index, :locals => { :body_class => 'assets' }
    end

    get '/about' do
      haml :about, :locals => { :body_class => 'about' }
    end

    helpers Helpers
  end
end
