part of '_responses.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @Default("") String name,
    @Default("") String uid,
    @Default("") String profilePic,
    @Default(false) bool isOnline,
    @Default("") String email,
    @Default("") String role,
    @Default(0) int unreadCounter,
    @Default(<String, dynamic>{}) Map<String, dynamic> lastMessage,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
