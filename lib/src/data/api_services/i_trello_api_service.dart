import 'package:trello_test/src/data/dto/card_dto.dart';

abstract class ITrelloApi {

  Future<String> getAuthToken(String username,String password) async {
  }

  Future<List<CardDataDTO>> getAllCards() async {}

  void clearJWTtoken();
}