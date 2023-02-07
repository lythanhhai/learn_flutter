class Quote {
  late int Id;
  late String text;
  late String author;

  Quote(int Id, String text, String author) {
    this.Id = Id;
    this.text = text;
    this.author = author;
  }

  getText() => text;
  getAuthor() => author;
  getId() => Id;

  setText(text) => text = text;
  setAuthor(author) => author = author;
  setId(Id) => Id;
}
