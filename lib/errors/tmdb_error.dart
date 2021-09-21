abstract class TmdbError implements Exception {
  String message; 

  @override
  String toString(){
    return message;
  }
}

class TmdbRepositoryError extends TmdbError{
    TmdbRepositoryError(String message){
      this.message = message;
    }
    
}
