import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginOtpGetEvent extends LoginEvent {
  final Map<String, dynamic> map;
  LoginOtpGetEvent({required this.map});

  @override
  List<Object?> get props => [map];
}
