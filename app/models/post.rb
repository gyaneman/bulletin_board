class Post < ActiveRecord::Base
  validates :name,
    presence: true,
    length: {maximum: 16}
  validates :email,
    presence: true,
    length: {maximum: 90},
    format: {with: /@/}
  validates :message,
    presence: true,
    length: {maximum: 200}
end
