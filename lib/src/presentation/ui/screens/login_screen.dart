import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trello_test/src/presentation/bloc/app_bloc.dart';
import 'package:trello_test/src/presentation/bloc/form/base/form_bloc.dart';
import 'package:trello_test/src/presentation/bloc/form/base/form_blocs.dart';
import 'package:trello_test/src/presentation/bloc/form/form_login_bloc.dart';
import 'package:trello_test/src/presentation/ui/screens/main_screen.dart';
import 'package:trello_test/src/presentation/ui/widget/loading_widget.dart';
import 'package:trello_test/src/utils/locale_helper/l10n.dart';


Widget getFormTextFieldWidget({@required TextFormBloc bloc, @required String label, String error, String initialValue}) {

  return BlocBuilder<FormInputBloc,FormInputBlocState>(
      cubit: bloc,
      builder: (context,state) {
        return TextFormField(
          onChanged: (String text) {
            bloc.updateValue(text);
          },
          focusNode: bloc.getFocus,
          enableSuggestions: false,
          initialValue: initialValue,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top:14.5,bottom: 14.5),
            errorStyle:TextStyle(color: Colors.red),
            errorText: state is FormInputBlocStateInvalid ? error: null,
            counterStyle: state is FormInputBlocStateInvalid ? TextStyle(color: Colors.red) : TextStyle(color: Colors.black),
            labelText: label,
            prefixIcon: Icon(Icons.person_pin_rounded),
          ),
        );
      });
}

class LoginScreen extends StatelessWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    LoginFormBloc formBloc = BlocProvider.of<AppBloc>(context).dependencyManager.get<LoginFormBloc>();

    return Scaffold(
        appBar: AppBar(
          title: Text(S.current.Screen_1),
          ),
    body:Padding(padding:EdgeInsets.all(10),
        child:BlocConsumer<LoginFormBloc,FormBlocState>(
        cubit: formBloc ,
        listener: (context,state) {
          if (state is FormSuccessState ) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()));
          }
        },
        builder: (context,state) {
          if (state is FormLoadingState) return Column(children: [
            SizedBox(height: 100,),
            LoadingIndicator()
          ]);
          else return Column(children: [
            getFormTextFieldWidget(
                bloc:formBloc.fieldName,
                initialValue: formBloc.fieldName.getValue,
                label:S.current.FormLogin_fieldNameText,
                error:S.current.FormLogin_fieldError,
            ),
            getFormTextFieldWidget(
                bloc:formBloc.fieldPassword,
                initialValue: formBloc.fieldPassword.getValue,
                label:S.current.FormLogin_fieldPasswordText,
                error:S.current.FormLogin_fieldError,
            ),
            SizedBox(height: 10,),
            RaisedButton.icon(
              onPressed: () async {
                formBloc.submitForm();
              },
              icon: Icon(Icons.group_outlined),
              label: Text(S.current.com_Login)),
            SizedBox(height: 10,),
            if (state is FormErrorState) Text(state.error,style: TextStyle(color: Colors.red),)
          ]);
          }
    )));
  }

}