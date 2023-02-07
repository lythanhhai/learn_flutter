import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myfirst_flutter_project/models/Quote.dart';

void main() => runApp(MaterialApp(home: QuoteList()));

class QuoteList extends StatefulWidget {
  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(1, "1", "lythanhhai"),
    Quote(2, "2", "huynhphuquy")
  ];
  Widget QuoteTemplate(quote) {
    return QuoteCard(quote: quote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Quote List"),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Column(
            children: quotes.map((quote) => QuoteTemplate(quote)).toList()));
  }
}

class QuoteCard extends StatelessWidget {
  QuoteCard({super.key, required this.quote});
  final Quote quote;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 0),
              child: Text(quote.text,
                  style: TextStyle(fontSize: 18, color: Colors.grey[600])),
            ),
            SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 8),
              child: Text(quote.author,
                  style: TextStyle(fontSize: 14, color: Colors.grey[800])),
            ),
            SizedBox(
              height: 6,
            ),
            TextButton.icon(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.heart, color: Colors.redAccent),
              label: Text("Add to favourite!",
                  style: TextStyle(color: Colors.redAccent)),
            )
          ]),
    );
  }
}
