import 'package:trello_test/src/data/api_services/i_trello_api_service.dart';
import 'package:trello_test/src/data/api_services/trello_api_service.dart';
import 'package:trello_test/src/data/repo/i_repository_cards.dart';
import 'package:trello_test/src/data/repo/repository_cards.dart';
import 'package:trello_test/src/domain/interactors/form/form_login_interactor.dart';
import 'package:trello_test/src/domain/interactors/main_interactor.dart';
import 'package:trello_test/src/presentation/bloc/app_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:trello_test/src/presentation/bloc/form/form_login_bloc.dart';
import 'package:trello_test/src/presentation/bloc/main_bloc.dart';

class DependencyManager {
  static Injector initialise(Injector injector) {
    try {
      _registerData(injector);
      _registerInteractors(injector);
      _registerBlocs(injector);
    } catch(e) {

    }

    return injector;
  }

  static void _registerData(Injector injector) {
    injector.map<ITrelloApi>((i) => ApiService(), isSingleton: true);
    injector.map<IRepositoryCards>((i) => RepositoryCards(injector.get<ITrelloApi>()), isSingleton: true);
  }


  ///В идеале везде должны быть интерфейсы, но в реальности все зависит от задачи
  static void _registerInteractors(Injector injector) {
    injector.map<MainInteractor>((i) => MainInteractor(injector.get<IRepositoryCards>()));
    injector.map<FormLoginInteractor>((i) => FormLoginInteractor(injector.get<IRepositoryCards>()));
  }

  static void _registerBlocs(Injector injector) {
    injector.map<AppBloc>((i) => AppBloc(i), isSingleton: true);
    injector.map<MainBloc>((i) => MainBloc(injector.get<MainInteractor>(),injector.get<AppBloc>())..add(MainBlocEventLoad()));
    injector.map<LoginFormBloc>((i) => LoginFormBloc(injector.get<FormLoginInteractor>()));

  }

}