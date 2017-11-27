$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "erp/employees/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "erp_employees"
  s.version     = Erp::Employees::VERSION
  s.authors     = ["Son Nguyen",
                  "Hung Nguyen"]
  s.email       = ["1633645@hcmut.edu.vn",
                  "1633514@hcmut.edu.vn"]
  s.homepage    = "http://hcmut.edu.vn/"
  s.summary     = "Employees features of Erp System."
  s.description = "Employees features of Erp System."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 5.1.4"
  s.add_dependency "erp_core"
  s.add_dependency "deface"
end
