import 'journal_details.dart';

class DailyJournalData {
  final String date;
  final String dayOfTheWeek;
  final List<JournalEntry> journals;

  DailyJournalData({
    required this.date,
    required this.dayOfTheWeek,
    required this.journals,
  });

  factory DailyJournalData.fromJson(Map<String, dynamic> json) {
    return DailyJournalData(
      date: json['date'],
      dayOfTheWeek: json['dayOfTheWeek'],
      journals: (json['journals'] as List)
          .map((i) => JournalEntry.fromJson(i))
          .toList(),
    );
  }
}

class JournalEntry {
  final String time;
  final int heartRateMin;
  final int heartRateMax;
  final int heartRateAvg;
  final int stressLevel;
  final JournalDetails? journalDetail;

  JournalEntry({
    required this.time,
    required this.heartRateMin,
    required this.heartRateMax,
    required this.heartRateAvg,
    required this.stressLevel,
    this.journalDetail,
  });

  factory JournalEntry.fromJson(Map<String, dynamic> json) {
    return JournalEntry(
      time: json['time'],
      heartRateMin: json['heartRateMin'],
      heartRateMax: json['heartRateMax'],
      heartRateAvg: json['heartRateAvg'],
      stressLevel: json['stressLevel'],
      journalDetail: json['journalDetail'] != null
          ? JournalDetails.fromJson(json['journalDetail'])
          : null,
    );
  }
}
