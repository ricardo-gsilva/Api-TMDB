import 'package:dartz/dartz.dart';
import 'package:tmdb_filmes_series/errors/tmdb_error.dart';
import 'package:tmdb_filmes_series/model/movies/movie_response_model.dart';
import 'package:tmdb_filmes_series/model/movies/movie_results.dart';
import 'package:tmdb_filmes_series/model/trend/trending_response_model.dart';
import 'package:tmdb_filmes_series/model/trend/trending_results.dart';
import 'package:tmdb_filmes_series/model/tv/tv_response_model.dart';
import 'package:tmdb_filmes_series/model/tv/tv_results.dart';
import 'package:tmdb_filmes_series/repositories/page_repository.dart';

class PageControl {
  final _repositoryPage = PageRepository();

  TmdbError tmdbError;
  bool loading = true;

  //MOVIE
  MovieResponseModel movieResponseModel;  
  MovieResult movieResult;

  //TV
  TvResponseModel tvResponseModel;  
  TvResult tvResult;

  //TREND
  TrendingResponseModel trendingResponseModel;
  TrendingResult trendingResult;

  //MOVIE
  List<MovieResult> get movie => movieResponseModel?.results ?? <MovieResult>[];
  int get movieCount => movie.length;
  bool get hasMovie => movieCount != 0;
  int get totalPagesMovie => movieResponseModel?.totalPages ?? 1;
  int get currentPagesMovie => movieResponseModel?.page ?? 1;

  //TV
  List<TvResult> get tv => tvResponseModel?.results ?? <TvResult>[];
  int get tvCount => tv.length;
  bool get hasTv => tvCount != 0;
  int get totalPagesTv => tvResponseModel?.totalPages ?? 1;
  int get currentPagesTv => tvResponseModel?.page ?? 1;

  //TREND
  List<TrendingResult> get trending => trendingResponseModel?.results ?? <TrendingResult>[];
  int get trendingCount => trending.length;
  bool get hasTrending => trendingCount != 0;
  int get totalPagesTrend => trendingResponseModel?.totalPages ?? 1;
  int get currentPagesTrend => trendingResponseModel?.page ?? 1;

  
  //MOVIE
  Future<Either<TmdbError, MovieResponseModel>> fetchAllMovie (
    {int page = 1}) async {
      tmdbError = null;
      final result = await _repositoryPage.fetchAllMovie(page);
      result.fold(
        (error) => tmdbError = error, 
        (movie) {
          if(movieResponseModel == null){
            movieResponseModel = movie;
          } else {
            movieResponseModel.page = movie.page;
            movieResponseModel.results.addAll(movie.results);
          }
        }
      );
      return result;      
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

  // fetchTmdb(bool movieid){
  //   movieid = false; 
  // }

  //TV
  Future<Either<TmdbError, TvResponseModel>> fecthAllTv(
    {int page =1}) async {
      tmdbError = null;
      final result = await _repositoryPage.fetchAllTv(page);
      result.fold(
        (error) => tmdbError = error, 
        (tv) {
          if(tvResponseModel == null){
            tvResponseModel = tv;
          } else {
            tvResponseModel.page = tv.page;
            tvResponseModel.results.addAll(tv.results);
          }
        });
      return result;
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

  // fetchTmdb(bool tvid){
  //   tvid = false; 
  // }

  //TREND
  Future<Either<TmdbError, TrendingResponseModel>> fetchAllTrending (
    {int page = 1, String type, String typeTrend}) async {
      tmdbError = null;
      final result = await _repositoryPage.fetchAllTrending(page, type);
      result.fold(
        (error) => tmdbError = error, 
        (trending) {
          if(trendingResponseModel == null){
            trendingResponseModel = trending;
          } else {
            trendingResponseModel.page = trending.page;
            trendingResponseModel.results.addAll(trending.results);
          }
        }
      );
      return result;      
    }
  
    Future<Either<TmdbError, TrendingResult>> fetchTrendById (int id, String type) async {
      tmdbError = null;
      final resultTrend = await _repositoryPage.fetchTrendById(id, type);
      resultTrend.fold(
        (error) => tmdbError = error, 
        (detail) => trendingResult = detail
      );
      return resultTrend;
  }

  fetchTmdb(bool trendid){
    trendid = false;
  }
}

