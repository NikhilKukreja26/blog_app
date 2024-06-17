// Project imports:
import 'package:blog_app/common.dart';

mixin ValidationMixin {
  String? validateName(String? value) {
    if (value.isNullOrEmpty) {
      return AppStrings.pleaseEnterTheName;
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value.isNullOrEmpty) {
      return AppStrings.pleaseEnterTheEmail;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value.isNullOrEmpty) {
      return AppStrings.pleaseEnterThePassword;
    }
    return null;
  }

  String? validateTitle(String? value) {
    if (value.isNullOrEmpty) {
      return AppStrings.pleaseEnterTheTitle;
    }
    return null;
  }

  String? validateContent(String? value) {
    if (value.isNullOrEmpty) {
      return AppStrings.pleaseEnterTheContent;
    }
    return null;
  }
}
