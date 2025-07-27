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
