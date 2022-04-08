class QuizesModel
{
  int? id;
  int? topic_id;
  String? question;
  String? a;
  String? b;
  String? c;
  String? d;
  String? answer;
  String? code_snippet;
  String? answer_exp;
  String? question_img;
  String? question_video_link;

  QuizesModel({
    this.id,
      this.topic_id,
      this.question,
      this.a,
      this.b,
      this.c,
      this.d,
      this.answer,
      this.code_snippet,
      this.answer_exp,
      this.question_img,
      this.question_video_link
  });

  QuizesModel.fromJson(Map<String,dynamic> map)
  {
    this.id = map['id'];
    this.topic_id = map['topic_id'];
    this.question = map['question'];
    this.a = map['a'];
    this.b = map['b'];
    this.c = map['c'];
    this.d = map['d'];
    this.answer = map['answer'];
    this.code_snippet = map['code_snippet'];
    this.answer_exp = map['answer_exp'];
    this.question_img = map['question_img'];
    this.question_video_link = map['question_video_link'];
  }
}
