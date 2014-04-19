class PdpController < ApplicationController
  def index
    name = '/Users/sander/Dropbox/M1.1/PDP/PDP.md'
    source = File.read name
    #markdown = Redcarpet::Markdown.new PDPFile
    renderer = Redcarpet::Render::HTML.new with_toc_data: true, hard_wrap: true
    markdown = Redcarpet::Markdown.new renderer, footnotes: true
    html = markdown.render source
    @pdp = html.html_safe
  end
end
