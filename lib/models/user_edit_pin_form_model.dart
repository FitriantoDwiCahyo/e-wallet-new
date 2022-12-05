class UserEditPinFormModel {
  final String? oldPin;
  final String? newPin;

  UserEditPinFormModel({this.oldPin, this.newPin});

  Map<String, dynamic> toJson() {
    return {
      'previous_pin': oldPin,
      'new_pin': newPin,
    };
  }
}
