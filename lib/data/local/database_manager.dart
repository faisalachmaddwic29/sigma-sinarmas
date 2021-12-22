// ignore_for_file: avoid_print

import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart' as paths;
import 'package:path/path.dart' as p;
import 'package:sinarmas/domain/models/local/favorites_table.dart';

import 'db/favorite/favorite_dao.dart';

part 'database_manager.g.dart';

@UseMoor(tables: [Favorites], daos: [FavoritesDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) {
        print(m);
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {},
      beforeOpen: (details) async {},
    );
  }
}

AppDatabase openConnection({bool logStatements = true}) {
  if (Platform.isIOS || Platform.isAndroid) {
    final executor = LazyDatabase(() async {
      final dataDir = await paths.getApplicationDocumentsDirectory();
      print(dataDir);
      final dbFile = File(p.join(dataDir.path, 'db.sqlite'));
      print(dbFile);

      return VmDatabase(dbFile, logStatements: logStatements);
    });
    return AppDatabase(executor);
  }
  return AppDatabase(VmDatabase.memory(logStatements: logStatements));
}
