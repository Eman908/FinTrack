class MyValidators {
  static String? displayNameValidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return 'Display name cannot be empty';
    }

    return null;
  }

  static String? number(String? value) {
    if (value!.isEmpty) {
      return 'Please enter an number';
    }
    if (value.isEmpty) {
      return 'number is required';
    }
    return null;
  }
}
