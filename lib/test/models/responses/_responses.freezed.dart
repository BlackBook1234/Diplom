// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '_responses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get name => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get profilePic => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  int get unreadCounter => throw _privateConstructorUsedError;
  Map<String, dynamic> get lastMessage => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String name,
      String uid,
      String profilePic,
      bool isOnline,
      String email,
      String role,
      int unreadCounter,
      Map<String, dynamic> lastMessage});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? uid = null,
    Object? profilePic = null,
    Object? isOnline = null,
    Object? email = null,
    Object? role = null,
    Object? unreadCounter = null,
    Object? lastMessage = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      profilePic: null == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      unreadCounter: null == unreadCounter
          ? _value.unreadCounter
          : unreadCounter // ignore: cast_nullable_to_non_nullable
              as int,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String uid,
      String profilePic,
      bool isOnline,
      String email,
      String role,
      int unreadCounter,
      Map<String, dynamic> lastMessage});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? uid = null,
    Object? profilePic = null,
    Object? isOnline = null,
    Object? email = null,
    Object? role = null,
    Object? unreadCounter = null,
    Object? lastMessage = null,
  }) {
    return _then(_$UserModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      profilePic: null == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      unreadCounter: null == unreadCounter
          ? _value.unreadCounter
          : unreadCounter // ignore: cast_nullable_to_non_nullable
              as int,
      lastMessage: null == lastMessage
          ? _value._lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {this.name = "",
      this.uid = "",
      this.profilePic = "",
      this.isOnline = false,
      this.email = "",
      this.role = "",
      this.unreadCounter = 0,
      final Map<String, dynamic> lastMessage = const <String, dynamic>{}})
      : _lastMessage = lastMessage;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String uid;
  @override
  @JsonKey()
  final String profilePic;
  @override
  @JsonKey()
  final bool isOnline;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String role;
  @override
  @JsonKey()
  final int unreadCounter;
  final Map<String, dynamic> _lastMessage;
  @override
  @JsonKey()
  Map<String, dynamic> get lastMessage {
    if (_lastMessage is EqualUnmodifiableMapView) return _lastMessage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_lastMessage);
  }

  @override
  String toString() {
    return 'UserModel(name: $name, uid: $uid, profilePic: $profilePic, isOnline: $isOnline, email: $email, role: $role, unreadCounter: $unreadCounter, lastMessage: $lastMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.unreadCounter, unreadCounter) ||
                other.unreadCounter == unreadCounter) &&
            const DeepCollectionEquality()
                .equals(other._lastMessage, _lastMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      uid,
      profilePic,
      isOnline,
      email,
      role,
      unreadCounter,
      const DeepCollectionEquality().hash(_lastMessage));

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {final String name,
      final String uid,
      final String profilePic,
      final bool isOnline,
      final String email,
      final String role,
      final int unreadCounter,
      final Map<String, dynamic> lastMessage}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get name;
  @override
  String get uid;
  @override
  String get profilePic;
  @override
  bool get isOnline;
  @override
  String get email;
  @override
  String get role;
  @override
  int get unreadCounter;
  @override
  Map<String, dynamic> get lastMessage;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Status _$StatusFromJson(Map<String, dynamic> json) {
  return _Status.fromJson(json);
}

/// @nodoc
mixin _$Status {
  String get uid => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  List<String> get photoUrl => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  String get profilePic => throw _privateConstructorUsedError;
  String get statusId => throw _privateConstructorUsedError;
  List<String> get whoCanSee => throw _privateConstructorUsedError;

  /// Serializes this Status to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatusCopyWith<Status> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusCopyWith<$Res> {
  factory $StatusCopyWith(Status value, $Res Function(Status) then) =
      _$StatusCopyWithImpl<$Res, Status>;
  @useResult
  $Res call(
      {String uid,
      String username,
      String phoneNumber,
      List<String> photoUrl,
      int createdAt,
      String profilePic,
      String statusId,
      List<String> whoCanSee});
}

