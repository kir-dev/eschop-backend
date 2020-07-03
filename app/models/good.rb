# frozen_string_literal: true

# == Schema Information
#
# Table name: goods
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  price       :float            not null
#  quantity    :integer          not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Good < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
