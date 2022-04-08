import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../shered/apis.dart';

part 'exams_pay_with_code_state.dart';

class ExamsPayWithCodeCubit extends Cubit<ExamsPayWithCodeState> {
  ExamsPayWithCodeCubit() : super(ExamsPayWithCodeInitial());
  Future paywitcode({required String code, required String id}) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var header = {"Authorization":"Bearer " + prefs.get("token")!.toString()};
    emit(ExamPayWithCodeLoadingState());
    try{
      http.Response response = await http.post(Uri.parse(ApiUrl + 'quizcheckCoupon'),
          headers: header,
          body: {
            "topic_id" : id,
            "code" : code
          }
      );
      var json = jsonDecode(response.body);
      var message = json['message'];
      print(response.statusCode);
      if(response.statusCode == 401){
        print('Error');
        print(message);
        emit(ExamPayWithCodeErrorState(message));
      }else if(response.statusCode == 400){
        print('error2');
        print(message);
        emit(ExamPayWithCodeErrorState(message));
      }else if(response.statusCode == 200){
        print('success');
        print(message);
        emit(ExamPayWithCodeSuccessState());
      }
      print(response.body);
    }catch (e){
      emit(ExamPayWithCodeErrorState(e.toString()));
      print(e);
    }
  }
}
