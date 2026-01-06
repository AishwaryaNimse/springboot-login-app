package com.ResturantManagement.Repo;

import org.springframework.data.jpa.repository.JpaRepository;
import com.ResturantManagement.entity.LoginRegi;
import java.util.Optional;

public interface LoginRegiRepo extends JpaRepository<LoginRegi, Long>{

    Optional<LoginRegi> findByEmailAndPassword(String email, String password);
	
	Optional<LoginRegi> findByEmail(String email);	
}
