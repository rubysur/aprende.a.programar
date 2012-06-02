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