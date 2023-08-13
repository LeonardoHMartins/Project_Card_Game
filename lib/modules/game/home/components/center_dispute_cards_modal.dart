import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:project_card_game/core/common/utils/custom_dialog_utils.dart';
import 'package:project_card_game/core/shared/cards/data/models/card_model.dart';
import 'package:project_card_game/modules/game/home/cubit/game_cubit.dart';
import 'package:project_card_game/ui/components/button.dart';

class CenterDisputeCardsModal extends StatefulWidget {
  const CenterDisputeCardsModal({super.key, required this.card});

  final CardModel card;

  Future<T?> show<T>(BuildContext context) {
    return showCustomDialog<T>(context, child: this);
  }

  @override
  State<CenterDisputeCardsModal> createState() => CenterDisputeCardsModalState();
}

class CenterDisputeCardsModalState extends State<CenterDisputeCardsModal> {
  GameCubit cubit = Modular.get<GameCubit>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            width: 200,
            height: 400,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Center(
              child: Text(widget.card.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          const Gap(30),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Button(
                onPressed: () async {
                  Navigator.pop(context);
                  cubit.votar(0);
                },
                child: const Text('Aceitar'),
              ),
              const Gap(10),
              Button(
                  onPressed: () async {
                    Navigator.pop(context);
                    cubit.votar(1);
                  },
                  child: const Text('Negar'))
            ],
          )
        ]),
      ),
    );
  }
}
