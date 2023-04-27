enum Xpaths {
  inputKeywordElTools(
      "/html/body/div[2]/main/div[1]/div/div/div/div/div/div/div[3]/div/form/div/div[1]/input"),
  searchButtonElTools(
      "/html/body/div[2]/main/div[1]/div/div/div/div/div/div/div[3]/div/form/div/div[3]/button"),
  resultingKeywordsDivElTools(
      "/html/body/div[2]/main/div/div/div/div/div[2]/div/div[4]/div[1]/div/div/table/tbody"),
  inputKeywordElRapid("/html/body/form/div/div[1]/label/input"),
  searchButtonElRapid("/html/body/form/div/div[1]/label/button"),
  resultingKeywordsDivElRapid("/html/body/form/div/div[2]/div/div[1]");

  final String value;

  const Xpaths(this.value);
}
