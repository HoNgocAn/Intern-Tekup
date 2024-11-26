class AppValidator{
  String? validateUser(value) {
    if (value!.isEmpty) {
      return "Please enter an email";
    }
    if (value.length > 30) {
      return "Email must be less than 30 characters";
    }
    return null;
  }

  String? validateEmail(value) {
    if (value!.isEmpty) {
      return "Please enter an email";
    }
    if (value.length > 30) {
      return "Must be less than 30 characters";
    }
    return null;
  }


  String? validatePassword(value) {
    if (value!.isEmpty) {
      return "Please enter a password";
    }
    if (value.length > 30) {
      return "Password must be less than 30 characters";
    }
    return null;
  }

  String? isEmptyCheck(String? value) {
    if (value == null || value.isEmpty) {
      return "Please fill details";
    }
    return null;
  }

}