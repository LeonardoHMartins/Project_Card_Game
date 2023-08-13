import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:project_card_game/modules/game/home/components/center_dispute_votation.dart';
import 'package:project_card_game/modules/game/home/components/deck_center_cards.dart';
import 'package:project_card_game/modules/game/home/components/hand_cards.dart';
import 'package:project_card_game/modules/game/home/components/hand_cards_player2.dart';
import 'package:project_card_game/modules/game/home/components/hand_cards_player3.dart';
import 'package:project_card_game/modules/game/home/components/hand_cards_player4.dart';
import 'package:project_card_game/modules/game/home/cubit/game_cubit.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  GameCubit cubit = GameCubit();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      bloc: cubit,
      builder: (context, state) {
        if (state is GameInitial) {
          return Scaffold(
              backgroundColor: Colors.black,
              body: Padding(
                padding: const EdgeInsets.all(0),
                child: Stack(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: HandCardsPlayer3(),
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: HandCardsPlayer4(),
                    ),
                    const Align(
                      alignment: Alignment.topCenter,
                      child: HandCardsPlayer2(),
                    ),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: HandCards(),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CenterDisputeVotation(),
                          const Gap(20),
                          Container(
                            width: 275,
                            height: 200,
                            decoration: const BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: DeckCenterCards(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        }
        return Container();
      },
    );
  }
}
