require 'dotenv'
Dotenv.load

###
# Blog settings
###

# Time.zone = "UTC"

activate :blog do |blog|
  # blog.prefix = "blog"
  blog.permalink = ":title"
  blog.sources = "blog/:title"
  # blog.taglink = "tags/:tag.html"
  blog.layout = "layouts/blog"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = ":year.html"
  # blog.month_link = ":year/:month.html"
  # blog.day_link = ":year/:month/:day.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/:num"
end

page "/feed.xml", :layout => false

###
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Roll out the red carpet to fix XML parsing errors in Markdown
set :markdown,  :tables => true,
                :gh_blockcode => true,
                :fenced_code_blocks => true,
                :autolink => true
set :markdown_engine, :redcarpet

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

page "/lab/*", :layout => "lab"

page "/sitemap.xml", :layout => false

# Pretty URLs
activate :directory_indexes

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # Squeeze that html down
  activate :minify_html

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Uniquely-named assets
  activate :asset_hash

  # Enable cache buster
  activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  activate :gzip

  # Or use a different image path
  # set :http_path, "/Content/images/"
end

# Livereload action
# activate :livereload

# Activate sync extension
activate :sync do |sync|
  sync.fog_provider = 'AWS' # Your storage provider
  sync.fog_directory = ENV['S3_BUCKET'] # Your bucket name
  sync.fog_region = ENV['S3_REGION'] # The region your storage bucket is in (eg us-east-1, us-west-1, eu-west-1, ap-southeast-1 )
  sync.aws_access_key_id = ENV['AWS_ACCESS'] # Your Amazon S3 access key
  sync.aws_secret_access_key = ENV['AWS_SECRET'] # Your Amazon S3 access secret
  sync.existing_remote_files = 'delete' # What to do with your existing remote files? ( keep or delete )
  sync.gzip_compression = true # Automatically replace files with their equivalent gzip compressed version
  sync.after_build = false # Disable sync to run after Middleman build ( defaults to true )
end

activate :cloudfront do |cloudfront|
  cloudfront.access_key_id = ENV['AWS_ACCESS']
  cloudfront.secret_access_key = ENV['AWS_SECRET']
  cloudfront.distribution_id = ENV['CF_DISTRIBUTION']
  cloudfront.filter = /\.html$/i  # default is /.*/
end
