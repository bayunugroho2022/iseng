import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/usecases/tv/get_popular_tv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetPopularTv usecase;
  late MockTvRepository mockTVRepository;

  setUp(() {
    mockTVRepository = MockTvRepository();
    usecase = GetPopularTv(mockTVRepository);
  });

  final tTv = <Tv>[];

  group('GetPopularTv Tests', () {
    group('execute', () {
      test(
          'should get list of TV from the repository when execute function is called',
          () async {
        // arrange
        when(mockTVRepository.getPopularTv())
            .thenAnswer((_) async => Right(tTv));
        // act
        final result = await usecase.execute();
        // assert
        expect(result, Right(tTv));
      });
    });
  });
}
