import 'package:chinese_flashcards/models/flash_card.dart';
import 'package:mobx/mobx.dart';
part 'card_pile.g.dart';

class CardPile = _CardPile with _$CardPile;

abstract class _CardPile with Store {
  @observable
  int currentCard = 0;
  @observable
  int status;
  ObservableList<FlashCard> cards = ObservableList();

  _CardPile({required this.status});

  @action
  void addCard(FlashCard card) {
    cards.add(card);
  }

  CardPile get copy {
    final pile = CardPile(status: status);
    for (FlashCard card in cards) {
      pile.addCard(card.copy);
    }
    return pile;
  }
}
