import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/cihan/FlutterProjects/flutter_hackathon_21/lib/core/providers/boxs_api_providers.dart';
import 'package:flutter_hackathon_21/core/models/states.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:logging/logging.dart';

class RegisterStateNotifier extends StateNotifier<RegisterState> {
  RegisterStateNotifier(this._reader) : super(const RegisterState.loading()) {
    addListener((state) => debugPrint('$state'));
    _init();
  }

  final Reader _reader;
  static final provider = StateNotifierProvider<RegisterStateNotifier>(
      (ref) => RegisterStateNotifier(ref.read));

  void update(RegisterState newState) {
    state = newState;
  }

  Future<void> _init() async {
    final userApiProvider = _reader(UserBoxApiProvider.provider);
    state = RegisterState(userApiProvider.isRegistered);
  }
}
