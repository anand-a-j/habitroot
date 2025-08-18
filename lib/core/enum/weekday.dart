enum Weekday {
  mon,
  tue,
  wed,
  thu,
  fri,
  sat,
  sun,
}

String getAbbreviation(Weekday day) {
  switch (day) {
    case Weekday.mon:
      return 'Mu';
    case Weekday.tue:
      return 'Tu';
    case Weekday.wed:
      return 'We';
    case Weekday.thu:
      return 'Th';
    case Weekday.fri:
      return 'Fr';
    case Weekday.sat:
      return 'Sa';
    case Weekday.sun:
      return 'Su';
  }
}

List<int> weekdaysToInts(List<Weekday> days) {
  return days.map((day) {
    switch (day) {
      case Weekday.mon:
        return DateTime.monday; // 1
      case Weekday.tue:
        return DateTime.tuesday; // 2
      case Weekday.wed:
        return DateTime.wednesday; // 3
      case Weekday.thu:
        return DateTime.thursday; // 4
      case Weekday.fri:
        return DateTime.friday; // 5
      case Weekday.sat:
        return DateTime.saturday; // 6
      case Weekday.sun:
        return DateTime.sunday; // 7
    }
  }).toList();
}

List<int> convertWeekdaysToInts(List<Weekday> days) {
  final mapping = {
    Weekday.mon: DateTime.monday, // 1
    Weekday.tue: DateTime.tuesday, // 2
    Weekday.wed: DateTime.wednesday, // 3
    Weekday.thu: DateTime.thursday, // 4
    Weekday.fri: DateTime.friday, // 5
    Weekday.sat: DateTime.saturday, // 6
    Weekday.sun: DateTime.sunday, // 7
  };

  return days.map((day) => mapping[day]!).toList();
}

List<Weekday> convertIntsToWeekdays(List<int> ints) {
  final mapping = {
    DateTime.monday: Weekday.mon,
    DateTime.tuesday: Weekday.tue,
    DateTime.wednesday: Weekday.wed,
    DateTime.thursday: Weekday.thu,
    DateTime.friday: Weekday.fri,
    DateTime.saturday: Weekday.sat,
    DateTime.sunday: Weekday.sun,
  };

  return ints.map((i) => mapping[i]!).toList();
}
