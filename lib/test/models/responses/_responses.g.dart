// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      name: json['name'] as String? ?? "",
      uid: json['uid'] as String? ?? "",
      profilePic: json['profilePic'] as String? ?? "",
      isOnline: json['isOnline'] as bool? ?? false,
      email: json['email'] as String? ?? "",
      role: json['role'] as String? ?? "",
      unreadCounter: (json['unreadCounter'] as num?)?.toInt() ?? 0,
      lastMessage: json['lastMessage'] as Map<String, dynamic>? ??
          const <String, dynamic>{},
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uid': instance.uid,
      'profilePic': instance.profilePic,
      'isOnline': instance.isOnline,
      'email': instance.email,
      'role': instance.role,
      'unreadCounter': instance.unreadCounter,
      'lastMessage': instance.lastMessage,
    };

_$StatusImpl _$$StatusImplFromJson(Map<String, dynamic> json) => _$StatusImpl(
      uid: json['uid'] as String? ?? "",
      username: json['username'] as String? ?? "",
      phoneNumber: json['phoneNumber'] as String? ?? "",
      photoUrl: (json['photoUrl'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdAt: (json['createdAt'] as num?)?.toInt() ?? 0,
      profilePic: json['profilePic'] as String? ?? "",
      statusId: json['statusId'] as String? ?? "",
      whoCanSee: (json['whoCanSee'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$StatusImplToJson(_$StatusImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'username': instance.username,
      'phoneNumber': instance.phoneNumber,
      'photoUrl': instance.photoUrl,
      'createdAt': instance.createdAt,
      'profilePic': instance.profilePic,
      'statusId': instance.statusId,
      'whoCanSee': instance.whoCanSee,
    };

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      senderId: json['senderId'] as String? ?? "",
      senderName: json['senderName'] as String? ?? "",
      senderImage: json['senderImage'] as String? ?? "",
      senderIsOnline: json['senderIsOnline'] as bool? ?? false,
      recieverid: json['recieverid'] as String? ?? "",
      text: json['text'] as String? ?? "",
      type: $enumDecodeNullable(_$MessageEnumEnumMap, json['type']) ??
          MessageEnum.text,
      timeSent: (json['timeSent'] as num?)?.toInt() ?? 0,
      messageId: json['messageId'] as String? ?? "",
      isSeen: json['isSeen'] as bool? ?? false,
      repliedMessage: json['repliedMessage'] as String? ?? "",
      repliedTo: json['repliedTo'] as String? ?? "",
      repliedMessageType: $enumDecodeNullable(
              _$MessageEnumEnumMap, json['repliedMessageType']) ??
          MessageEnum.text,
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'senderName': instance.senderName,
      'senderImage': instance.senderImage,
      'senderIsOnline': instance.senderIsOnline,
      'recieverid': instance.recieverid,
      'text': instance.text,
      'type': _$MessageEnumEnumMap[instance.type]!,
      'timeSent': instance.timeSent,
      'messageId': instance.messageId,
      'isSeen': instance.isSeen,
      'repliedMessage': instance.repliedMessage,
      'repliedTo': instance.repliedTo,
      'repliedMessageType': _$MessageEnumEnumMap[instance.repliedMessageType]!,
    };

const _$MessageEnumEnumMap = {
  MessageEnum.text: 'text',
  MessageEnum.image: 'image',
  MessageEnum.audio: 'audio',
  MessageEnum.video: 'video',
  MessageEnum.gif: 'gif',
};

_$GroupImpl _$$GroupImplFromJson(Map<String, dynamic> json) => _$GroupImpl(
      senderId: json['senderId'] as String? ?? "",
      name: json['name'] as String? ?? "",
      groupId: json['groupId'] as String? ?? "",
      lastMessage: json['lastMessage'] as String? ?? "",
      groupPic: json['groupPic'] as String? ?? "",
      membersUid: (json['membersUid'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      timeSent: (json['timeSent'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$GroupImplToJson(_$GroupImpl instance) =>
    <String, dynamic>{
      'senderId': instance.senderId,
      'name': instance.name,
      'groupId': instance.groupId,
      'lastMessage': instance.lastMessage,
      'groupPic': instance.groupPic,
      'membersUid': instance.membersUid,
      'timeSent': instance.timeSent,
    };

_$CallImpl _$$CallImplFromJson(Map<String, dynamic> json) => _$CallImpl(
      callerId: json['callerId'] as String? ?? "",
      callerName: json['callerName'] as String? ?? "",
      callerPic: json['callerPic'] as String? ?? "",
      receiverId: json['receiverId'] as String? ?? "",
      receiverName: json['receiverName'] as String? ?? "",
      receiverPic: json['receiverPic'] as String? ?? "",
      callId: json['callId'] as String? ?? "",
      hasDialled: json['hasDialled'] as bool? ?? false,
    );

Map<String, dynamic> _$$CallImplToJson(_$CallImpl instance) =>
    <String, dynamic>{
      'callerId': instance.callerId,
      'callerName': instance.callerName,
      'callerPic': instance.callerPic,
      'receiverId': instance.receiverId,
      'receiverName': instance.receiverName,
      'receiverPic': instance.receiverPic,
      'callId': instance.callId,
      'hasDialled': instance.hasDialled,
    };

_$ChatContactImpl _$$ChatContactImplFromJson(Map<String, dynamic> json) =>
    _$ChatContactImpl(
      name: json['name'] as String? ?? "",
      profilePic: json['profilePic'] as String? ?? "",
      contactId: json['contactId'] as String? ?? "",
      timeSent: (json['timeSent'] as num?)?.toInt() ?? 0,
      lastMessage: json['lastMessage'] as String? ?? "",
      isOnline: json['isOnline'] as bool? ?? false,
    );

Map<String, dynamic> _$$ChatContactImplToJson(_$ChatContactImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profilePic': instance.profilePic,
      'contactId': instance.contactId,
      'timeSent': instance.timeSent,
      'lastMessage': instance.lastMessage,
      'isOnline': instance.isOnline,
    };
