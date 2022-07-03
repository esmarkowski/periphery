# frozen_string_literal: true
require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.setup # ready!

require 'active_support/all'
require 'tracery'
require 'terminal-table'

module Periphery
  class Error < StandardError; end
  # Your code goes here...
end
