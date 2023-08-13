import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:project_card_game/modules/game/home/cubit/game_cubit.dart';

class CenterDisputeVotation extends StatefulWidget {
  const CenterDisputeVotation({super.key});

  @override
  State<CenterDisputeVotation> createState() => _CenterDisputeVotationState();
}

class _CenterDisputeVotationState extends State<CenterDisputeVotation> {
  GameCubit cubit = Modular.get<GameCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      bloc: cubit,
      builder: (context, state) {
        return cubit.votation.length == 3
            ? Text(
                textAlign: TextAlign.center,
                '''Resultado da votação:
    aceitar = ${cubit.aceitar.length} negar = ${cubit.negar.length}''',
                style: const TextStyle(color: Colors.white, fontSize: 30),
              )
            : const Text('');
      },
    );
  }
}
