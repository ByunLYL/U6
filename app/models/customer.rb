class Customer < ApplicationRecord
  has_one_attached :image

  validates :full_name, presence: true
  validates :email_address, absence: true, if: -> { some_condition_here } # 替换为你希望的条件
  validates :password, confirmation: true # 假设有 password 字段

  # 添加 ransackable_associations 方法
  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob"]
  end

  # 添加 ransackable_attributes 方法
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email_address", "full_name", "id", "notes", "phone_number", "updated_at"]
  end
end
