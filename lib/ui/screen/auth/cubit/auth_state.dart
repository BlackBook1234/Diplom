part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  @Implements<BaseState>()
  const factory AuthState({
    @Default(true) bool loading,
    @Default(UserModel()) UserModel userInfo,
    @Default([]) List<UserModel> userList,
  }) = _AuthState;
  factory AuthState.initial() => const AuthState();
  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);
}
