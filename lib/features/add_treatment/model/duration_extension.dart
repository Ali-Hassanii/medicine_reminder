extension DurationToTreatmentDuration on Duration {
  String get toTreatmentDuration {
    String out = "";

    final int hours = inHours % 24;
    final int minutes = inMinutes % 60;

    // Day
    if (inDays == 1) {
      out += "Each day ";
    } else if (inDays > 1) {
      out += "Every $inDays days ";
    }

    // Hour
    if (hours > 0) {
      if (inDays > 0) {
        out += "and ";
      } else {
        out += "Every ";
      }
      out += "$hours hours ";
    }

    // Minute
    if (minutes > 0) {
      if (inDays > 0 || hours > 0) {
        out += "and ";
      } else {
        out += "Every ";
      }
      out += "$minutes minutes";
    }
    return out;
  }
}
