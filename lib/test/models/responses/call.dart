part of '_responses.dart';

@freezed
class Call with _$Call {
  const factory Call({
    @Default("") String callerId,
    @Default("") String callerName,
    @Default("") String callerPic,
    @Default("") String receiverId,
    @Default("") String receiverName,
    @Default("") String receiverPic,
    @Default("") String callId,
    @Default(false) bool hasDialled,
  }) = _Call;

  factory Call.fromJson(Map<String, dynamic> json) => _$CallFromJson(json);
}
