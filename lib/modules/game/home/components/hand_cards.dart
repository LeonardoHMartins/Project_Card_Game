import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:project_card_game/core/shared/cards/data/models/card_model.dart';
import 'package:project_card_game/modules/game/home/components/center_dispute_cards_modal.dart';
import 'package:project_card_game/modules/game/home/components/hand_show_card_modal.dart';
import 'package:project_card_game/modules/game/home/cubit/game_cubit.dart';

class HandCards extends StatefulWidget {
  const HandCards({super.key, required this.playerJogando});
  final int playerJogando;

  @override
  State<HandCards> createState() => _HandCardsState();
}

class _HandCardsState extends State<HandCards> {
  GameCubit cubit = Modular.get<GameCubit>();
  Color? colorCard;
  List<CardModel>? cards = [];

  @override
  void initState() {
    super.initState();
    if (widget.playerJogando == 1) {
      colorCard = Colors.blue;
      cards = cubit.cardsPlayer1;
      return;
    }
    if (widget.playerJogando == 2) {
      colorCard = Colors.green;
      cards = cubit.cardsPlayer2;
      return;
    }
    if (widget.playerJogando == 3) {
      colorCard = Colors.red;
      cards = cubit.cardsPlayer3;
      return;
    }
    if (widget.playerJogando == 4) {
      colorCard = Colors.pink;
      cards = cubit.cardsPlayer4;
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    int player = widget.playerJogando;
    return BlocBuilder<GameCubit, GameState>(
      bloc: cubit,
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cards!.isEmpty
                    ? Container()
                    : GestureDetector(
                        onTap: () async {
                          if (cubit.player == 1) {
                            await HandShowCardModal(
                              player: player,
                              card: cards![0],
                            ).show(context);
                            cubit.resp1 == true
                                ? Timer(const Duration(seconds: 2), () {
                                    CenterDisputeCardsModal(
                                      card: cubit.deckCenter[0],
                                    ).show(context);
                                    cubit.resp1 = null;
                                  })
                                : null;
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: colorCard,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          width: 100,
                          height: 200,
                          child: Center(child: Text(cards![0].name, style: const TextStyle(fontWeight: FontWeight.bold))),
                        ),
                      ),
                const Gap(10),
                cards!.length > 1
                    ? GestureDetector(
                        onTap: () async {
                          if (cubit.player == 1) {
                            await HandShowCardModal(
                              player: player,
                              card: cards![1],
                            ).show(context);
                            cubit.resp1 == true
                                ? Timer(const Duration(seconds: 2), () {
                                    CenterDisputeCardsModal(
                                      card: cubit.deckCenter[0],
                                    ).show(context);
                                    cubit.resp1 = null;
                                  })
                                : null;
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: colorCard,
                            borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                          ),
                          width: 100,
                          height: 200,
                          child: Center(child: Text(cards![1].name, style: const TextStyle(fontWeight: FontWeight.bold))),
                        ),
                      )
                    : Container(),
                const Gap(10),
                cards!.length > 2
                    ? GestureDetector(
                        onTap: () async {
                          if (cubit.player == 1) {
                            await HandShowCardModal(
                              player: player,
                              card: cards![2],
                            ).show(context);
                            cubit.resp1 == true
                                ? Timer(const Duration(seconds: 2), () {
                                    CenterDisputeCardsModal(
                                      card: cubit.deckCenter[0],
                                    ).show(context);
                                    cubit.resp1 = null;
                                  })
                                : null;
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: colorCard,
                            borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                          ),
                          width: 100,
                          height: 200,
                          child: Center(child: Text(cards![2].name, style: const TextStyle(fontWeight: FontWeight.bold))),
                        ),
                      )
                    : Container(),
                const Gap(10),
                cards!.length > 3
                    ? GestureDetector(
                        onTap: () async {
                          if (cubit.player == 1) {
                            await HandShowCardModal(
                              player: player,
                              card: cards![3],
                            ).show(context);
                            cubit.resp1 == true
                                ? Timer(const Duration(seconds: 2), () {
                                    CenterDisputeCardsModal(
                                      card: cubit.deckCenter[0],
                                    ).show(context);
                                    cubit.resp1 = null;
                                  })
                                : null;
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: colorCard,
                            borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                          ),
                          width: 100,
                          height: 200,
                          child: Center(child: Text(cards![3].name, style: const TextStyle(fontWeight: FontWeight.bold))),
                        ),
                      )
                    : Container(),
              ],
            ),
          ],
        );
      },
    );
  }
}
