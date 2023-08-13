import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:project_card_game/modules/game/home/cubit/game_cubit.dart';

class DeckCenterCards extends StatefulWidget {
  const DeckCenterCards({super.key});

  @override
  State<DeckCenterCards> createState() => _DeckCenterCardsState();
}

class _DeckCenterCardsState extends State<DeckCenterCards> {
  GameCubit cubit = Modular.get<GameCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
        bloc: cubit,
        builder: (context, state) {
          return cubit.deckCenterLeft.isNotEmpty
              ? Center(
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              cubit.deckCenterLeft.isNotEmpty
                                  ? Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      width: 100,
                                      height: 200,
                                      child: Center(child: Text(cubit.deckCenterLeft[0].name, style: const TextStyle(fontWeight: FontWeight.bold))),
                                    )
                                  : Container(),
                              const Gap(30),
                              cubit.deckCenterRight.isNotEmpty
                                  ? Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      width: 100,
                                      height: 200,
                                      child: Center(child: Text(cubit.deckCenterRight[0].name, style: const TextStyle(fontWeight: FontWeight.bold))),
                                    )
                                  : Container(),
                            ],
                          ),
                        ],
                      )),
                )
              : Container();
          // return Container();
        });
  }
}
