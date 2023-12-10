import 'package:chinese_flashcards/models/card_pile.dart';
import 'package:chinese_flashcards/models/card_store.dart';
import 'package:chinese_flashcards/models/flash_card.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Quiz extends StatefulWidget {
  final CardPile pile;
  const Quiz({super.key, required this.pile});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  static const animationDuration = Duration(milliseconds: 200);
  int _currentIdx = 0;
  bool _answerRevealed = false;
  late CardPile _initialPile;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    widget.pile.cards.shuffle();
    _initialPile = widget.pile.copy;
    super.initState();
  }

  void _checkAnswer(bool correct) {
    final cardStore = Provider.of<CardStore>(context, listen: false);
    cardStore.submitAnswer(_initialPile.cards[_currentIdx], correct);
    setState(() {
      _currentIdx++;
      _answerRevealed = false;
    });
    _controller.nextPage(duration: animationDuration, curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CardStore>(
      builder: (_, store, __) {
        CardPile pile = store.piles[widget.pile.status - 1];
        return Observer(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text("Pile ${pile.status}"),
            ),
            body: Column(
              children: [
                LinearProgressIndicator(
                  value: _currentIdx / _initialPile.cards.length,
                  semanticsValue:
                      "${_currentIdx + 1} / ${_initialPile.cards.length} }",
                  semanticsLabel:
                      "${_currentIdx + 1} / ${_initialPile.cards.length} }",
                  minHeight: 10,
                ),
                Expanded(
                  child: PageView(
                    controller: _controller,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      for (FlashCard card in _initialPile.cards)
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: FlipCard(
                            onFlip: () {
                              setState(() {
                                _answerRevealed = true;
                              });
                            },
                            front: Card(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    store.zhToEng ? card.zh : card.en,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            )),
                            back: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Text(
                                        store.zhToEng ? card.en : card.zh,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        card.pinyin,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "${card.partOfSpeech}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "${card.zhSentence} ${card.enSentence}",
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                              "Review Complete 🎉",
                              style: Theme.of(context).textTheme.displaySmall,
                            )),
                            Center(
                                child: Text(
                              "Review another pile.",
                              style: Theme.of(context).textTheme.headlineSmall,
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomAppBar(
              child: Column(
                children: [
                  if (_currentIdx == _initialPile.cards.length)
                    FilledButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Exit"))
                  else if (_answerRevealed)
                    FutureBuilder(
                      future: Future.delayed(animationDuration),
                      builder: (context, snapshot) =>
                          snapshot.connectionState == ConnectionState.done
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton.filled(
                                        onPressed: () {
                                          _checkAnswer(false);
                                        },
                                        icon: const Icon(Icons.close)),
                                    IconButton.filled(
                                        onPressed: () {
                                          _checkAnswer(true);
                                        },
                                        icon: const Icon(Icons.check)),
                                  ],
                                )
                              : Container(),
                    )
                  else if (store.zhToEng)
                    IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              "${_initialPile.cards[_currentIdx].zhSentence}",
                              style: TextStyle(
                                  fontSize: 20,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                            backgroundColor: Theme.of(context).primaryColor,
                          ));
                        },
                        icon: const Icon(Icons.help_outline))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
