import 'package:chinese_flashcards/models/card_pile.dart';
import 'package:chinese_flashcards/models/flash_card.dart';
import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;

class CSVService {
  static Future<CardPile> importCardsFromURL(int status) async {
    final url = Uri.parse(
        "https://raw.githubusercontent.com/MatthewGreenspun/flashcards/main/assets/cards.csv");
    final res = await http.get(url);
    final data = const CsvToListConverter().convert(res.body);
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
