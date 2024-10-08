extension StringX on String {
  String fixPmAm() {
    return this.replaceAll('PM', 'pm').replaceAll('AM', 'am');
  }
}
