# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true,
                    format: { with: /\S+@\S+/ },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6, allow_blank: true }
end
