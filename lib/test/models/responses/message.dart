part of '_responses.dart';

@freezed
class Message with _$Message {
  const factory Message({
    @Default("") String senderId,
    @Default("") String senderName,
    @Default("") String senderImage,
    @Default(false) bool senderIsOnline,
    @Default("") String recieverid,
    @Default("") String text,
    @Default(MessageEnum.text) MessageEnum type,
    @Default(0) int timeSent,
    @Default("") String messageId,
    @Default(false) bool isSeen,
    @Default("") String repliedMessage,
    @Default("") String repliedTo,
    @Default(MessageEnum.text) MessageEnum repliedMessageType,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
