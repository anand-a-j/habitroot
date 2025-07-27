// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Reminder {
  @HiveField(0)
  String get id;
  @HiveField(1)
  String get habitId;
  @HiveField(2)
  String get time;
  @HiveField(3)
  List<Weekday> get days;
  @HiveField(4)
  bool get isEnabled;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReminderCopyWith<Reminder> get copyWith =>
      _$ReminderCopyWithImpl<Reminder>(this as Reminder, _$identity);

  /// Serializes this Reminder to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Reminder &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.habitId, habitId) || other.habitId == habitId) &&
            (identical(other.time, time) || other.time == time) &&
            const DeepCollectionEquality().equals(other.days, days) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, habitId, time,
      const DeepCollectionEquality().hash(days), isEnabled);

  @override
  String toString() {
    return 'Reminder(id: $id, habitId: $habitId, time: $time, days: $days, isEnabled: $isEnabled)';
  }
}

/// @nodoc
abstract mixin class $ReminderCopyWith<$Res> {
  factory $ReminderCopyWith(Reminder value, $Res Function(Reminder) _then) =
      _$ReminderCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String habitId,
      @HiveField(2) String time,
      @HiveField(3) List<Weekday> days,
      @HiveField(4) bool isEnabled});
}

/// @nodoc
class _$ReminderCopyWithImpl<$Res> implements $ReminderCopyWith<$Res> {
  _$ReminderCopyWithImpl(this._self, this._then);

  final Reminder _self;
  final $Res Function(Reminder) _then;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? habitId = null,
    Object? time = null,
    Object? days = null,
    Object? isEnabled = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      habitId: null == habitId
          ? _self.habitId
          : habitId // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      days: null == days
          ? _self.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<Weekday>,
      isEnabled: null == isEnabled
          ? _self.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [Reminder].
extension ReminderPatterns on Reminder {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Reminder value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Reminder() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Reminder value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Reminder():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Reminder value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Reminder() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @HiveField(0) String id,
            @HiveField(1) String habitId,
            @HiveField(2) String time,
            @HiveField(3) List<Weekday> days,
            @HiveField(4) bool isEnabled)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Reminder() when $default != null:
        return $default(
            _that.id, _that.habitId, _that.time, _that.days, _that.isEnabled);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @HiveField(0) String id,
            @HiveField(1) String habitId,
            @HiveField(2) String time,
            @HiveField(3) List<Weekday> days,
            @HiveField(4) bool isEnabled)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Reminder():
        return $default(
            _that.id, _that.habitId, _that.time, _that.days, _that.isEnabled);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @HiveField(0) String id,
            @HiveField(1) String habitId,
            @HiveField(2) String time,
            @HiveField(3) List<Weekday> days,
            @HiveField(4) bool isEnabled)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Reminder() when $default != null:
        return $default(
            _that.id, _that.habitId, _that.time, _that.days, _that.isEnabled);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Reminder extends Reminder {
  const _Reminder(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.habitId,
      @HiveField(2) required this.time,
      @HiveField(3) final List<Weekday> days = const <Weekday>[],
      @HiveField(4) this.isEnabled = false})
      : _days = days,
        super._();
  factory _Reminder.fromJson(Map<String, dynamic> json) =>
      _$ReminderFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String habitId;
  @override
  @HiveField(2)
  final String time;
  final List<Weekday> _days;
  @override
  @JsonKey()
  @HiveField(3)
  List<Weekday> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  @JsonKey()
  @HiveField(4)
  final bool isEnabled;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReminderCopyWith<_Reminder> get copyWith =>
      __$ReminderCopyWithImpl<_Reminder>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReminderToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Reminder &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.habitId, habitId) || other.habitId == habitId) &&
            (identical(other.time, time) || other.time == time) &&
            const DeepCollectionEquality().equals(other._days, _days) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, habitId, time,
      const DeepCollectionEquality().hash(_days), isEnabled);

  @override
  String toString() {
    return 'Reminder(id: $id, habitId: $habitId, time: $time, days: $days, isEnabled: $isEnabled)';
  }
}

/// @nodoc
abstract mixin class _$ReminderCopyWith<$Res>
    implements $ReminderCopyWith<$Res> {
  factory _$ReminderCopyWith(_Reminder value, $Res Function(_Reminder) _then) =
      __$ReminderCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String habitId,
      @HiveField(2) String time,
      @HiveField(3) List<Weekday> days,
      @HiveField(4) bool isEnabled});
}

/// @nodoc
class __$ReminderCopyWithImpl<$Res> implements _$ReminderCopyWith<$Res> {
  __$ReminderCopyWithImpl(this._self, this._then);

  final _Reminder _self;
  final $Res Function(_Reminder) _then;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? habitId = null,
    Object? time = null,
    Object? days = null,
    Object? isEnabled = null,
  }) {
    return _then(_Reminder(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      habitId: null == habitId
          ? _self.habitId
          : habitId // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      days: null == days
          ? _self._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<Weekday>,
      isEnabled: null == isEnabled
          ? _self.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
