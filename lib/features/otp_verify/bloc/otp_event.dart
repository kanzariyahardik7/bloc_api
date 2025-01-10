import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class OtpEvent extends Equatable {}

class LoginOtpVerifyEvent extends OtpEvent {
  final Map<String, dynamic> map;
  final BuildContext context;
  LoginOtpVerifyEvent({required this.map, required this.context});

  @override
  List<Object?> get props => [map];
}

class RegisterOtpVerifyEvent extends OtpEvent {
  final Map<String, dynamic> map;
  final BuildContext context;
  RegisterOtpVerifyEvent({required this.map, required this.context});
  @override
  List<Object?> get props => [map];
}
