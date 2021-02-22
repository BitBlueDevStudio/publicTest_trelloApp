

import 'package:trello_test/src/domain/enties/card_entity.dart';

class IRepositoryCards {
  Future<List<CardEntity>> getAllCards() async {}

  Future<List<CardEntity>> authUserByPassword(String username,String password) async  {}

  Future<String> getJWTtoken() {}

}