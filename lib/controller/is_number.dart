bool isNumber(String numb) {
  RegExp numbRex = RegExp(r'^[0-9]+$');
  return numbRex.hasMatch(numb);
}
