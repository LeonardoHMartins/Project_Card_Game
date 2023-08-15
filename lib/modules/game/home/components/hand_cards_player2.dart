import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:project_card_game/modules/game/home/components/center_dispute_cards_modal.dart';
import 'package:project_card_game/modules/game/home/components/hand_show_card_modal.dart';
import 'package:project_card_game/modules/game/home/cubit/game_cubit.dart';

class HandCardsPlayer2 extends StatefulWidget {
  const HandCardsPlayer2({super.key});

  @override
  State<HandCardsPlayer2> createState() => _HandCardsPlayer2State();
}

class _HandCardsPlayer2State extends State<HandCardsPlayer2> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cubit.cardsPlayer2.isEmpty
                    ? Container()
                    : GestureDetector(
                        onTap: () async {
                          if (cubit.player == 2) {
                            await HandShowCardModal(
                              player: 2,
                              card: cubit.cardsPlayer2[0],
                            ).show(context);
                            cubit.resp2 == true
                                ? Timer(const Duration(seconds: 2), () {
                                    CenterDisputeCardsModal(
                                      card: cubit.deckCenter[0],
                                    ).show(context);
                                    cubit.resp2 = null;
                                  })
                                : null;
                          }
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          width: 200,
                          height: 100,
                          child: Center(child: Text(cubit.cardsPlayer2[0].name, style: const TextStyle(fontWeight: FontWeight.bold))),
                        ),
                      ),
                const Gap(10),
                cubit.cardsPlayer2.length > 1
                    ? GestureDetector(
                        onTap: () async {
                          if (cubit.player == 2) {
                            await HandShowCardModal(
                              player: 2,
                              card: cubit.cardsPlayer2[1],
                            ).show(context);
                            cubit.resp2 == true
                                ? Timer(const Duration(seconds: 2), () {
                                    CenterDisputeCardsModal(
                                      card: cubit.deckCenter[0],
                                    ).show(context);
                                    cubit.resp2 = null;
                                  })
                                : null;
                          }
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          width: 200,
                          height: 100,
                          child: Center(child: Text(cubit.cardsPlayer2[1].name, style: const TextStyle(fontWeight: FontWeight.bold))),
                        ),
                      )
                    : Container(),
                const Gap(10),
                cubit.cardsPlayer2.length > 2
                    ? GestureDetector(
                        onTap: () async {
                          if (cubit.player == 2) {
                            await HandShowCardModal(
                              player: 2,
                              card: cubit.cardsPlayer2[2],
                            ).show(context);
                            cubit.resp2 == true
                                ? Timer(const Duration(seconds: 2), () {
                                    CenterDisputeCardsModal(
                                      card: cubit.deckCenter[0],
                                    ).show(context);
                                    cubit.resp2 = null;
                                  })
                                : null;
                          }
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          width: 200,
                          height: 100,
                          child: Center(child: Text(cubit.cardsPlayer2[2].name, style: const TextStyle(fontWeight: FontWeight.bold))),
                        ),
                      )
                    : Container(),
                const Gap(10),
                cubit.cardsPlayer2.length > 3
                    ? GestureDetector(
                        onTap: () async {
                          if (cubit.player == 2) {
                            await HandShowCardModal(
                              player: 2,
                              card: cubit.cardsPlayer2[3],
                            ).show(context);
                            cubit.resp2 == true
                                ? Timer(const Duration(seconds: 2), () {
                                    CenterDisputeCardsModal(
                                      card: cubit.deckCenter[0],
                                    ).show(context);
                                    cubit.resp2 = null;
                                  })
                                : null;
                          }
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          width: 200,
                          height: 100,
                          child: Center(child: Text(cubit.cardsPlayer2[3].name, style: const TextStyle(fontWeight: FontWeight.bold))),
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
