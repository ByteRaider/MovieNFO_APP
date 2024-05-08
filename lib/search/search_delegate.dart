import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Buscar...';
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      const Text('Build actions'),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const Text('Build leading');
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('Build results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('Build suggestions: $query');
  }
}
