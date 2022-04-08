class LessonsModel{
  int? Id;
  int? Course_id;
  String? LessonTitle;
  String? ShortDetail;
  int? Status;
  String? VideoUrl;
  String? VideoUloaded;
  LessonsModel({this.Id,this.Course_id,this.LessonTitle,this.ShortDetail,this.VideoUrl,this.VideoUloaded,this.Status});

  LessonsModel.fromJson(Map<String,dynamic> map){
    this.Id = map['id'];
    this.Course_id = map['course_id'];
    this.LessonTitle = map['title'];
    this.ShortDetail = map['short_detail'];
    this.Status = map['status'];
    this.VideoUrl = map['vedio_url'];
    this.VideoUloaded = map['vedio_upload'];
  }
}