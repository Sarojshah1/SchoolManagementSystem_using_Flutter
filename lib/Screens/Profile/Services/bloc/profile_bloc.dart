import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../models/StudentProfileModel.dart';
import 'package:http/http.dart' as http;

import '../../../Attendance/classSingleton.dart';
import '../detailssingleton.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()){
    on<FetchUserByUsername>(_fetchUser);
  }

  void _fetchUser(FetchUserByUsername event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    try {
      final username = UserManager().username;
      final url = Uri.parse('http://192.168.56.1:7000/Student/$username');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final studentProfileModel = StudentProfileModel.fromJson(data);
        emit(ProfileLoaded(studentProfileModel));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      emit(ProfileError(error.toString()));
      print(error);
    }
  }

}
