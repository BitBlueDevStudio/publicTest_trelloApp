// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "ApiError_NoAuth" : MessageLookupByLibrary.simpleMessage("Authorization error"),
    "ApiError_NotFound" : MessageLookupByLibrary.simpleMessage("Not found error"),
    "ApiError_Unexpected" : MessageLookupByLibrary.simpleMessage("Unexpected server error"),
    "FormLogin_fieldError" : MessageLookupByLibrary.simpleMessage("This field should be longer"),
    "FormLogin_fieldNameText" : MessageLookupByLibrary.simpleMessage("User name"),
    "FormLogin_fieldPasswordText" : MessageLookupByLibrary.simpleMessage("Password"),
    "Screen_1" : MessageLookupByLibrary.simpleMessage("Login screen"),
    "Screen_2" : MessageLookupByLibrary.simpleMessage("Board"),
    "appName" : MessageLookupByLibrary.simpleMessage("Trello app"),
    "board_ErrorEmpty" : MessageLookupByLibrary.simpleMessage("Board is empty. Zero cards in all lists"),
    "board_ErrorEmptyList" : MessageLookupByLibrary.simpleMessage("No cards"),
    "com_ListGroup0" : MessageLookupByLibrary.simpleMessage("On hold"),
    "com_ListGroup1" : MessageLookupByLibrary.simpleMessage("Todo"),
    "com_ListGroup2" : MessageLookupByLibrary.simpleMessage("In progress"),
    "com_ListGroup3" : MessageLookupByLibrary.simpleMessage("Need review"),
    "com_ListGroup4" : MessageLookupByLibrary.simpleMessage("Approved"),
    "com_Login" : MessageLookupByLibrary.simpleMessage("Login"),
    "com_Unknown" : MessageLookupByLibrary.simpleMessage("Unknown"),
    "com_error" : MessageLookupByLibrary.simpleMessage("Error"),
    "com_error0" : MessageLookupByLibrary.simpleMessage("Something went wrong"),
    "com_exit" : MessageLookupByLibrary.simpleMessage("Exit"),
    "com_stay" : MessageLookupByLibrary.simpleMessage("Stay"),
    "dialog_LogoutQuestion" : MessageLookupByLibrary.simpleMessage("Do you really want to log out?"),
    "dialog_LogoutQuestionDescription" : MessageLookupByLibrary.simpleMessage("You will need to enter password again")
  };
}
