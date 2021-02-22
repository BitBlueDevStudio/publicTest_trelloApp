import 'package:trello_test/src/data/repo/repository_cards.dart';
import 'package:trello_test/src/domain/enties/card_entity.dart';
import 'package:trello_test/src/domain/interactors/base_interactor.dart';

class MainInteractor extends BaseInteractor {

  RepositoryCards repo;

  MainInteractor(this.repo) : super(repo);

  Future<List<CardEntity>> getCards() async  {
    List<CardEntity> readyCardsList= await repo.getAllCards();
    return readyCardsList;
  }

  void logOut() {

  }

}