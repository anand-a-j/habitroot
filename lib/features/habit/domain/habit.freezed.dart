// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Habit {
  @HiveField(0)
  String get id;
  @HiveField(1)
  String get name;
  @HiveField(2)
  String? get description;
  @HiveField(3)
  int get color;
  @HiveField(4)
  String get icon;
  @HiveField(5)
  DateTime get createdAt;
  @HiveField(6)
  DateTime? get lastCompleted;
  @HiveField(7)
  int get streak;
  @HiveField(8)
  bool get isArchived;
  @HiveField(9)
  List<DateTime> get completedDates;
  @HiveField(10)
  int get order;
  @HiveField(11)
  Reminder? get reminder;

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HabitCopyWith<Habit> get copyWith =>
      _$HabitCopyWithImpl<Habit>(this as Habit, _$identity);

  /// Serializes this Habit to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Habit &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastCompleted, lastCompleted) ||
                other.lastCompleted == lastCompleted) &&
            (identical(other.streak, streak) || other.streak == streak) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            const DeepCollectionEquality()
                .equals(other.completedDates, completedDates) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.reminder, reminder) ||
                other.reminder == reminder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      color,
      icon,
      createdAt,
      lastCompleted,
      streak,
      isArchived,
      const DeepCollectionEquality().hash(completedDates),
      order,
      reminder);

  @override
  String toString() {
    return 'Habit(id: $id, name: $name, description: $description, color: $color, icon: $icon, createdAt: $createdAt, lastCompleted: $lastCompleted, streak: $streak, isArchived: $isArchived, completedDates: $completedDates, order: $order, reminder: $reminder)';
  }
}

/// @nodoc
abstract mixin class $HabitCopyWith<$Res> {
  factory $HabitCopyWith(Habit value, $Res Function(Habit) _then) =
      _$HabitCopyWithImpl;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String? description,
      @HiveField(3) int color,
      @HiveField(4) String icon,
      @HiveField(5) DateTime createdAt,
      @HiveField(6) DateTime? lastCompleted,
      @HiveField(7) int streak,
      @HiveField(8) bool isArchived,
      @HiveField(9) List<DateTime> completedDates,
      @HiveField(10) int order,
      @HiveField(11) Reminder? reminder});

  $ReminderCopyWith<$Res>? get reminder;
}

/// @nodoc
class _$HabitCopyWithImpl<$Res> implements $HabitCopyWith<$Res> {
  _$HabitCopyWithImpl(this._self, this._then);

