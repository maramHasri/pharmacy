import 'package:bloc/bloc.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:meta/meta.dart';
import 'package:untitled32/model/userModel.dart';
import 'package:untitled32/view/login.dart';
import 'package:untitled32/service/userService.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<SendLoginModel>((event, emit) async {
      emit(Loading());
      var response = await ImpUserService().login(event.user);
    });
  }
}
