import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity extends Equatable {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final DateTime dateOfBirth;
  final bool? sex;

  UserEntity(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.dateOfBirth,
      required this.sex});

  @override
  List<Object?> get props {
    return [id, email, firstName, lastName, phoneNumber, dateOfBirth];
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
