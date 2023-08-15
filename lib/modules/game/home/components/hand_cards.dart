import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:project_card_game/modules/game/home/components/center_dispute_cards_modal.dart';
import 'package:project_card_game/modules/game/home/components/hand_show_card_modal.dart';
import 'package:project_card_game/modules/game/home/cubit/game_cubit.dart';

class HandCards extends StatefulWidget {
  const HandCards({super.key});

  @override
  State<HandCards> createState() => _HandCardsState();
}

class _HandCardsState extends State<HandCards> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GameCubit cubit = Modular.get<GameCubit>();
    return BlocBuilder<GameCubit, GameState>(
      bloc: cubit,
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cubit.cardsPlayer1.isEmpty
                    ? Container()
                    : GestureDetector(
                        onTap: () async {
                          if (cubit.player == 1) {
                            await HandShowCardModal(
                              player: 1,
                              card: cubit.cardsPlayer1[0],
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
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          width: 100,
                          height: 200,
                          child: Center(child: Text(cubit.cardsPlayer1[0].name, style: const TextStyle(fontWeight: FontWeight.bold))),
                        ),
                      ),
                const Gap(10),
                cubit.cardsPlayer1.length > 1
                    ? GestureDetector(
                        onTap: () async {
                          if (cubit.player == 1) {
                            await HandShowCardModal(
                              player: 1,
                              card: cubit.cardsPlayer1[1],
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
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                          ),
                          width: 100,
                          height: 200,
                          child: Center(child: Text(cubit.cardsPlayer1[1].name, style: const TextStyle(fontWeight: FontWeight.bold))),
                        ),
                      )
                    : Container(),
                const Gap(10),
                cubit.cardsPlayer1.length > 2
                    ? GestureDetector(
                        onTap: () async {
                          if (cubit.player == 1) {
                            await HandShowCardModal(
                              player: 1,
                              card: cubit.cardsPlayer1[2],
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
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                          ),
                          width: 100,
                          height: 200,
                          child: Center(child: Text(cubit.cardsPlayer1[2].name, style: const TextStyle(fontWeight: FontWeight.bold))),
                        ),
                      )
                    : Container(),
                const Gap(10),
                cubit.cardsPlayer1.length > 3
                    ? GestureDetector(
                        onTap: () async {
                          if (cubit.player == 1) {
                            await HandShowCardModal(
                              player: 1,
                              card: cubit.cardsPlayer1[3],
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
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                          ),
                          width: 100,
                          height: 200,
                          child: Center(child: Text(cubit.cardsPlayer1[3].name, style: const TextStyle(fontWeight: FontWeight.bold))),
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
