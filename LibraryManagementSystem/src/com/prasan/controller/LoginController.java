package com.prasan.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.prasan.data.LibraryManagementServiceManager;
import com.prasan.model.User;

@SessionAttributes(value = { "loggedInUser", "username", "user" })
@Controller
public class LoginController {
	@RequestMapping("login")
	public ModelAndView adminHomeContent() {
		ModelAndView mav = new ModelAndView("login");
		mav.addObject("user", new User());
		return mav;
	}

	@RequestMapping("/loginAction")
	public ModelAndView loginAction(@ModelAttribute("user") User user) {
		List users = LibraryManagementServiceManager.select(
				"select u from User u where u.username='" + user.getUsername()
						+ "' and u.password='" + user.getPassword() + "'",
				User.class);
		if (users.size() >= 1) {
			User loggedInUser = (User) users.get(0);
			if (loggedInUser.getRole().equals("admin")) {
				ModelAndView mav = new ModelAndView(
						"redirect:admin/adminHome.htm");
				mav.addObject("username", loggedInUser.getUsername());
				mav.addObject("loggedInUser", loggedInUser);
				return mav;
			} else {
				// palce to return students profile..
				ModelAndView mav = new ModelAndView(
						"redirect:studentDashboard.htm");
				mav.addObject("username", loggedInUser.getUsername());
				mav.addObject("user", loggedInUser);
				return mav;
			}

		} else {
			ModelAndView mav = new ModelAndView("login");
			mav.addObject("invalid", "invalid");
			return mav;
		}

	}

	@RequestMapping("logout")
	public ModelAndView logout(WebRequest request, SessionStatus status) {
		status.setComplete();
		request.removeAttribute("username", WebRequest.SCOPE_SESSION);
		request.removeAttribute("loggedInUser", WebRequest.SCOPE_SESSION);
		ModelAndView mav = new ModelAndView("redirect:login.htm");
		return mav;
	}

	@RequestMapping("changePassword")
	public ModelAndView changePassword(@RequestParam("type") String type) {
		ModelAndView mav = new ModelAndView("changePassword");
		if (type.equals("admin")) {
			mav.addObject("type", "admin/");
		}
		mav.addObject("user", new User());
		return mav;
	}

	@RequestMapping("changePasswordAction")
	public ModelAndView changePasswordAction(WebRequest request,
			SessionStatus status, @ModelAttribute("user") User user) {
		ModelAndView mav = new ModelAndView("changePasswordAction");
		String username = (String) request.getAttribute("username",
				WebRequest.SCOPE_SESSION);
		User user2 = (User) LibraryManagementServiceManager.select(
				"select u from User u where u.username='" + username + "'",
				User.class).get(0);
		System.out.println(user2.getUsername());
		String message = "";
		if (user.getPassword().equals(user.getRePassword())) {
			if (user.getOldPassword().equals(user2.getPassword())) {
				user2.setPassword(user.getPassword());
				LibraryManagementServiceManager.update(user2);
				message = "Password Changed";
			} else {
				message = "Your password is incorrect";
			}
		}
		else{
			message="Your password does not match";
		}

		// message="To go here..."+username;
		mav.addObject("message", message);
		return mav;
	}
}
