import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_card_game/core/common/constants/app_routes.dart';
import 'package:project_card_game/modules/game/home/presenter/game_page.dart';
import 'package:project_card_game/modules/home/home/presenter/home_page.dart';

class AppModule extends Module {
  // static GlobalData get globalData => Modular.get<GlobalData>();

  // static Future populate() async {
  //   // var result = await service.sync();
  //   await session.refreshUser();
  //   await session.updateConfig();

  //   // globalData.populate(result);
  // }

  @override
  List<ModularRoute> get routes => [
        /* ChildRoute(
          AppRoutes.notConnection,
          child: (context, args) => NotConnectionPage(),
          transition: TransitionType.fadeIn,
          duration: 500.ms,
        ), */
        ChildRoute(
          AppRoutes.home,
          child: (context, args) => WillPopScope(
            child: const HomePage(),
            onWillPop: () async => false,
          ),
          transition: TransitionType.fadeIn,
          duration: 400.ms,
        ),
        ChildRoute(
          AppRoutes.game,
          child: (context, args) => WillPopScope(
            child: const GamePage(),
            onWillPop: () async => false,
          ),
          transition: TransitionType.fadeIn,
          duration: 400.ms,
        ),
      ];

  // @override
  // List<Bind<Object>> get binds => [
  //       Bind.singleton<ConnectionService>((i) => ConnectionServiceImpl()),
  //       Bind.singleton<RequestService>((i) => DioRequestService()),
  //       Bind.singleton<GlobalData>((i) => GlobalData()),
  //       ...UserLogic.binds,
  //       ...NewObservarLogic.binds
  //     ];
}

// class GlobalData {
//   ObservarModuleGlobalConfigModel? observar;
//   DataGlobalConfigModel? data;

//   void populate(GlobalData dt) {
//     observar = dt.observar;
//     data = dt.data;
//   }
// }
