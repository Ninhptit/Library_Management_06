categories = [
  {name: "Van hoc", parent_id: nil},
  {name: "Ki nang song", parent_id: nil},
  {name: "Tieu thuyet", parent_id: nil},
  {name: "Truyen tranh", parent_id: nil},
]

categories.each do |category|
  Category.create! category
end

authors = [
  {name: "Nguyen Nhat Anh"},
  {name: "Trang Ha"},
  {name: "Nguyen Phong Viet"},
  {name: "Gao"},
  {name: "Nguyen Ngoc Thach"},
  {name: "Do Nhat Nam"},
  {name: "Huong Giang"},
  {name: "Nam Cao"},
  {name: "Thien Thai"}
]

authors.each do |author|
  Author.create! author
end

publishers = [
  {name: "NXB Kim Dong"},
  {name: "NXB Tre"},
  {name: "Nha sach Lao Dong"},
  {name: "Nha sach Sao Mai"},
  {name: "Nha xuat ban hoi nha van"}
]

publishers.each do |publisher|
  Publisher.create! publisher
end

books = [
  {name: "Ai đó đã khóc ngày hôm qua",
   author_books_attributes: [{author_id: 4}],
   category_books_attributes: [{category_id: 3}],
   publisher_id: 5,
   total_pages: 731, quantity: 100,
   image: "ai_do_da_khoc_ngay_hom_q.jpg",
   description: FFaker::Lorem.paragraph},
   {name: "Cho em gần anh thêm chút nữa",
    author_books_attributes: [{author_id: 4}],
    category_books_attributes: [{category_id: 3}],
    publisher_id: 5,
    total_pages: 731, quantity: 100,
    image: "cho-em-gan-anh-them-chut-nua-52872.jpg",
    description: FFaker::Lorem.paragraph},
    {name: "Chúng ta rồi sẽ ổn thôi",
      author_books_attributes: [{author_id: 4}],
      category_books_attributes: [{category_id: 3}],
      publisher_id: 5,
      total_pages: 731, quantity: 100,
      image: "chung_ta_roi_se_on_thoi.jpeg",
      description: FFaker::Lorem.paragraph},
    {name: "hoa linh lan",
      author_books_attributes: [{author_id: 4}],
      category_books_attributes: [{category_id: 3}],
      publisher_id: 5,
      total_pages: 731, quantity: 100,
      image: "hoa_linh_lan.png",
      description: FFaker::Lorem.paragraph},  
    {name: "nhat ky son moi",
      author_books_attributes: [{author_id: 4}],
      category_books_attributes: [{category_id: 3}],
      publisher_id: 5,
      total_pages: 731, quantity: 100,
      image:"nhat-ky-son-moi .jpg",
      description: FFaker::Lorem.paragraph}
    ]
  books.each do |book|
    Book.create! book
  end  