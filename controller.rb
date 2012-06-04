# encoding: utf-8

require 'sass'
require 'redcarpet'
require 'tilt'
require 'yaml'

# ignorando archivos
ignore /\/_.*/        # archivos que comienzan con _
ignore /\/\..*/       # archivos que comienzan con .
ignore /\/Gemfile.*/  # Gemfile y relacionados
ignore /\/README.*/   # READMEs
ignore /\/.*\.yml/    # archivos YAML

# priority /.*/markdown/ => 1, 'index.html.erb' => 2

layout 'layout.html.erb'

before 'index.html.erb' do
  chapters_path = File.expand_path("../capitulos/", __FILE__) + "**/*"
  @chapters = []
  Dir[chapters_path].each do |chapter_path|
    @chapters << Chapter.new(chapter_path)
  end
end

helpers do
  def link_to(text, url)
    "<a href='#{url}' title='#{text}'>#{text}</a>"
  end
end

# probablemente seria bueno mover esto a lib
class Chapter
  attr_reader :path

  def initialize(full_path)
    @path = full_path.split("/").last
  end

  def id
    path.gsub('.html.markdown', '')
  end

  def url
    '/capitulos/' + path.gsub('.markdown', '')
  end

  def position
    id.split("-").first
  end

  def title
    split_id = id.split("-")
    split_id.shift
    split_id.join(" ").capitalize
  end

  def to_link
    "<a href='#{url}' title='#{title}'>#{title}</a>"
  end
end