import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tmdb_filmes_series/core/api_tmdb.dart';
import 'package:tmdb_filmes_series/errors/tmdb_error.dart';
import 'package:tmdb_filmes_series/model/movies/movie_response_model.dart';
import 'package:tmdb_filmes_series/model/movies/movie_results.dart';
import 'package:tmdb_filmes_series/model/trend/trending_response_model.dart';
import 'package:tmdb_filmes_series/model/trend/trending_results.dart';
import 'package:tmdb_filmes_series/model/tv/tv_response_model.dart';
import 'package:tmdb_filmes_series/model/tv/tv_results.dart';

class PageRepository {
  final Dio _dio = Dio(dDioOptions);

  //------------------------ TRENDING ----------------------------//

  Future<Either<TmdbError, TrendingResponseModel>> fetchAllTrending(
      int page, String type) async{
        if(type == 'movie'){
          type = '/movie/popular?page=$page?&language=pt-BR';
        } else if (type == 'tv'){
          // type = '/tv/popular?page=$page?&language=pt-BR';
          type = '/tv/top_rated?page=$page?&language=pt-BR';
        } else if (type == 'day'){
          type = '/trending/all/day?page=$page?&language=pt-BR';
        } else {
          type = '/trending/all/week?page=$page?&language=pt-BR';  
        }
        print(type); 
      try{
        final response = await _dio.get('$type');      
        final model = TrendingResponseModel.fromMap(response.data);
        return Right(model);
      } on DioError catch (error) {
        if(error.response != null){
          return Left(
            TmdbRepositoryError(error.response.data['status_message']));
        } else {
          return Left(TmdbRepositoryError(dServerError));
        }
      } on Exception catch (error) {
        return Left(TmdbRepositoryError(error.toString()));
      }
      
    }

    Future<Either<TmdbError, TrendingResult>> fetchTrendById(int id, String type) async{    
      try {
        final response = await _dio.get('/$type/$id?&language=pt-BR');
        final model = TrendingResult.fromMap(response.data);
        return Right(model);
      } on DioError catch (error) {
        if(error.response != null) {
          return Left(TmdbRepositoryError(error.response.data['status_message']));
        } else {
          return Left(TmdbRepositoryError(dServerError));
        }
      } on Exception catch (error) {
        return Left(TmdbRepositoryError(error.toString()));
      }
  } 

  //-------------------------------- MOVIE -----------------------------------//

    Future<Either<TmdbError, MovieResponseModel>> fetchAllMovie(
    int page) async {
      try{
        final response = await _dio.get('/movie/popular?page=$page?&language=pt-BR');
        final model = MovieResponseModel.fromMap(response.data);
        return Right(model);
      } on DioError catch (error) {
        if(error.response != null){
          return Left(
            TmdbRepositoryError(error.response.data['status_message'])
          );        
        } else {
          return Left(TmdbRepositoryError(dServerError));
        }
      } on Exception catch (error){
        return Left(TmdbRepositoryError(error.toString()));
      }
  }

  Future<Either<TmdbError, MovieResult>> fetchMovieById(int id) async{
      try {
        final response = await _dio.get('/movie/$id?&language=pt-BR');
        final model = MovieResult.fromMap(response.data);        
        return Right(model);
      } on DioError catch (error) {
        if(error.response != null) {
          return Left(TmdbRepositoryError(error.response.data['status_message']));
        } else {
          return Left(TmdbRepositoryError(dServerError));
        }
      } on Exception catch (error) {
        return Left(TmdbRepositoryError(error.toString()));
      }
  } 

  //---------------------------------------- TV -----------------------------------//  

  Future<Either<TmdbError, TvResponseModel>> fetchAllTv(
    int page) async {
      try{
        // final response = await _dio.get('/tv/popular?page=$page?&language=pt-BR'); 
        final response = await _dio.get('/tv/top_rated?page=$page?&language=pt-BR'); 
         
        final model = TvResponseModel.fromMap(response.data);
        return Right(model);
      } on DioError catch (error) {
        if(error.response != null){
          return Left(
            TmdbRepositoryError(error.response.data['status_message'])
          );
        } else {
          return Left(TmdbRepositoryError(dServerError));
        }
      } on Exception catch (error){
        return Left(TmdbRepositoryError(error.toString()));
      }
  } 

  Future<Either<TmdbError, TvResult>> fetchTvById(int id) async {
    try{
      final response = await _dio.get('/tv/$id?&language=pt-BR');
      final model = TvResult.fromMap(response.data);
      return Right(model);      
    } on DioError catch (error){
      if(error.response != null) {
        return Left(TmdbRepositoryError(error.response.data['status_message']));
      } else {
        return Left(TmdbRepositoryError(dServerError));
      }
    } on Exception catch (error) {
      return Left(TmdbRepositoryError(error.toString()));
    }
  }  
}