public with sharing class BingoParser {
    List<String> contentToParse;
    Integer rowLength;
    Integer colLength;
    public BingoParser(String content, Integer rowLength, Integer colLength) {
        this.contentToParse = content.split('\n');
        this.rowLength = rowLength;
        this.colLength = colLength;
    }
    public List<Integer> getInput() {
        contentToParse.remove(1); // remove the second line as it is always empty
        return parseToNumbers(contentToParse.remove(0).split(',')); // the first line is always the comma-separated input
    }
    public List<BingoBoard> createBoards() {
        List<BingoBoard> boards = new List<BingoBoard>();
        Boolean stop = false;
        Integer boardNr = 0;
        while (!stop) {
            BingoBoard board = createBoard(boardNr);
            boards.add(board);
            // remove next empty line
            if (contentToParse.size() > 1 && String.isBlank(contentToParse[0])) {
                contentToParse.remove(0);
            } 
            stop = contentToParse.isEmpty() || String.isBlank(contentToParse[0]);
            boardNr++;
        }
        return boards;
    }
    private BingoBoard createBoard(Integer boardNr) {
        List<BingoBoardRow> bingoRows = new List<BingoBoardRow>();
        for(Integer rowNr = 0; rowNr < rowLength; rowNr++) {
            List<String> row = contentToParse.remove(0).split(' ');
            List<Integer> elements = parseToNumbers(row);
            List<BingoBoardElement> bingoBoardElements = new List<BingoBoardElement>();
            for (Integer element : elements) {
                bingoBoardElements.add(new BingoBoardElement(element));
            }
            BingoBoardRow bingoRow = new BingoBoardRow(bingoBoardElements);
            bingoRows.add(bingoRow);
        }
        
        return new BingoBoard(bingoRows, boardNr);
    }
    private List<Integer> parseToNumbers(List<String> strings) {
        List<Integer> numbers = new List<Integer>();
        for (String i : strings) {
            if (String.isBlank(i)) {
                continue;
            }
            numbers.add(Integer.valueOf(i));
        }
        return numbers;
    }
}
