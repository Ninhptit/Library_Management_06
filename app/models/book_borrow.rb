class BookBorrow < ApplicationRecord
  belongs_to :borrow
  belongs_to :book

  scope :unpaid, ->{where(return_date: nil, status: 1)}
  scope :has_borrowed, ->{where(status: 1)}
  scope :find_book, ->(book_id){where book_id: book_id}
end
