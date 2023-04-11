class WebtoonModel {
  late final String title, thumb, id;

  WebtoonModel.fromJson2(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
  // WebtoonModel(Map<String, dynamic> json) {
  //   title = json['title'];
  //   thumb = json['thumb'];
  //   id = json['id'];
  // }
}
