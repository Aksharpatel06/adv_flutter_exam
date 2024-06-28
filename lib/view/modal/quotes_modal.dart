import 'package:adv_flutter_exam/view/modal/result_modal.dart';

class QuotesModal {
  final int count;
  final int totalCount;
  final int page;
  final int totalPages;
  final int lastItemIndex;
  final List<ResultModal> resultsList;

  QuotesModal(
      {required this.count,
      required this.totalCount,
      required this.page,
      required this.totalPages,
      required this.lastItemIndex,
      required this.resultsList});

  factory QuotesModal.fromJson(Map json) {
    return QuotesModal(
      count: json['count'],
      totalCount: json['totalCount'],
      page: json['page'],
      totalPages: json['totalPages'],
      lastItemIndex: json['lastItemIndex'],
      resultsList: (json['results'] as List)
          .map(
            (e) => ResultModal.fromJson(e),
          )
          .toList(),
    );
  }
}
