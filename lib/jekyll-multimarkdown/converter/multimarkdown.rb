# frozen_string_literal: true
require "jekyll"
module Jekyll
  module MultiMarkdown
    class MultiMarkdownConverter < Converter
      safe true
      priority :low
      def initialize(config = {})
        @config = Jekyll::Utils.deep_merge_hashes(DEFAULT_CONFIGURATION, config)
        @setup = false
      end
      def setup
        return if @setup
        require 'rmultimarkdown'
        @setup = true
      rescue LoadError
        STDERR.puts 'Cannot find rmultimarkdown, please install'
        STDERR.puts '  $ [sudo] gem install RedCloth'
        raise Errors::FatalException.new("Missing dependency: RedCloth")
      end
      def matches(ext)
        t=ext.split('.').last
        t=="mmd"||(t=="md"&&@config['mmd_override'])
      end
      def output_ext(_ext)
        ".html"
      end
      def convert(content)
        MultiMarkdown.new(content).to_html
      end
    end
  end
end
