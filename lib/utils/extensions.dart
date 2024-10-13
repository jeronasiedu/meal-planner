// create a groupBy extension on List
extension GroupExtension<T> on List<T> {
  Map<K, List<T>> groupBy<K>(K Function(T) keyFunction) {
    Map<K, List<T>> map = {};
    for (T element in this) {
      K key = keyFunction(element);
      if (map.containsKey(key)) {
        map[key]!.add(element);
      } else {
        map[key] = [element];
      }
    }
    return map;
  }
}
