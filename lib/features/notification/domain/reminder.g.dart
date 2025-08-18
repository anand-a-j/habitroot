// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReminderAdapter extends TypeAdapter<Reminder> {
  @override
  final typeId = 1;

  @override
  Reminder read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Reminder(
      id: (fields[0] as num).toInt(),
      habitId: fields[1] as String,
      time: fields[2] as String,
      weekdays: fields[3] == null ? [] : (fields[3] as List).cast<int>(),
      isEnabled: fields[4] == null ? false : fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Reminder obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.habitId)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.weekdays)
      ..writeByte(4)
      ..write(obj.isEnabled);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReminderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Reminder _$ReminderFromJson(Map<String, dynamic> json) => _Reminder(
      id: (json['id'] as num).toInt(),
      habitId: json['habitId'] as String,
      time: json['time'] as String,
      weekdays: (json['weekdays'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const <int>[],
      isEnabled: json['isEnabled'] as bool? ?? false,
    );

Map<String, dynamic> _$ReminderToJson(_Reminder instance) => <String, dynamic>{
      'id': instance.id,
      'habitId': instance.habitId,
      'time': instance.time,
      'weekdays': instance.weekdays,
      'isEnabled': instance.isEnabled,
    };
