import 'dart:io';

/// This function generates the output txt file with all the solicitations information
void generateOutput(var items, String? openingDate) async {
  // create a txt file with all the links of the filtered solicitations
  var file = File('output.txt');

  if (items.length > 0) {
    await file.writeAsString(
      "Chamados abertos no dia $openingDate:\n\n",
    );

    for (int i = 0; i < items.length; i++) {
      await file.writeAsString(
        """--------------------------------------------------------------------------------------------------------------------------------------------\n
Título: ${items[i]["title"]}\r
Categoria: ${items[i]["category"]}\r
Autor: ${items[i]["author"]}\r
Descrição: ${items[i]["description"]}\r
Status: ${items[i]["status"]}\r
Link: ${items[i]["link"]}\r--------------------------------------------------------------------------------------------------------------------------------------------\n\n
    """,
        mode: FileMode.append,
      );
    }
  } else {
    await file.writeAsString("Nenhum chamado foi aberto no dia $openingDate!");
  }
}
