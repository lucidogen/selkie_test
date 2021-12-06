typedef Getter<T> = T Function();

class Query<T> {
  final Getter<T> getter;
  final T value;

  Query(this.getter) : value = getter();

  bool stale() => value != getter();
}
