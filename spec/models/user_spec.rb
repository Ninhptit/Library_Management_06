require "rails_helper"

RSpec.describe User, type: :model do

  describe "db schema" do
    context "columns" do
      it { should have_db_column(:email).of_type(:string) }
      it { should have_db_column(:name).of_type(:string) }
      it { should have_db_column(:avatar).of_type(:string) }
    end
  end

  VALID_EMAIL = [
    "develop-temp@tm71.net",
    "hoashi@spring-gl.co.jp",
    "hoashi.spring.gl.co.jp@gmail.com",
    "info@spring-gl.co.jp",
    "123456789@bla.bla",
    "glo_naka0@yahoo.co.jp",
    "1@2.com",
    "mnisimu@ba2.so-net.ne.jp",
    "email@domain.com",
    "firstname.lastname@domain.com",
    "email@subdomain.domain.com",
    "firstname+lastname@domain.com",
    "1234567890@domain.com",
    "email@domain-one.com",
    "_______@domain.com",
    "email@domain.name",
    "email@domain.co.jp",
    "firstname-lastname@domain.com"
  ]
  INVALID_EMAIL = [
    "sahara @yahoo.jp",
    "plainaddress",
    "@domain.com",
    "Joe Smith <email@domain.com>",
    "email.domain.com",
    "email@domain@domain.com",
    "あいうえお@domain.com",
    "email@domain.com (Joe Smith)",
    "email@domain",
    "email@111.222.333.44444"
  ]

  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_confirmation_of :password }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_length_of(:password).is_at_least 8 }
    it { should validate_length_of(:password).is_at_most(128) }
    context "valid email" do
      VALID_EMAIL.each do |email|
        it { is_expected.to allow_value(email).for(:email) }
      end
    end
    context "invalid email" do
      INVALID_EMAIL.each do |email|
        it { is_expected.to_not allow_value(email).for(:email) }
      end
    end
  end

  describe "#borrow_not_approve" do
    let!(:user1) { FactoryGirl.create(:user) }
    context "find borrow not approve" do
      let!(:borrow) { FactoryGirl.create(:borrow, user_id: user1.id)}
      it do
        expect(user1.borrow_not_approve).to eq(true)
      end
    end

    context "not find borrow not approve when have 1 borrow" do
      let!(:borrow1) { FactoryGirl.create(:borrow, user_id: user1.id, approve: true)}
      it do
        expect(user1.borrow_not_approve).to eq(false)
      end
    end

    context "not find borrow not approve when have 2 borrow" do
      let!(:borrow) { FactoryGirl.create(:borrow, user_id: user1.id)}
      let!(:borrow1) { FactoryGirl.create(:borrow, user_id: user1.id, approve: true)}
      it do
        expect(user1.borrow_not_approve).to eq(true)
      end
    end
  end

  describe "#can_borrow_book" do
    let!(:user1) { FactoryGirl.create(:user) }
    let!(:category1) { FactoryGirl.create(:category) }
    let!(:publisher1) { FactoryGirl.create(:publisher) }
    let!(:book1) { FactoryGirl.create(:book, publisher_id: publisher1.id) }
    context "Not borrow" do
      it do
        expect(user1.can_borrow_book).to eq true
      end
    end

    context "All books were paid" do
      let!(:borrow) { FactoryGirl.create(:borrow, approve: true, user_id: user1.id) }
      let!(:book_borrow) { FactoryGirl.create(:book_borrow, book_id: book1.id, borrow_id: borrow.id, return_date: Time.now+3.days) }
      it do
        expect(user1.can_borrow_book).to eq true
      end
    end

    context "have book unpaid" do
      let!(:borrow) { FactoryGirl.create(:borrow, approve: true, user_id: user1.id) }
      let!(:book_borrow1) { FactoryGirl.create(:book_borrow, book_id: book1.id, borrow_id: borrow.id) }
      it do
        expect(user1.can_borrow_book).to eq false
      end
    end
  end
end
