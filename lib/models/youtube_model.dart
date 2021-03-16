import 'package:brave_girls/models/thumbnail_model.dart';

class YoutubeModel {
  String? kind;
  String? id;
  String? channelTitle;
  String? title;
  String? description;
  String? publishedAt;
  String? channelId;
  Thumbnails? thumbnails;
  String? channelUrl;
  String? url;

  YoutubeModel({
    this.kind,
    this.id,
    this.channelTitle,
    this.title,
    this.description,
    this.publishedAt,
    this.channelId,
    this.thumbnails,
    this.channelUrl,
    this.url,
  });

  YoutubeModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    id = json['id'];
    channelTitle = json['channelTitle'];
    title = json['title'];
    description = json['description'];
    publishedAt = json['publishedAt'];
    channelId = json['channelId'];
    thumbnails = json['thumbnails'] != null ? new Thumbnails.fromJson(json['thumbnails']) : null;
    channelUrl = json['channelurl'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    data['id'] = this.id;
    data['channelTitle'] = this.channelTitle;
    data['title'] = this.title;
    data['description'] = this.description;
    data['publishedAt'] = this.publishedAt;
    data['channelId'] = this.channelId;
    if (this.thumbnails != null) {
      data['thumbnails'] = this.thumbnails?.toJson();
    }
    data['channelurl'] = this.channelUrl;
    data['url'] = this.url;
    return data;
  }
}
