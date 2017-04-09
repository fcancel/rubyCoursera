class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :todo_lists, dependent: :destroy
end
