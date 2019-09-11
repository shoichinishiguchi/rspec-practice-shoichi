# -*- encoding: utf-8 -*-
# stub: terrapin 0.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "terrapin"
  s.version = "0.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Jon Yurek"]
  s.date = "2018-02-02"
  s.description = "Run shell commands safely, even with user-supplied values"
  s.email = "jyurek@thoughtbot.com"
  s.homepage = "https://github.com/thoughtbot/terrapin"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Run shell commands safely, even with user-supplied values"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<climate_control>, ["< 1.0", ">= 0.0.3"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<bourne>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<activesupport>, ["< 5.0", ">= 3.0.0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
    else
      s.add_dependency(%q<climate_control>, ["< 1.0", ">= 0.0.3"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<bourne>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<activesupport>, ["< 5.0", ">= 3.0.0"])
      s.add_dependency(%q<pry>, [">= 0"])
    end
  else
    s.add_dependency(%q<climate_control>, ["< 1.0", ">= 0.0.3"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<bourne>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<activesupport>, ["< 5.0", ">= 3.0.0"])
    s.add_dependency(%q<pry>, [">= 0"])
  end
end
