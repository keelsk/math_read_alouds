require_relative "./math_read_alouds/version"
require_relative "./math_read_alouds/cli"
require_relative "./math_read_alouds/scraper"
require_relative "./math_read_alouds/book"
require_relative "./math_read_alouds/topic"

require 'pry'
require 'nokogiri'
require 'open-uri'
require 'colorize'

module MathReadAlouds
  class Error < StandardError; end
  # Your code goes here...
end
