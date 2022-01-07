class Product {
  final int id;
  final String name;
  final String brand;
  final String description;
  final String image;
  final double price;
  final String category;
  final List<double>? ukSize;
  final List<int>? usSize;

  Product({
    required this.name,
    required this.description,
    required this.brand,
    required this.image,
    required this.price,
    required this.category,
    required this.id,
    this.ukSize,
    this.usSize,
  });
}
