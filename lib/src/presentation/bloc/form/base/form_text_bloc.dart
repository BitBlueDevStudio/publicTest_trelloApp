import 'form_input_bloc.dart';

class TextFormBloc extends FormInputBloc<String> {

  @override bool Function(String value) validationCallback;

  TextFormBloc([this.validationCallback]) : super(FormInputBlocStateLoading(),validationCallback);

}

