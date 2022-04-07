package kopo.poly.dto;

import lombok.Getter;
import lombok.Setter;



    /**
     * lombok은 코딩을 줄이기 위해 @어노테이션을 통한 자동 코드 완성기능임
     * @Getter => getter 함수를 작성하지 않았지만, 자동 생성
     * @Setter => setter 함수를 작성하지 않았지만, 자동 생성
     */
    @Getter
    @Setter
    public class UserInfoDTO {
        private String notice_seq; // 기본키, 순번
        private String user_id; //
        private String user_name; //
        private String password; //
        private String email; //
        private String addr1; //
        private String addr2; //
        private String reg_dt; // 등록일




}
