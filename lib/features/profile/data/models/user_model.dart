library user_model;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/core/serializers/serializers.dart';
import 'package:instagram_clone/features/profile/domain/entities/user_entity.dart';

part 'user_model.g.dart';

abstract class UserModel
    implements UserEntity, Built<UserModel, UserModelBuilder> {
  // fields go here
  @override
  String get userId;
  @override
  String get username;
  @override
  String get email;
  @override
  String get photoUrl;
  @override
  String get bio;
  @override
  BuiltList<String> get posts;
  @override
  BuiltList<String> get followers;
  @override
  BuiltList<String> get following;

  UserModel._();

  factory UserModel([Function(UserModelBuilder b) updates]) = _$UserModel;

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(UserModel.serializer, this)
        as Map<String, dynamic>;
  }

  static UserEntity fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return serializers.deserializeWith(UserModel.serializer, data)!;
  }

  static Serializer<UserModel> get serializer => _$userModelSerializer;
}
