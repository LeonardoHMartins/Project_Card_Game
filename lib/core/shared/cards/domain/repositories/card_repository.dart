import 'package:dartz/dartz.dart';
import 'package:project_card_game/core/common/errors/failures.dart';
import 'package:project_card_game/core/shared/cards/data/models/card_model.dart';

abstract class UserRepository {
  Future<Either<Failure, CardModel>> getCard();
}
