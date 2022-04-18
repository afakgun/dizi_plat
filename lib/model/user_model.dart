import 'dart:convert';

class User {
  String? uid;
  String? displayName;
  String? email;
  bool? emailVerify;
  DateTime? creationTime;
  DateTime? lastSignin;
  String? phone;
  String? photoUrl;
  int? providerId;
  User({
    this.uid,
    this.displayName,
    this.email,
    this.emailVerify,
    this.creationTime,
    this.lastSignin,
    this.phone,
    this.photoUrl,
    this.providerId,
  });

  User copyWith({
    String? uid,
    String? displayName,
    String? email,
    bool? emailVerify,
    DateTime? creationTime,
    DateTime? lastSignin,
    String? phone,
    String? photoUrl,
    int? providerId,
  }) {
    return User(
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      emailVerify: emailVerify ?? this.emailVerify,
      creationTime: creationTime ?? this.creationTime,
      lastSignin: lastSignin ?? this.lastSignin,
      phone: phone ?? this.phone,
      photoUrl: photoUrl ?? this.photoUrl,
      providerId: providerId ?? this.providerId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'displayName': displayName,
      'email': email,
      'emailVerify': emailVerify,
      'creationTime': creationTime?.millisecondsSinceEpoch,
      'lastSignin': lastSignin?.millisecondsSinceEpoch,
      'phone': phone,
      'photoUrl': photoUrl,
      'providerId': providerId,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] ?? '',
      displayName: map['displayName'] ?? '',
      email: map['email'] ?? '',
      emailVerify: map['emailVerify'] ?? false,
      creationTime: DateTime.fromMillisecondsSinceEpoch(map['creationTime']),
      lastSignin: DateTime.fromMillisecondsSinceEpoch(map['lastSignin']),
      phone: map['phone'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      providerId: map['providerId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(uid: $uid, displayName: $displayName, email: $email, emailVerify: $emailVerify, creationTime: $creationTime, lastSignin: $lastSignin, phone: $phone, photoUrl: $photoUrl, providerId: $providerId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.uid == uid &&
        other.displayName == displayName &&
        other.email == email &&
        other.emailVerify == emailVerify &&
        other.creationTime == creationTime &&
        other.lastSignin == lastSignin &&
        other.phone == phone &&
        other.photoUrl == photoUrl &&
        other.providerId == providerId;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        displayName.hashCode ^
        email.hashCode ^
        emailVerify.hashCode ^
        creationTime.hashCode ^
        lastSignin.hashCode ^
        phone.hashCode ^
        photoUrl.hashCode ^
        providerId.hashCode;
  }
}
