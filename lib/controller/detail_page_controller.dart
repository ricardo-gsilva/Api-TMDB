import 'package:tmdb_filmes_series/errors/tmdb_error.dart';
import 'package:tmdb_filmes_series/model/movies/movie_results.dart';
import 'package:tmdb_filmes_series/model/trend/trending_results.dart';
import 'package:tmdb_filmes_series/model/tv/tv_results.dart';
import 'package:tmdb_filmes_series/repositories/page_repository.dart';
import 'package:dartz/dartz.dart';

class DetailPageController {
  final _repositoryPage = PageRepository();

  TmdbError tmdbError;
  TrendingResult trendingResult;
  MovieResult movieResult;
  TvResult tvResult;  

  bool loading = true;   

  Future<Either<TmdbError, TrendingResult>> fetchTrendById (int id, String type) async {
      tmdbError = null;
      final resultTrend = await _repositoryPage.fetchTrendById(id, type);
      resultTrend.fold(
        (error) => tmdbError = error, 
        (detail) => trendingResult = detail
      );
      return resultTrend;
  }

  Future<Either<TmdbError, MovieResult>> fetchMovieById (int id) async {
      tmdbError = null;
      final resultMovie = await _repositoryPage.fetchMovieById(id);
      resultMovie.fold(
        (error) => tmdbError = error, 
        (detail) => movieResult = detail
      );
      return resultMovie;
  }

  Future<Either<TmdbError, TvResult>> fetchTvById (int id) async {
      tmdbError = null;
      final resultTv = await _repositoryPage.fetchTvById(id);
      resultTv.fold(
        (error) => tmdbError = error, 
        (detail) => tvResult = detail
      );
      return resultTv;
  }


}