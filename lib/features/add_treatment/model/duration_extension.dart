extension DurationExtension on Duration {
  String get toFormattedString {
    final int days = inDays;
    final int hours = inHours % 24;
    final int minutes = inMinutes % 60;

    String out = "";

    // Day
    if (days == 1) {
      out += "Each day ";
    } else if (days > 1) {
      out += "Every $days days ";
    }

    // Hour
    if (hours > 0) {
      if (days > 0) {
        out += "and ";
      } else {
        out += "Every ";
      }
      out += "$hours hours ";
    }

    // Minute
    if (minutes > 0) {
      if (days > 0 || hours > 0) {
        out += "and ";
      } else {
        out += "Every ";
      }
      out += "$minutes minutes";
    }
    return out;
  }
}
