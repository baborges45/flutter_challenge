import 'dart:convert';

class ProductModel {
  String title;
  String type;
  String description;
  String filename;
  String heigth;
  String width;
  String price;
  String rating;

  ProductModel({
    required this.title,
    required this.type,
    required this.description,
    required this.filename,
    required this.heigth,
    required this.width,
    required this.price,
    required this.rating,
  });

  ProductModel copyWith({
    String? title,
    String? type,
    String? description,
    String? filename,
    String? heigth,
    String? width,
    String? price,
    String? rating,
  }) {
    return ProductModel(
      title: title ?? this.title,
      type: type ?? this.type,
      description: description ?? this.description,
      filename: filename ?? this.filename,
      heigth: heigth ?? this.heigth,
      width: width ?? this.width,
      price: price ?? this.price,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'type': type,
      'description': description,
      'filename': filename,
      'heigth': heigth,
      'width': width,
      'price': price,
      'rating': rating,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      title: map['title'] ?? '',
      type: map['type'] ?? '',
      description: map['description'] ?? '',
      filename: map['filename'] ?? '',
      heigth: map['heigth'] ?? '',
      width: map['width'] ?? '',
      price: map['price'] ?? '',
      rating: map['rating'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(title: $title, type: $type, description: $description, filename: $filename, heigth: $heigth, width: $width, price: $price, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.title == title &&
        other.type == type &&
        other.description == description &&
        other.filename == filename &&
        other.heigth == heigth &&
        other.width == width &&
        other.price == price &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        type.hashCode ^
        description.hashCode ^
        filename.hashCode ^
        heigth.hashCode ^
        width.hashCode ^
        price.hashCode ^
        rating.hashCode;
  }
}
