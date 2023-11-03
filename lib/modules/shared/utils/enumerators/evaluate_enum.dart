enum Evaluates {
  getResults('''
node => {
  let keywords = [];
  for(let i = 0; i<10; i++){
      keywords.push(node.children[i].children[1].innerText);
  }

  return keywords;
}'''),
  getRapidTagsResult('''
node => {
  let keywords = [];
  const elements = node.children;

  for(let i = 0; i<elements.length; i ++){
    keywords.push(elements[i].textContent);
  }

  return keywords;
}''');

  final String value;

  const Evaluates(this.value);
}
