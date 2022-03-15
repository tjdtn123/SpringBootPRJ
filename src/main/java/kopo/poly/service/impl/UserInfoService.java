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
    public void InsertUserInfo(UserInfoDTO pDTO) throws Exception {
        log.info(this.getClass().getName() + ".InsertUserInfo start!");

       userinfoMapper.InsertUserInfo(pDTO);

    }
}

