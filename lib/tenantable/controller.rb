module Tenantable

  module Controller
    extend ActiveSupport::Concern

    module ClassMethods
      def use_public_schema_for(*models)
        models.each do | m |
          table_name =  m.table_name.split('.', 2).last
          m.table_name = "public.#{table_name}"
        end
      end
    end

    module InstanceMethods
      def setup_schema(include_public = true)
        ActiveRecord::Base.connection.schema_search_path = [current_schema, ("public" if include_public)].compact.join(",")
      end
    end

  end
end