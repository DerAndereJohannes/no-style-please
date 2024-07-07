require 'liquid'
require 'uri'

module URLToLinkFilter
  def url_to_link(input)
    input.gsub(URI.regexp(['http', 'https']), '<a href="\0">\0</a>')
  end
end

Liquid::Template.register_filter(URLToLinkFilter)

