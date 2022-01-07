class Product {
  final String name;
  final String description;
  final String brand;
  final String image;
  final double price;
  final String category;
  final int id;
  final List<double>? ukSize;
  final List<int>? uSSize;

  Product({
    required this.name,
    required this.description,
    required this.brand,
    required this.image,
    required this.price,
    required this.category,
    required this.id,
    this.ukSize,
    this.uSSize,
  });
}
