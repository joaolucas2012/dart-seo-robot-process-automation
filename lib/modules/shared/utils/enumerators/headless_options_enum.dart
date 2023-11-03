enum HeadlessOptions {
  one(key: "1", value: false),
  two(key: "2", value: true),
  empty(key: "", value: true);

  final String key;
  final bool value;

  const HeadlessOptions({required this.key, required this.value});
}
