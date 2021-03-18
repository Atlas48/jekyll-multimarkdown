# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll-multimarkdown/version"

Gem::Specification.new do |spec|
  spec.name          = "jekyll-multimarkdown"
  spec.version       = Jekyll::MultiMarkdown::VERSION
  spec.authors       = ["Atlas Cove"]
  spec.email         = ["Atlas48@gmx.com"]

  spec.summary       = "An example of Jekyll's plugin project structure"
  spec.description   = "Adds multimarkdown to jekyll"
  spec.homepage      = "https://github.com/Atlas48/jekyll-multimarkdown"
  spec.license       = "LGPL-3.0-or-later"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r!^(test|spec|features)/!)
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r!^exe/!) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "jekyll", "~> 3.8.3"
  spec.add_dependency " rmultimarkdown", "~> 6.4.0.4"

  spec.add_development_dependency "bundler", "~> 1.16.1"
  spec.add_development_dependency "minitest", "~> 5.11.3"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rubocop", "~> 0.52.0"
end
