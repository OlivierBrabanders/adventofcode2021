public with sharing class BingoBoard {
    private List<BingoBoardRow> rows;
    private Integer colLength;
    private Integer boardNr;
    public BingoBoard(List<BingoBoardRow> rows, Integer boardNr) {
        this.rows = rows;
        this.colLength = rows[0].getLength();
        this.boardNr = boardNr;
    }

    public void markBoard(Integer input) {
        for (BingoBoardRow row : rows) {
            row.mark(input);
        }
    }

    public Boolean hasMarkedRow() {
        for (BingoBoardRow row : rows) {
            if (row.isMarked()) {
                return true;
            }
        }
        return false;
    }

    public Boolean hasMarkedColumn() {
        for (Integer i = 0; i < 5; i++) {
            Boolean columnIsMarked = true;
            for (Integer j = 0; columnIsMarked && j < 5; j++) {
                if (!rows[j].getElement(i).isMarked()) {
                    columnIsMarked = false;
                }
            }
            if (columnIsMarked) {
                return true;
            }
        }
        return false;
        // for (Integer colNr = 0; colNr < colLength; colNr++) {
        //     for (BingoBoardRow row : rows) {
        //         if (!row.elements[colNr].isMarked()) {
        //             return false;
        //         }
        //     }
        // }
        // return true;
    }

    public List<Integer> getUnmarkedElements() {
        List<Integer> unmarkedElements = new List<Integer>();
        for (BingoBoardRow row : rows) {
            unmarkedElements.addAll(row.getUnmarkedElements());
        }
        return unmarkedElements;
    }
    public List<Integer> getMarkedElements() {
        List<Integer> markedElements = new List<Integer>();
        for (BingoBoardRow row : rows) {
            markedElements.addAll(row.getMarkedElements());
        }
        return markedElements;
    }
}
