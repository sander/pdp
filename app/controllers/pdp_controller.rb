class PdpController < ApplicationController
  def index
    name = '/Users/sander/Dropbox/M1.2/PDP/PDP.md'
    name = '/home/sander/www/pdp-m12.md' unless File.exist? name
    source = File.read name
    renderer = Redcarpet::Render::HTML.new with_toc_data: true, hard_wrap: true
    markdown = Redcarpet::Markdown.new renderer, footnotes: true, strikethrough: true
    html = markdown.render source
    @date = Time.now.strftime '%B %e, %Y'
    @version = 'f'
    @pdp = html.html_safe
  end
end
