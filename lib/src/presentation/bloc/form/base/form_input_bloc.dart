import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'form_bloc.dart';

class FormInputBlocState<T> extends Equatable {

  final T value;
  FormInputBlocState(this.value);

  @override
  List<Object> get props => [this.value];

}

class FormInputBlocStateLoaded<T> extends FormInputBlocState {
  FormInputBlocStateLoaded(value) : super(value);

}

class FormInputBlocStateLoading extends FormInputBlocState {
  FormInputBlocStateLoading() : super(null);

  @override
  List<Object> get props => [];

}

class FormInputBlocStateInvalid<T> extends FormInputBlocStateLoaded {
  final T value;
  FormInputBlocStateInvalid(this.value) : super(value);

  @override
  List<Object> get props => [this.value];
}


abstract class FormInputBloc<T> extends Cubit<FormInputBlocState>{
  FormInputBloc(FormInputBlocState state,[this.validationCallback, this._value]) : super(state) {
    _focus.addListener(onFocusChange);
  }

  T _value;
  T get getValue => _value;



  FormBloc formBloc;
  //FormBloc getForm(dynamic context) => BlocProvider.of<FormBloc>(context);

  bool Function(T value) validationCallback;

  final FocusNode _focus = new FocusNode();
  FocusNode get getFocus => _focus;

  loadField() async {
    emit(FormInputBlocStateLoaded(_value));
  }

  setValidator(Function(T value) validation) {
    this.validationCallback=validation;
  }

  updateValue(T newValue) async {
    _value=newValue;
    loadField();
  }

  fieldValidation() async {
    try {
      if (validationCallback != null && !validationCallback(_value))
        emit(FormInputBlocStateInvalid(_value));
    } catch (e) {
      log(e);
    }
  }

  onFocusChange() async {
    if (!_focus.hasFocus) fieldValidation();
    else emit(FormInputBlocStateLoaded(_value));
  }


}