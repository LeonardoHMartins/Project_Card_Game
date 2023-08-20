import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:project_card_game/core/shared/cards/data/models/card_model.dart';
import 'package:project_card_game/modules/game/home/cubit/game_cubit.dart';

class HandCardsPlayer3 extends StatefulWidget {
  const HandCardsPlayer3({super.key, required this.playerJogando});
  final int playerJogando;

  @override
  State<HandCardsPlayer3> createState() => _HandCardsPlayer3State();
}

class _HandCardsPlayer3State extends State<HandCardsPlayer3> {
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cards!.isEmpty
                    ? Container()
                    : Container(
                        decoration: BoxDecoration(
                          color: colorCard,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        width: 100,
                        height: 65,
                      ),
                const Gap(10),
                cards!.length > 1
                    ? Container(
                        decoration: BoxDecoration(
                          color: colorCard,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        width: 100,
                        height: 65,
                      )
                    : Container(),
                const Gap(10),
                cards!.length > 2
                    ? Container(
                        decoration: BoxDecoration(
                          color: colorCard,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        width: 100,
                        height: 65,
                      )
                    : Container(),
                const Gap(10),
                cards!.length > 3
                    ? Container(
                        decoration: BoxDecoration(
                          color: colorCard,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        width: 100,
                        height: 65,
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
