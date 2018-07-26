require "rails_helper"

RSpec.describe Book, type: :model do
  let!(:user1) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user) }
  let!(:borrow1) { FactoryBot.create(:borrow, user_id: user1.id) }
  let!(:category1) { FactoryBot.create(:category) }
  let!(:publisher1) { FactoryBot.create(:publisher, name: "nhà xuất bản Hai Tien") }
  let!(:author1) { FactoryBot.create(:author, name: "Gao") }
  let!(:book1) { FactoryBot.create(:book, publisher_id: publisher1.id, quantity: 5, name: "Bước Chân Theo Dấu Mặt Trời") }
  let!(:book2) { FactoryBot.create(:book, publisher_id: publisher1.id, quantity: 2, name: "Thanh Xuân Không Hối Tiếc") }
  let!(:book3) { FactoryBot.create(:book, publisher_id: publisher1.id, name: "Doremon tap 1") }
  let!(:rate1) { FactoryBot.create(:rate, user_id: user1.id, book_id: book1.id, point: 10) }
  let!(:rate2) { FactoryBot.create(:rate, user_id: user2.id, book_id: book1.id, point: 20) }
  let!(:rate3) { FactoryBot.create(:rate, user_id: user2.id, book_id: book3.id, point: 20) }
  let!(:author_book1) { FactoryBot.create(:author_book, author_id: author1.id, book_id: book2.id) }

  describe "associations" do
    it { should belong_to(:publisher) }
    it { should have_many(:author_books) }
    it { should have_many(:authors).through(:author_books) }
    it { should have_many(:category_books) }
    it { should have_many(:categories).through(:category_books) }
    it { should have_many(:book_borrows) }
    it { should have_many(:borrows).through(:book_borrows) }
    it { should have_many(:comments) }
    it { should have_many(:comment_users).through(:comments).source(:user) }
    it { should have_many(:rates) }
    it { should have_many(:rate_users).through(:rates).source(:user) }   
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:total_pages) }
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:image) }
  end

  describe "#can_borrow?" do
    context "can borrow book" do
      let!(:book_borrow1) { FactoryBot.create(:book_borrow, book_id: book1.id, borrow_id: borrow1.id) }
      it do
        expect(book1.can_borrow?).to eq true
      end
    end

    context "can't borrow book" do
      let!(:book_borrow1) { FactoryBot.create(:book_borrow, book_id: book2.id, borrow_id: borrow1.id) }
      let!(:book_borrow2) { FactoryBot.create(:book_borrow, book_id: book2.id, borrow_id: borrow1.id) }
      it do
        expect(book2.can_borrow?).to eq false
      end
    end
  end

  describe ".load_name_book" do
    context "find book by name" do
      it do
        expect(Book.load_name_book("Buoc Chan").map(&:name) ).to eq ["Bước Chân Theo Dấu Mặt Trời"]
      end
    end

    context "not find book by name" do
      it do
        expect(Book.load_name_book("Khong tim").map(&:name) ).to eq []
      end
    end
  end

  describe "#avg_rating" do
    context "avg rating of book have 2 rate" do
      it do
        expect(book1.avg_rating).to eq 15
      end
    end

    context "avg rating of book haven't been rated" do
      it do
        expect(book2.avg_rating).to eq 0
      end
    end

    context "avg rating of book have 1 rate" do
      it do
        expect(book3.avg_rating).to eq 20
      end
    end
  end

  describe ".searchs" do
    context "search by name publisher" do
      it do
        expect(Book.searchs("nhà xuất bản Hai Tien")).to include(book1, book2, book3)
      end
    end

    context "search by name book" do
      it do
        expect(Book.searchs("Doremon tap 1")).to eq [book3]
      end
    end

    context "seach by author name" do
      it do
        expect(Book.searchs("Gao")).to eq [book2]
      end
    end
  end
end
