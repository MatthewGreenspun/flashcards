import 'package:chinese_flashcards/models/card_pile.dart';
import 'package:chinese_flashcards/models/card_store.dart';
import 'package:chinese_flashcards/ui/card_pile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CardStore>(
      builder: (_, store, __) => Observer(
        builder: (context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Piles",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  IconButton(
                      onPressed: store.toggleLanguage,
                      icon: const Icon(Icons.language_outlined))
                ],
              ),
              for (CardPile pile in store.piles) CardPileWidget(pile: pile)
            ],
          ),
        ),
      ),
    );
  }
}