  final Habit _self;
  final $Res Function(Habit) _then;

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? color = null,
    Object? icon = null,
    Object? createdAt = null,
    Object? lastCompleted = freezed,
    Object? streak = null,
    Object? isArchived = null,
    Object? completedDates = null,
    Object? order = null,
    Object? reminder = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      icon: null == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastCompleted: freezed == lastCompleted
          ? _self.lastCompleted
          : lastCompleted // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      streak: null == streak
          ? _self.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as int,
      isArchived: null == isArchived
          ? _self.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      completedDates: null == completedDates
          ? _self.completedDates
          : completedDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      order: null == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      reminder: freezed == reminder
          ? _self.reminder
          : reminder // ignore: cast_nullable_to_non_nullable
              as Reminder?,
    ));
  }

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReminderCopyWith<$Res>? get reminder {
    if (_self.reminder == null) {
      return null;
    }

    return $ReminderCopyWith<$Res>(_self.reminder!, (value) {
      return _then(_self.copyWith(reminder: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Habit].
extension HabitPatterns on Habit {
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
    TResult Function(_Habit value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Habit() when $default != null:
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
    TResult Function(_Habit value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Habit():
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
    TResult? Function(_Habit value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Habit() when $default != null:
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
            @HiveField(1) String name,
            @HiveField(2) String? description,
            @HiveField(3) int color,
            @HiveField(4) String icon,
            @HiveField(5) DateTime createdAt,
            @HiveField(6) DateTime? lastCompleted,
            @HiveField(7) int streak,
            @HiveField(8) bool isArchived,
            @HiveField(9) List<DateTime> completedDates,
            @HiveField(10) int order,
            @HiveField(11) Reminder? reminder)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Habit() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.description,
            _that.color,
            _that.icon,
            _that.createdAt,
            _that.lastCompleted,
            _that.streak,
            _that.isArchived,
            _that.completedDates,
            _that.order,
            _that.reminder);
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
            @HiveField(1) String name,
            @HiveField(2) String? description,
            @HiveField(3) int color,
            @HiveField(4) String icon,
            @HiveField(5) DateTime createdAt,
            @HiveField(6) DateTime? lastCompleted,
            @HiveField(7) int streak,
            @HiveField(8) bool isArchived,
            @HiveField(9) List<DateTime> completedDates,
            @HiveField(10) int order,
            @HiveField(11) Reminder? reminder)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Habit():
        return $default(
            _that.id,
            _that.name,
            _that.description,
            _that.color,
            _that.icon,
            _that.createdAt,
            _that.lastCompleted,
            _that.streak,
            _that.isArchived,
            _that.completedDates,
            _that.order,
            _that.reminder);
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
            @HiveField(1) String name,
            @HiveField(2) String? description,
            @HiveField(3) int color,
            @HiveField(4) String icon,
            @HiveField(5) DateTime createdAt,
            @HiveField(6) DateTime? lastCompleted,
            @HiveField(7) int streak,
            @HiveField(8) bool isArchived,
            @HiveField(9) List<DateTime> completedDates,
            @HiveField(10) int order,
            @HiveField(11) Reminder? reminder)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Habit() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.description,
            _that.color,
            _that.icon,
            _that.createdAt,
            _that.lastCompleted,
            _that.streak,
            _that.isArchived,
            _that.completedDates,
            _that.order,
            _that.reminder);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Habit extends Habit {
  const _Habit(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) this.description,
      @HiveField(3) required this.color,
      @HiveField(4) required this.icon,
      @HiveField(5) required this.createdAt,
      @HiveField(6) this.lastCompleted,
      @HiveField(7) this.streak = 0,
      @HiveField(8) this.isArchived = false,
      @HiveField(9) final List<DateTime> completedDates = const <DateTime>[],
      @HiveField(10) this.order = 0,
      @HiveField(11) this.reminder})
      : _completedDates = completedDates,
        super._();
  factory _Habit.fromJson(Map<String, dynamic> json) => _$HabitFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String? description;
  @override
  @HiveField(3)
  final int color;
  @override
  @HiveField(4)
  final String icon;
  @override
  @HiveField(5)
  final DateTime createdAt;
  @override
  @HiveField(6)
  final DateTime? lastCompleted;
  @override
  @JsonKey()
  @HiveField(7)
  final int streak;
  @override
  @JsonKey()
  @HiveField(8)
  final bool isArchived;
  final List<DateTime> _completedDates;
  @override
  @JsonKey()
  @HiveField(9)
  List<DateTime> get completedDates {
    if (_completedDates is EqualUnmodifiableListView) return _completedDates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedDates);
  }

  @override
  @JsonKey()
  @HiveField(10)
  final int order;
  @override
  @HiveField(11)
  final Reminder? reminder;

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HabitCopyWith<_Habit> get copyWith =>
      __$HabitCopyWithImpl<_Habit>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HabitToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Habit &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastCompleted, lastCompleted) ||
                other.lastCompleted == lastCompleted) &&
            (identical(other.streak, streak) || other.streak == streak) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            const DeepCollectionEquality()
                .equals(other._completedDates, _completedDates) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.reminder, reminder) ||
                other.reminder == reminder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      color,
      icon,
      createdAt,
      lastCompleted,
      streak,
      isArchived,
      const DeepCollectionEquality().hash(_completedDates),
      order,
      reminder);

  @override
  String toString() {
    return 'Habit(id: $id, name: $name, description: $description, color: $color, icon: $icon, createdAt: $createdAt, lastCompleted: $lastCompleted, streak: $streak, isArchived: $isArchived, completedDates: $completedDates, order: $order, reminder: $reminder)';
  }
}

/// @nodoc
abstract mixin class _$HabitCopyWith<$Res> implements $HabitCopyWith<$Res> {
  factory _$HabitCopyWith(_Habit value, $Res Function(_Habit) _then) =
      __$HabitCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String? description,
      @HiveField(3) int color,
      @HiveField(4) String icon,
      @HiveField(5) DateTime createdAt,
      @HiveField(6) DateTime? lastCompleted,
      @HiveField(7) int streak,
      @HiveField(8) bool isArchived,
      @HiveField(9) List<DateTime> completedDates,
      @HiveField(10) int order,
      @HiveField(11) Reminder? reminder});

  @override
  $ReminderCopyWith<$Res>? get reminder;
}

/// @nodoc
class __$HabitCopyWithImpl<$Res> implements _$HabitCopyWith<$Res> {
  __$HabitCopyWithImpl(this._self, this._then);

  final _Habit _self;
  final $Res Function(_Habit) _then;

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? color = null,
    Object? icon = null,
    Object? createdAt = null,
    Object? lastCompleted = freezed,
    Object? streak = null,
    Object? isArchived = null,
    Object? completedDates = null,
    Object? order = null,
    Object? reminder = freezed,
  }) {
    return _then(_Habit(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      color: null == color
          ? _self.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      icon: null == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastCompleted: freezed == lastCompleted
          ? _self.lastCompleted
          : lastCompleted // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      streak: null == streak
          ? _self.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as int,
      isArchived: null == isArchived
          ? _self.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      completedDates: null == completedDates
          ? _self._completedDates
          : completedDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      order: null == order
          ? _self.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      reminder: freezed == reminder
          ? _self.reminder
          : reminder // ignore: cast_nullable_to_non_nullable
              as Reminder?,
    ));
  }

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReminderCopyWith<$Res>? get reminder {
    if (_self.reminder == null) {
      return null;
    }

    return $ReminderCopyWith<$Res>(_self.reminder!, (value) {
      return _then(_self.copyWith(reminder: value));
    });
  }
}

// dart format on
