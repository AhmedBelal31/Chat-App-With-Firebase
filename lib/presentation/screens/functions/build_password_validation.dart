String? buildPasswordValidation(String? value) {
  if (value?.isEmpty ?? true) {
    return 'Password is required';
  } else if (value!.length < 8) {
    return 'Password must be at least 8 characters';
  } else {
    // Check for specific character requirements
    bool hasUpperCase = value.contains(RegExp(r'[A-Z]'));
    bool hasDigit = value.contains(RegExp(r'[0-9]'));

    if (!hasUpperCase && !hasDigit) {
      return 'Include uppercase letter and digit';
    } else if (!hasUpperCase) {
      return 'Include at least one uppercase letter';
    } else if (!hasDigit) {
      return 'Include at least one digit';
    }

    return null; // Password is valid
  }
}
