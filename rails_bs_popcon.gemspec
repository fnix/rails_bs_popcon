$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_bs_popcon/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_bs_popcon"
  s.version     = RailsBsPopcon::VERSION
  s.authors     = ["Kadu Diógenes"]
  s.email       = ["kadu.diogenes@fnix.com.br"]
  s.homepage    = "https://github.com/fnix/rails_bs_popcon"
  s.summary     = "Bootstrap popover for confirmation."
  s.description = "Uses bootstrap popover to show confirmation buttons for links with data-confirm."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2"
end
