import 'package:chinese_flashcards/models/card_pile.dart';
import 'package:chinese_flashcards/models/flash_card.dart';
import 'package:chinese_flashcards/services/db.dart';
import 'package:mobx/mobx.dart';
part 'card_store.g.dart';

class CardStore = _CardStore with _$CardStore;

abstract class _CardStore with Store {
  @observable
  bool zhToEng = true;
  @observable
  ObservableList<CardPile> piles = ObservableList();
  _CardStore({required List<CardPile> initialPiles}) {
    piles.addAll(initialPiles);
  }

  @action
  void addPile(CardPile pile) {
    piles.add(pile);
  }

  @action
  void toggleLanguage() {
    zhToEng = !zhToEng;
  }

  @action
  void submitAnswer(FlashCard card, bool correct) {
    final pile = piles.where((p) => p.status == card.status).first;
    pile.cards.removeWhere((c) => c.zh == card.zh);
    if (correct) {
      card.setStatus(card.status + 1);
    } else {
      card.setStatus(card.status - 1);
    }
    if (piles.where((p) => p.status == card.status).isNotEmpty) {
      piles.where((p) => p.status == card.status).first.cards.add(card);
    } else {
      final newPile = CardPile(status: card.status);
      newPile.addCard(card);
      addPile(newPile);
    }
    DBService.saveCard(card);
  }
}
