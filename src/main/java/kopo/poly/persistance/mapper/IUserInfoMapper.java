package kopo.poly.persistance.mapper;

import kopo.poly.dto.UserInfoDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IUserInfoMapper {

	//게시판 리스트
	//List<NoticeDTO> getNoticeList() throws Exception;
	
	//회원 가입
	void InsertUserInfo(UserInfoDTO pDTO) throws Exception;
		/*
	//게시판 상세보기
	NoticeDTO getNoticeInfo(NoticeDTO pDTO) throws Exception;

	//게시판 조회수 업데이트
	void updateNoticeReadCnt(NoticeDTO pDTO) throws Exception;

	//게시판 글 수정
	void updateNoticeInfo(NoticeDTO pDTO) throws Exception;

	//게시판 글 삭제
	void deleteNoticeInfo(NoticeDTO pDTO) throws Exception;

	 */
	
}
