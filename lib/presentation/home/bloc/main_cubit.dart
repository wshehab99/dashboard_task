import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  bool isCollapsed = false;
  void collapseNavSide() {
    isCollapsed = !isCollapsed;
    emit(MainColapseSide());
  }

  DateTime selectedDateTime = DateTime.now();
  void pickDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: selectedDateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    ).then((value) {
      if (value != null) {
        selectedDateTime = value;
        emit(MainChangeDate());
      }
    });
  }
}
