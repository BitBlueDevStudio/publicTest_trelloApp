import 'package:trello_test/src/data/api_services/trello_api_service.dart';
import 'package:trello_test/src/domain/interactors/form/form_login_interactor.dart';

import 'base/form_bloc.dart';
import 'base/form_blocs.dart';

class LoginFormBloc extends FormBloc<FormLoginInteractor> {


  final TextFormBloc fieldName=TextFormBloc((String value) {
    if (value==null || value.length<4)
    {
      return false;
    }
    return true;
  });

  final TextFormBloc fieldPassword=TextFormBloc((String value) {
    if (value==null || value.length<8)
    {
      return false;
    }
    return true;
  });

  LoginFormBloc(FormLoginInteractor interactor) : super(FormLoadingState(),interactor) {
   init();
  }

  void init() async {
    fieldList.add(fieldName);
    fieldList.add(fieldPassword);
    loadForm();
  }

  @override Future<bool> submitForm() async {

    if (!(await super.submitForm()))  {
      return null;
    }

    emitSubmiting();

    try {
      await interactor.authorizeUser(fieldName.getValue, fieldPassword.getValue);

      emitSuccess(true);
      fieldName.updateValue("");
      fieldPassword.updateValue("");

    } on AuthException catch (e) {
      emitFailure(e.cause);
    }
    catch (e) {
      emitFailure(e.toString());
    }

  }

}