import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HelperFunctions{
    Future<void> deleteHiveDatabase() async {
  // Get the directory where Hive database files are stored
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String hiveDbPath = appDocDir.path;

  // Close all open Hive boxes before deleting the database
  await Hive.close();

  // Delete the Hive database directory
  await Directory(hiveDbPath).delete(recursive: true);

  // Optionally, you can delete the lock file as well
  // if it's present
  File lockFile = File('$hiveDbPath.lock');
  if (await lockFile.exists()) {
    await lockFile.delete();
  }

  print('Hive database deleted successfully.');
}
}