/// @nodoc
class _$StatusCopyWithImpl<$Res, $Val extends Status>
    implements $StatusCopyWith<$Res> {
  _$StatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? username = null,
    Object? phoneNumber = null,
    Object? photoUrl = null,
    Object? createdAt = null,
    Object? profilePic = null,
    Object? statusId = null,
    Object? whoCanSee = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      profilePic: null == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String,
      statusId: null == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as String,
      whoCanSee: null == whoCanSee
          ? _value.whoCanSee
          : whoCanSee // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatusImplCopyWith<$Res> implements $StatusCopyWith<$Res> {
  factory _$$StatusImplCopyWith(
          _$StatusImpl value, $Res Function(_$StatusImpl) then) =
      __$$StatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String username,
      String phoneNumber,
      List<String> photoUrl,
      int createdAt,
      String profilePic,
      String statusId,
      List<String> whoCanSee});
}

/// @nodoc
class __$$StatusImplCopyWithImpl<$Res>
    extends _$StatusCopyWithImpl<$Res, _$StatusImpl>
    implements _$$StatusImplCopyWith<$Res> {
  __$$StatusImplCopyWithImpl(
      _$StatusImpl _value, $Res Function(_$StatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? username = null,
    Object? phoneNumber = null,
    Object? photoUrl = null,
    Object? createdAt = null,
    Object? profilePic = null,
    Object? statusId = null,
    Object? whoCanSee = null,
  }) {
    return _then(_$StatusImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value._photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      profilePic: null == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String,
      statusId: null == statusId
          ? _value.statusId
          : statusId // ignore: cast_nullable_to_non_nullable
              as String,
      whoCanSee: null == whoCanSee
          ? _value._whoCanSee
          : whoCanSee // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatusImpl implements _Status {
  const _$StatusImpl(
      {this.uid = "",
      this.username = "",
      this.phoneNumber = "",
      final List<String> photoUrl = const [],
      this.createdAt = 0,
      this.profilePic = "",
      this.statusId = "",
      final List<String> whoCanSee = const []})
      : _photoUrl = photoUrl,
        _whoCanSee = whoCanSee;

  factory _$StatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusImplFromJson(json);

  @override
  @JsonKey()
  final String uid;
  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String phoneNumber;
  final List<String> _photoUrl;
  @override
  @JsonKey()
  List<String> get photoUrl {
    if (_photoUrl is EqualUnmodifiableListView) return _photoUrl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photoUrl);
  }

  @override
  @JsonKey()
  final int createdAt;
  @override
  @JsonKey()
  final String profilePic;
  @override
  @JsonKey()
  final String statusId;
  final List<String> _whoCanSee;
  @override
  @JsonKey()
  List<String> get whoCanSee {
    if (_whoCanSee is EqualUnmodifiableListView) return _whoCanSee;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_whoCanSee);
  }

  @override
  String toString() {
    return 'Status(uid: $uid, username: $username, phoneNumber: $phoneNumber, photoUrl: $photoUrl, createdAt: $createdAt, profilePic: $profilePic, statusId: $statusId, whoCanSee: $whoCanSee)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            const DeepCollectionEquality().equals(other._photoUrl, _photoUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.statusId, statusId) ||
                other.statusId == statusId) &&
            const DeepCollectionEquality()
                .equals(other._whoCanSee, _whoCanSee));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      username,
      phoneNumber,
      const DeepCollectionEquality().hash(_photoUrl),
      createdAt,
      profilePic,
      statusId,
      const DeepCollectionEquality().hash(_whoCanSee));

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusImplCopyWith<_$StatusImpl> get copyWith =>
      __$$StatusImplCopyWithImpl<_$StatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusImplToJson(
      this,
    );
  }
}

abstract class _Status implements Status {
  const factory _Status(
      {final String uid,
      final String username,
      final String phoneNumber,
      final List<String> photoUrl,
      final int createdAt,
      final String profilePic,
      final String statusId,
      final List<String> whoCanSee}) = _$StatusImpl;

  factory _Status.fromJson(Map<String, dynamic> json) = _$StatusImpl.fromJson;

