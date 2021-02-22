import 'dart:async';
import 'dart:collection';

import 'package:trello_test/src/data/api_services/trello_api_service.dart';
import 'package:trello_test/src/domain/enties/card_entity.dart';
import 'package:trello_test/src/domain/interactors/main_interactor.dart';
import 'package:trello_test/src/presentation/bloc/app_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trello_test/src/utils/app_helpers.dart';

class MainBlocState extends Equatable {
  @override
  List<Object> get props => [];
}

class MainBlocStateLoaded extends MainBlocState {
  final HashMap<int,List<CardEntity>> listItems;
  List<CardEntity> unknownCards;
  MainBlocStateLoaded(this.listItems,[this.unknownCards]);

  @override
  List<Object> get props => [listItems];
}

class MainBlocStateLoading extends MainBlocState {}

class MainBlocStateError extends MainBlocState {
  final String error;
  MainBlocStateError(
      this.error
      );
}
class MainBlocStateEmpty extends MainBlocState {}

class MainBlocStateNoAuth extends MainBlocState {}


class MainBlocEvent {

}

class MainBlocEventLoad extends MainBlocEvent  {
  List<CardEntity> prefletchedCards;
  MainBlocEventLoad({this.prefletchedCards});

}

class MainBlocEventLogOut extends MainBlocEvent  {

}


class MainBloc extends Bloc<MainBlocEvent, MainBlocState> {

  final AppBloc appBloc;
  final MainInteractor interactor;
  MainBloc(this.interactor,this.appBloc) : super(MainBlocStateLoading());

  @override
  Stream<MainBlocState> mapEventToState(MainBlocEvent event) async* {
    if (event is  MainBlocEventLogOut) {
      appBloc.logOut();
    }
    else if (event is  MainBlocEventLoad) {
      yield MainBlocStateLoading();
      try {
        ///По канону для presentation слоя нужен свой объект DTO вместо entity, но каноны нужны в рамках разумного!
        ///В текущей ситуации и во многих других ситуациях это лишнее и можно использовать Entity из Domain (мне так кажется).
        ///
        List<CardEntity> cardsFromInteractor;
        if (event.prefletchedCards!=null && event.prefletchedCards.isNotEmpty) cardsFromInteractor=event.prefletchedCards;
        else cardsFromInteractor = await interactor.getCards();

        HashMap<int,List<CardEntity>> cardsByGroup= HashMap.fromIterable(
            CardsLists.CardGroups.keys,
            key: (k) => k,
            value: (v) => []);

        List<CardEntity> unknownCards=[];

        for (var card in cardsFromInteractor) {
          if (CardsLists.CardGroups.containsKey(card.groupId)) cardsByGroup[card.groupId].add(card);
          else unknownCards.add(card);
        }

        if (cardsFromInteractor.isEmpty) yield MainBlocStateEmpty();
        else yield MainBlocStateLoaded(cardsByGroup,unknownCards);
      } on AuthException catch(e) {
        yield(MainBlocStateNoAuth());
      } catch (Exception){
        yield MainBlocStateError(Exception.toString());
      }
    }
  }
}