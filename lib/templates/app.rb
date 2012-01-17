class <%= @name.camel_case %> < Sinatra::Base

  set :public_folder => "public", :static => true

  get "/" do
    @version     = RUBY_VERSION
    @environment = ENV['RACK_ENV']

    erb :welcome
  end
end
