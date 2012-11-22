Gem::Specification.new do |gem|
  gem.name          = "rack-request_time"
  gem.version       = "0.0.1"
  gem.authors       = ["onk"]
  gem.email         = ["takafumi.onaka@gmail.com"]
  gem.description   = %q{Rack middleware for using consistent time in request.}
  gem.summary       = %q{Rack::RequestTime is a Rack middleware for using consistent time in request.}
  gem.homepage      = "https://github.com/onk/rack-request_time"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "rack"
  gem.add_dependency "activesupport"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "timecop"
end

