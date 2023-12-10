import 'package:chinese_flashcards/models/card_store.dart';
import 'package:chinese_flashcards/services/csv.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Import extends StatefulWidget {
  const Import({super.key});

  @override
  State<Import> createState() => _ImportState();
}

class _ImportState extends State<Import> {
  bool _isLoading = false;

  void _import() {
    setState(() {
      _isLoading = true;
    });
    CSVService.importCardsFromPath("assets/cards.csv", 1).then((pile) {
      final cardStore = Provider.of<CardStore>(context, listen: false);
      cardStore.addPile(pile);
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Import Cards",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        if (_isLoading)
          const Center(
            child: CircularProgressIndicator(),
          )
        else
          FilledButton(onPressed: _import, child: const Text("Import"))
      ],
    );
  }
}
