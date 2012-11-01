require 'rubygems'
require 'middleman/rack'

run Middleman.server

require "rack/contrib/try_static"
use Rack::TryStatic, :root => "build", :urls => %w[/], :try => ['.html']