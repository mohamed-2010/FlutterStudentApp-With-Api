import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/countdown_controller.dart';
import 'package:mrstudentapp/bloc/courses/courses_cubit.dart';
import 'package:mrstudentapp/data/models/exams_model.dart';
import 'package:mrstudentapp/data/models/quizes_model.dart';
import 'package:mrstudentapp/presentation/screens/my_results.dart';
import 'package:mrstudentapp/shered/apis.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
part 'exams_state.dart';

class ExamsCubit extends Cubit<ExamsState>{
  ExamsCubit() : super(ExamsInitial());
  static ExamsCubit get(BuildContext context) => BlocProvider.of(context);
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  late List listofexams;
  List<ExamsModel> exam = [];
  late List listofquizes;
  List<QuizesModel> quizes = [];
  int index = 0;
  Timer? timer;
  double? seconds;
  static int? start;
  int? count_questions;
  int? student_mark;
  int? per_quetion_mark;
  int? total_marks;
  String? exId;
  bool selected1 = false;
  bool selected2 = false;
  bool selected3 = false;
  bool selected4 = false;
  Future <List<ExamsModel>?> getExams() async {
    emit(ExamsLoadingState());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var header = {"Authorization":"Bearer " + prefs.get("token")!.toString()};
    try{
      http.Response response = await http.get(Uri.parse(ApiUrl + "exams"),headers: header);
      var json = jsonDecode(response.body);
      print (json);
      listofexams = json['exams'];
      print(listofexams);
      for(int i =0; i < listofexams.length; i++){
        ExamsModel model = ExamsModel.fromJson(listofexams[i]);
        exam.add(model);
        http.Response responsemycourse = await http.get(Uri.parse(ApiUrl + "checkexamepay/${model.id}"),headers: header);
        var j = jsonDecode(responsemycourse.body);
        if(j['message'] == 'false'){
          model.exam = 'أشتري الأمتحان';
          model.IsBuyer = false;
        }else{
          model.exam = 'أبداء الأمتحان';
          model.IsBuyer = true;
        }
      }
      emit(ExamsSuccessState());
    }catch (e){
      ExamsErrorState(e.toString());
      print(e);
    }
  }

  Future <List<QuizesModel>?> getQuizes(int ExameId) async{
    exId = ExameId.toString();
    emit(QuizesLoadingState());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var header = {"Authorization":"Bearer " + prefs.get("token")!.toString()};
    try{
      print('1');
      http.Response response = await http.get(Uri.parse(ApiUrl + "start_exam/$ExameId"),headers: header);
      var json = jsonDecode(response.body);
      print(json);
      if(json['message'] == 'ExamTaken'){
        http.Response response = await http.get(Uri.parse(ApiUrl + 'start_quiz/$ExameId/finish'),headers: header);
        var json = jsonDecode(response.body);
        count_questions = json['count_questions'];
        student_mark = json['student_mark'];
        per_quetion_mark = json['per_quetion_mark'];
        total_marks = json['total_marks'];
        print(response.body);
        emit(ResultsExam());
       // GetResult(exId!);
      }else{
        listofquizes = json['questions'];
        print("Timer Is:" + json['topic']['timer'].toString());
        var timer = json['topic']['timer'];
        start = timer;
        seconds = start! % 60;
        print(start);
        print(listofquizes);
        //startTimer();
        for(int i = 0; i<listofquizes.length; i++) {
          QuizesModel model1 = QuizesModel.fromJson(listofquizes[i]);
          quizes.add(model1);
        }
        emit(QuizesSuccessState());
      }
    } catch (e) {
      emit(QuizesErrorState(e.toString()));
      print(e.toString());
    }
  }

  Future sendAnswer(String Examid,String quizId,String answer) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var header = {
      "Authorization":"Bearer " + prefs.get("token")!.toString(),
      "content-type": "application/json",
    };
    try{
      //if(index < listofquizes.length){
        http.Response response = await http.post(
          Uri.parse(ApiUrl + "send_quiz_answer/$Examid/$quizId/$answer"),
          headers: header,
        );
        // index++;
        // print(listofquizes.length);
        // print("true");
      //}
      // else if(index == listofquizes.length){
      //   print('Finished');
      //   start =0;
      //   GetResult(Examid);
      //   print('f');
      // }
      // var json = jsonDecode(response.body);
      // print(json);
    }catch (e){
      print(e.toString());
    }
  }

  Future GetResult(String Id) async
  {
    emit(ExamsLoadingState());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var header = {"Authorization":"Bearer " + prefs.get("token")!.toString()};
    try{
      if(index == listofquizes.length){
        http.Response response = await http.get(Uri.parse(ApiUrl + 'start_quiz/$Id/finish'),headers: header);
        var json = jsonDecode(response.body);
        count_questions = json['count_questions'];
        student_mark = json['student_mark'];
        per_quetion_mark = json['per_quetion_mark'];
        total_marks = json['total_marks'];
        print(response.body);
        emit(ResultsExam());
      }
    }catch (e){
      emit(ExamsErrorState(e.toString()));
      print(e);
    }
  }
  Future finish(String Id) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var header = {"Authorization":"Bearer " + prefs.get("token")!.toString()};
    http.Response response = await http.get(Uri.parse(ApiUrl + 'start_quiz/$Id/finish'),headers: header);
    var json = jsonDecode(response.body);
    count_questions = json['count_questions'];
    student_mark = json['student_mark'];
    per_quetion_mark = json['per_quetion_mark'];
    total_marks = json['total_marks'];
    emit(ResultsExam());
  }
}
