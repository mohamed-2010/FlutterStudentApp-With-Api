import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

import '../../data/models/lessons_model.dart';
import '../../shered/apis.dart';
part 'lessons_state.dart';

class LessonsCubit extends Cubit<LessonsState> {
  LessonsCubit() : super(LessonsInitial());
  static LessonsCubit get(BuildContext context) => BlocProvider.of(context);
  late List listoflessons;
  List<LessonsModel> lessons = [];
  FlickManager _flickManager = FlickManager(
      videoPlayerController:
      VideoPlayerController.network('https://moapiecommerce.000webhostapp.com/videos/lesson_1646231678Main.mp4')
  );
  Future getLessons(int CourseId) async{
    emit(LessonLoadingState());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var header = {"Authorization":"Bearer " + prefs.get("token")!.toString()};
    try{
      http.Response response = await http.get(Uri.parse(ApiUrl + "start_course/$CourseId"),headers: header);
      var json = jsonDecode(response.body);
      listoflessons = json['lessons'];
      for(int i = 0; i<listoflessons.length; i++) {
        LessonsModel model = LessonsModel.fromJson(listoflessons[i]);
        lessons.add(model);
      }
      emit(LessonSuccessState());
    } catch (e) {
      emit(LessonErrorState(e.toString()));
      print(e.toString());
    }
  }
  Widget playVideo(){
    print('1');
    //ccontroller = ccontroller;
    final controller = _flickManager;
    print('2');
    if(controller != null){
      //emit(LessonvideoloadedState());
      print('3');
      return Container(
          child: FlickVideoPlayer(
              flickManager: controller
          ),
      );
    }else{
      return AspectRatio(
        aspectRatio: 16/9,
          child: Center(child: Text("Being")));
    }
  }
  onTapVideo(int index){
    print('taped');
    LessonsModel model = LessonsModel.fromJson(listoflessons[index]);
    final flickManager = FlickManager(
      videoPlayerController:
      VideoPlayerController.network(lessonsUrl + model.VideoUloaded.toString())
    );
    print(lessonsUrl+model.VideoUloaded.toString());
    _flickManager = flickManager;
    print('0');
  }
}
