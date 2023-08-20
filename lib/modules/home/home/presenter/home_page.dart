import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_card_game/core/common/constants/app_routes.dart';
import 'package:project_card_game/ui/components/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Button(
              onPressed: () async {
                Modular.to.navigate(AppRoutes.player1);
              },
              child: const Text('Player 1'),
            ),
            Button(
              onPressed: () async {
                Modular.to.navigate(AppRoutes.player2);
              },
              child: const Text('Player 2'),
            ),
            Button(
              onPressed: () async {
                Modular.to.navigate(AppRoutes.player3);
              },
              child: const Text('Player 3'),
            ),
            Button(
              onPressed: () async {
                Modular.to.navigate(AppRoutes.player4);
              },
              child: const Text('Player 4'),
            ),
          ],
        ),
      ),
    );
  }
}
