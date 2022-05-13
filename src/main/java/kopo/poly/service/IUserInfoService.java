package kopo.poly.service;

import kopo.poly.dto.UserInfoDTO;

public interface IUserInfoService {

    void InsertUserInfo(UserInfoDTO uDTO) throws Exception;

    void ChangePwd(UserInfoDTO uDTO) throws Exception;

    public int idCheck(String id);

    public UserInfoDTO Login(UserInfoDTO uDTO )throws Exception;
}
