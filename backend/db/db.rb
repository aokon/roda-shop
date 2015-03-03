require 'yaml'

module DB
  extend self

  ROOT_PATH = File.expand_path('../../', __FILE__).freeze
  POSTGRES_ADAPTER = 'postgres'.freeze
  SQLITE_ADAPTER = 'sqlite'.freeze

  ConfigNotFound = Class.new(StandardError)
  UndefinedAdapter = Class.new(StandardError)

  def rom
    @rom ||= setup
  end

  def setup
    load 'Rakefile'
    Rake::Task['db:migrate'].invoke

    load_files
    ::ROM.finalize.env
  end

  def connection
    case config[:adapter]
    when POSTGRES_ADAPTER
      load_postgres_adapter(config)
    when SQLITE_ADAPTER
      load_sqlite_adapter
    else
      raise UndefinedAdapter
    end.default.connection
  end

  private
  def config
    @config ||= begin
      config_path = File.join(ROOT_PATH, 'config', 'database.yml')
      raise ConfigNotFound unless File.exists?(config_path)
      YAML.load_file(config_path)[ENV.fetch('RACK_ENV', 'development')]
    end
  end

  def load_sqlite_adapter
    require 'sqlite3'
    ::ROM.setup(:sql, 'sqlite::memory')
  end

  def load_postgres_adapter(config)
    require 'pg'
    ::ROM.setup(:sql, config[:url])
  end

  def load_files
    %w(relations models mappers commands).each do |item|
      Dir[File.join(ROOT_PATH, 'db', item, '**', '*.rb')].each { |f| require(f) }
    end
  end
end
