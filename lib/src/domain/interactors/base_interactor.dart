import 'package:trello_test/src/data/repo/base_repository.dart';

abstract class BaseInteractor {
  final BaseRepository repo;
  BaseInteractor(this.repo);
}