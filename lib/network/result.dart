class Result<T> {
  final bool isSuccess;
  final T data;
  final T error;

  Result({
    this.data,
    this.isSuccess,
    this.error,
  });
}
