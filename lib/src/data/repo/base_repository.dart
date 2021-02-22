import '../base_data_store.dart';

class BaseRepository <T extends BaseDataStore> {
  final T datastore;

  BaseRepository(this.datastore);
}