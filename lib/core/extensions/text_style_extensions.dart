// Project imports:
import 'package:blog_app/common.dart';

extension TextStyleHelper on BuildContext {
  TextStyle? get titleLarge => Theme.of(this)
      .textTheme
      .titleLarge
      ?.copyWith(fontSize: FontSizeManager.s22);

  TextStyle? get titleMedium => Theme.of(this)
      .textTheme
      .titleMedium
      ?.copyWith(fontSize: FontSizeManager.s16);

  TextStyle? get titleSmall => Theme.of(this)
      .textTheme
      .titleSmall
      ?.copyWith(fontSize: FontSizeManager.s14);

  TextStyle? get bodySmall => Theme.of(this)
      .textTheme
      .bodySmall
      ?.copyWith(fontSize: FontSizeManager.s12);

  TextStyle? get bodyMedium => Theme.of(this)
      .textTheme
      .bodyMedium
      ?.copyWith(fontSize: FontSizeManager.s14);

  TextStyle? get bodyLarge => Theme.of(this)
      .textTheme
      .bodyLarge
      ?.copyWith(fontSize: FontSizeManager.s16);

  TextStyle? get labelLarge => Theme.of(this)
      .textTheme
      .labelLarge
      ?.copyWith(fontSize: FontSizeManager.s14);

  TextStyle? get labelMedium => Theme.of(this)
      .textTheme
      .labelMedium
      ?.copyWith(fontSize: FontSizeManager.s12);

  TextStyle? get labelSmall => Theme.of(this)
      .textTheme
      .labelSmall
      ?.copyWith(fontSize: FontSizeManager.s11);

  TextStyle? get displayLarge => Theme.of(this)
      .textTheme
      .displayLarge
      ?.copyWith(fontSize: FontSizeManager.s57);

  TextStyle? get displayMedium => Theme.of(this)
      .textTheme
      .displayMedium
      ?.copyWith(fontSize: FontSizeManager.s45);

  TextStyle? get displaySmall => Theme.of(this)
      .textTheme
      .displaySmall
      ?.copyWith(fontSize: FontSizeManager.s36);

  TextStyle? get headlineLarge => Theme.of(this)
      .textTheme
      .headlineLarge
      ?.copyWith(fontSize: FontSizeManager.s32);

  TextStyle? get headlineMedium => Theme.of(this)
      .textTheme
      .headlineMedium
      ?.copyWith(fontSize: FontSizeManager.s28);

  TextStyle? get headlineSmall => Theme.of(this)
      .textTheme
      .headlineSmall
      ?.copyWith(fontSize: FontSizeManager.s24);
}
