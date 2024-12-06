import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable {}

class LoginOtpGetEvent extends LoginEvent {
  final Map<String, dynamic> map;
  LoginOtpGetEvent({required this.map});

  @override
  List<Object?> get props => [map];
}

class LoginOtpVerifyEvent extends LoginEvent {
  final Map<String, dynamic> map;
  final BuildContext context;
  LoginOtpVerifyEvent({required this.map, required this.context});

  @override
  List<Object?> get props => [map];
}
