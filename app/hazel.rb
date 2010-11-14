class Hazel < Sinatra::Base
  get '/' do
    haml :index, :locals => { :body_class => 'home' }
  end
end