import 'package:shared_preferences/shared_preferences.dart';
import 'package:trello_test/src/data/api_services/trello_api_service.dart';
import 'package:trello_test/src/data/repo/repository_cards.dart';
import 'package:trello_test/src/domain/enties/card_entity.dart';
import 'package:trello_test/src/domain/interactors/base_interactor.dart';
import 'package:trello_test/src/utils/locale_helper/l10n.dart';

class FormLoginInteractor extends BaseInteractor {

  RepositoryCards repo;

  FormLoginInteractor(this.repo) : super(repo);

  Future<List<CardEntity>> authorizeUser(String name, String password) async  {
      List<CardEntity> readyCardsList = await repo.authUserByPassword(
          name, password);
      return readyCardsList;
  }

  Future<List<CardEntity>> checkIsAuthorizedUser() async  {
    
    String JWTtoken=await repo.getJWTtoken();

    if (JWTtoken!=null && JWTtoken.isNotEmpty) {
      List<CardEntity> readyCardsList = await repo.getAllCards();
      Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
      final SharedPreferences prefs = await _prefs;
      prefs.setString("JWTtoken", JWTtoken);
      return readyCardsList;
    } else {
      throw AuthException(S.current.ApiError_NoAuth);
    }
  }

}