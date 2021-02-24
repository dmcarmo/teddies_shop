class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy

  monetize :amount_cents
end
