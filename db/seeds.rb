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
  {name: "Meta Wagner"},
  {name: "Yoshihiro Togashi", image: "truyen_tr.jpeg"},
  {name: "Nguyen Phong Viet"},
  {name: "Gao", image: "g.jpg"},
  {name: "Nguyen Ngoc Thach"},
  {name: "Do Nhat Nam"},
  {name: "Huong Giang"},
  {name: "Nam Cao", image: "nvnc.jpeg"},
  {name: "Nguyen Tuan", image: "nguyen_tuan.jpeg"}
]

authors.each do |author|
  Author.create! author
end

publishers = [
  {name: "NXB Kim Dong"},
  {name: "NXB Tre"},
  {name: "Nha sach Lao Dong"},
  {name: "Nha xuat ban The Gioi"},
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
   image: "sach_gao.jpg",
   description: FFaker::Lorem.paragraph},
   {name: "Cho em gần anh thêm chút nữa",
    author_books_attributes: [{author_id: 4}],
    category_books_attributes: [{category_id: 3}],
    publisher_id: 5,
    total_pages: 731, quantity: 100,
    image: "sach_gao.jpg",
    description: FFaker::Lorem.paragraph},
    {name: "Chúng ta rồi sẽ ổn thôi",
      author_books_attributes: [{author_id: 4}],
      category_books_attributes: [{category_id: 3}],
      publisher_id: 5,
      total_pages: 731, quantity: 100,
      image: "sach_gao.jpg",
      description: FFaker::Lorem.paragraph},
    {name: "hoa linh lan",
      author_books_attributes: [{author_id: 4}],
      category_books_attributes: [{category_id: 3}],
      publisher_id: 5,
      total_pages: 731, quantity: 100,
      image: "sach_gao.jpg",
      description: FFaker::Lorem.paragraph},  
    {name: "nhat ky son moi",
      author_books_attributes: [{author_id: 4}],
      category_books_attributes: [{category_id: 3}],
      publisher_id: 5,
      total_pages: 731, quantity: 100,
      image:"sach_gao.jpg",
      description: FFaker::Lorem.paragraph},
      {name: "Trăng sáng",
        author_books_attributes: [{author_id: 8}],
        category_books_attributes: [{category_id: 1}],
        publisher_id: 1,
        total_pages: 731, quantity: 100,
        image: "sach_gao.jpg",
        description: FFaker::Lorem.paragraph},
      {name: "Đời thường",
        author_books_attributes: [{author_id: 8}],
        category_books_attributes: [{category_id: 1}],
        publisher_id: 1,
        total_pages: 731, quantity: 100,
        image: "sach_gao.jpg",
        description: FFaker::Lorem.paragraph},
      {name: "Một chuyến đi",
        author_books_attributes: [{author_id: 9}],
        category_books_attributes: [{category_id: 1}],
        publisher_id: 1,
        total_pages: 731, quantity: 100,
        image: "sach_gao.jpg",
        description: FFaker::Lorem.paragraph},
      {name: "Vang bóng một thời",
        author_books_attributes: [{author_id: 9}],
        category_books_attributes: [{category_id: 1}],
        publisher_id: 1,
        total_pages: 731, quantity: 100,
        image: "sach_gao.jpg",
        description: FFaker::Lorem.paragraph},
      {name: "Bạn đắt giá bao nhiêu",
        author_books_attributes: [{author_id: 1}],
        category_books_attributes: [{category_id: 2}],
        publisher_id: 4,
        total_pages: 731, quantity: 100,
        image: "sach_gao.jpg",
        description: FFaker::Lorem.paragraph},
      {name: "Ai cũng là nhà sáng tạo đại tài",
        author_books_attributes: [{author_id: 1}],
        category_books_attributes: [{category_id: 2}],
        publisher_id: 4,
        total_pages: 731, quantity: 100,
        image: "sach_gao.jpg",
        description: FFaker::Lorem.paragraph},
      {name: "Hunter x Hunter",
        author_books_attributes: [{author_id: 2}],
        category_books_attributes: [{category_id: 4}],
        publisher_id: 4,
        total_pages: 731, quantity: 100,
        image: "sach_gao.jpg",
        description: FFaker::Lorem.paragraph},
      {name: "Captain Tsubasa",
        author_books_attributes: [{author_id: 2}],
        category_books_attributes: [{category_id: 4}],
        publisher_id: 4,
        total_pages: 731, quantity: 100,
        image: "sach_gao.jpg",
        description: FFaker::Lorem.paragraph},         
    ]
  books.each do |book|
    Book.create! book
  end  