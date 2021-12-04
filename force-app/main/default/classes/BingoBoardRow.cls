public with sharing class BingoBoardRow {
    public List<BingoBoardElement> elements;
    public BingoBoardRow(List<BingoBoardElement> elements) {
        this.elements = elements;
    }

    public Integer getLength() {
        return elements.size();
    }

    public void mark(Integer input) {
        for (BingoBoardElement element : elements) {
            if (element.content == input) {
                element.setMarked();
            }
        }
    }

    public Boolean isMarked() {
        for (BingoBoardElement e : elements) {
            if (!e.isMarked()) {
                return false;
            }
        }
        return true;
    }

    public BingoBoardElement getElement(Integer position) {
        return position < elements.size() ? elements.get(position) : null;
    }

    public List<Integer> getUnmarkedElements() {
        List<Integer> unmarkedElements = new List<Integer>();
        for (BingoBoardElement element : elements) {
            if (!element.isMarked()) {
                unmarkedElements.add(element.content);
            }
        }
        return unmarkedElements;
    }

    public List<Integer> getMarkedElements() {
        List<Integer> markedElements = new List<Integer>();
        for (BingoBoardElement element : elements) {
            if (element.isMarked()) {
                markedElements.add(element.content);
            }
        }
        return markedElements;
    }
}
