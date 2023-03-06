import 'package:bloc/bloc.dart';
import 'package:flutter_application_rickandmorty/features/character/data/models/character_model.dart';
import 'package:flutter_application_rickandmorty/features/character/domain/use_case/character_use_case.dart';
import 'package:flutter_application_rickandmorty/internal/helpers/error_helper.dart';
import 'package:meta/meta.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterUseCase useCase = CharacterUseCase();
  CharacterBloc() : super(CharacterInitial()) {
    on<CharacterEvent>((event, emit) async {
      emit(CharacterLoadingState());

      try {
        List<LocationModel> characterModelList = await useCase.getCharacter();

        emit(CharacterFetchedState(characterModelList));
      } catch (e) {
        emit(CharacterErrorState(ErrorsEnum.invalidError)); // нужно переделать
      }
    });
  }
}