  @override
  String get uid;
  @override
  String get username;
  @override
  String get phoneNumber;
  @override
  List<String> get photoUrl;
  @override
  int get createdAt;
  @override
  String get profilePic;
  @override
  String get statusId;
  @override
  List<String> get whoCanSee;

  /// Create a copy of Status
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusImplCopyWith<_$StatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  String get senderId => throw _privateConstructorUsedError;
  String get senderName => throw _privateConstructorUsedError;
  String get senderImage => throw _privateConstructorUsedError;
  bool get senderIsOnline => throw _privateConstructorUsedError;
  String get recieverid => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  MessageEnum get type => throw _privateConstructorUsedError;
  int get timeSent => throw _privateConstructorUsedError;
  String get messageId => throw _privateConstructorUsedError;
  bool get isSeen => throw _privateConstructorUsedError;
  String get repliedMessage => throw _privateConstructorUsedError;
  String get repliedTo => throw _privateConstructorUsedError;
  MessageEnum get repliedMessageType => throw _privateConstructorUsedError;

  /// Serializes this Message to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {String senderId,
      String senderName,
      String senderImage,
      bool senderIsOnline,
      String recieverid,
      String text,
      MessageEnum type,
      int timeSent,
      String messageId,
      bool isSeen,
      String repliedMessage,
      String repliedTo,
      MessageEnum repliedMessageType});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? senderName = null,
    Object? senderImage = null,
    Object? senderIsOnline = null,
    Object? recieverid = null,
    Object? text = null,
    Object? type = null,
    Object? timeSent = null,
    Object? messageId = null,
    Object? isSeen = null,
    Object? repliedMessage = null,
    Object? repliedTo = null,
    Object? repliedMessageType = null,
  }) {
    return _then(_value.copyWith(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      senderName: null == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String,
      senderImage: null == senderImage
          ? _value.senderImage
          : senderImage // ignore: cast_nullable_to_non_nullable
              as String,
      senderIsOnline: null == senderIsOnline
          ? _value.senderIsOnline
          : senderIsOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      recieverid: null == recieverid
          ? _value.recieverid
          : recieverid // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageEnum,
      timeSent: null == timeSent
          ? _value.timeSent
          : timeSent // ignore: cast_nullable_to_non_nullable
              as int,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      isSeen: null == isSeen
          ? _value.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as bool,
      repliedMessage: null == repliedMessage
          ? _value.repliedMessage
          : repliedMessage // ignore: cast_nullable_to_non_nullable
              as String,
      repliedTo: null == repliedTo
          ? _value.repliedTo
          : repliedTo // ignore: cast_nullable_to_non_nullable
              as String,
      repliedMessageType: null == repliedMessageType
          ? _value.repliedMessageType
          : repliedMessageType // ignore: cast_nullable_to_non_nullable
              as MessageEnum,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
          _$MessageImpl value, $Res Function(_$MessageImpl) then) =
      __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String senderId,
      String senderName,
      String senderImage,
      bool senderIsOnline,
      String recieverid,
      String text,
      MessageEnum type,
      int timeSent,
      String messageId,
      bool isSeen,
      String repliedMessage,
      String repliedTo,
      MessageEnum repliedMessageType});
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
      _$MessageImpl _value, $Res Function(_$MessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? senderName = null,
    Object? senderImage = null,
    Object? senderIsOnline = null,
    Object? recieverid = null,
    Object? text = null,
    Object? type = null,
    Object? timeSent = null,
    Object? messageId = null,
    Object? isSeen = null,
    Object? repliedMessage = null,
    Object? repliedTo = null,
    Object? repliedMessageType = null,
  }) {
    return _then(_$MessageImpl(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      senderName: null == senderName
          ? _value.senderName
          : senderName // ignore: cast_nullable_to_non_nullable
              as String,
      senderImage: null == senderImage
          ? _value.senderImage
          : senderImage // ignore: cast_nullable_to_non_nullable
              as String,
      senderIsOnline: null == senderIsOnline
          ? _value.senderIsOnline
          : senderIsOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      recieverid: null == recieverid
          ? _value.recieverid
          : recieverid // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MessageEnum,
      timeSent: null == timeSent
          ? _value.timeSent
          : timeSent // ignore: cast_nullable_to_non_nullable
              as int,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      isSeen: null == isSeen
          ? _value.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as bool,
      repliedMessage: null == repliedMessage
          ? _value.repliedMessage
          : repliedMessage // ignore: cast_nullable_to_non_nullable
              as String,
      repliedTo: null == repliedTo
          ? _value.repliedTo
          : repliedTo // ignore: cast_nullable_to_non_nullable
              as String,
      repliedMessageType: null == repliedMessageType
          ? _value.repliedMessageType
          : repliedMessageType // ignore: cast_nullable_to_non_nullable
              as MessageEnum,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageImpl implements _Message {
  const _$MessageImpl(
      {this.senderId = "",
      this.senderName = "",
      this.senderImage = "",
      this.senderIsOnline = false,
      this.recieverid = "",
      this.text = "",
      this.type = MessageEnum.text,
      this.timeSent = 0,
      this.messageId = "",
      this.isSeen = false,
      this.repliedMessage = "",
      this.repliedTo = "",
      this.repliedMessageType = MessageEnum.text});

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  @override
  @JsonKey()
  final String senderId;
  @override
  @JsonKey()
  final String senderName;
  @override
  @JsonKey()
  final String senderImage;
  @override
  @JsonKey()
  final bool senderIsOnline;
  @override
  @JsonKey()
  final String recieverid;
  @override
  @JsonKey()
  final String text;
  @override
  @JsonKey()
  final MessageEnum type;
  @override
  @JsonKey()
  final int timeSent;
  @override
  @JsonKey()
  final String messageId;
  @override
  @JsonKey()
  final bool isSeen;
  @override
  @JsonKey()
  final String repliedMessage;
  @override
  @JsonKey()
  final String repliedTo;
  @override
  @JsonKey()
  final MessageEnum repliedMessageType;

  @override
  String toString() {
    return 'Message(senderId: $senderId, senderName: $senderName, senderImage: $senderImage, senderIsOnline: $senderIsOnline, recieverid: $recieverid, text: $text, type: $type, timeSent: $timeSent, messageId: $messageId, isSeen: $isSeen, repliedMessage: $repliedMessage, repliedTo: $repliedTo, repliedMessageType: $repliedMessageType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.senderImage, senderImage) ||
                other.senderImage == senderImage) &&
            (identical(other.senderIsOnline, senderIsOnline) ||
                other.senderIsOnline == senderIsOnline) &&
            (identical(other.recieverid, recieverid) ||
                other.recieverid == recieverid) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.timeSent, timeSent) ||
                other.timeSent == timeSent) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.isSeen, isSeen) || other.isSeen == isSeen) &&
            (identical(other.repliedMessage, repliedMessage) ||
                other.repliedMessage == repliedMessage) &&
            (identical(other.repliedTo, repliedTo) ||
                other.repliedTo == repliedTo) &&
            (identical(other.repliedMessageType, repliedMessageType) ||
                other.repliedMessageType == repliedMessageType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      senderId,
      senderName,
      senderImage,
      senderIsOnline,
      recieverid,
      text,
      type,
      timeSent,
      messageId,
      isSeen,
      repliedMessage,
      repliedTo,
      repliedMessageType);

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(
      this,
    );
  }
}

