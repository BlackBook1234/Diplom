part of '_responses.dart';

@freezed
class ChatContact with _$ChatContact {
  const factory ChatContact({
    @Default("") String name,
    @Default("") String profilePic,
    @Default("") String contactId,
    @Default(0) int timeSent,
    @Default("") String lastMessage,
    @Default(false) bool isOnline,
  }) = _ChatContact;

  factory ChatContact.fromJson(Map<String, dynamic> json) =>
      _$ChatContactFromJson(json);
}
