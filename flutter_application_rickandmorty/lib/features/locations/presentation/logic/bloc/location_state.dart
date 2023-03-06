part of 'location_bloc.dart';


abstract class LocationState {}

class LocationInitial extends LocationState {}

// ignore: must_be_immutable
class LocationFetchedState extends LocationState {
  List<LocationModel> locationModelList;

  LocationFetchedState(this.locationModelList);
}

class LocationLoadingState extends LocationState {}

class LocationErrorState extends LocationState {
  final ErrorsEnum error;
  
  LocationErrorState(this.error);
}