# frozen_string_literal: true

require "jekyll"
require "liquid"

module Jekyll
  module Filters
    def mmarkdownify(input)
      site = @context.registers['site']
      converter = if site.respond_to?(:find_converter_instance)
         site.find_converter_instance(Jekyll::Converters::MultiMarkdown)
      else
         site.getConverterImpl(Jekyll::Converters::Textile
      end
      converter.convert(input)
    end
  end
end

Liquid::Template.register_filter(Jekyll::MultiMarkdown::MMarkdownify)
