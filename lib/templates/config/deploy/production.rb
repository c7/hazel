role :web, "<%= @name %>.tld"
role :app, "<%= @name %>.tld"
role :db,  "<%= @name %>.tld", :primary => true
