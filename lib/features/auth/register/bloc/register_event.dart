import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RegisterEvent extends Equatable {}

class RegisterOtpGetEvent extends RegisterEvent {
  final Map<String, dynamic> map;
  final BuildContext context;
  RegisterOtpGetEvent(this.context, {required this.map});

  @override
  List<Object?> get props => [map];
}
