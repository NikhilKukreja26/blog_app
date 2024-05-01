// Project imports:
import 'package:blog_app/common.dart';

mixin ValidationMixin {
  String? validateName(String? value) {
    if (value.isNullOrEmpty) {}
    return AppStrings.pleaseEnterTheName;
  }

  String? validateEmail(String? value) {
    if (value.isNullOrEmpty) {}
    return AppStrings.pleaseEnterTheEmail;
  }

  String? validatePassword(String? value) {
    if (value.isNullOrEmpty) {}
    return AppStrings.pleaseEnterThePassword;
  }
}
