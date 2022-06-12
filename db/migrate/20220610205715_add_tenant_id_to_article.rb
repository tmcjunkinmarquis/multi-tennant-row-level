class AddTenantIdToArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :tenant_id, :integer
  end
end
