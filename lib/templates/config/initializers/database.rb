<% unless @database.empty? -%>
require "yaml"
settings = YAML::load_file("config/db.yml")
<% if @database != 'mongo' -%>
# Sequel Configuration
DB = Sequel.connect(settings[ENV['RACK_ENV']])
<% else -%>
# MongoDB Configuration
<% end -%>
<% end -%>