abstract class _Message implements Message {
  const factory _Message(
      {final String senderId,
      final String senderName,
      final String senderImage,
      final bool senderIsOnline,
      final String recieverid,
      final String text,
      final MessageEnum type,
      final int timeSent,
      final String messageId,
      final bool isSeen,
      final String repliedMessage,
      final String repliedTo,
      final MessageEnum repliedMessageType}) = _$MessageImpl;

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override
  String get senderId;
  @override
  String get senderName;
  @override
  String get senderImage;
  @override
  bool get senderIsOnline;
  @override
  String get recieverid;
  @override
  String get text;
  @override
  MessageEnum get type;
  @override
  int get timeSent;
  @override
  String get messageId;
  @override
  bool get isSeen;
  @override
  String get repliedMessage;
  @override
  String get repliedTo;
  @override
  MessageEnum get repliedMessageType;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Group _$GroupFromJson(Map<String, dynamic> json) {
  return _Group.fromJson(json);
}

/// @nodoc
mixin _$Group {
  String get senderId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get groupId => throw _privateConstructorUsedError;
  String get lastMessage => throw _privateConstructorUsedError;
  String get groupPic => throw _privateConstructorUsedError;
  List<String> get membersUid => throw _privateConstructorUsedError;
  int get timeSent => throw _privateConstructorUsedError;

  /// Serializes this Group to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupCopyWith<Group> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupCopyWith<$Res> {
  factory $GroupCopyWith(Group value, $Res Function(Group) then) =
      _$GroupCopyWithImpl<$Res, Group>;
  @useResult
  $Res call(
      {String senderId,
      String name,
      String groupId,
      String lastMessage,
      String groupPic,
      List<String> membersUid,
      int timeSent});
}

/// @nodoc
class _$GroupCopyWithImpl<$Res, $Val extends Group>
    implements $GroupCopyWith<$Res> {
  _$GroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? name = null,
    Object? groupId = null,
    Object? lastMessage = null,
    Object? groupPic = null,
    Object? membersUid = null,
    Object? timeSent = null,
  }) {
    return _then(_value.copyWith(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      groupPic: null == groupPic
          ? _value.groupPic
          : groupPic // ignore: cast_nullable_to_non_nullable
              as String,
      membersUid: null == membersUid
          ? _value.membersUid
          : membersUid // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timeSent: null == timeSent
          ? _value.timeSent
          : timeSent // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupImplCopyWith<$Res> implements $GroupCopyWith<$Res> {
  factory _$$GroupImplCopyWith(
          _$GroupImpl value, $Res Function(_$GroupImpl) then) =
      __$$GroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String senderId,
      String name,
      String groupId,
      String lastMessage,
      String groupPic,
      List<String> membersUid,
      int timeSent});
}

