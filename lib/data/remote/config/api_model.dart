import 'package:equatable/equatable.dart';

class ApiModel extends Equatable {
  final bool status;
  final dynamic data;
  final String message;
  final List<dynamic> messages;
  final String messageKey;
  final int statusCode;

  const ApiModel({
    required this.status,
    required this.data,
    required this.message,
    required this.messages,
    required this.messageKey,
    required this.statusCode,
  });

  @override
  List<Object> get props =>
      [status, data, message, messages, messageKey, statusCode];

  @override
  String toString() =>
      '{status:$status,data:$data ,message:"$message",messageKey:"$messageKey",messages:"$messages",statusCode:$statusCode}';
}
