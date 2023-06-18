///when we fetch data we might have 2 states, success and fail, we create an abstract data class
///and always wrap our respond inside `DataState` class in repository, we always return `DataState` class from repository
///if the respond was OK we use `DataSuccess` type and if not we use `DataError` type which both are type of `DataState`
///and inside our presentation layer(mostly bloc) we check if our data state is type of success or error

abstract class DataState<T> {
  final T? data;
  final String? error;

  const DataState(this.data, this.error);
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T? data) : super(data, null);
}

class DataError<T> extends DataState<T> {
  DataError(String error) :super (null, error);
}
