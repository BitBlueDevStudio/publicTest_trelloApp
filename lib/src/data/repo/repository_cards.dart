import 'package:trello_test/src/data/api_services/trello_api_service.dart';
import 'package:trello_test/src/data/repo/i_repository_cards.dart';
import 'package:trello_test/src/data/repo/base_repository.dart';
import 'package:trello_test/src/domain/enties/card_entity.dart';

import '../dto/card_dto.dart';

class RepositoryCards extends BaseRepository<ApiService> implements IRepositoryCards {
  
  @override RepositoryCards(ApiService database) : super(database);

  CardEntity _cardToEntity(CardDataDTO cardDTO) {
    return CardEntity(
      id: cardDTO.id,
      text: cardDTO.text,
      groupId: cardDTO.groupId,
    );
  }
  /*CardDataDTO _cardToDTO(CardEntity cardEntity) {
    return CardDataDTO(
      id: cardEntity.id,
      text: cardEntity.text,
      groupId: cardEntity.groupId
    );
  }*/

  @override
  Future<List<CardEntity>> getAllCards() async {
    var cards= await datastore.getAllCards();
    List<CardEntity> lst=cards.map((c) => _cardToEntity(c)).toList();
    return lst;
  }

  @override
  Future<List<CardEntity>> authUserByPassword(String username,String password) async  {
    String authToken=await datastore.getAuthToken(username, password);

    List<CardEntity> getCardsAttempt=await getAllCards();

    return getCardsAttempt;

  }

  @override
  Future<String> getJWTtoken() async  {
    if (datastore.JWTtoken.isEmpty) await datastore.init();
    return datastore.JWTtoken;
  }

}