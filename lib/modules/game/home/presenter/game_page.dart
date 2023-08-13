import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_card_game/core/common/extensions/context_extension.dart';
import 'package:project_card_game/modules/game/home/components/hand_cards.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(30),
      child: Stack(
        children: [
          Container(
            color: Colors.black,
            width: context.widthPx,
            height: context.heightPx,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      width: 100,
                      height: 200,
                    ),
                    const Gap(10),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                      ),
                      width: 100,
                      height: 200,
                    ),
                  ],
                ),
              ],
            ),
            const HandCards(),
          ]),
        ],
      ),
    ));
  }
}
