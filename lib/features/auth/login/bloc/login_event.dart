import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable {}

class LoginOtpGetEvent extends LoginEvent {
  final Map<String, dynamic> map;
  final BuildContext context;
  LoginOtpGetEvent(this.context, {required this.map});

  @override
  List<Object?> get props => [map];
}
