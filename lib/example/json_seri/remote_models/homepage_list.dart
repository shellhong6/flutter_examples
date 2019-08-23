import 'package:json_annotation/json_annotation.dart'; 
  
part 'homepage_list.g.dart';


@JsonSerializable()
  class HomepageList extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'value')
  List<Value> value;

  HomepageList(this.code,this.value,);

  factory HomepageList.fromJson(Map<String, dynamic> srcJson) => _$HomepageListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomepageListToJson(this);

}

  
@JsonSerializable()
  class Value extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'linkUrl')
  String linkUrl;

  @JsonKey(name: 'modules')
  List<Modules> modules;

  Value(this.id,this.title,this.type,this.linkUrl,this.modules,);

  factory Value.fromJson(Map<String, dynamic> srcJson) => _$ValueFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ValueToJson(this);

}

  
@JsonSerializable()
  class Modules extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'showMore')
  bool showMore;

  @JsonKey(name: 'showType')
  String showType;

  @JsonKey(name: 'showNum')
  int showNum;

  @JsonKey(name: 'endTime')
  int endTime;

  @JsonKey(name: 'canDownload')
  bool canDownload;

  @JsonKey(name: 'targetType')
  String targetType;

  @JsonKey(name: 'items')
  List<Items> items;

  Modules(this.id,this.type,this.title,this.showMore,this.showType,this.showNum,this.endTime,this.canDownload,this.targetType,this.items,);

  factory Modules.fromJson(Map<String, dynamic> srcJson) => _$ModulesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ModulesToJson(this);

}

  
@JsonSerializable()
  class Items extends Object {

  @JsonKey(name: 'bookId')
  int bookId;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'text')
  String text;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'shortDesc')
  String shortDesc;

  @JsonKey(name: 'category')
  String category;

  @JsonKey(name: 'coverUrl')
  String coverUrl;

  @JsonKey(name: 'imgUrl')
  String imgUrl;

  @JsonKey(name: 'linkUrl')
  String linkUrl;

  Items(this.title,this.text,this.name,this.coverUrl,this.imgUrl,this.linkUrl,);

  factory Items.fromJson(Map<String, dynamic> srcJson) => _$ItemsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);

}