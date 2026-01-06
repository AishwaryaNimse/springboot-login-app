package com.ResturantManagement.RepoImpl;

import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ResturantManagement.Repo.LoginRegiRepo;
import com.ResturantManagement.entity.LoginRegi;
@Service
public class LoginRegiRepoImpl {
	
    @Autowired
    private LoginRegiRepo repoImpl;

    public void saveRegister(LoginRegi loginRegi) {
        repoImpl.save(loginRegi);
    }
    
    public Optional<LoginRegi> getLoginByEmailAndPassword(String email, String password) {
        return repoImpl.findByEmailAndPassword(email, password);
    }

    public Optional<LoginRegi> getLogin(String email) {
        return repoImpl.findByEmail(email);
    }
}
