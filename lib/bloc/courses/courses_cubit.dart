import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:mrstudentapp/data/models/courses_model.dart';
import 'package:mrstudentapp/shered/apis.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/authintcation_cubit.dart';
part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit() : super(CoursesInitial());
  static CoursesCubit get(BuildContext context) => BlocProvider.of(context);
  late List listofcourses;
  List<CoursesModel> courses = [];
  String name = '';
  Future<List<CoursesModel>?> getCourses() async {
    emit(CoursesLoadingState());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString("name").toString();
    var header = {"Authorization":"Bearer " + prefs.get("token")!.toString()};
    try{
      http.Response response = await http.get(Uri.parse(ApiUrl + "courses"),headers: header);
      var json = jsonDecode(response.body);
      listofcourses = json['courses'];
      for(int i = 0; i<listofcourses.length; i++){
        CoursesModel model = CoursesModel.fromJson(listofcourses[i]);
        courses.add(model);
        http.Response responsemycourse = await http.get(Uri.parse(ApiUrl + "checkcoursepay/${model.id}"),headers: header);
        var j = jsonDecode(responsemycourse.body);
        if(j['message'] == 'false'){
          model.hesa = 'أشتري الحصة';
          model.IsBuyer = false;
        }else{
          model.hesa = 'أبداء الحصة';
          model.IsBuyer = true;
        }
      }
      print(listofcourses.length);
      emit(CoursesSuccessState());
    }catch (e) {
      emit(CoursesErrorState(e.toString()));
    }
  }
}
