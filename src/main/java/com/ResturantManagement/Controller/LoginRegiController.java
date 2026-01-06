package com.ResturantManagement.Controller;

import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.ResturantManagement.RepoImpl.LoginRegiRepoImpl;
import com.ResturantManagement.entity.LoginRegi;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginRegiController {
	
	@Autowired
	LoginRegiRepoImpl repoImpl;

	public LoginRegiController(LoginRegiRepoImpl repoImpl) {
		this.repoImpl = repoImpl;
	}
	
	@GetMapping("/login")
	public String getLoginPage() {
		
		return "login.jsp";
	}
	@GetMapping("/registration")
	public String getRegisterPage() {
		
		return "registration.jsp";
	}
	
	@PostMapping("/signUp")
    public String signUp(LoginRegi loginRegi) {
        if (loginRegi.getStatus() == null || loginRegi.getStatus().isEmpty()) {
            loginRegi.setStatus("USER");
        }
        repoImpl.saveRegister(loginRegi);
        return "redirect:/login";
    }

    @PostMapping("/loginSave")
    public String login(LoginRegi loginRegi, Model model, HttpSession session) {
        Optional<LoginRegi> userOptional = repoImpl.getLoginByEmailAndPassword(
                loginRegi.getEmail(), loginRegi.getPassword());

        if (userOptional.isPresent()) {
            LoginRegi user = userOptional.get();
            session.setAttribute("userName", user.getUsername());
            session.setAttribute("role", user.getStatus());

            if ("ADMIN".equalsIgnoreCase(user.getStatus())) {
                return "redirect:/adminHome";
            } else if ("USER".equalsIgnoreCase(user.getStatus())) {
                return "redirect:/userHome";
            } else {
                model.addAttribute("error", "Unknown role!");
                return "login.jsp";
            }
        } else {
            model.addAttribute("error", "Invalid email or password");
            return "login.jsp";
        }
    }
	 @GetMapping("/logout")
	    public String logout(HttpSession session) {
	        session.invalidate();  
	        return "redirect:/login";  
	    }
}