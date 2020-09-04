import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  final String uid;

  @HiveField(1)
  final String displayName;

  @HiveField(2)
  final String photoUrl;

  @HiveField(3)
  final String emailId;

  UserModel({
    this.uid,
    this.displayName,
    this.photoUrl,
    this.emailId,
  });
}
