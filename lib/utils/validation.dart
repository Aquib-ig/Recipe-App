class Validation {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Name cannot be empty";
    }
    return null;
  }

   static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email cannot be empty";
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value.trim())) {
      return 'Enter a valid email';
    }
    return null;
  } 

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password cannot be empty";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return "Please confirm your password";
    }
    if (value != password) {
      return "Passwords do not match";
    }
    return null;
  }


}
