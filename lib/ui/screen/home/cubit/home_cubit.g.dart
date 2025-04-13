// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeStateImpl _$$HomeStateImplFromJson(Map<String, dynamic> json) =>
    _$HomeStateImpl(
      loading: json['loading'] as bool? ?? true,
      emailList: (json['emailList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      contacts: (json['contacts'] as List<dynamic>?)
              ?.map((e) => ChatContact.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      groups: (json['groups'] as List<dynamic>?)
              ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      index: (json['index'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$HomeStateImplToJson(_$HomeStateImpl instance) =>
    <String, dynamic>{
      'loading': instance.loading,
      'emailList': instance.emailList,
      'contacts': instance.contacts,
      'groups': instance.groups,
      'index': instance.index,
    };
