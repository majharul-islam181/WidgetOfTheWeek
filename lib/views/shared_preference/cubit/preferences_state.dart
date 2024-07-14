// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of "preferences_cubit.dart";

abstract class PreferencesState extends Equatable {
  const PreferencesState();

  @override
  List<Object?> get props => [];
}

class PreferencesInitial extends PreferencesState {}

class PreferencesLoaded extends PreferencesState {
  final String name;

  const PreferencesLoaded({required this.name});

  @override
  List<Object> get props => [name];
}
