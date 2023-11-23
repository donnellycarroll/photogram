# == Schema Information
#
# Table name: relationships
#
#  id             :integer          not null, primary key
#  request_status :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  reciever_id    :integer
#  sender_id      :integer
#
class Relationship < ApplicationRecord
end
