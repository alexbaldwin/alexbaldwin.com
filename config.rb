configure :development do
  # activate :livereload
  set :debug_assets, true
end

activate :blog do |blog|
  blog.permalink = ":title"
  blog.sources = "blog/:title"
  blog.layout = "layouts/blog"
  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
end

page "/feed.xml", :layout => false

activate :automatic_image_sizes

# Roll out the red carpet to fix XML parsing errors in Markdown
set :markdown,  :tables => true,
                :gh_blockcode => true,
                :fenced_code_blocks => true,
                :autolink => true
set :markdown_engine, :redcarpet

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
end

page "/lab/*.html", :layout => false
page "/sitemap.xml", :layout => false

# Pretty URLs
activate :directory_indexes
set :trailing_slash, false

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

configure :build do
  activate :minify_html
  activate :minify_css
  # activate :minify_javascript
  activate :asset_hash
  activate :cache_buster
  activate :relative_assets
  activate :gzip
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
end
