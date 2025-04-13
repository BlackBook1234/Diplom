part of '_responses.dart';

@freezed
class Status with _$Status {
  const factory Status({
    @Default("") String uid,
    @Default("") String username,
    @Default("") String phoneNumber,
    @Default([]) List<String> photoUrl,
    @Default(0) int createdAt,
    @Default("") String profilePic,
    @Default("") String statusId,
    @Default([]) List<String> whoCanSee,
  }) = _Status;

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
}
