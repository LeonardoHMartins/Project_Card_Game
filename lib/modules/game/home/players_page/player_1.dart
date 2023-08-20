import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:project_card_game/modules/game/home/components/center_dispute_votation.dart';
import 'package:project_card_game/modules/game/home/components/deck_center_cards.dart';
import 'package:project_card_game/modules/game/home/components/hand_cards.dart';
import 'package:project_card_game/modules/game/home/components/hand_cards_player3.dart';
import 'package:project_card_game/modules/game/home/components/hand_cards_player2.dart';
import 'package:project_card_game/modules/game/home/components/hand_cards_player4.dart';
import 'package:project_card_game/modules/game/home/cubit/game_cubit.dart';

class Player1 extends StatefulWidget {
  const Player1({super.key});

  @override
  State<Player1> createState() => _Player1State();
}

class _Player1State extends State<Player1> {
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: HandCardsPlayer2(playerJogando: 2),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: HandCardsPlayer4(playerJogando: 4),
                        ),
                      ],
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: HandCardsPlayer3(playerJogando: 3),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: HandCards(playerJogando: 1),
                        ),
                      ],
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
