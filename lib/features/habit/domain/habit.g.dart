// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitAdapter extends TypeAdapter<Habit> {
  @override
  final typeId = 0;

  @override
  Habit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Habit(
      id: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String?,
      color: (fields[3] as num).toInt(),
      icon: fields[4] as String,
      createdAt: fields[5] as DateTime,
      lastCompleted: fields[6] as DateTime?,
      streak: fields[7] == null ? 0 : (fields[7] as num).toInt(),
      isArchived: fields[8] == null ? false : fields[8] as bool,
      completedDates:
          fields[9] == null ? [] : (fields[9] as List).cast<DateTime>(),
      order: fields[10] == null ? 0 : (fields[10] as num).toInt(),
      reminder: fields[11] as Reminder?,
    );
  }

  @override
  void write(BinaryWriter writer, Habit obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.icon)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.lastCompleted)
      ..writeByte(7)
      ..write(obj.streak)
      ..writeByte(8)
      ..write(obj.isArchived)
      ..writeByte(9)
      ..write(obj.completedDates)
      ..writeByte(10)
      ..write(obj.order)
      ..writeByte(11)
      ..write(obj.reminder);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Habit _$HabitFromJson(Map<String, dynamic> json) => _Habit(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      color: (json['color'] as num).toInt(),
      icon: json['icon'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastCompleted: json['lastCompleted'] == null
          ? null
          : DateTime.parse(json['lastCompleted'] as String),
      streak: (json['streak'] as num?)?.toInt() ?? 0,
      isArchived: json['isArchived'] as bool? ?? false,
      completedDates: (json['completedDates'] as List<dynamic>?)
              ?.map((e) => DateTime.parse(e as String))
              .toList() ??
          const <DateTime>[],
      order: (json['order'] as num?)?.toInt() ?? 0,
      reminder: json['reminder'] == null
          ? null
          : Reminder.fromJson(json['reminder'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HabitToJson(_Habit instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'color': instance.color,
      'icon': instance.icon,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastCompleted': instance.lastCompleted?.toIso8601String(),
      'streak': instance.streak,
      'isArchived': instance.isArchived,
      'completedDates':
          instance.completedDates.map((e) => e.toIso8601String()).toList(),
      'order': instance.order,
      'reminder': instance.reminder,
    };
