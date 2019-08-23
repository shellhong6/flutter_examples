// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homepage_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomepageList _$HomepageListFromJson(Map<String, dynamic> json) {
  return HomepageList(
    json['code'] as int,
    (json['value'] as List)
        ?.map(
            (e) => e == null ? null : Value.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HomepageListToJson(HomepageList instance) =>
    <String, dynamic>{
      'code': instance.code,
      'value': instance.value,
    };

Value _$ValueFromJson(Map<String, dynamic> json) {
  return Value(
    json['id'] as int,
    json['title'] as String,
    json['type'] as String,
    json['linkUrl'] as String,
    (json['modules'] as List)
        ?.map((e) =>
            e == null ? null : Modules.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ValueToJson(Value instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'linkUrl': instance.linkUrl,
      'modules': instance.modules,
    };

Modules _$ModulesFromJson(Map<String, dynamic> json) {
  return Modules(
    json['id'] as int,
    json['type'] as String,
    json['title'] as String,
    json['showMore'] as bool,
    json['showType'] as String,
    json['showNum'] as int,
    json['endTime'] as int,
    json['canDownload'] as bool,
    json['targetType'] as String,
    (json['items'] as List)
        ?.map(
            (e) => e == null ? null : Items.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ModulesToJson(Modules instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'showMore': instance.showMore,
      'showType': instance.showType,
      'showNum': instance.showNum,
      'endTime': instance.endTime,
      'canDownload': instance.canDownload,
      'targetType': instance.targetType,
      'items': instance.items,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return Items(
    json['title'] as String,
    json['text'] as String,
    json['name'] as String,
    json['coverUrl'] as String,
    json['imgUrl'] as String,
    json['linkUrl'] as String,
  )
    ..bookId = json['bookId'] as int
    ..author = json['author'] as String
    ..shortDesc = json['shortDesc'] as String
    ..category = json['category'] as String;
}

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'bookId': instance.bookId,
      'title': instance.title,
      'text': instance.text,
      'name': instance.name,
      'author': instance.author,
      'shortDesc': instance.shortDesc,
      'category': instance.category,
      'coverUrl': instance.coverUrl,
      'imgUrl': instance.imgUrl,
      'linkUrl': instance.linkUrl,
    };
