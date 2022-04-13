package kopo.poly.service;

import kopo.poly.dto.UserInfoDTO;

public interface IUserInfoService {

    void InsertUserInfo(UserInfoDTO uDTO) throws Exception;

    public int idCheck(String id);

    public int Login(UserInfoDTO uDTO )throws Exception;
}
