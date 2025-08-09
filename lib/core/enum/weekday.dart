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
