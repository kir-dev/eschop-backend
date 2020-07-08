# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  name        :string
#  email       :string
#  auth_sch_id :string
#  room_number :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class User < ApplicationRecord
end
