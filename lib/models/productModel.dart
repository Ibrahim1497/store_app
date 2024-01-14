class ProductModel {
  final int id;
  final String title;
  var price;
  final String description;
  final String category;
  late final String image;
  // final RatingModel rating;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      // required this.rating
      });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        description: json['description'],
        category: json['category'],
        image: json['image'],
        // rating: RatingModel.fromJson(json["rating"])
    );
  }
}
//
// class RatingModel {
//    var rate;
//   final int count;
//
//   RatingModel({required this.rate, required this.count});
//
//   factory RatingModel.fromJson(Map<String, dynamic> json) {
//     return RatingModel(rate: json['rate'], count: json['count']);
//   }
// }
