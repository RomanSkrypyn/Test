class Currency < ApplicationRecord
  has_many :rates_from, class_name: 'Rate', foreign_key: 'currency_from_id'
  has_many :rates_to, class_name: 'Rate', foreign_key: 'currency_to_id'
  validates :contraction, presence: true
  validates :description, presence: true

  def rates
    Rate.where('currency_from_id = ? OR currency_to_id = ?', id, id )
  end
end