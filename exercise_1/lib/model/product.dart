class Product {
  final String name;
  final String description;
  final double price;
  final double reviewStars;
  final String image;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.reviewStars,
    required this.image,
  });

  // Convert object to map for Firebase upload
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'reviewStars': reviewStars,
      'image': image,
    };
  }
}

// Sample list of products
final List<Product> productList = [
  Product(
    name: "T-shirt",
    description: "Comfortable cotton T-shirt for daily wear.",
    price: 15.99,
    reviewStars: 4.5,
    image: "https://product.hstatic.net/200000305259/product/back_b_42c9917f8db74210bc4b79070150a43d.jpg",
  ),
  Product(
    name: "Jeans",
    description: "Classic blue jeans, slim fit style.",
    price: 49.99,
    reviewStars: 4.8,
    image: "https://product.hstatic.net/1000340796/product/z5758993730474_0d4401e0072d39371079d21fc82bd8d3_d7d9c5bfc7104e2095346048ec104b45.jpg",
  ),
  Product(
    name: "Sneakers",
    description: "Lightweight and comfortable sneakers for all-day wear.",
    price: 89.99,
    reviewStars: 4.7,
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvs1-tY28MXxC-sC0Mr0xoDCahAprCVAeAag&s",
  ),
  Product(
    name: "Sandals",
    description: "Stylish and durable sandals for summer days.",
    price: 25.50,
    reviewStars: 4.2,
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAbsPi5U2V33Z63U__D3ldSxh4Fy6ixnHBBA&s",
  ),
  Product(
    name: "Wrist Watch",
    description: "Elegant wrist watch with leather strap.",
    price: 199.99,
    reviewStars: 4.9,
    image: "https://m.media-amazon.com/images/I/71iyG4F3MML._AC_SL1000_.jpg",
  ),
];