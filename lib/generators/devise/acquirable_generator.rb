# frozen_string_literal: true

require 'rails/generators/active_record'

module Devise
  module Generators
    class AcquirableGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path('templates', __dir__)

      desc 'Generate migration for ActiveRecord and add :acquirable directive in the given model.'

      def copy_migration
        migration_template 'migration.rb', "db/migrate/devise_acquirable_add_to_#{table_name}.rb",
                           migration_version: migration_version
      end

      def inject_devise_acquirable_content
        path = File.join('app', 'models', "#{file_path}.rb")
        inject_into_file(path, 'acquirable, :', after: 'devise :') if File.exist?(path)
      end

      private

      def versioned_migrations?
        Rails::VERSION::MAJOR >= 5
      end

      def migration_version
        "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]" if versioned_migrations?
      end
    end
  end
end
