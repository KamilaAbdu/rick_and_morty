import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<T, E> extends Bloc<T, E>{
  BaseBloc(super.state);
}