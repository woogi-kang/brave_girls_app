class Thumbnails {
  ThumbnailType? defaultType;
  ThumbnailType? mediumType;
  ThumbnailType? highType;

  Thumbnails({
    this.defaultType,
    this.mediumType,
    this.highType,
  });

  Thumbnails.fromJson(Map<String, dynamic> json) {
    defaultType = json['default'] != null ? new ThumbnailType.fromJson(json['default']) : null;
    mediumType = json['medium'] != null ? new ThumbnailType.fromJson(json['medium']) : null;
    highType = json['high'] != null ? new ThumbnailType.fromJson(json['high']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.defaultType != null) {
      data['default'] = this.defaultType?.toJson();
    }
    if (this.mediumType != null) {
      data['medium'] = this.mediumType?.toJson();
    }
    if (this.highType != null) {
      data['high'] = this.highType?.toJson();
    }
    return data;
  }
}

class ThumbnailType {
  String? url;
  int? width;
  int? height;

  ThumbnailType({
    this.url,
    this.width,
    this.height,
  });

  ThumbnailType.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}
