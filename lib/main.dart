import 'package:chinese_flashcards/models/card_pile.dart';
import 'package:chinese_flashcards/models/card_store.dart';
import 'package:chinese_flashcards/services/csv.dart';
import 'package:chinese_flashcards/services/db.dart';
import 'package:chinese_flashcards/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<CardPile> piles = await DBService.retrievePiles();
  if (piles.every((pile) => pile.cards.isEmpty)) {
    final initialPile =
        await CSVService.importCardsFromPath("assets/cards.csv", 1);
    await DBService.saveCards(initialPile);
  }
  piles = await DBService.retrievePiles();

  runApp(MyApp(initialPiles: piles));
}

class MyApp extends StatelessWidget {
  final List<CardPile> initialPiles;
  const MyApp({super.key, required this.initialPiles});

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (context) => CardStore(initialPiles: initialPiles),
        child: MaterialApp(
          title: 'Chinese FlashCards',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          home: const App(),
        ));
  }
}
