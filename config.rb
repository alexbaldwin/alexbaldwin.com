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
helpers do
  def hack_design_users
    require 'open-uri'
    require 'json'

    url = 'http://www.hackdesign.org/stats.json'
    buffer = open(url, "UserAgent" => "Ruby-Wget").read
    result = JSON.parse(buffer)
    user_count = result['users'].to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse

    user_count
  end

  def family_videos
    require 'youtube_it'
    client = YouTubeIt::Client.new(
      username: 'alexbaldwin@gmail.com',
      password: 'lejmgpfvdkfaweti',
      dev_key: 'AI39si7Q8ON9jLp5bDuCZ48rxnMDmBjQzbSBleqQYi07n9s-Ly9efV7vXIkT_Lqb3-1Vk_3wWePB2hQxx3oFUkSXINUpalLVfw'
    )

    playlist = client.my_videos
    playlist_videos = playlist.videos

    playlist_videos
  end
end

page "/lab/*.html", :layout => false
page "/sitemap.xml", :layout => false

# Pretty URLs
activate :directory_indexes
set :trailing_slash, false

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
  # activate :minify_javascript

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

activate :deploy do |deploy|
  deploy.method = :git
end
