module Hazel
  module Helpers
    def base_url
      @base_url ||= "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}"
    end

    def bookmarklet
      url = "#{base_url}/"
      name = 'hazel-bookmarklet'
      width = 750
      height = 550

      "javascript:hazel=window.open('#{url}','#{name}'," +
      "'width=#{width},height=#{height}');" +
      "if(window.focus){ hazel.focus(); }"
    end
  end
end
