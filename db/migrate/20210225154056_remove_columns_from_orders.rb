class RemoveColumnsFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column(:orders, :product_sku, :string)
    remove_column(:orders, :amount_cents, :integer, default: 0, null: false)
    remove_column(:orders, :product_id, null: false)
  end
end
