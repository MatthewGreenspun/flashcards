// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CardStore on _CardStore, Store {
  late final _$zhToEngAtom = Atom(name: '_CardStore.zhToEng', context: context);

  @override
  bool get zhToEng {
    _$zhToEngAtom.reportRead();
    return super.zhToEng;
  }

  @override
  set zhToEng(bool value) {
    _$zhToEngAtom.reportWrite(value, super.zhToEng, () {
      super.zhToEng = value;
    });
  }

  late final _$pilesAtom = Atom(name: '_CardStore.piles', context: context);

  @override
  ObservableList<CardPile> get piles {
    _$pilesAtom.reportRead();
    return super.piles;
  }

  @override
  set piles(ObservableList<CardPile> value) {
    _$pilesAtom.reportWrite(value, super.piles, () {
      super.piles = value;
    });
  }

  late final _$_CardStoreActionController =
      ActionController(name: '_CardStore', context: context);

  @override
  void addPile(CardPile pile) {
    final _$actionInfo =
        _$_CardStoreActionController.startAction(name: '_CardStore.addPile');
    try {
      return super.addPile(pile);
    } finally {
      _$_CardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleLanguage() {
    final _$actionInfo = _$_CardStoreActionController.startAction(
        name: '_CardStore.toggleLanguage');
    try {
      return super.toggleLanguage();
    } finally {
      _$_CardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void submitAnswer(FlashCard card, bool correct) {
    final _$actionInfo = _$_CardStoreActionController.startAction(
        name: '_CardStore.submitAnswer');
    try {
      return super.submitAnswer(card, correct);
    } finally {
      _$_CardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
zhToEng: ${zhToEng},
piles: ${piles}
    ''';
  }
}
