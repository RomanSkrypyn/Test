class Rate < ApplicationRecord
  belongs_to :user
  belongs_to :currency_from, class_name: 'Currency'
  belongs_to :currency_to, class_name: 'Currency'

end