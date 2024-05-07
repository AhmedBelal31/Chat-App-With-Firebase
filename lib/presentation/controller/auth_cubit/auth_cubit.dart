import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';
class AuthCubit extends Cubit<AuthStates> {

  AuthCubit() : super(AuthInitialState());



}
