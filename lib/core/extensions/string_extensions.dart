extension IsNullableOrEmpty on String? {
  bool get isNullOrEmpty => this == null || this?.trim() == '';
}
