import 'package:tech_task/data/repository/repository.dart';

import '../remote/remote.dart';

class AppRepositoryImpl extends AppRepository {
  final AppRemote remote;

  AppRepositoryImpl(
    this.remote,
  );

}
