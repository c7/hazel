lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'hazel/version'

Gem::Specification.new do |s|
  s.name        = "hazel"
  s.version     = Hazel::VERSION::STRING
  s.date        = Time.now.strftime('%Y-%m-%d')
  s.summary     = "Simple asset management for the rest of us."
  s.description = "Hazel is a Sinatra application that handles " +
                  "asset management, mainly images, for a number of " +
                  "(predefined) users."
  s.email       = "peter@c7.se"
  s.homepage    = "http://c7.github.com/hazel/"
  s.authors     = ["Peter Hellberg"]
  s.licenses    = "MIT-LICENSE"

  s.executables = ['hazel']
  s.default_executable = 'hazel'

  s.rubyforge_project = 'hazel'

  s.has_rdoc          = true
  s.rdoc_options      = ['--main', 'README.rdoc', '--charset=UTF-8']
  s.extra_rdoc_files  = ['README.rdoc', 'MIT-LICENSE']

  s.files             = Dir.glob("lib/**/*") +
                        Dir.glob("app/**/*") +
                        %w(MIT-LICENSE README.rdoc)

  s.add_dependency('haml', '~> 3.0.23')
  s.add_dependency('thor', '>= 0.14.4')
  s.add_dependency('sinatra', '>= 1.1.0')
end
