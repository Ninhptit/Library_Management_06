class AddStatusToBookBorrows < ActiveRecord::Migration[5.1]
  def change
    add_column :book_borrows, :status, :integer, default: 0
  end
end
