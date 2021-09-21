import 'package:dio/dio.dart';


const dUrlBase = 'https://api.themoviedb.org/3';
const dTokenApi = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1YzE2MzE5YjA3ODdiNTI0ZmIwNzg1N2ZiZDBk"
    "MTM5NyIsInN1YiI6IjYxMjY5NGNmM2MzYWIwMDA0Mzk3YzZiMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ"
    "2ZXJzaW9uIjoxfQ.u72FM_uRnojVxg_8ScUm0oiqZTlhKuLWjgrrDLj-57g";

const dServerError = 'Failed to connect to the server. Try again later.';
final dDioOptions = BaseOptions(
  baseUrl: dUrlBase,
  connectTimeout: 5000,
  receiveTimeout: 3000,
  sendTimeout: 3000,
  contentType: 'application/json;charset=utf-8',
  headers: {'Authorization': 'Bearer $dTokenApi'}
);