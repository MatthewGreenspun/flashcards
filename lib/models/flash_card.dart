import 'dart:math';

import 'package:mobx/mobx.dart';
part 'flash_card.g.dart';

class FlashCard = _FlashCard with _$FlashCard;

abstract class _FlashCard with Store {
  @observable
  String zh;
  @observable
  String pinyin;
  @observable
  String en;
  @observable
  String? zhSentence;
  @observable
  String? enSentence;
  @observable
  String? partOfSpeech;
  int status;
  @observable
  DateTime lastUpdated;

  _FlashCard(
      {required this.zh,
      required this.pinyin,
      required this.en,
      this.zhSentence,
      this.enSentence,
      this.partOfSpeech,
      required this.status,
      required this.lastUpdated});

  @action
  void setStatus(int newStatus) {
    status = max(1, newStatus);
    status = min(5, status);
  }

  get sql => {
        "zh": zh,
        "en": en,
        "pinyin": pinyin,
        "part_of_speech": partOfSpeech,
        "zh_sentence": zhSentence,
        "en_sentence": enSentence,
        "status": status,
        "last_updated": DateTime.now().toIso8601String()
      };

  FlashCard get copy => FlashCard(
      en: en,
      zh: zh,
      pinyin: pinyin,
      partOfSpeech: partOfSpeech,
      zhSentence: zhSentence,
      enSentence: enSentence,
      status: status,
      lastUpdated: lastUpdated);
}
