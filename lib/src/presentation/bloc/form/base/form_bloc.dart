
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trello_test/src/domain/interactors/base_interactor.dart';

import 'form_blocs.dart';

abstract class FormBloc<T extends BaseInteractor> extends Cubit<FormBlocState>{

  final T interactor;

  FormBloc(FormBlocState state,this.interactor) : super(state);

  List<FormInputBloc> fieldList=[];


  loadForm() async {
    try {
      for (var field in fieldList) {
        if (field.formBloc==null) field.formBloc=this;
        field.loadField();
      }

      emit(FormLoadedState());

    } catch (e) {
      emit(FormErrorState(e.toString()));
    }
  }

  refreshForm() async {
    emit(FormLoadingState());
    emit(FormLoadedState());
  }

  Future<dynamic> submitForm() async {

      for (var field in fieldList) {
        await field.fieldValidation();
      }

      if (fieldList.where((element) => element.state is FormInputBlocStateInvalid).length>0) {
        emitInvalid();
        return false;
      }

      return true;
  }

  emitSuccess(bool canSubmitAgain) async {
    emit(FormSuccessState());
  }

  emitSubmiting() async {
    emit(FormLoadingState());
  }

  emitFailure(String error) async {
    emit(FormErrorState(error));
  }

  emitInvalid() async {

  }
  
}


class FormBlocState extends Equatable {


  FormBlocState();

  @override
  List<Object> get props => [];

}

class FormInitState extends FormBlocState {}

class FormLoadingState extends FormBlocState {}

class FormLoadedState extends FormBlocState {}

class FormSuccessState extends FormBlocState {}

class FormInvalidState extends FormBlocState {}

class FormErrorState extends FormBlocState {

  final String error;

  FormErrorState(this.error);

  @override
  List<Object> get props => [];
}
