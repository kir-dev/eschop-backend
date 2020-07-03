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
require 'test_helper'

class GoodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
