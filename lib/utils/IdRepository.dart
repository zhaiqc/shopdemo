import 'dart:html';

class IdRepository {
  final Storage _localStorage = window.localStorage;

  Future save(String id) async {
    _localStorage['selected_id'] = id;
  }

  Future<String> getId() async => _localStorage['selected_id'];

  Future invalidate() async {
    _localStorage.remove('selected_id');
  }
}