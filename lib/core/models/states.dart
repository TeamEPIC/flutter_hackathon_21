import 'package:freezed_annotation/freezed_annotation.dart';

part 'states.freezed.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState(bool value) = Data;
  const factory RegisterState.loading() = Loading;
  const factory RegisterState.error([String message]) = ErrorDetails;
}
