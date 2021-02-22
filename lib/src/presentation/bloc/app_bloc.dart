import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trello_test/src/data/api_services/i_trello_api_service.dart';
import 'package:trello_test/src/data/api_services/trello_api_service.dart';

class AppBlocState extends Equatable {
  AppBlocState();

  @override
  List<Object> get props => [];
}

enum AppBlocEvent { refreshed, themeChanged, languageChanged }

class AppBloc extends Bloc<AppBlocEvent, AppBlocState> {
  final Injector dependencyManager;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  AppBloc(this.dependencyManager) : super(AppBlocState());

  void logOut() {
    dependencyManager.get<ITrelloApi>().clearJWTtoken();
  }

  @override
  Stream<AppBlocState> mapEventToState(AppBlocEvent event) async* {
  }

}

