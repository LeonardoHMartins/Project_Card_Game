import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:project_card_game/core/common/extensions/context_extension.dart';
import 'package:project_card_game/core/common/utils/custom_dialog_utils.dart';
import 'package:project_card_game/core/shared/cards/data/models/card_model.dart';
import 'package:project_card_game/modules/game/home/cubit/game_cubit.dart';
import 'package:project_card_game/ui/components/button.dart';
import 'package:project_card_game/ui/components/input.dart';

class HandShowCardModal extends StatefulWidget {
  const HandShowCardModal({super.key, required this.card, required this.player});
  final CardModel card;
  final int player;

  Future<T?> show<T>(BuildContext context) {
    return showCustomDialog<T>(context, child: this);
  }

  @override
  State<HandShowCardModal> createState() => _HandShowCardModalState();
}

class _HandShowCardModalState extends State<HandShowCardModal> {
  GameCubit cubit = Modular.get<GameCubit>();
  Color? colorCard;

  @override
  void initState() {
    super.initState();
    if (widget.player == 1) {
      colorCard = Colors.blue;
      return;
    }
    if (widget.player == 2) {
      colorCard = Colors.green;
      return;
    }
    if (widget.player == 3) {
      colorCard = Colors.red;
      return;
    }
    if (widget.player == 4) {
      colorCard = Colors.pink;
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: colorCard,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            width: 200,
            height: 400,
            child: Center(
              child: Text(widget.card.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          const Gap(20),
          SizedBox(
            width: context.widthPx * .5,
            child: Input(
              cubit.controllerInput,
              maxLines: 2,
            ),
          ),
          const Gap(10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Button(
                onPressed: () async {
                  cubit.adcionarCardDeckCenter(widget.card);
                  cubit.jogarCard(widget.card.id, widget.player);
                  Navigator.pop(context);
                },
                child: const Text('Jogar'),
              ),
              const Gap(10),
              Button(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancelar'))
            ],
          )
        ],
      ),
    );
  }
}
