import 'package:chinese_flashcards/models/card_pile.dart';
import 'package:chinese_flashcards/models/flash_card.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBService {
  static Future<Database> get database async {
    return openDatabase(
      join(await getDatabasesPath(), 'cards.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE cards(zh TEXT PRIMARY KEY, pinyin TEXT, en TEXT, part_of_speech TEXT, zh_sentence TEXT, en_sentence TEXT, status INTEGER, last_updated TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<List<CardPile>> retrievePiles() async {
    final db = await database;
    final data = await db.query("cards");
    final piles = List.generate(5, (index) => CardPile(status: index + 1));
    for (Map<String, Object?> row in data) {
      final card = FlashCard(
        zh: "${row['zh']}",
        pinyin: "${row['pinyin']}",
        en: "${row['en']}",
        enSentence: "${row['en_sentence']}",
        zhSentence: "${row['zh_sentence']}",
        partOfSpeech: "${row['part_of_speech']}",
        status: int.parse("${row['status']}"),
        lastUpdated: DateTime.parse("${row['last_updated']}"),
      );
      piles[card.status - 1].cards.add(card);
    }
    return piles;
  }

  static Future<void> saveCard(FlashCard card) async {
    final db = await database;
    db.insert("cards", card.sql, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<void> saveCards(CardPile pile) async {
    final db = await database;
    final batch = db.batch();
    for (FlashCard card in pile.cards) {
      batch.insert("cards", card.sql,
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    batch.commit();
  }
}