/// @nodoc
class __$$GroupImplCopyWithImpl<$Res>
    extends _$GroupCopyWithImpl<$Res, _$GroupImpl>
    implements _$$GroupImplCopyWith<$Res> {
  __$$GroupImplCopyWithImpl(
      _$GroupImpl _value, $Res Function(_$GroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? name = null,
    Object? groupId = null,
    Object? lastMessage = null,
    Object? groupPic = null,
    Object? membersUid = null,
    Object? timeSent = null,
  }) {
    return _then(_$GroupImpl(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      groupPic: null == groupPic
          ? _value.groupPic
          : groupPic // ignore: cast_nullable_to_non_nullable
              as String,
      membersUid: null == membersUid
          ? _value._membersUid
          : membersUid // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timeSent: null == timeSent
          ? _value.timeSent
          : timeSent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupImpl implements _Group {
  const _$GroupImpl(
      {this.senderId = "",
      this.name = "",
      this.groupId = "",
      this.lastMessage = "",
      this.groupPic = "",
      final List<String> membersUid = const [],
      this.timeSent = 0})
      : _membersUid = membersUid;

  factory _$GroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupImplFromJson(json);

  @override
  @JsonKey()
  final String senderId;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String groupId;
  @override
  @JsonKey()
  final String lastMessage;
  @override
  @JsonKey()
  final String groupPic;
  final List<String> _membersUid;
  @override
  @JsonKey()
  List<String> get membersUid {
    if (_membersUid is EqualUnmodifiableListView) return _membersUid;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_membersUid);
  }

  @override
  @JsonKey()
  final int timeSent;

  @override
  String toString() {
    return 'Group(senderId: $senderId, name: $name, groupId: $groupId, lastMessage: $lastMessage, groupPic: $groupPic, membersUid: $membersUid, timeSent: $timeSent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupImpl &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.groupPic, groupPic) ||
                other.groupPic == groupPic) &&
            const DeepCollectionEquality()
                .equals(other._membersUid, _membersUid) &&
            (identical(other.timeSent, timeSent) ||
                other.timeSent == timeSent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      senderId,
      name,
      groupId,
      lastMessage,
      groupPic,
      const DeepCollectionEquality().hash(_membersUid),
      timeSent);

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupImplCopyWith<_$GroupImpl> get copyWith =>
      __$$GroupImplCopyWithImpl<_$GroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupImplToJson(
      this,
    );
  }
}

abstract class _Group implements Group {
  const factory _Group(
      {final String senderId,
      final String name,
      final String groupId,
      final String lastMessage,
      final String groupPic,
      final List<String> membersUid,
      final int timeSent}) = _$GroupImpl;

  factory _Group.fromJson(Map<String, dynamic> json) = _$GroupImpl.fromJson;

  @override
  String get senderId;
  @override
  String get name;
  @override
  String get groupId;
  @override
  String get lastMessage;
  @override
  String get groupPic;
  @override
  List<String> get membersUid;
  @override
  int get timeSent;

  /// Create a copy of Group
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupImplCopyWith<_$GroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Call _$CallFromJson(Map<String, dynamic> json) {
  return _Call.fromJson(json);
}

/// @nodoc
mixin _$Call {
  String get callerId => throw _privateConstructorUsedError;
  String get callerName => throw _privateConstructorUsedError;
  String get callerPic => throw _privateConstructorUsedError;
  String get receiverId => throw _privateConstructorUsedError;
  String get receiverName => throw _privateConstructorUsedError;
  String get receiverPic => throw _privateConstructorUsedError;
  String get callId => throw _privateConstructorUsedError;
  bool get hasDialled => throw _privateConstructorUsedError;

  /// Serializes this Call to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Call
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CallCopyWith<Call> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallCopyWith<$Res> {
  factory $CallCopyWith(Call value, $Res Function(Call) then) =
      _$CallCopyWithImpl<$Res, Call>;
  @useResult
  $Res call(
      {String callerId,
      String callerName,
      String callerPic,
      String receiverId,
      String receiverName,
      String receiverPic,
      String callId,
      bool hasDialled});
}

/// @nodoc
class _$CallCopyWithImpl<$Res, $Val extends Call>
    implements $CallCopyWith<$Res> {
  _$CallCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Call
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callerId = null,
    Object? callerName = null,
    Object? callerPic = null,
    Object? receiverId = null,
    Object? receiverName = null,
    Object? receiverPic = null,
    Object? callId = null,
    Object? hasDialled = null,
  }) {
    return _then(_value.copyWith(
      callerId: null == callerId
          ? _value.callerId
          : callerId // ignore: cast_nullable_to_non_nullable
              as String,
      callerName: null == callerName
          ? _value.callerName
          : callerName // ignore: cast_nullable_to_non_nullable
              as String,
      callerPic: null == callerPic
          ? _value.callerPic
          : callerPic // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverName: null == receiverName
          ? _value.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String,
      receiverPic: null == receiverPic
          ? _value.receiverPic
          : receiverPic // ignore: cast_nullable_to_non_nullable
              as String,
      callId: null == callId
          ? _value.callId
          : callId // ignore: cast_nullable_to_non_nullable
              as String,
      hasDialled: null == hasDialled
          ? _value.hasDialled
          : hasDialled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CallImplCopyWith<$Res> implements $CallCopyWith<$Res> {
  factory _$$CallImplCopyWith(
          _$CallImpl value, $Res Function(_$CallImpl) then) =
      __$$CallImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String callerId,
      String callerName,
      String callerPic,
      String receiverId,
      String receiverName,
      String receiverPic,
      String callId,
      bool hasDialled});
}

/// @nodoc
class __$$CallImplCopyWithImpl<$Res>
    extends _$CallCopyWithImpl<$Res, _$CallImpl>
    implements _$$CallImplCopyWith<$Res> {
  __$$CallImplCopyWithImpl(_$CallImpl _value, $Res Function(_$CallImpl) _then)
      : super(_value, _then);

  /// Create a copy of Call
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callerId = null,
    Object? callerName = null,
    Object? callerPic = null,
    Object? receiverId = null,
    Object? receiverName = null,
    Object? receiverPic = null,
    Object? callId = null,
    Object? hasDialled = null,
  }) {
    return _then(_$CallImpl(
      callerId: null == callerId
          ? _value.callerId
          : callerId // ignore: cast_nullable_to_non_nullable
              as String,
      callerName: null == callerName
          ? _value.callerName
          : callerName // ignore: cast_nullable_to_non_nullable
              as String,
      callerPic: null == callerPic
          ? _value.callerPic
          : callerPic // ignore: cast_nullable_to_non_nullable
              as String,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverName: null == receiverName
          ? _value.receiverName
          : receiverName // ignore: cast_nullable_to_non_nullable
              as String,
      receiverPic: null == receiverPic
          ? _value.receiverPic
          : receiverPic // ignore: cast_nullable_to_non_nullable
              as String,
      callId: null == callId
          ? _value.callId
          : callId // ignore: cast_nullable_to_non_nullable
              as String,
      hasDialled: null == hasDialled
          ? _value.hasDialled
          : hasDialled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CallImpl implements _Call {
  const _$CallImpl(
      {this.callerId = "",
      this.callerName = "",
      this.callerPic = "",
      this.receiverId = "",
      this.receiverName = "",
      this.receiverPic = "",
      this.callId = "",
      this.hasDialled = false});

  factory _$CallImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallImplFromJson(json);

  @override
  @JsonKey()
  final String callerId;
  @override
  @JsonKey()
  final String callerName;
  @override
  @JsonKey()
  final String callerPic;
  @override
  @JsonKey()
  final String receiverId;
  @override
  @JsonKey()
  final String receiverName;
  @override
  @JsonKey()
  final String receiverPic;
  @override
  @JsonKey()
  final String callId;
  @override
  @JsonKey()
  final bool hasDialled;

  @override
  String toString() {
    return 'Call(callerId: $callerId, callerName: $callerName, callerPic: $callerPic, receiverId: $receiverId, receiverName: $receiverName, receiverPic: $receiverPic, callId: $callId, hasDialled: $hasDialled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallImpl &&
            (identical(other.callerId, callerId) ||
                other.callerId == callerId) &&
            (identical(other.callerName, callerName) ||
                other.callerName == callerName) &&
            (identical(other.callerPic, callerPic) ||
                other.callerPic == callerPic) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.receiverName, receiverName) ||
                other.receiverName == receiverName) &&
            (identical(other.receiverPic, receiverPic) ||
                other.receiverPic == receiverPic) &&
            (identical(other.callId, callId) || other.callId == callId) &&
            (identical(other.hasDialled, hasDialled) ||
                other.hasDialled == hasDialled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, callerId, callerName, callerPic,
      receiverId, receiverName, receiverPic, callId, hasDialled);

  /// Create a copy of Call
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CallImplCopyWith<_$CallImpl> get copyWith =>
      __$$CallImplCopyWithImpl<_$CallImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CallImplToJson(
      this,
    );
  }
}

abstract class _Call implements Call {
  const factory _Call(
      {final String callerId,
      final String callerName,
      final String callerPic,
      final String receiverId,
      final String receiverName,
      final String receiverPic,
      final String callId,
      final bool hasDialled}) = _$CallImpl;

  factory _Call.fromJson(Map<String, dynamic> json) = _$CallImpl.fromJson;

  @override
  String get callerId;
  @override
  String get callerName;
  @override
  String get callerPic;
  @override
  String get receiverId;
  @override
  String get receiverName;
  @override
  String get receiverPic;
  @override
  String get callId;
  @override
  bool get hasDialled;

  /// Create a copy of Call
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CallImplCopyWith<_$CallImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatContact _$ChatContactFromJson(Map<String, dynamic> json) {
  return _ChatContact.fromJson(json);
}

/// @nodoc
mixin _$ChatContact {
  String get name => throw _privateConstructorUsedError;
  String get profilePic => throw _privateConstructorUsedError;
  String get contactId => throw _privateConstructorUsedError;
  int get timeSent => throw _privateConstructorUsedError;
  String get lastMessage => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;

  /// Serializes this ChatContact to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatContactCopyWith<ChatContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatContactCopyWith<$Res> {
  factory $ChatContactCopyWith(
          ChatContact value, $Res Function(ChatContact) then) =
      _$ChatContactCopyWithImpl<$Res, ChatContact>;
  @useResult
  $Res call(
      {String name,
      String profilePic,
      String contactId,
      int timeSent,
      String lastMessage,
      bool isOnline});
}

/// @nodoc
class _$ChatContactCopyWithImpl<$Res, $Val extends ChatContact>
    implements $ChatContactCopyWith<$Res> {
  _$ChatContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatContact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? profilePic = null,
    Object? contactId = null,
    Object? timeSent = null,
    Object? lastMessage = null,
    Object? isOnline = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profilePic: null == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String,
      contactId: null == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as String,
      timeSent: null == timeSent
          ? _value.timeSent
          : timeSent // ignore: cast_nullable_to_non_nullable
              as int,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatContactImplCopyWith<$Res>
    implements $ChatContactCopyWith<$Res> {
  factory _$$ChatContactImplCopyWith(
          _$ChatContactImpl value, $Res Function(_$ChatContactImpl) then) =
      __$$ChatContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String profilePic,
      String contactId,
      int timeSent,
      String lastMessage,
      bool isOnline});
}

/// @nodoc
class __$$ChatContactImplCopyWithImpl<$Res>
    extends _$ChatContactCopyWithImpl<$Res, _$ChatContactImpl>
    implements _$$ChatContactImplCopyWith<$Res> {
  __$$ChatContactImplCopyWithImpl(
      _$ChatContactImpl _value, $Res Function(_$ChatContactImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatContact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? profilePic = null,
    Object? contactId = null,
    Object? timeSent = null,
    Object? lastMessage = null,
    Object? isOnline = null,
  }) {
    return _then(_$ChatContactImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profilePic: null == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String,
      contactId: null == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as String,
      timeSent: null == timeSent
          ? _value.timeSent
          : timeSent // ignore: cast_nullable_to_non_nullable
              as int,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatContactImpl implements _ChatContact {
  const _$ChatContactImpl(
      {this.name = "",
      this.profilePic = "",
      this.contactId = "",
      this.timeSent = 0,
      this.lastMessage = "",
      this.isOnline = false});

  factory _$ChatContactImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatContactImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String profilePic;
  @override
  @JsonKey()
  final String contactId;
  @override
  @JsonKey()
  final int timeSent;
  @override
  @JsonKey()
  final String lastMessage;
  @override
  @JsonKey()
  final bool isOnline;

  @override
  String toString() {
    return 'ChatContact(name: $name, profilePic: $profilePic, contactId: $contactId, timeSent: $timeSent, lastMessage: $lastMessage, isOnline: $isOnline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatContactImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.contactId, contactId) ||
                other.contactId == contactId) &&
            (identical(other.timeSent, timeSent) ||
                other.timeSent == timeSent) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, profilePic, contactId,
      timeSent, lastMessage, isOnline);

  /// Create a copy of ChatContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatContactImplCopyWith<_$ChatContactImpl> get copyWith =>
      __$$ChatContactImplCopyWithImpl<_$ChatContactImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatContactImplToJson(
      this,
    );
  }
}

abstract class _ChatContact implements ChatContact {
  const factory _ChatContact(
      {final String name,
      final String profilePic,
      final String contactId,
      final int timeSent,
      final String lastMessage,
      final bool isOnline}) = _$ChatContactImpl;

  factory _ChatContact.fromJson(Map<String, dynamic> json) =
      _$ChatContactImpl.fromJson;

  @override
  String get name;
  @override
  String get profilePic;
  @override
  String get contactId;
  @override
  int get timeSent;
  @override
  String get lastMessage;
  @override
  bool get isOnline;

  /// Create a copy of ChatContact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatContactImplCopyWith<_$ChatContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
