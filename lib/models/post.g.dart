// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    userId: json['userId'] as int,
    id: json['id'] as int,
    title: json['title'] as String,
    completed: json['completed'] as bool,
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
