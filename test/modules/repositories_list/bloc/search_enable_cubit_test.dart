import 'package:flutter_test/flutter_test.dart';
import 'package:sofomo_task/modules/repositories_list/bloc/search_enable_cubit.dart';

void main() {
  group('SearchEnableCubit', () {
    late SearchEnableCubit searchEnableCubit;

    setUp(() {
      searchEnableCubit = SearchEnableCubit();
    });

    tearDown(() {
      searchEnableCubit.close();
    });

    test('initial state is false', () {
      expect(searchEnableCubit.state, false);
    });

    test('emits true when enableSearch is called with non-empty query', () {
      final expectedStates = [true];

      expectLater(searchEnableCubit.stream, emitsInOrder(expectedStates));

      searchEnableCubit.enableSearch('query');
    });

    test('emits none when enableSearch is called with empty query', () {
      final expectedStates = [false];

      expectLater(searchEnableCubit.stream, emitsInOrder(expectedStates));

      searchEnableCubit.enableSearch('');
    });
  });
}