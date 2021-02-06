// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RegisterStateTearOff {
  const _$RegisterStateTearOff();

// ignore: unused_element
  Data<bool> call<bool>(bool value) {
    return Data<bool>(
      value,
    );
  }

// ignore: unused_element
  Loading<bool> loading<bool>() {
    return Loading<bool>();
  }

// ignore: unused_element
  ErrorDetails<bool> error<bool>([String message]) {
    return ErrorDetails<bool>(
      message,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RegisterState = _$RegisterStateTearOff();

/// @nodoc
mixin _$RegisterState<bool> {
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(bool value), {
    @required TResult loading(),
    @required TResult error(String message),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(bool value), {
    TResult loading(),
    TResult error(String message),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(Data<bool> value), {
    @required TResult loading(Loading<bool> value),
    @required TResult error(ErrorDetails<bool> value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(Data<bool> value), {
    TResult loading(Loading<bool> value),
    TResult error(ErrorDetails<bool> value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $RegisterStateCopyWith<bool, $Res> {
  factory $RegisterStateCopyWith(
          RegisterState<bool> value, $Res Function(RegisterState<bool>) then) =
      _$RegisterStateCopyWithImpl<bool, $Res>;
}

/// @nodoc
class _$RegisterStateCopyWithImpl<bool, $Res>
    implements $RegisterStateCopyWith<bool, $Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  final RegisterState<bool> _value;
  // ignore: unused_field
  final $Res Function(RegisterState<bool>) _then;
}

/// @nodoc
abstract class $DataCopyWith<bool, $Res> {
  factory $DataCopyWith(Data<bool> value, $Res Function(Data<bool>) then) =
      _$DataCopyWithImpl<bool, $Res>;
  $Res call({bool value});
}

/// @nodoc
class _$DataCopyWithImpl<bool, $Res>
    extends _$RegisterStateCopyWithImpl<bool, $Res>
    implements $DataCopyWith<bool, $Res> {
  _$DataCopyWithImpl(Data<bool> _value, $Res Function(Data<bool>) _then)
      : super(_value, (v) => _then(v as Data<bool>));

  @override
  Data<bool> get _value => super._value as Data<bool>;

  @override
  $Res call({
    Object value = freezed,
  }) {
    return _then(Data<bool>(
      value == freezed ? _value.value : value as bool,
    ));
  }
}

/// @nodoc
class _$Data<bool> implements Data<bool> {
  const _$Data(this.value) : assert(value != null);

  @override
  final bool value;

  @override
  String toString() {
    return 'RegisterState<$bool>(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Data<bool> &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  $DataCopyWith<bool, Data<bool>> get copyWith =>
      _$DataCopyWithImpl<bool, Data<bool>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(bool value), {
    @required TResult loading(),
    @required TResult error(String message),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return $default(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(bool value), {
    TResult loading(),
    TResult error(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(Data<bool> value), {
    @required TResult loading(Loading<bool> value),
    @required TResult error(ErrorDetails<bool> value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(Data<bool> value), {
    TResult loading(Loading<bool> value),
    TResult error(ErrorDetails<bool> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class Data<bool> implements RegisterState<bool> {
  const factory Data(bool value) = _$Data<bool>;

  bool get value;
  @JsonKey(ignore: true)
  $DataCopyWith<bool, Data<bool>> get copyWith;
}

/// @nodoc
abstract class $LoadingCopyWith<bool, $Res> {
  factory $LoadingCopyWith(
          Loading<bool> value, $Res Function(Loading<bool>) then) =
      _$LoadingCopyWithImpl<bool, $Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<bool, $Res>
    extends _$RegisterStateCopyWithImpl<bool, $Res>
    implements $LoadingCopyWith<bool, $Res> {
  _$LoadingCopyWithImpl(
      Loading<bool> _value, $Res Function(Loading<bool>) _then)
      : super(_value, (v) => _then(v as Loading<bool>));

  @override
  Loading<bool> get _value => super._value as Loading<bool>;
}

/// @nodoc
class _$Loading<bool> implements Loading<bool> {
  const _$Loading();

  @override
  String toString() {
    return 'RegisterState<$bool>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading<bool>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(bool value), {
    @required TResult loading(),
    @required TResult error(String message),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(bool value), {
    TResult loading(),
    TResult error(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(Data<bool> value), {
    @required TResult loading(Loading<bool> value),
    @required TResult error(ErrorDetails<bool> value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(Data<bool> value), {
    TResult loading(Loading<bool> value),
    TResult error(ErrorDetails<bool> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<bool> implements RegisterState<bool> {
  const factory Loading() = _$Loading<bool>;
}

/// @nodoc
abstract class $ErrorDetailsCopyWith<bool, $Res> {
  factory $ErrorDetailsCopyWith(
          ErrorDetails<bool> value, $Res Function(ErrorDetails<bool>) then) =
      _$ErrorDetailsCopyWithImpl<bool, $Res>;
  $Res call({String message});
}

/// @nodoc
class _$ErrorDetailsCopyWithImpl<bool, $Res>
    extends _$RegisterStateCopyWithImpl<bool, $Res>
    implements $ErrorDetailsCopyWith<bool, $Res> {
  _$ErrorDetailsCopyWithImpl(
      ErrorDetails<bool> _value, $Res Function(ErrorDetails<bool>) _then)
      : super(_value, (v) => _then(v as ErrorDetails<bool>));

  @override
  ErrorDetails<bool> get _value => super._value as ErrorDetails<bool>;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(ErrorDetails<bool>(
      message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$ErrorDetails<bool> implements ErrorDetails<bool> {
  const _$ErrorDetails([this.message]);

  @override
  final String message;

  @override
  String toString() {
    return 'RegisterState<$bool>.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ErrorDetails<bool> &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  $ErrorDetailsCopyWith<bool, ErrorDetails<bool>> get copyWith =>
      _$ErrorDetailsCopyWithImpl<bool, ErrorDetails<bool>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>(
    TResult $default(bool value), {
    @required TResult loading(),
    @required TResult error(String message),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>(
    TResult $default(bool value), {
    TResult loading(),
    TResult error(String message),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>(
    TResult $default(Data<bool> value), {
    @required TResult loading(Loading<bool> value),
    @required TResult error(ErrorDetails<bool> value),
  }) {
    assert($default != null);
    assert(loading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>(
    TResult $default(Data<bool> value), {
    TResult loading(Loading<bool> value),
    TResult error(ErrorDetails<bool> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorDetails<bool> implements RegisterState<bool> {
  const factory ErrorDetails([String message]) = _$ErrorDetails<bool>;

  String get message;
  @JsonKey(ignore: true)
  $ErrorDetailsCopyWith<bool, ErrorDetails<bool>> get copyWith;
}
