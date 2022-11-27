import 'package:equatable/equatable.dart';

/// [User.empty] represents an unauthenticated user.
class User extends Equatable {
  const User({
    this.id,
    this.email,
    this.name,
    this.photo,
  });

  /// The current user's email address.
  final String? email;

  /// The current user's id.
  final String? id;

  /// The current user's name (display name).
  final String? name;

  /// Url for the current user's photo.
  final String? photo;

  /// Empty user which represents an unauthenticated user.
  static const empty = User(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [email, id, name, photo];

  /// Creates a new [User] from a json map.
  /// Returns [User.empty] if the map is null.
  factory User.fromJson(Map<String, dynamic>? json) => json != null
      ? User(
          id: json['id'] as String,
          email: json['email'] as String?,
          name: json['name'] as String?,
          photo: json['photo'] as String?,
        )
      : User.empty;

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "photo": photo,
      };
}
