class CoursesModel
{
  int? id;
  String? Image;
  String? Title;
  String? Description;
  String? Price;
  String? hesa;
  bool? IsBuyer;
  CoursesModel({this.id,this.Image,this.Title,this.Description,this.Price,this.hesa,this.IsBuyer});
  CoursesModel.fromJson(Map<String,dynamic> map){
    this.id = map["id"];
    this.Title = map["title"];
    this.Description = map["description"];
    this.Price = map["price"];
    this.Image = map["course_image"];
    // this.free = map["free"].toString();
    // this.showInHome = map["show_in_home"].toString();
    // this.published = map["published"].toString();
  }
}