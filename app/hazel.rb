class Hazel < Sinatra::Base
  get '/' do
    haml :index, :locals => { :body_class => 'home' }
  end
  
  get '/manage' do
    haml :manage, :locals => { :body_class => 'manage' }
  end
  
  helpers do
    def base_url
      @base_url ||= "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}"
    end
    
    def bookmarklet
      haml(:bookmarklet, :locals => {
        :url => "#{base_url}/manage", 
        :window_name => 'hazel-bookmarklet',
        :width => 500, :height => 600
      }).to_s.gsub('\n', '')
    end
  end
end