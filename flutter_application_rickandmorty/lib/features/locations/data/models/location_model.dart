import 'dart:convert';

class LocationModel {
  LocationModel({
    this.image,
    this.id,
    this.name,
    this.type,
    this.dimension,
    this.residents,
    this.url,
    this.created,
  });

  final int? id;
  final String? name;
  final String? type;
  final String? dimension;
  final List<String>? residents;
  final String? url;
  final DateTime? created;
  final String? image;

  factory LocationModel.fromRawJson(String str) =>
      LocationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        dimension: json["dimension"],
        residents: List<String>.from(json["residents"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "dimension": dimension,
        "residents": List<dynamic>.from(residents!.map((x) => x)),
        "url": url,
        "created": created!.toIso8601String(),
        "image": image,
      };
}



// // To parse this JSON data, do
// //
// //     final locationModel = locationModelFromJson(jsonString);

// import 'dart:convert';

// class LocationModel {
//     LocationModel({
//         required this.info,
//         required this.results,
//     });

//     final Info info;
//     final List<Result> results;

//     factory LocationModel.fromRawJson(String str) => LocationModel.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
//         info: Info.fromJson(json["info"]),
//         results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "info": info.toJson(),
//         "results": List<dynamic>.from(results.map((x) => x.toJson())),
//     };
// }

// class Info {
//     Info({
//          this.count,
//          this.pages,
//          this.next,
//          this.prev,
//     });

//     final int? count;
//     final int? pages;
//     final String? next;
//     final dynamic? prev;

//     factory Info.fromRawJson(String str) => Info.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Info.fromJson(Map<String, dynamic> json) => Info(
//         count: json["count"],
//         pages: json["pages"],
//         next: json["next"],
//         prev: json["prev"],
//     );

//     Map<String, dynamic> toJson() => {
//         "count": count,
//         "pages": pages,
//         "next": next,
//         "prev": prev,
//     };
// }

// class Result {
//     Result({
//          this.id,
//          this.name,
//          this.type,
//          this.dimension,
//          this.residents,
//          this.url,
//          this.created,
//     });

//     final int? id;
//     final String? name;
//     final String? type;
//     final String? dimension;
//     final List<String>? residents;
//     final String? url;
//     final DateTime? created;

//     factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Result.fromJson(Map<String, dynamic> json) => Result(
//         id: json["id"],
//         name: json["name"],
//         type: json["type"],
//         dimension: json["dimension"],
//         residents: List<String>.from(json["residents"].map((x) => x)),
//         url: json["url"],
//         created: DateTime.parse(json["created"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "type": type,
//         "dimension": dimension,
//         "residents": List<dynamic>.from(residents!.map((x) => x)),
//         "url": url,
//         "created": created?.toIso8601String(),
//     };
// }
