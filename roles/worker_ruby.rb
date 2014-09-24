name 'worker_ruby'
description 'Travis Ruby Worker for Linux'
default_attributes(
  'golang' =>
    { 'multi' =>
      {
        'aliases' => [],
        'default_version' => 'go1.3.1',
        'versions' => ['go1.3.1']
      }
    },
  'rvm' =>
      {
        'latest_minor' =>  true,
        'default' => '1.9.3',
        'rubies' => [
          { 'name' => '1.9.3' },
          { 'name' => '1.8.7' },
          { 'name' => 'jruby-1.7.15-d18', 'arguments' => '--18', 'check_for' => 'jruby-d18' }
          { 'name' => 'jruby-1.7.15-d19', 'arguments' => '--19', 'check_for' => 'jruby-d19' }
          { 'name' => 'ree' },
          { 'name' => '1.9.2' },
          { 'name' => '2.0.0' },
          { 'name' => '2.1.1' },
          { 'name' => '2.1.2' },
          { 'name' => '2.1.3' },
          { 'name' => '2.2.0-preview1' },
        ],
        'gems' => %w(bundler rake),
        'aliases' => {
          'jruby-d18'    => 'jruby-1.7.15-d18',
          'jruby-d19'    => 'jruby-1.7.15-d19',
          'jruby-18mode' => 'jruby-d18',
          'jruby-19mode' => 'jruby-d19',
          'jruby'        => 'jruby-19mode',
          '2.0'          => 'ruby-2.0.0',
          '2.1'          => 'ruby-2.1.3',
          '2.2'          => 'ruby-2.2.0-preview1'
        },
        'java' => {
          'alternate_versions' => %w(
            openjdk6,
            openjdk7,
            oraclejdk8
          )
        }
      },
  'travis_build_environment' =>
    {
      'use_tmpfs_for_builds' => false,
      'user' => 'vagrant',      # Note - vagrant only!
    }
)
run_list(
  'recipe["rvm"]',
  'recipe["rvm::multi"]',
  'recipe["java"]',
  'recipe[sweeper]'
)
