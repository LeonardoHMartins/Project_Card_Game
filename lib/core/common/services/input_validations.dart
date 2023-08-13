import 'package:flux_validator_dart/flux_validator_dart.dart';
import 'package:project_card_game/core/common/extensions/all_extension.dart';

class InputValidations {
  /// It's a function that validates the password.
  static String? Function(String?)? inputSimpleValidation = ((value) {
    if (value == null) {
      return 'É obrigatorio passar algum valor.';
    } else if (value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  });

  /// It's a function that validates the password.
  static String? Function(String?) inputPasswordValidation = (value) {
    RegExp regex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@_#\$&*~-]).{8,}$',
    );

    if (value == null) {
      return 'É obrigatorio passar algum valor.';
    } else if (value.isEmpty) {
      return 'Campo obrigatório';
    } else if (!regex.hasMatch(value)) {
      return 'Insira uma senha válida!';
    }
    return null;
  };

  /// It's a function that validates the email.
  static String? Function(String?)? inputEmailValidation = ((value) {
    if (value == null) {
      return 'É obrigatorio passar algum valor.';
    } else if (value.isEmpty) {
      return 'Campo obrigatório';
    } else if (Validator.email(value)) {
      return 'Insira um email válido!';
    }
    return null;
  });

  /// It's a function that validates the email.
  static String? Function(String?)? inputDateValidation = ((value) {
    if (value == null) {
      return 'É obrigatorio passar algum valor.';
    } else if (value.isEmpty) {
      return 'Campo obrigatório';
    } else {
      var splitted = value.split('/');
      var days = int.tryParse(splitted.first);
      var month = splitted.length > 1 ? int.tryParse(splitted[1]) : null;
      var year = splitted.length > 2 ? int.tryParse(splitted[2]) : null;
      if (days != null && (days > 31 || days < 1)) {
        return 'Insira um dia válido!';
      }
      if (month != null && (month > 12 || month < 1)) {
        return 'Insira um mês válido!';
      }
      if (year != null && (year > 2100 || year < 1900)) {
        return 'Insira um ano válido!';
      }
      if (value.length < 10) {
        return 'Insira uma data completa!';
      }
      if (year.isNotNull && month.isNotNull && days.isNotNull) {
        DateTime date = DateTime(year!, month!, days!);

        if (date.millisecondsSinceEpoch > DateTime.now().millisecondsSinceEpoch) {
          return 'A data selecionada não pode ser maior que a data atual!';
        }
      }
    }
    return null;
  });
}
