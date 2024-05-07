String? buildEmailValidation(String? value) {
  if (value?.isEmpty ?? true) {
    return 'Email required';
  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
    return 'Invalid email format';
  } else {
    return null;
  }
}
