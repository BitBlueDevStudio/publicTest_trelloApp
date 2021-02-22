import 'package:shared_preferences/shared_preferences.dart';
import 'package:trello_test/src/domain/enties/card_entity.dart';
import 'package:trello_test/src/presentation/bloc/app_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trello_test/src/presentation/bloc/main_bloc.dart';
import 'package:trello_test/src/presentation/ui/screens/login_screen.dart';
import 'package:trello_test/src/presentation/ui/widget/loading_widget.dart';
import 'package:trello_test/src/utils/app_helpers.dart';
import 'package:trello_test/src/utils/locale_helper/l10n.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key key}) : super(key: key);

  Widget _getHeadWidget({List<CardEntity> unknownCards}) {

    List<Tab> tabs=[];
    for (var tab in CardsLists.CardGroups.values) tabs.add(Tab(text: tab));
    if (unknownCards!=null && unknownCards.isNotEmpty) tabs.add(Tab(text: S.current.com_Unknown));


     return TabBar(
        isScrollable: true,
        tabs: tabs
    );
  }

  Widget _getBodyWidget(MainBlocState state) {
    if (state is MainBlocStateLoaded) return TabBarView(
      children: [
        for (var group in state.listItems.keys)
          state.listItems[group].isNotEmpty ? ListView.builder(
            itemCount: state.listItems[group].length,
            itemBuilder: (context, index) {
              CardEntity card=state.listItems[group][index];
              return ListTile(
                title: Card(
                    child:Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("#"+card.id.toString()),
                            SizedBox(height: 5,),
                            Text(card.text),
                          ],
                      )
                )),
              );
            },
          ) : Text(S.current.board_ErrorEmptyList)
      ],
    );
    else if (state is MainBlocStateLoading) return LoadingIndicator();
    else if (state is MainBlocStateError) return Text(S.current.com_error+" "+state.error);
    else if (state is MainBlocStateEmpty) return Text(S.current.board_ErrorEmpty);
    else return Text(S.current.com_error0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => BlocProvider.of<AppBloc>(context).dependencyManager.get<MainBloc>(),
        child: BlocConsumer<MainBloc, MainBlocState>(
            listener: (context,state) {
              if (state is MainBlocStateNoAuth) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              }
            },
            builder: (context, state) {
             return DefaultTabController(
                  length: CardsLists.CardGroups.length,
                  child: Scaffold(
                    appBar: (state is MainBlocStateLoaded) ? AppBar(
                      automaticallyImplyLeading: false,
                      bottom: _getHeadWidget(unknownCards: state.unknownCards) ,
                      title: Text(S.of(context).Screen_2),
                    ) : null,
                    body: Padding(padding:EdgeInsets.only(top:10,left: 3,right: 3),child:_getBodyWidget(state)),

                   floatingActionButton: (state is MainBlocStateLoaded) ? FloatingActionButton(
                      onPressed: () {
                        MainBloc bloc=BlocProvider.of<MainBloc>(context);
                        return showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(S.of(context).dialog_LogoutQuestion),
                              content: Text(S.of(context).dialog_LogoutQuestionDescription),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text(S.of(context).com_exit),
                                  onPressed: () {
                                    bloc.add(MainBlocEventLogOut());
                                    bloc.close();
                                    Navigator.of(context).pop();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginScreen()));
                                  },
                                ),
                                FlatButton(
                                  child: Text(S.of(context).com_stay),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.backspace_rounded),
                    ) : null,
                  ));
            }));
  }

}