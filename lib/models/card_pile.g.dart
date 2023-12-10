// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_pile.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CardPile on _CardPile, Store {
  late final _$currentCardAtom =
      Atom(name: '_CardPile.currentCard', context: context);

  @override
  int get currentCard {
    _$currentCardAtom.reportRead();
    return super.currentCard;
  }

  @override
  set currentCard(int value) {
    _$currentCardAtom.reportWrite(value, super.currentCard, () {
      super.currentCard = value;
    });
  }

  late final _$statusAtom = Atom(name: '_CardPile.status', context: context);

  @override
  int get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(int value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$_CardPileActionController =
      ActionController(name: '_CardPile', context: context);

  @override
  void addCard(FlashCard card) {
    final _$actionInfo =
        _$_CardPileActionController.startAction(name: '_CardPile.addCard');
    try {
      return super.addCard(card);
    } finally {
      _$_CardPileActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentCard: ${currentCard},
status: ${status}
    ''';
  }
}
