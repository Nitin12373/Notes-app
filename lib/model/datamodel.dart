class DataModel {
  String? title;
  String? description;
  String? date;
  Map<dynamic, dynamic>? color;

  DataModel({
    required this.title,
    required this.description,
    required this.date,
    required this.color,
  });

  DataModel.fromJson(Map json) {
    title = json['title'];
    description = json['description'];
    date = json['date'];
    color = json['color'];
  }

  Map toJson() => {
        "title": title,
        'description': description,
        'date': date,
        'color': color,
      };
}
