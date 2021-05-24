import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

/// This allows the `Post` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'post.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Post {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$PostFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$PostToJson`.
  Map<String, dynamic> toJson() => _$PostToJson(this);
}

List<Post> postsFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postsToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
