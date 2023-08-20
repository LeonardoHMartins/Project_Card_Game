import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:project_card_game/core/shared/cards/data/models/card_model.dart';
import 'package:project_card_game/modules/game/home/cubit/game_cubit.dart';

class HandCardsPlayer2 extends StatefulWidget {
  const HandCardsPlayer2({super.key, required this.playerJogando});
  final int playerJogando;

  @override
  State<HandCardsPlayer2> createState() => _HandCardsPlayer2State();
}

class _HandCardsPlayer2State extends State<HandCardsPlayer2> {
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
    return BlocBuilder<GameCubit, GameState>(
      bloc: cubit,
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cards!.isEmpty
                    ? Container()
                    : Container(
                        decoration: BoxDecoration(
                          color: colorCard,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        width: 65,
                        height: 100,
                      ),
                const Gap(10),
                cards!.length > 1
                    ? Container(
                        decoration: BoxDecoration(
                          color: colorCard,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        width: 65,
                        height: 100,
                      )
                    : Container(),
                const Gap(10),
                cards!.length > 2
                    ? Container(
                        decoration: BoxDecoration(
                          color: colorCard,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        width: 65,
                        height: 100,
                      )
                    : Container(),
                const Gap(10),
                cards!.length > 3
                    ? Container(
                        decoration: BoxDecoration(
                          color: colorCard,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        width: 65,
                        height: 100,
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
