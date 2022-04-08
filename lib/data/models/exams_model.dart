class ExamsModel{
  int? id;
  String? Title;
  String? description;
  int? per_q_mark;
  int? timer;
  String? show_ans;
  int? amount;
  String? exam;
  bool? IsBuyer;

  ExamsModel(
      {this.id,
      this.Title,
      this.description,
      this.per_q_mark,
      this.timer,
      this.show_ans,
      this.amount,
      this.exam,
      this.IsBuyer
      });
  ExamsModel.fromJson(Map<String,dynamic> map)
  {
    this.id = map["id"];
    this.Title = map["title"];
    this.description = map["description"];
    this.per_q_mark = map["per_q_mark"];
    this.timer = map["timer"];
    this.show_ans = map["show_ans"];
    this.amount = map["amount"];
  }
}