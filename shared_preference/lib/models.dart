enum Gender{FEMALE, MALE, OTHERS}
enum Language{  C, Dart,BATCH, ASSEMBLY,PYTHON}
class Settings{
  final String username;
  final Gender? gendr;
  final Set<Language> lang;
  final bool employed;

  Settings({required this.username, required this.gendr, required this.lang, required this.employed});
}