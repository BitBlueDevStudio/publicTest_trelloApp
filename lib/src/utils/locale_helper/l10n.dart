// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Trello app`
  String get appName {
    return Intl.message(
      'Trello app',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Login screen`
  String get Screen_1 {
    return Intl.message(
      'Login screen',
      name: 'Screen_1',
      desc: '',
      args: [],
    );
  }

  /// `Board`
  String get Screen_2 {
    return Intl.message(
      'Board',
      name: 'Screen_2',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get com_Unknown {
    return Intl.message(
      'Unknown',
      name: 'com_Unknown',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get com_Login {
    return Intl.message(
      'Login',
      name: 'com_Login',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get com_exit {
    return Intl.message(
      'Exit',
      name: 'com_exit',
      desc: '',
      args: [],
    );
  }

  /// `Stay`
  String get com_stay {
    return Intl.message(
      'Stay',
      name: 'com_stay',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get com_error {
    return Intl.message(
      'Error',
      name: 'com_error',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get com_error0 {
    return Intl.message(
      'Something went wrong',
      name: 'com_error0',
      desc: '',
      args: [],
    );
  }

  /// `Do you really want to log out?`
  String get dialog_LogoutQuestion {
    return Intl.message(
      'Do you really want to log out?',
      name: 'dialog_LogoutQuestion',
      desc: '',
      args: [],
    );
  }

  /// `You will need to enter password again`
  String get dialog_LogoutQuestionDescription {
    return Intl.message(
      'You will need to enter password again',
      name: 'dialog_LogoutQuestionDescription',
      desc: '',
      args: [],
    );
  }

  /// `Not found error`
  String get ApiError_NotFound {
    return Intl.message(
      'Not found error',
      name: 'ApiError_NotFound',
      desc: '',
      args: [],
    );
  }

  /// `Authorization error`
  String get ApiError_NoAuth {
    return Intl.message(
      'Authorization error',
      name: 'ApiError_NoAuth',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected server error`
  String get ApiError_Unexpected {
    return Intl.message(
      'Unexpected server error',
      name: 'ApiError_Unexpected',
      desc: '',
      args: [],
    );
  }

  /// `On hold`
  String get com_ListGroup0 {
    return Intl.message(
      'On hold',
      name: 'com_ListGroup0',
      desc: '',
      args: [],
    );
  }

  /// `Todo`
  String get com_ListGroup1 {
    return Intl.message(
      'Todo',
      name: 'com_ListGroup1',
      desc: '',
      args: [],
    );
  }

  /// `In progress`
  String get com_ListGroup2 {
    return Intl.message(
      'In progress',
      name: 'com_ListGroup2',
      desc: '',
      args: [],
    );
  }

  /// `Need review`
  String get com_ListGroup3 {
    return Intl.message(
      'Need review',
      name: 'com_ListGroup3',
      desc: '',
      args: [],
    );
  }

  /// `Approved`
  String get com_ListGroup4 {
    return Intl.message(
      'Approved',
      name: 'com_ListGroup4',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get FormLogin_fieldNameText {
    return Intl.message(
      'User name',
      name: 'FormLogin_fieldNameText',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get FormLogin_fieldPasswordText {
    return Intl.message(
      'Password',
      name: 'FormLogin_fieldPasswordText',
      desc: '',
      args: [],
    );
  }

  /// `This field should be longer`
  String get FormLogin_fieldError {
    return Intl.message(
      'This field should be longer',
      name: 'FormLogin_fieldError',
      desc: '',
      args: [],
    );
  }

  /// `Board is empty. Zero cards in all lists`
  String get board_ErrorEmpty {
    return Intl.message(
      'Board is empty. Zero cards in all lists',
      name: 'board_ErrorEmpty',
      desc: '',
      args: [],
    );
  }

  /// `No cards`
  String get board_ErrorEmptyList {
    return Intl.message(
      'No cards',
      name: 'board_ErrorEmptyList',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru', countryCode: 'RU'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}