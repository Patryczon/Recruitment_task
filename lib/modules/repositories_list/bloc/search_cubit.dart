import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchCubit extends Cubit<String> {
  SearchCubit() : super('');

  void search(String query) => emit(query);
}
