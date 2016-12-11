package com.prasan.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.prasan.data.LibraryManagementServiceManager;
import com.prasan.model.User;
@SessionAttributes(value={"loggedInUser","username","user"})

@Controller
public class LoginController {
	@RequestMapping("login")
	public ModelAndView adminHomeContent(){
		ModelAndView mav=new ModelAndView("login");
		mav.addObject("user",new User());
		return mav;
	}
	@RequestMapping("/loginAction")
	public ModelAndView loginAction(@ModelAttribute("user")User user){
		List users=LibraryManagementServiceManager.select("select u from User u where u.username='"+user.getUsername()+"' and u.password='"+user.getPassword()+"'", User.class);
		if(users.size()>=1){
			User loggedInUser=(User) users.get(0);
			if(loggedInUser.getRole().equals("admin")){
				ModelAndView mav=new ModelAndView("redirect:admin/adminHome.htm");
				mav.addObject("username", loggedInUser.getUsername());
				mav.addObject("loggedInUser", loggedInUser);
				return mav;
			}
			else{
				// palce to return students profile..
				ModelAndView mav=new ModelAndView("redirect:studentDashboard.htm");
				mav.addObject("username", loggedInUser.getUsername());
				mav.addObject("user", loggedInUser);
				return mav;
			}
			
		}
		else{
			ModelAndView mav=new ModelAndView("login");
			mav.addObject("invalid", "invalid");
			return mav;
		}
		
		
	}
	@RequestMapping("logout")
	public ModelAndView logout(WebRequest request,SessionStatus status){
		status.setComplete();
		request.removeAttribute("username", WebRequest.SCOPE_SESSION);
		request.removeAttribute("loggedInUser", WebRequest.SCOPE_SESSION);
		ModelAndView mav=new ModelAndView("redirect:login.htm");
		return mav;
	}
}
