part of 'main_cubit.dart';

@immutable
sealed class MainState {}

class MainInitial extends MainState {}

class MainColapseSide extends MainState {}

class MainChangeDate extends MainState {}
