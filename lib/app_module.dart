import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_card_game/core/common/constants/app_routes.dart';
import 'package:project_card_game/modules/game/home/cubit/game_cubit.dart';
import 'package:project_card_game/modules/game/home/players_page/player_1.dart';
import 'package:project_card_game/modules/game/home/players_page/player_2.dart';
import 'package:project_card_game/modules/game/home/players_page/player_3.dart';
import 'package:project_card_game/modules/game/home/players_page/player_4.dart';
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
          AppRoutes.player1,
          child: (context, args) => WillPopScope(
            child: const Player1(),
            onWillPop: () async => false,
          ),
          transition: TransitionType.fadeIn,
          duration: 400.ms,
        ),
        ChildRoute(
          AppRoutes.player2,
          child: (context, args) => WillPopScope(
            child: const Player2(),
            onWillPop: () async => false,
          ),
          transition: TransitionType.fadeIn,
          duration: 400.ms,
        ),
        ChildRoute(
          AppRoutes.player3,
          child: (context, args) => WillPopScope(
            child: const Player3(),
            onWillPop: () async => false,
          ),
          transition: TransitionType.fadeIn,
          duration: 400.ms,
        ),
        ChildRoute(
          AppRoutes.player4,
          child: (context, args) => WillPopScope(
            child: const Player4(),
            onWillPop: () async => false,
          ),
          transition: TransitionType.fadeIn,
          duration: 400.ms,
        ),
      ];

  @override
  List<Bind> get binds => [
        Bind.singleton<GameCubit>((i) => GameCubit()),
      ];
}

// class GlobalData {
//   ObservarModuleGlobalConfigModel? observar;
//   DataGlobalConfigModel? data;

//   void populate(GlobalData dt) {
//     observar = dt.observar;
//     data = dt.data;
//   }
// }
