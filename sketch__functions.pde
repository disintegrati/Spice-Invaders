/*public int textHeight(String inputString, int specificWidth, int leading) {
  String[] paragraphs = split(inputString, "\n");
  int numEmptyLines = 0;
  int numTextLines = 0;
  for (int i=0; i<paragraphs.length; i++) {
    if (paragraphs[i].length() == 0) {
      numEmptyLines++;
    } else {
      numTextLines++;
      String[] wordsArray = split(paragraphs[i], " ");
      String tempString = "";
      for (int k=0; k < wordsArray.length; k++) {
        if (textWidth(tempString + wordsArray[k]) < specificWidth) {
          tempString += wordsArray[k] + " ";
        } else {
          tempString = wordsArray[k] + " ";
          numTextLines++;
        }
      }
    }
  }
  return (numTextLines + numEmptyLines) * leading;
}*/
