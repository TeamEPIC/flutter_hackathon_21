import 'package:flutter/foundation.dart';
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
    testUserProvider();
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

  Future<void> testUserProvider() async {
    return;
    await clearAll();
    await create(UserHiveObject(
        phone: '05322709042',
        mail: 'b.cihancengiz@gmail.com',
        city: 'Antalya',
        bio: 'bio',
        name: 'Cihan Cengiz',
        age: 29));
  }
}

class BulletinsBoxApiProvider extends BoxApiBase<BulletinHiveObject>
    with ProviderMixin<BulletinHiveObject> {
  BulletinsBoxApiProvider(Reader reader)
      : super(AppConstants.BOX_NAME_BULLETINS) {
    _reader = reader;
    _addMocks();
    testBulletinsProvider();
  }

  static final provider = Provider((ref) => BulletinsBoxApiProvider(ref.read));

  Future<void> _addMocks() async {
    if (_box.isEmpty) {
      await _box.addAll(Mocks.bulletins);
    }
  }

  Future<void> testBulletinsProvider() async {
    return;
    await clearAll();

    final mock = <BulletinHiveObject>[
      BulletinHiveObject(
          user: UserHiveObject(
              phone: '05322709042',
              mail: 'b.cihancengiz@gmail.com',
              city: 'Antalya',
              bio: 'bio',
              name: 'Cihan Cengiz',
              age: 29),
          type: BulletinType.mentor,
          content: 'Matematik',
          createdTme: DateTime.now().subtract(Duration(days: 1)),
          additional:
              'İstanbuldada bir öğrenciye Flutter mobil uygulama eğitimi verebilir ve yazılım alanında mentörlük yapabilirim',
          title: 'Matematik Dersi'),
      BulletinHiveObject(
          user: UserHiveObject(
              phone: '05322709042',
              mail: 'b.cihancengiz@gmail.com',
              city: 'Antalya',
              bio: 'bio',
              name: 'Cihan Cengiz',
              age: 29),
          type: BulletinType.mentor,
          content: 'Matematik',
          createdTme: DateTime.now().subtract(Duration(days: 1)),
          additional:
              'İstanbuldada bir öğrenciye Flutter mobil uygulama eğitimi verebilir ve yazılım alanında mentörlük yapabilirim',
          title: 'Matematik Dersi'),
      BulletinHiveObject(
          user: UserHiveObject(
              phone: '05322709042',
              mail: 'b.cihancengiz@gmail.com',
              city: 'Antalya',
              bio: 'bio',
              name: 'Cihan Cengiz',
              age: 29),
          type: BulletinType.mentor,
          content: 'Matematik',
          createdTme: DateTime.now().subtract(Duration(days: 1)),
          additional:
              'İstanbuldada bir öğrenciye Flutter mobil uygulama eğitimi verebilir ve yazılım alanında mentörlük yapabilirim',
          title: 'Matematik Dersi')
    ];

    await Future.forEach<BulletinHiveObject>(
        mock, (element) async => await create(element));
  }
}
