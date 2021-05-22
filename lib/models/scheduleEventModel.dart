class ScheduleEvent {
  String? name;
  int? type;
  Map<String, dynamic>? data;
  String? startDate;
  String? description;

  ScheduleEvent(this.name, this.type, this.data, this.startDate, this.description);

  ScheduleEvent.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    data = json['data'] ?? {};
    startDate = json['startDate'];
    description = json['description'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();

    json['name'] = this.name;
    json['type'] = this.type;

    if(json['data'] != null) {
      json['data'] = this.data;
    }
    json['startDate'] = this.startDate;
    if(json['description']) {
      json['description'] = this.description;
    }
    return json;
  }
}
