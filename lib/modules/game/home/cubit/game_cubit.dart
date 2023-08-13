import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:project_card_game/core/shared/cards/data/models/card_model.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameInitial());

  //Cartas que estao na minha mão, ira ser trocado por outras aleatorias.
  List<CardModel> cardsPlayer1 = [
    CardModel(id: 1, name: 'monkey'),
    CardModel(id: 2, name: 'bird'),
    CardModel(id: 3, name: 'frog'),
    CardModel(id: 4, name: 'horse'),
  ];
  List<CardModel> cardsPlayer2 = [
    CardModel(id: 1, name: 'dog'),
    CardModel(id: 2, name: 'crocodile'),
    CardModel(id: 3, name: 'cat'),
    CardModel(id: 4, name: 'duck'),
  ];
  List<CardModel> cardsPlayer3 = [
    CardModel(id: 1, name: 'laranja'),
    CardModel(id: 2, name: 'limao'),
    CardModel(id: 3, name: 'maça'),
    CardModel(id: 4, name: 'abacaxi'),
  ];
  List<CardModel> cardsPlayer4 = [
    CardModel(id: 1, name: 'et'),
    CardModel(id: 2, name: 'humano'),
    CardModel(id: 3, name: 'deus'),
    CardModel(id: 4, name: 'jujutsu'),
  ];

  List<CardModel> cardsPlayerAtual = [];

  //Cartas jogadas do lado esquerdo
  List<CardModel> deckCenterLeft = [
    CardModel(id: 4, name: 'elefant'),
  ];

  //Cartas jogadas do lado direito
  List<CardModel> deckCenterRight = [];

  //Cartas que estao no centro da mesa
  List<CardModel> deckCenter = [];

  //0 = esquerda 1 = direita
  int direction = 0;

  bool? resp;
  //Resultado da votação
  List<int> votation = [];

  List<int> aceitar = [];
  List<int> negar = [];

  TextEditingController controllerInput = TextEditingController();

  //--------------------------------Controlador do game----------------------------

  //joga a carta no meio da mesa.
  void jogarCard(int index, int player) {
    if (player == 1) {
      cardsPlayer1.removeAt(cardsPlayer1.indexWhere((element) => element.id == index));
      return;
    }
    if (player == 2) {
      cardsPlayer2.removeAt(cardsPlayer2.indexWhere((element) => element.id == index));
      return;
    }
    if (player == 3) {
      cardsPlayer3.removeAt(cardsPlayer3.indexWhere((element) => element.id == index));
      return;
    }
    if (player == 4) {
      cardsPlayer4.removeAt(cardsPlayer4.indexWhere((element) => element.id == index));
      return;
    }
    emit(GameLoading());
    emit(GameInitial());
  }

  //adiciona a nova carta no centro e remove a carta antiga da lista,
  //tambem muda o lado que vai ser jogado a carta.
  void adcionarCardDeckCenter(CardModel card) {
    if (direction == 1) {
      deckCenterLeft.add(card);
      deckCenter.add(card);
      deckCenter.removeWhere((element) => element.id != card.id);
      deckCenterLeft.removeWhere((element) => element.id != card.id);
      direction = 0;
      emit(GameLoading());
      emit(GameInitial());
      return;
    }
    if (direction == 0) {
      deckCenter.add(card);
      deckCenterRight.add(card);
      deckCenter.removeWhere((element) => element.id != card.id);
      deckCenterRight.removeWhere((element) => element.id != card.id);
      direction = 1;
      emit(GameLoading());
      emit(GameInitial());
      return;
    }
  }
  //--------------------------------------------------------------------------------

  //--------------------------------Regras do game----------------------------------

  //recebe o index 0(aceitar) ou 1(negar) para calcular o resultado da votação.
  void votar(int vote) {
    votation.add(vote);
    if (vote == 0) {
      aceitar.add(vote);
      emit(GameLoading());
      emit(GameInitial());
      return;
    }
    if (vote == 1) {
      negar.add(vote);
      emit(GameLoading());
      emit(GameInitial());
      return;
    }
    emit(GameLoading());
    emit(GameInitial());
  }

  //--------------------------------------------------------------------------------
}
