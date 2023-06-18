///since each use case is made for 1 action and every usecase has an input and output,
///we create a wrapper(parent) class with one function (call) for the sake of better readability
///and unique approach of using usecases

abstract class UsecaseCore<T, P> {
  Future<T> call({P? param});
}
