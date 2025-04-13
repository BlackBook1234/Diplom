part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState._();
  @Implements<BaseState>()
  const factory HomeState({
    @Default(true) bool loading,
    @Default([]) List<String> emailList,
    @Default([]) List<ChatContact> contacts,
    @Default([]) List<Group> groups,
    @Default(0) int index,
  }) = _HomeState;
  factory HomeState.initial() => const HomeState();
  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}
