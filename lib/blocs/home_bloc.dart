import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final BehaviorSubject<String> _serachController = BehaviorSubject<String>();

  Stream<String> get outSearch => _serachController.stream;

  void setSearch(String search) {
    _serachController.add(search);
  }

  void dispose() {
    _serachController.close();
  }
}
