module Tenantable
  module Model
    extend ActiveSupport::Concern

    included do
      before_validation :generating_schema_name
      validates :schema, presence: true
    end

    module ClassMethods
      
      def set_search_path(schema, include_public = true)
        ActiveRecord::Base.connection.schema_search_path = [schema, ("public" if include_public)].compact.join(",")
      end
      
      def create_schema(schema_name)
        sql = %{CREATE SCHEMA "#{schema_name}" }
        ActiveRecord::Base.connection.execute sql
      end

      def schemas
        sql = "SELECT nspname FROM pg_namespace WHERE nspname !~ '^pg_.*'"
        ActiveRecord::Base.connection.query(sql).flatten
      end

      def scoped_schema(schema_name, include_public = true)
        create_schema(schema_name) unless schemas.include?(schema_name)
        set_search_path(schema_name, include_public)
        yield
        restore_default_search_path
      end
      
      def restore_default_search_path
         ActiveRecord::Base.connection.schema_search_path = %{"$user", public}
      end

    end

    module InstanceMethods

      def generate_schema_UUID
        alphabet = ('a'..'z').to_a
        first_letter = alphabet[ rand alphabet.size ]
        [first_letter, Time.new.to_time.to_i.to_s, SecureRandom.hex(10).to_s].flatten.join("")
      end

      def generating_schema_name
        self.schema = generate_schema_UUID if self.schema.blank?
      end

      def provisioning
        self.class.scoped_schema(self.schema, false) do
          load "#{Rails.root}/db/schema.rb"
          load "#{Rails.root}/db/seeds.rb"
        end
      end
    end
  end
end


