import 'dart:typed_data';

class User {
  final String uid;
  final String username;
  final String email;
  final String bio;
  final String profileImage;
  final List followers;
  final List following;

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
 
}
