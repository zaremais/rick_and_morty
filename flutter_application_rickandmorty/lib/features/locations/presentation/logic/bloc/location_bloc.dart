
import 'package:bloc/bloc.dart';
import 'package:flutter_application_rickandmorty/features/locations/data/models/location_model.dart';
import 'package:flutter_application_rickandmorty/features/locations/domain/use_case/location_use_case.dart';
import 'package:flutter_application_rickandmorty/internal/helpers/error_helper.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<LocationEvent>((event, emit) async {
      emit(LocationLoadingState());
      try {
        List<LocationModel> locationModelList = await LocationUseCase().getLocation();
        emit(LocationFetchedState(locationModelList));
      } catch (e) {
       
        emit(LocationErrorState(ErrorsEnum.invalidError));
      }
    });
  }
}
