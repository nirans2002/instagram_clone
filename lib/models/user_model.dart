import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String username;
  final String email;
  final String bio;
  final String profileImage;
  final Map followers;
  final Map following;

  const User({
    required this.uid,
    required this.username,
    required this.email,
    required this.bio,
    required this.profileImage,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'username': username,
        'email': email,
        'bio': bio,
        'profileImage': profileImage,
        'followers': followers,
        'following': following,
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        uid: json["uid"],
        email: json["email"],
        profileImage: json["profileImage"],
        bio: json["bio"],
        followers: json["followers"],
        following: json["following"],
      );

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      username: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      profileImage: snapshot["profileImage"],
      bio: snapshot["bio"],
      followers: snapshot["followers"],
      following: snapshot["following"],
    );
  }
}
