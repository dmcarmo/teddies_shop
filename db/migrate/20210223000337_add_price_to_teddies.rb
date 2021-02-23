class AddPriceToTeddies < ActiveRecord::Migration[6.1]
  def change
    add_monetize :teddies, :price, currency: { present: false }
  end
end
