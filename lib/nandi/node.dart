class Node {
  final List<Node> dependants = [];
  bool dirty = false;

  bool get isView => false;

  void markDirty() {
    // Mark all dependants as being dirty
    for (final dependant in dependants) {
      dependant.markDirty();
    }
    dirty = true;
  }
}
