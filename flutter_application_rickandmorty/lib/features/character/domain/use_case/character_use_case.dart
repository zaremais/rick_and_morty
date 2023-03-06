import 'package:flutter_application_rickandmorty/features/character/data/models/character_model.dart';
import 'package:flutter_application_rickandmorty/features/character/data/repositories/character_repository_impl.dart';

class CharacterUseCase {
  CharacterRepositoryImpl characterRepositoryImpl = CharacterRepositoryImpl();

  Future<List<LocationModel>> getCharacter() async =>
      await characterRepositoryImpl.getCharacter();
}
