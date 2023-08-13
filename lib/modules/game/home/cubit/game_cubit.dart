import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:project_card_game/core/shared/cards/data/models/card_model.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameInitial());
  List<CardModel> cards = [
    CardModel(id: 1, name: 'dog'),
    CardModel(id: 2, name: 'crocodile'),
    CardModel(id: 3, name: 'cat'),
    CardModel(id: 4, name: 'duck'),
  ];

  List<CardModel> deckCenterLeft = [];
  List<CardModel> deckCenterRight = [];

  //0 = esquerda 1 = direita
  int direction = 0;

  TextEditingController controllerInput = TextEditingController();

  jogarCard(int index) {
    cards.removeAt(cards.indexWhere((element) => element.id == index));
    emit(GameLoading());
    emit(GameInitial());
  }

  adcionarCardDeckCenter(CardModel card) {
    if (direction == 0) {
      deckCenterLeft.add(card);
      deckCenterLeft.removeWhere((element) => element.id != card.id);
      direction = 1;
      emit(GameLoading());
      emit(GameInitial());
      return;
    }
    if (direction == 1) {
      deckCenterRight.add(card);
      deckCenterRight.removeWhere((element) => element.id != card.id);
      direction = 0;
      emit(GameLoading());
      emit(GameInitial());
      return;
    }
  }
}
