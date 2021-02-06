import 'package:flutter/foundation.dart';
import 'package:flutter_hackathon_21/core/constants/app/app_constants.dart';
import 'package:flutter_hackathon_21/core/models/models.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';

Future<void> hiveSetup() async {
  await Hive.initFlutter();

  Hive.registerAdapter(BulletinTypeAdapter());
  Hive.registerAdapter(BulletinHiveObjectAdapter());
  Hive.registerAdapter(UserHiveObjectAdapter());

  await Hive.openBox<UserHiveObject>(AppConstants.BOX_NAME_USER);
  await Hive.openBox<BulletinHiveObject>(AppConstants.BOX_NAME_BULLETINS);
}

void loggerSetup() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(
      (record) => debugPrint('${record.loggerName} : ${record.message}'));
}
