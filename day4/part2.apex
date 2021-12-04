StaticResource srObject = [SELECT Id,Body FROM StaticResource WHERE Name = 'day4'];
String contents = srObject.Body.toString();
BingoParser parser = new BingoParser(contents, 5, 5);
List<Integer> input = parser.getInput();
List<BingoBoard> boards = parser.createBoards();
BingoGame game = new BingoGame(boards, input);
game.startGame();
System.debug(game.calculateOutcomeLastWinningBoard());

