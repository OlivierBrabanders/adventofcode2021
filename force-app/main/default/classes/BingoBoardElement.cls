public with sharing class BingoBoardElement {
    public Integer content {
        public get;
        private set;
    }
    private Boolean marked;
    public BingoBoardElement(Integer element) {
        this.content = element;
        this.marked = false;
    }

    public Boolean isMarked() {
        return marked;
    }

    public void setMarked() {
        marked = true;
    }


}
