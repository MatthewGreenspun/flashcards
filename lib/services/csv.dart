import 'package:chinese_flashcards/models/card_pile.dart';
import 'package:chinese_flashcards/models/flash_card.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

class CSVService {
  static Future<CardPile> importCardsFromPath(String path, int status) async {
    final csv = await rootBundle.loadString(path);
    final data = const CsvToListConverter().convert(csv);
    CardPile pile = CardPile(status: status);
    for (List row in data.sublist((1))) {
      final card = FlashCard(
          zh: row[0],
          pinyin: row[1],
          en: row[2],
          partOfSpeech: row[3],
          zhSentence: row[4],
          enSentence: row[5],
          status: status,
          lastUpdated: DateTime.now());
      pile.addCard(card);
    }
    return pile;
  }
}
