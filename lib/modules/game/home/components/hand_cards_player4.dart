import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:project_card_game/modules/game/home/components/center_dispute_cards_modal.dart';
import 'package:project_card_game/modules/game/home/components/hand_show_card_modal.dart';
import 'package:project_card_game/modules/game/home/cubit/game_cubit.dart';

class HandCardsPlayer4 extends StatefulWidget {
  const HandCardsPlayer4({super.key});

  @override
  State<HandCardsPlayer4> createState() => _HandCardsPlayer4State();
}

class _HandCardsPlayer4State extends State<HandCardsPlayer4> {
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
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cubit.cardsPlayer4.isEmpty
                    ? Container()
                    : GestureDetector(
                        onTap: () async {
                          if (cubit.player == 4) {
                            await HandShowCardModal(
                              player: 4,
                              card: cubit.cardsPlayer4[0],
                            ).show(context);
                            cubit.resp == true
                                ? Timer(const Duration(seconds: 2), () {
                                    CenterDisputeCardsModal(
                                      card: cubit.deckCenter[0],
                                    ).show(context);
                                    cubit.resp = null;
                                  })
                                : null;
                          }
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            ),
                          ),
                          width: 200,
                          height: 100,
                          child: Center(child: Text(cubit.cardsPlayer4[0].name, style: const TextStyle(fontWeight: FontWeight.bold))),
                        ),
                      ),
                const Gap(10),
                cubit.cardsPlayer4.length > 1
                    ? GestureDetector(
                        onTap: () async {
                          if (cubit.player == 4) {
                            await HandShowCardModal(
                              player: 4,
                              card: cubit.cardsPlayer4[1],
                            ).show(context);
                            cubit.resp == true
                                ? Timer(const Duration(seconds: 2), () {
                                    CenterDisputeCardsModal(
                                      card: cubit.deckCenter[0],
                                    ).show(context);
                                    cubit.resp = null;
                                  })
                                : null;
                          }
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            ),
                          ),
                          width: 200,
                          height: 100,
                          child: Center(child: Text(cubit.cardsPlayer4[1].name, style: const TextStyle(fontWeight: FontWeight.bold))),
                        ),
                      )
                    : Container(),
                const Gap(10),
                cubit.cardsPlayer4.length > 2
                    ? GestureDetector(
                        onTap: () async {
                          if (cubit.player == 4) {
                            await HandShowCardModal(
                              player: 4,
                              card: cubit.cardsPlayer4[2],
                            ).show(context);
                            cubit.resp == true
                                ? Timer(const Duration(seconds: 2), () {
                                    CenterDisputeCardsModal(
                                      card: cubit.deckCenter[0],
                                    ).show(context);
                                    cubit.resp = null;
                                  })
                                : null;
                          }
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            ),
                          ),
                          width: 200,
                          height: 100,
                          child: Center(child: Text(cubit.cardsPlayer4[2].name, style: const TextStyle(fontWeight: FontWeight.bold))),
                        ),
                      )
                    : Container(),
                const Gap(10),
                cubit.cardsPlayer4.length > 3
                    ? GestureDetector(
                        onTap: () async {
                          if (cubit.player == 4) {
                            await HandShowCardModal(
                              player: 4,
                              card: cubit.cardsPlayer4[3],
                            ).show(context);
                            cubit.resp == true
                                ? Timer(const Duration(seconds: 2), () {
                                    CenterDisputeCardsModal(
                                      card: cubit.deckCenter[0],
                                    ).show(context);
                                    cubit.resp = null;
                                  })
                                : null;
                          }
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            ),
                          ),
                          width: 200,
                          height: 100,
                          child: Center(child: Text(cubit.cardsPlayer4[3].name, style: const TextStyle(fontWeight: FontWeight.bold))),
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
