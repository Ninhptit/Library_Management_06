class Author < ApplicationRecord
  acts_as_followable

  has_many :author_books
  has_many :books, through: :author_books

  extend FriendlyId
  friendly_id :name, use: :slugged

  scope :load_name_author, (lambda do |name|
    select(:name)
    .ransack(name_cont: name)
    .result(distinct: true)
    .limit Settings.autocomplete.limit
  end)

  def load_image
    super
  end
end
