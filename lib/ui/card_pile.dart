import 'package:chinese_flashcards/models/card_pile.dart';
import 'package:chinese_flashcards/models/card_store.dart';
import 'package:chinese_flashcards/ui/quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CardPileWidget extends StatelessWidget {
  final CardPile pile;
  const CardPileWidget({super.key, required this.pile});

  @override
  Widget build(BuildContext context) {
    return Consumer<CardStore>(
      builder: (_, store, __) => Observer(
        builder: (context) => ExpansionTile(
          title: Text("Pile ${pile.status} (${pile.cards.length})"),
          children: [
            SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: pile.cards
                      .map((card) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Quiz(pile: pile)));
                            },
                            child: Card(
                              child: Container(
                                  padding: const EdgeInsets.all(8),
                                  width: 120,
                                  height: 70,
                                  child: Center(
                                      child: Observer(
                                          builder: (context) => Text(
                                                store.zhToEng
                                                    ? card.zh
                                                    : card.en,
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                              )))),
                            ),
                          ))
                      .toList(),
                ))
          ],
        ),
      ),
    );
  }
}
