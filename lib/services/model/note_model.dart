import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part "note_model.g.dart";

@HiveType(typeId: 0)
class Note extends Equatable {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? content;

  Note({this.id, this.title, this.content});

  Note copyWith({String? id, String? title, String? content}) => Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content);

  @override
  List<Object?> get props => [id, title, content];
}
