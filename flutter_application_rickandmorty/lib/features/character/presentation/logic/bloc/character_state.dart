part of 'character_bloc.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

// ignore: must_be_immutable
class CharacterFetchedState extends CharacterState {
  List<LocationModel> characterModelList;

  CharacterFetchedState(this.characterModelList);
}

class CharacterLoadingState extends CharacterState {}

class CharacterErrorState extends CharacterState {
  final ErrorsEnum error;

  CharacterErrorState(this.error);
}
