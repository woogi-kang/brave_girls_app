class ProfileModel {
  String? memberName;
  String? image;
  Profile? profile;

  ProfileModel({this.memberName, this.image, this.profile});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    memberName = json['memberName'];
    image = json['image'];
    profile =
    json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['memberName'] = this.memberName;
    data['image'] = this.image;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Profile {
  String? name_ko;
  String? name_en;
  String? birth;
  String? ancestry;
  String? country;
  String? school;
  String? height;
  String? blood;
  String? debut;
  String? agency;
  String? group;
  String? position;
  String? mbti;
  List<String>? nicknames;
  List<String>? ability;
  Link? link;

  Profile(
      {this.name_ko,
        this.name_en,
        this.birth,
        this.ancestry,
        this.country,
        this.school,
        this.height,
        this.blood,
        this.debut,
        this.agency,
        this.group,
        this.position,
        this.mbti,
        this.nicknames,
        this.ability,
        this.link});

  Profile.fromJson(Map<String, dynamic> json) {
    name_ko = json['name_ko'];
    name_en = json['name_en'];
    birth = json['birth'];
    ancestry = json['ancestry'];
    country = json['country'];
    school = json['school'];
    height = json['height'];
    blood = json['blood'];
    debut = json['debut'];
    agency = json['agency'];
    group = json['group'];
    position = json['position'];
    mbti = json['mbti'];
    nicknames = json['nicknames'].cast<String>();
    ability = json['ability'].cast<String>();
    link = json['link'] != null ? new Link.fromJson(json['link']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_ko'] = this.name_ko;
    data['name_en'] = this.name_en;
    data['birth'] = this.birth;
    data['ancestry'] = this.ancestry;
    data['country'] = this.country;
    data['school'] = this.school;
    data['height'] = this.height;
    data['blood'] = this.blood;
    data['debut'] = this.debut;
    data['agency'] = this.agency;
    data['group'] = this.group;
    data['position'] = this.position;
    data['mbti'] = this.mbti;
    data['nicknames'] = this.nicknames;
    data['ability'] = this.ability;
    if (this.link != null) {
      data['link'] = this.link!.toJson();
    }
    return data;
  }
}

class Link {
  String? twitter;
  String? instagram;
  String? youtube;
  String? tiktok;

  Link({this.twitter, this.instagram, this.youtube, this.tiktok});

  Link.fromJson(Map<String, dynamic> json) {
    twitter = json['twitter'];
    instagram = json['instagram'];
    youtube = json['youtube'];
    tiktok = json['tiktok'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['twitter'] = this.twitter;
    data['instagram'] = this.instagram;
    data['youtube'] = this.youtube;
    data['tiktok'] = this.tiktok;
    return data;
  }
}