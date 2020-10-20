Future<void> delay([int milliseconds = 750]) async {
  await Future<void>.delayed(Duration(milliseconds: milliseconds));
}
