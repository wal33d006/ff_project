import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Dependent extends Equatable {
  final String name;
  final String id;

  Dependent({required this.name}) : id = const Uuid().v1();

  factory Dependent.empty() => Dependent(
        name: '',
      );

  Dependent copyWith({
    String? name,
  }) =>
      Dependent(
        name: name ?? this.name,
      );

  @override
  List<Object?> get props => [name, id];
}
