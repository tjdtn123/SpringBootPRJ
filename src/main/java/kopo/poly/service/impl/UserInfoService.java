package kopo.poly.service.impl;

import kopo.poly.dto.UserInfoDTO;
import kopo.poly.persistance.mapper.IUserInfoMapper;
import kopo.poly.service.IUserInfoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service("UserInfoService")
public class UserInfoService implements IUserInfoService {

    private final IUserInfoMapper userinfoMapper;

    @Autowired
    public UserInfoService(IUserInfoMapper userinfoMapper) {
        this.userinfoMapper = userinfoMapper;
    }




    @Transactional
    @Override
    public void InsertUserInfo(UserInfoDTO uDTO) throws Exception {

        log.info(this.getClass().getName() + ".InsertUserInfo start!");

       userinfoMapper.InsertUserInfo(uDTO);

    }
    @Transactional
    @Override
    public void ChangePwd(UserInfoDTO uDTO) throws Exception {

        log.info(this.getClass().getName() + ".InsertUserInfo start!");

        userinfoMapper.ChangePwd(uDTO);

    }
    @Override
    public int idCheck(String id) {
        int cnt = userinfoMapper.idCheck(id);
        return cnt;
    }

    @Override
    public UserInfoDTO Login(UserInfoDTO uDTO) {

        return userinfoMapper.Login(uDTO);
    }
}

