feed_name = 'Alex Baldwin'
site_url = 'http://alexbaldwin.com/'
author_name = 'Alex Baldwin'

xml.instruct!
xml.feed xmlns: 'http://www.w3.org/2005/Atom' do
  xml.title feed_name
  xml.id URI.join(site_url, blog.options.prefix.to_s)
  xml.link href: URI.join(site_url, blog.options.prefix.to_s)
  xml.link href: URI.join(site_url, current_page.path), rel: 'self'
  xml.author { xml.name author_name }

  unless blog.articles.empty?
    xml.updated blog.articles.first.date.to_time.iso8601

    blog.articles.each do |article|
      if article.published?
        xml.entry do
          xml.title article.title
          xml.link href: URI.join(site_url, article.url), rel: 'alternate'
          xml.id URI.join(site_url, article.url)
          xml.published article.date.to_time.iso8601
          xml.updated File.mtime(article.source_file).iso8601
          xml.author { xml.name author_name }
          xml.summary article.summary.gsub(/<\/?[^>]*>/, ""), type: 'html'
          xml.content article.body.gsub(/<\/?[^>]*>/, ""), type: 'html'
        end
      end
    end
  end
end
