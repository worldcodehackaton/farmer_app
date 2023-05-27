// ignore_for_file: void_checks

typedef EmptyResult = Result<void>;

class Result<T> {
  Result(
    this._value,
    this._error,
    this.succeed,
  );

  Result.failed(this._error)
      : succeed = false,
        _value = null;

  Result.succeed(this._value)
      : succeed = true,
        _error = null;

  static EmptyResult empty() => Result.succeed(() {});

  final T? _value;
  final bool succeed;
  final Object? _error;

  T? get value => _value;

  Object? get error => _error;
}
