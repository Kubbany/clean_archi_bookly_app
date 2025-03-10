import 'package:hive/hive.dart';

void cacheData<T>(List<T> data, String boxName) {
  Box<T> box = Hive.box<T>(boxName);
  box.addAll(data);
}
