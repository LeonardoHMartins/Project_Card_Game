import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:project_card_game/core/shared/cards/data/models/card_model.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameInitial());

  Color player1Color = Colors.blue;
  Color player2Color = Colors.green;
  Color player3Color = Colors.red;
  Color player4Color = Colors.pink;

  //Cartas que estao na minha mão, ira ser trocado por outras aleatorias.
  List<CardModel> cardsPlayer1 = [
    CardModel(id: 1, name: 'monkey'),
    CardModel(id: 2, name: 'bird'),
    CardModel(id: 3, name: 'frog'),
    CardModel(id: 4, name: 'horse'),
  ];
  List<CardModel> cardsPlayer3 = [
    CardModel(id: 5, name: 'dog'),
    CardModel(id: 6, name: 'crocodile'),
    CardModel(id: 7, name: 'cat'),
    CardModel(id: 8, name: 'duck'),
  ];
  List<CardModel> cardsPlayer2 = [
    CardModel(id: 9, name: 'laranja'),
    CardModel(id: 10, name: 'limao'),
    CardModel(id: 11, name: 'maça'),
    CardModel(id: 12, name: 'abacaxi'),
  ];
  List<CardModel> cardsPlayer4 = [
    CardModel(id: 13, name: 'et'),
    CardModel(id: 14, name: 'humano'),
    CardModel(id: 15, name: 'deus'),
    CardModel(id: 16, name: 'jujutsu'),
  ];

  //Player atual jogando
  int? player = 1;

  //Cores das cartas no centro da mesa
  Color? colorCardRight;
  Color? colorCardLeft;

  //Cartas jogadas do lado esquerdo
  List<CardModel> deckCenterLeft = [
    CardModel(id: 66, name: 'elefant'),
  ];

  //Cartas jogadas do lado direito
  List<CardModel> deckCenterRight = [];

  //Cartas que estao no centro da mesa
  List<CardModel> deckCenter = [];

  //Qual player está jogando no momento
  int? playerJogando;

  //0 = esquerda 1 = direita
  int direction = 0;

  bool? resp1;
  bool? resp2;
  bool? resp3;
  bool? resp4;

  //Resultado da votação
  List<int> votation = [];

  List<int> aceitar = [];
  List<int> negar = [];

  TextEditingController controllerInput = TextEditingController();

  //--------------------------------Controlador do game----------------------------

  void gameMaster() {}

  //Mudar o jogador do turno
  void changePlayer() {
    if (player == 1) {
      resp1 = null;
      resp2 = true;
      player = 2;
      return;
    }
    if (player == 2) {
      resp2 = null;
      resp3 = true;
      player = 3;
      return;
    }
    if (player == 3) {
      resp3 = null;
      resp4 = true;
      player = 4;
      return;
    }
    if (player == 4) {
      resp4 = null;
      resp1 = true;
      player = 1;
      return;
    }
  }

  //joga a carta no meio da mesa.
  void jogarCard(int index, int jogador) {
    player = jogador;
    if (jogador == 1) {
      if (direction == 0) colorCardLeft = Colors.blue;
      if (direction == 1) colorCardRight = Colors.blue;

      cardsPlayer1.removeAt(cardsPlayer1.indexWhere((element) => element.id == index));
      changePlayer();
      return;
    }
    if (jogador == 2) {
      if (direction == 0) colorCardLeft = Colors.green;
      if (direction == 1) colorCardRight = Colors.green;
      cardsPlayer2.removeAt(cardsPlayer2.indexWhere((element) => element.id == index));
      changePlayer();
      return;
    }
    if (jogador == 3) {
      if (direction == 0) colorCardLeft = Colors.red;
      if (direction == 1) colorCardRight = Colors.red;
      cardsPlayer3.removeAt(cardsPlayer3.indexWhere((element) => element.id == index));
      changePlayer();
      return;
    }
    if (jogador == 4) {
      if (direction == 0) colorCardLeft = Colors.pink;
      if (direction == 1) colorCardRight = Colors.pink;
      cardsPlayer4.removeAt(cardsPlayer4.indexWhere((element) => element.id == index));
      changePlayer();
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
