class Hazel < Sinatra::Base
  get '/' do
    haml :index, :locals => { :body_class => 'home' }
  end
  
  get '/assets' do
    haml :assets, :locals => { :body_class => 'assets' }
  end
  
  get '/assets/upload' do
    
  end
  
  get '/assets/embed' do
    
  end
  
  helpers do
    def base_url
      @base_url ||= "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}"
    end
    
    def bookmarklet
      haml(:bookmarklet, :locals => {
        :url => "#{base_url}/assets", 
        :window_name => 'hazel-bookmarklet',
        :width => 500, :height => 600
      }).to_s.gsub('\n', '')
    end
  end
end