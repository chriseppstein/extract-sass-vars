require 'sass'
require "extract-sass-vars/version"

# We need access to the environment's children created in the perform visitor
class Sass::Environment
  attr_accessor :children
  alias old_initialize initialize
  def initialize(parent = nil, options = nil)
    old_initialize(parent,options)
    self.children = []
    if parent
      parent.children << self
    end
  end
end

class VariableExtractor
  def initialize(filename)
    @filename = filename
  end

  def extract
    engine = Sass::Engine.for_file(@filename, {})
    tree = engine.to_tree
    environment = Sass::Environment.new
    visitor = Sass::Tree::Visitors::Perform.new(environment)
    visitor.send(:visit, tree)
    environment.children.each do |child_env|
      vars = child_env.instance_variable_get("@vars")
      return vars
    end
  end
end

