import 'package:trello_test/src/data/repo/i_repository_cards.dart';
import 'package:trello_test/src/presentation/bloc/app_bloc.dart';
import 'package:trello_test/src/presentation/bloc/form/form_login_bloc.dart';
import 'package:trello_test/src/presentation/ui/screens/login_screen.dart';
import 'package:trello_test/src/presentation/ui/screens/main_screen.dart';
import 'package:trello_test/src/utils/app_helpers.dart';
import 'package:trello_test/src/utils/dependency_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trello_test/src/utils/locale_helper/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

void main() {
  runApp(TrelloApp());
}


class TrelloApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Injector injector=DependencyManager.initialise(Injector());

    return BlocProvider(
        create: (context) => injector.get<AppBloc>(),
        child: BlocBuilder<AppBloc,AppBlocState>( builder: (cont,state) {

          return MaterialApp(
            //title: S.of(cont).appName,
            onGenerateTitle: (context) {
              return S.of(context).appName;
            },
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: ThemeData(

              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            initialRoute: RoutesHelper.routeMain,
            routes: {
              RoutesHelper.routeMain: (ctx) => MainScreen(),
              RoutesHelper.routeLogin: (ctx) => LoginScreen(),
            },
            //home: HomeScreen()
          );
        }
        ));
  }
}