public with sharing class BingoGame {
    List<BingoBoard> boards;
    List<Integer> inputNumbers;
    List<BingoBoard> winningBoards;
    List<Integer> winningBoardNumbers;
    List<Integer> winningNumbers;
    private Integer numberOfBoards;
    public BingoGame(List<BingoBoard> boards, List<Integer> inputNumbers) {
        this.boards = boards;
        this.inputNumbers = inputNumbers;
        this.winningNumbers = new List<Integer>();
        this.winningBoardNumbers = new List<Integer>();
        this.winningBoards = new List<BingoBoard>();
        this.numberOfBoards = boards.size();
    }
    
    // marks boards through input
    public void startGame() {
        for (Integer inputNumber : inputNumbers) {
            for (Integer boardNr = 0; boardNr < numberOfBoards; boardNr++) {
                if (winningBoardNumbers.contains(boardNr)) {
                    continue;
                }
                BingoBoard board = boards[boardNr];
                board.markBoard(inputNumber);
                if (board.hasMarkedRow() || board.hasMarkedColumn()) {
                    winningBoardNumbers.add(boardNr);
                    winningBoards.add(board);
                    winningNumbers.add(inputNumber);
                }
            }
            if (winningBoardNumbers.size() == boards.size()) {
                break;
            }
        }
    }

    public Integer calculateOutcomeLastWinningBoard() {
        Integer outcome = 0;
        BingoBoard winningBoard = winningBoards.get(winningBoards.size()-1);
        Integer winningNumber = winningNumbers.get(winningNumbers.size()-1);
        for(Integer element : winningBoard.getUnmarkedElements()) {
            outcome += element;
        }
        return outcome * winningNumber;
    }

    // get sum of unmarked elements of winning board
    public Integer calculateOutcomeFirstWinningBoard() {
        Integer outcome = 0;
        BingoBoard winningBoard = winningBoards.get(0);
        Integer winningNumber = winningNumbers.get(0);

        for(Integer element : winningBoard.getUnmarkedElements()) {
            outcome += element;
        }
        return outcome * winningNumber;
    }
}
