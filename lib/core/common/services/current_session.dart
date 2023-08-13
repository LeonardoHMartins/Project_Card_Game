// // ignore_for_file: unnecessary_getters_setters

// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:working_safety/core/common/features/usecases/usecase.dart';
// import 'package:working_safety/core/shared/general/global_config/domain/entities/global_config_entity.dart';
// import 'package:working_safety/core/shared/user/domain/entities/user_config_entity.dart';
// import 'package:working_safety/core/shared/user/domain/usecases/db/get_configs.dart';
// import 'package:working_safety/core/shared/user/domain/usecases/db/get_user_config.dart';

// class CurrentSession {
//   //Singleton
//   CurrentSession._();
//   static final CurrentSession _instance = CurrentSession._();
//   factory CurrentSession() => CurrentSession._instance;
//   //

//   UserConfigEntity? get user => _user;
//   UserConfigEntity? _user;

//   GlobalConfigEntity? get config => _config;
//   GlobalConfigEntity? _config;

//   Future refreshUser() async {
//     var response = await Modular.get<GetUserConfig>()(NoParams());

//     response.fold((l) => null, (r) => _user = r);
//   }

//   Future updateConfig() async {
//     var response = await Modular.get<GetConfigs>()(NoParams());

//     response.fold((l) => null, (r) => _config = r);
//   }
// }
