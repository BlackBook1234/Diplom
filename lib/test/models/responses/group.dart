part of '_responses.dart';

@freezed
class Group with _$Group {
  const factory Group({
    @Default("") String senderId,
    @Default("") String name,
    @Default("") String groupId,
    @Default("") String lastMessage,
    @Default("") String groupPic,
    @Default([]) List<String> membersUid,
    @Default(0) int timeSent,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}
