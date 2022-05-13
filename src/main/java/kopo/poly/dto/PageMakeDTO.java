package kopo.poly.dto;

import kopo.poly.Criteria.Criteria;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageMakeDTO {

    private int total; // 게시판 전체 데이터 개수


    private int startPage; // 화면의 시작 번호
    private int endPage;  // 화면의 끝 번호
    private boolean prev; // 페이징 이전 버튼 활성화 여부
    private boolean next; // 페이징 다음 버튼 활성화 여부

    private Criteria cri;
    public PageMakeDTO(Criteria cri, int total) {

        this.cri = cri;
        this.total = total;

        /* 마지막 페이지 */
        this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
        /* 시작 페이지 */
        this.startPage = this.endPage - 9;

        /* 전체 마지막 페이지 */
        int realEnd = (int)(Math.ceil(total * 1.0/cri.getAmount()));

        /* 전체 마지막 페이지(realend)가 화면에 보이는 마지막페이지(endPage)보다 작은 경우, 보이는 페이지(endPage) 값 조정 */
        if(realEnd < this.endPage) {
            this.endPage = realEnd;
        }

        /* 시작 페이지(startPage)값이 1보다 큰 경우 true */
        this.prev = this.startPage > 1;

        /* 마지막 페이지(endPage)값이 1보다 큰 경우 true */
        this.next = this.endPage < realEnd;


    }


    @Override
    public String toString() {
        return "PagingDTO [startPage= " + startPage + ", endPage= " + endPage + ", prev= " + prev + ", next= "
        +next + ", total= " + total + ", cri=" +cri + "]";
    }

}



