class Foods {
  String name;
  String price;
  String imagePath;
  String description;
  String category;

  Foods({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.description,
    required this.category,
  });

  String get _name => name;
  String get _price => price;
  String get _imagePath => imagePath;
  String get _description => description;
}