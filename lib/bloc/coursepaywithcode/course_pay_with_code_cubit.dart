import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../shered/apis.dart';


part 'course_pay_with_code_state.dart';

class CoursePayWithCodeCubit extends Cubit<CoursePayWithCodeState> {
  CoursePayWithCodeCubit() : super(CoursePayWithCodeInitial());
  Future paywitcode({required String code, required String id}) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var header = {"Authorization":"Bearer " + prefs.get("token")!.toString()};
    emit(CoursePayWithCodeLoadingState());
    try{
      http.Response response = await http.post(Uri.parse(ApiUrl + 'checkCoupon'),
          headers: header,
          body: {
            "course_id" : id,
            "code" : code
          }
      );
      var json = jsonDecode(response.body);
      var message = json['message'];
      print(response.statusCode);
      if(response.statusCode == 401){
        print('Error');
        print(message);
        emit(CoursePayWithCodeErrorState(message));
      }else if(response.statusCode == 400){
        print('error2');
        print(message);
        emit(CoursePayWithCodeErrorState(message));
      }else if(response.statusCode == 200){
        print('success');
        print(message);
        emit(CoursePayWithCodeSuccessState());
      }
      print(response.body);
    }catch (e) {
      emit(CoursePayWithCodeErrorState(e.toString()));
      print(e);
    }
}
}
