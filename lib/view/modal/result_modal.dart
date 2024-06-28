class ResultModal {
  final String id, author, content, authorSlug, dateAdded, dateModified;
  final int length;
  final List tags;

  ResultModal(
      {required this.id,
      required this.author,
      required this.content,
      required this.authorSlug,
      required this.dateAdded,
      required this.dateModified,
      required this.length,
      required this.tags});

  factory ResultModal.fromJson(Map json) {
    return ResultModal(
        id: json['_id'],
        author: json['author'],
        content: json['content'],
        authorSlug: json['authorSlug'],
        dateAdded: json['dateAdded'],
        dateModified: json['dateModified'],
        length: json['length'],
        tags: json['tags']);
  }
}
