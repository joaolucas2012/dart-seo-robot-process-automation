/// Enumerates the possible types of print in the project flow.
enum PrintTypes {
  success("success"),
  error("error"),
  colored("colored"),
  info("info");

  final String value;

  const PrintTypes(this.value);
}
