package kopo.poly.Criteria;

public class Criteria {

    // 특정 페이지 조회를 위한 클래스
    private int pageNum; // 현재 페이지 번호
    private int amount; // 페이지당 보여줄 게시글의 개수
    private int skip; /* 스킵 할 게시물 수( (pageNum-1) * amount ) */
    public Criteria() {
        this(1,10);
        this.skip = 0;
    }

    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
        this.skip = (pageNum-1)*amount;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.skip = (pageNum-1)*this.amount;
        this.pageNum = pageNum;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.skip = (this.pageNum-1)*amount;
        this.amount = amount;
    }

    public int getSkip() {
        return skip;
    }

    public void setSkip(int skip) {
        this.skip = skip;
    }
    @Override
    public String toString() {
        return "Criteria {pageNum= " + pageNum + ", amount= " + amount + "]";
    }
}

