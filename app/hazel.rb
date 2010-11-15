class Hazel < Sinatra::Base
  get '/' do
    haml :index, :locals => { :body_class => 'home' }
  end
  
  get '/assets' do
    haml :assets, :locals => { :body_class => 'assets' }
  end
  
  helpers do
    def base_url
      @base_url ||= "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}"
    end
    
    def bookmarklet
      haml(:bookmarklet, :locals => {
        :url => "#{base_url}/assets", 
        :window_name => 'hazel-bookmarklet',
        :width => 750, :height => 550
      }).to_s.gsub('\n', '')
    end
  end
end