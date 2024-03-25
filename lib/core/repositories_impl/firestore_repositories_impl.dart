import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/core/repositories/firestore_repositories.dart';
import 'package:instagram_clone/core/repositories/storage_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/home/data/models/post_model.dart';
import 'package:uuid/uuid.dart';

class FirestoreRepositoriesImpl implements FirestoreRepositories {
  @override
  Future<void> uploadPost(
      {required String userId,
      required String username,
      required String profileImageUrl,
      required Uint8List postImage,
      required String description}) async {
    final String postUrl = await sl
        .get<StorageRepositories>()
        .uploadImage(folderName: 'posts', image: postImage, isPost: true);

    final String postId = const Uuid().v1();
    PostModel post = PostModel((b) => b
      ..userId = userId
      ..postId = postId
      ..username = username
      ..profileImageUrl = profileImageUrl
      ..postUrl = postUrl
      ..description = description
      ..publishedDate = DateTime.now().toString()
      ..likes = ListBuilder());

    await sl
        .get<FirebaseFirestore>()
        .collection('posts')
        .doc(postId)
        .set(post.toMap());
  }
}
