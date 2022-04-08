import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:mrstudentapp/shered/apis.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation/screens/home.dart';
import '../../presentation/screens/login.dart';

part 'authintcation_state.dart';

class AuthintcationCubit extends Cubit<AuthintcationState> {
  AuthintcationCubit() : super(AuthintcationInitial());
  static AuthintcationCubit get(BuildContext context) => BlocProvider.of(context);
  String? name;
  String? email;
  String mopile = 'لا يوجد رقم هاتف';

  Future login({required String email, required String password}) async{
    emit(AuthenticationLoadingState());
    try{
      var response = await http
          .post(Uri.parse(ApiUrl+"login"), body: {
        "email": email,
        "password": password
      });
        var json = jsonDecode(response.body);
        var token = json['token'];
        var name = json['data']['name'];
        print("JWT IS: {$token}");
        print(response.statusCode);
        switch (response.statusCode){
          case 401:
            {
              emit(AuthenticationErrortate('الرجاء التحقق من البريد الألكتروني أو كلمة السر'));
            }
        }
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("token", token);
        prefs.setString("name", name);
        print(prefs.getString('name'));
        emit(AuthenticationSuccessState());
        print(prefs.getString("token"));
    } catch(e) {
     // emit(AuthenticationErrortate(e.toString()));
      emit(UnAuthintcationState());
    }
  }

  Future logout(Function() onTa) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var header = {"Authorization":"Bearer " + prefs.get("token")!.toString(),};
    try
        {
          var response = await http.
          post(Uri.parse(ApiUrl + 'logout'),
              body: {"token": token},headers: header);
          if(response.statusCode == 200){
            var json = jsonDecode(response.body);
            var message = json['message'];
            print("Message Is:" + message);
            prefs.setString('token', '');
            print('Token Is:' + prefs.getString('token').toString());
            emit(LogdOutSuccessState(onTa));
          }
        }catch (e)
    {
      emit(AuthenticationErrortate(e.toString()));
      print(e);
    }
  }
  Future getUser() async
  {
    emit(AuthenticationLoadingState());
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var header = {"Authorization":"Bearer " + prefs.get("token")!.toString()};
      http.Response response = await http.get(Uri.parse(ApiUrl + 'get_user'),headers: header);
      var json = jsonDecode(response.body);
      print(json['user']);
      name = json['user']['name'];
      email = json['user']['email'];
      mopile = json['user']['mobile'];
      emit(AuthenticationSuccessState());
    }catch (e){
      emit(AuthenticationErrortate(e.toString()));
    }
  }
}
