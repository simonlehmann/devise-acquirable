class DeviseAcquirableAddTo<%= table_name.camelize %> < ActiveRecord::Migration<%= migration_version %>
  def self.up
    add_column :<%= table_name %>, :referring_url, :text
    add_column :<%= table_name %>, :landing_url, :text
  end

  def self.down
    remove_column :<%= table_name %>, :referring_url
    remove_column :<%= table_name %>, :landing_url
  end
end
