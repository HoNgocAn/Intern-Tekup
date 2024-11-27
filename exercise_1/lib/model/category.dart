class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
  // to upload data in firebase
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'image': image,
    };
  }
}

final List<Category> categoriesList = [
  Category(
    title: "Beauty",
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSC42jKjJLtrHV3szp5dgX7tBqfG_4ueNFGpg&s",
  ),
  Category(
    title: "Fashion",
    image: "https://i.pinimg.com/236x/4d/fa/ea/4dfaea9315e5b3c4a4f3249955fdbbe2.jpg",
  ),
  Category(
    title: "Kids",
    image: "https://img.lazcdn.com/g/p/085bc799f48e6ed02b0822fda1856269.jpg_720x720q80.jpg",
  ),
  Category(
    title: "Mens",
    image: "https://down-vn.img.susercontent.com/file/c7db377b177fc8e2ff75a769022dcc23",
  ),
  Category(
    title: "Women",
    image: "https://tieuthantai.com/wp-content/uploads/2021/12/y-tuong-kinh-doanh-thoi-trang-trung-quoc-1.jpeg",
  ),
];