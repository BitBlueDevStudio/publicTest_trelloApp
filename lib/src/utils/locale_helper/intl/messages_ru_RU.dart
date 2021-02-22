// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru_RU locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru_RU';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "ApiError_NoAuth" : MessageLookupByLibrary.simpleMessage("Ошибка авторизации"),
    "ApiError_NotFound" : MessageLookupByLibrary.simpleMessage("Не найдено"),
    "ApiError_Unexpected" : MessageLookupByLibrary.simpleMessage("Неожиданная ошибка сервера"),
    "FormLogin_fieldError" : MessageLookupByLibrary.simpleMessage("Это поле должно быть длиннее"),
    "FormLogin_fieldNameText" : MessageLookupByLibrary.simpleMessage("Имя пользователя"),
    "FormLogin_fieldPasswordText" : MessageLookupByLibrary.simpleMessage("Пароль"),
    "Screen_1" : MessageLookupByLibrary.simpleMessage("Вход"),
    "Screen_2" : MessageLookupByLibrary.simpleMessage("Доска"),
    "appName" : MessageLookupByLibrary.simpleMessage("Trello app"),
    "board_ErrorEmpty" : MessageLookupByLibrary.simpleMessage("Доска пуста. Ноль карточек во всех списках"),
    "board_ErrorEmptyList" : MessageLookupByLibrary.simpleMessage("Нет карточек"),
    "com_ListGroup0" : MessageLookupByLibrary.simpleMessage("On hold"),
    "com_ListGroup1" : MessageLookupByLibrary.simpleMessage("Todo"),
    "com_ListGroup2" : MessageLookupByLibrary.simpleMessage("In progress"),
    "com_ListGroup3" : MessageLookupByLibrary.simpleMessage("Need review"),
    "com_ListGroup4" : MessageLookupByLibrary.simpleMessage("Approved"),
    "com_Login" : MessageLookupByLibrary.simpleMessage("Вход"),
    "com_Unknown" : MessageLookupByLibrary.simpleMessage("Неизвестно"),
    "com_error" : MessageLookupByLibrary.simpleMessage("Ошибка"),
    "com_error0" : MessageLookupByLibrary.simpleMessage("Что-то пошло не так"),
    "com_exit" : MessageLookupByLibrary.simpleMessage("Выход"),
    "com_stay" : MessageLookupByLibrary.simpleMessage("Остаться"),
    "dialog_LogoutQuestion" : MessageLookupByLibrary.simpleMessage("Вы действительно хотите выйти?"),
    "dialog_LogoutQuestionDescription" : MessageLookupByLibrary.simpleMessage("Вам нужно будет снова ввести пароль")
  };
}
