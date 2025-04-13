// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthStateImpl _$$AuthStateImplFromJson(Map<String, dynamic> json) =>
    _$AuthStateImpl(
      loading: json['loading'] as bool? ?? true,
      userInfo: json['userInfo'] == null
          ? const UserModel()
          : UserModel.fromJson(json['userInfo'] as Map<String, dynamic>),
      userList: (json['userList'] as List<dynamic>?)
              ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AuthStateImplToJson(_$AuthStateImpl instance) =>
    <String, dynamic>{
      'loading': instance.loading,
      'userInfo': instance.userInfo,
      'userList': instance.userList,
    };
