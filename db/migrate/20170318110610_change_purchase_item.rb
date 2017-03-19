class ChangePurchaseItem < ActiveRecord::Migration[5.0]
  def change
    remove_column :purchase_items, :item, :string
  end
  add_column :purchase_items, :item_id, :integer
end
