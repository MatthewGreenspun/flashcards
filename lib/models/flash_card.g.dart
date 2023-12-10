// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flash_card.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FlashCard on _FlashCard, Store {
  late final _$zhAtom = Atom(name: '_FlashCard.zh', context: context);

  @override
  String get zh {
    _$zhAtom.reportRead();
    return super.zh;
  }

  @override
  set zh(String value) {
    _$zhAtom.reportWrite(value, super.zh, () {
      super.zh = value;
    });
  }

  late final _$pinyinAtom = Atom(name: '_FlashCard.pinyin', context: context);

  @override
  String get pinyin {
    _$pinyinAtom.reportRead();
    return super.pinyin;
  }

  @override
  set pinyin(String value) {
    _$pinyinAtom.reportWrite(value, super.pinyin, () {
      super.pinyin = value;
    });
  }

  late final _$enAtom = Atom(name: '_FlashCard.en', context: context);

  @override
  String get en {
    _$enAtom.reportRead();
    return super.en;
  }

  @override
  set en(String value) {
    _$enAtom.reportWrite(value, super.en, () {
      super.en = value;
    });
  }

  late final _$zhSentenceAtom =
      Atom(name: '_FlashCard.zhSentence', context: context);

  @override
  String? get zhSentence {
    _$zhSentenceAtom.reportRead();
    return super.zhSentence;
  }

  @override
  set zhSentence(String? value) {
    _$zhSentenceAtom.reportWrite(value, super.zhSentence, () {
      super.zhSentence = value;
    });
  }

  late final _$enSentenceAtom =
      Atom(name: '_FlashCard.enSentence', context: context);

  @override
  String? get enSentence {
    _$enSentenceAtom.reportRead();
    return super.enSentence;
  }

  @override
  set enSentence(String? value) {
    _$enSentenceAtom.reportWrite(value, super.enSentence, () {
      super.enSentence = value;
    });
  }

  late final _$partOfSpeechAtom =
      Atom(name: '_FlashCard.partOfSpeech', context: context);

  @override
  String? get partOfSpeech {
    _$partOfSpeechAtom.reportRead();
    return super.partOfSpeech;
  }

  @override
  set partOfSpeech(String? value) {
    _$partOfSpeechAtom.reportWrite(value, super.partOfSpeech, () {
      super.partOfSpeech = value;
    });
  }

  late final _$lastUpdatedAtom =
      Atom(name: '_FlashCard.lastUpdated', context: context);

  @override
  DateTime get lastUpdated {
    _$lastUpdatedAtom.reportRead();
    return super.lastUpdated;
  }

  @override
  set lastUpdated(DateTime value) {
    _$lastUpdatedAtom.reportWrite(value, super.lastUpdated, () {
      super.lastUpdated = value;
    });
  }

  late final _$_FlashCardActionController =
      ActionController(name: '_FlashCard', context: context);

  @override
  void setStatus(int newStatus) {
    final _$actionInfo =
        _$_FlashCardActionController.startAction(name: '_FlashCard.setStatus');
    try {
      return super.setStatus(newStatus);
    } finally {
      _$_FlashCardActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
zh: ${zh},
pinyin: ${pinyin},
en: ${en},
zhSentence: ${zhSentence},
enSentence: ${enSentence},
partOfSpeech: ${partOfSpeech},
lastUpdated: ${lastUpdated}
    ''';
  }
}
