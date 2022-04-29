class TestModel {
  String title;

  TestModel(this.title);

  TestModel.fromJson(Map<String, dynamic> json) : title = json['title'];
}
