import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_hackathon_21/core/constants/app/app_constants.dart';
import 'package:flutter_hackathon_21/core/models/models.dart';
import 'package:flutter_hackathon_21/core/models/states.dart';
import 'package:flutter_hackathon_21/core/providers/providers.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';

mixin ProviderMixin<T extends HiveObject> on BoxApiBase<T> {
  Reader _reader;
}

abstract class BoxApiBase<T extends HiveObject> {
  BoxApiBase(String boxName)
      : _boxName = boxName,
        _logger = Logger(boxName) {
    assert(boxName.isNotEmpty && boxName != null);
    assert(_box.isOpen);
  }

  final String _boxName;
  final Logger _logger;

  Box<T> get _box => Hive.box<T>(_boxName);

  ValueListenable<Box<T>> get listenable => _box.listenable();

  @mustCallSuper
  Future<T> create(T object) async {
    await _box.add(object);
    _logger.info('$object created');
    return object;
  }

  @mustCallSuper
  Future<int> clearAll() async {
    final deletedItems = await _box.clear();
    _logger.info('$deletedItems items deleted');
    return deletedItems;
  }

  @protected
  Future<void> remove(T object) async {
    if (object.isInBox) {
      await (object).delete();
      _logger.info('$object deleted');
    }
  }
}

class UserBoxApiProvider extends BoxApiBase<UserHiveObject>
    with ProviderMixin<UserHiveObject> {
  UserBoxApiProvider(Reader reader) : super(AppConstants.BOX_NAME_USER) {
    _reader = reader;
  }

  static final provider = Provider((ref) => UserBoxApiProvider(ref.read));

  UserHiveObject get user => _box.values.first;

  bool get isRegistered => _box.isNotEmpty;

  @override
  Future<UserHiveObject> create(UserHiveObject user) async {
    await super.create(user);
    _reader(RegisterStateNotifier.provider).update(RegisterState(true));
    return user;
  }

  @override
  Future<int> clearAll() async {
    final deletedItems = await super.clearAll();
    _reader(RegisterStateNotifier.provider).update(RegisterState(false));
    return deletedItems;
  }
}

class BulletinsBoxApiProvider extends BoxApiBase<BulletinHiveObject>
    with ProviderMixin<BulletinHiveObject> {
  BulletinsBoxApiProvider(Reader reader)
      : super(AppConstants.BOX_NAME_BULLETINS) {
    _reader = reader;
    if (false) {
      _init();
    }
  }

  static final provider = Provider((ref) => BulletinsBoxApiProvider(ref.read));

  Future<void> _init() async {
    if (_box.isEmpty) {
      final jsonData = jsonDecode(
              await rootBundle.loadString(AppConstants.MOCK_BULLETINS_PATH))
          as List<dynamic>;
      final hiveObjects = jsonData.map((packageJson) =>
          BulletinHiveObject.fromJson(packageJson as Map<String, dynamic>));

      await _box.addAll(hiveObjects);
    }
  }
}
