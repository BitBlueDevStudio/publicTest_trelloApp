import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:trello_test/src/data/dto/card_dto.dart';
import 'package:trello_test/src/utils/locale_helper/l10n.dart';

import '../base_data_store.dart';
import 'i_trello_api_service.dart';
import 'package:http/http.dart' as http;


class AuthException implements Exception {
  String cause;
  AuthException(this.cause);
}


class ApiService extends BaseDataStore implements ITrelloApi {

  String JWTtoken="";
  String _apiUrl="https://trello.backend.tests.nekidaem.ru/api/v1/";
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  init() async {
    final SharedPreferences prefs = await _prefs;
    JWTtoken = (prefs.getString('JWTtoken') ?? "");
  }

  void clearJWTtoken() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("JWTtoken", "");
  }

  Future<List<CardDataDTO>> getAllCards() async {

    if (JWTtoken.isEmpty) await init();

    final response = await http.get(_apiUrl+"cards/",
      headers: {
      "Authorization": "JWT "+JWTtoken
      },
    );

    if (response.statusCode == 404) {
      throw Exception(S.current.ApiError_NotFound);
    } else  if (response.statusCode == 401) {
      throw AuthException(S.current.ApiError_NoAuth);
    } else if (response.statusCode != 200) {
      throw Exception(S.current.ApiError_Unexpected);
    }

    Iterable l = json.decode(Utf8Decoder().convert(response.bodyBytes));
    List<CardDataDTO> data = List<CardDataDTO>.from(l.map((model)=>
        CardDataDTO.fromJson(model)));


    return data;
  }


  @override
  Future<String> getAuthToken(String username, String password) async {
    final response = await http.post(_apiUrl+"users/login/",
      body: {
        "username": username,
        "password": password,
      },

    );

    if (response.statusCode == 404) {
      throw Exception(S.current.ApiError_NotFound);
    } else  if (response.statusCode == 400) {
      throw AuthException(S.current.ApiError_NoAuth);
    } else if (response.statusCode != 200) {
      throw Exception(S.current.ApiError_Unexpected);
    }

    Map<String,dynamic> jsonMap = json.decode(response.body);
    JWTtoken=jsonMap["token"];
    final SharedPreferences prefs = await _prefs;
    prefs.setString("JWTtoken", JWTtoken);
    return JWTtoken;
  }
  
}
