import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchEnableCubit extends Cubit<bool> {
  SearchEnableCubit() : super(false);

  void enableSearch(String query) => emit(
        query.isNotEmpty,
      );
}
