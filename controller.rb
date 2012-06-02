require 'haml'
require 'redcarpet'
require 'tilt'

class Tilt::HamlTemplate
  def prepare
    options = @options.merge(:filename => eval_file, :line => line)
    options[:format] = :html5
    options = options.merge :ugly => true
    @engine = ::Haml::Engine.new(data, options)
  end
end

layout 'layout.html.haml'

before 'index.html.haml' do
  @chapters = {}

  Dir['capitulos/*.markdown'].each do |chapter|
    chapter.gsub!('capitulos/', '')
    chapter_number, chapter_title = chapter.split("-")
    chapter_title.gsub!('.html.markdown', '')
    @chapters.merge! chapter_number => chapter_title
  end
end

helpers do
  def link_to(text, url)
    "<a href='#{url}'>#{text}</a>"
  end
end