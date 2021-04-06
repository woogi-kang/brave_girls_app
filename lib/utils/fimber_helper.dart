import 'package:fimber/fimber.dart';

class AssertFormattedTree extends CustomFormatTree {
  static const String myFormat =  "${CustomFormatTree.levelToken} ${CustomFormatTree.tagToken}: ${CustomFormatTree.messageToken}";

  AssertFormattedTree(
      {String logFormat = myFormat,})
      : super(logFormat: logFormat);

  factory AssertFormattedTree.elapsed(
      {String logFormat = CustomFormatTree.defaultFormat}) {
    return AssertFormattedTree(logFormat: logFormat);
  }

  List<String> logLineHistory = [];

  @override
  void printLine(String line, {String? level}) {
    logLineHistory.add(line);
    super.printLine(line, level: level);
  }
}