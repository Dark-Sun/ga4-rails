$LOAD_PATH.push File.expand_path('lib', __dir__)

require_relative 'lib/ga4-rails'

Gem::Specification.new do |spec|
  spec.name = 'ga4-rails'
  spec.version = Ga4Rails::VERSION
  spec.authors = ['Andriy Lukashchuk']
  spec.email = ['andriy.lks@gmail.com']

  spec.summary = 'Efortlessly integrate Google Analytics 4 with your Rails app'
  spec.homepage = 'http://github.com/Dark-Sun/ga4-rails'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['allowed_push_host'] = "https://rubygems.org/"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'http://github.com/Dark-Sun/ga4-rails'
  spec.metadata['changelog_uri'] = 'http://github.com/Dark-Sun/ga4-rails/changelog'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(
        %r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)}
      )
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = %w(lib)

  # Uncomment to register a new dependency of your gem
  spec.add_dependency 'google-apis-analyticsadmin_v1alpha'
  spec.add_dependency 'google-apis-analyticsdata_v1beta'

  spec.add_development_dependency 'rubocop'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
