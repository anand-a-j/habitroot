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
      id: fields[0] as String,
      habitId: fields[1] as String,
      time: fields[2] as String,
      days: fields[3] == null ? [] : (fields[3] as List).cast<Weekday>(),
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
      ..write(obj.days)
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
      id: json['id'] as String,
      habitId: json['habitId'] as String,
      time: json['time'] as String,
      days: (json['days'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$WeekdayEnumMap, e))
              .toList() ??
          const <Weekday>[],
      isEnabled: json['isEnabled'] as bool? ?? false,
    );

Map<String, dynamic> _$ReminderToJson(_Reminder instance) => <String, dynamic>{
      'id': instance.id,
      'habitId': instance.habitId,
      'time': instance.time,
      'days': instance.days.map((e) => _$WeekdayEnumMap[e]!).toList(),
      'isEnabled': instance.isEnabled,
    };

const _$WeekdayEnumMap = {
  Weekday.mon: 'mon',
  Weekday.tue: 'tue',
  Weekday.wed: 'wed',
  Weekday.thu: 'thu',
  Weekday.fri: 'fri',
  Weekday.sat: 'sat',
  Weekday.sun: 'sun',
};
