import 'package:freezed_annotation/freezed_annotation.dart';

part 'states.freezed.dart';

@freezed
abstract class RegisterState<bool> with _$RegisterState<bool> {
  const factory RegisterState(bool value) = Data<bool>;

  const factory RegisterState.loading() = Loading<bool>;

  const factory RegisterState.error([String message]) = ErrorDetails<bool>;
}
