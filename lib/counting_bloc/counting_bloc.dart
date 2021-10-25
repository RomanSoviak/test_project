import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/counting_bloc/counting_event.dart';
import 'package:test_project/counting_bloc/counting_state.dart';

class BlocA extends Bloc<BlocAEvent, BlocAState> {
  BlocA() : super(IncrementState());
}
