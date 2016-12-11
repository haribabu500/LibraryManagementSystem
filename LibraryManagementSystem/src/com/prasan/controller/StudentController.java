package com.prasan.controller;


import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.prasan.data.LibraryManagementServiceManager;
import com.prasan.model.Lend;
import com.prasan.model.User;
@SessionAttributes(value={"loggedInUser","username","user"})
@Controller
public class StudentController {

	@RequestMapping("studentDashboard")
	public ModelAndView studentDashboard(WebRequest request,SessionStatus status){
		ModelAndView mav=new ModelAndView("studentDashboard");
		User user=(User) request.getAttribute("user", WebRequest.SCOPE_SESSION);
		if(user==null){
			ModelAndView mav2=new ModelAndView("login");
			mav2.addObject("user",new User());
			return mav2;
		}
		mav.addObject("user",user);
		mav.addObject("studentId", user.getUsername().substring(7));
		String hql="select count(l.id) as total from Lend l where l.student.id="+user.getUsername().substring(7);
		List list=LibraryManagementServiceManager.select(hql, Lend.class);
		long totalBooks=(long) list.get(0);
		mav.addObject("totalBooks", totalBooks);
		
		hql="select count(l.id) as total from Lend l where l.student.id="+user.getUsername().substring(7)+" and l.status='lend'";
		list=LibraryManagementServiceManager.select(hql, Lend.class);
		long remainingBooks=(long) list.get(0);
		mav.addObject("remainingBooks", remainingBooks);
		return mav;
	}
	@RequestMapping("studentLends")
	public ModelAndView studentLends(WebRequest request,SessionStatus status){
		ModelAndView mav=new ModelAndView("studentLends");
		User user=(User) request.getAttribute("user", WebRequest.SCOPE_SESSION);
		if(user==null){
			ModelAndView mav2=new ModelAndView("login");
			mav2.addObject("user",new User());
			return mav2;
		}
		mav.addObject("user",user);
		String username=user.getUsername();
		String studentid=username.substring(7);//student=7
		List lends= LibraryManagementServiceManager.select("select l from Lend l where l.student.id="+studentid+" and l.status='lend'", Lend.class);
		
		for (Object object : lends) {
			Lend lend=(Lend) object;
			Calendar calendar=Calendar.getInstance();
			calendar.setTime(lend.getLendDate());
			calendar.add(Calendar.DATE, lend.getDays());
			lend.setReturnDate(calendar.getTime());
//			System.out.println(lend.getStatus());
		}
		mav.addObject("lends", lends);
		
		return mav;
	}
	@RequestMapping("studentAllLends")
	public ModelAndView studentAllLends(WebRequest request,SessionStatus status){
		ModelAndView mav=new ModelAndView("studentAllLends");
		User user=(User) request.getAttribute("user", WebRequest.SCOPE_SESSION);
		if(user==null){
			ModelAndView mav2=new ModelAndView("login");
			mav2.addObject("user",new User());
			return mav2;
		}
		mav.addObject("user",user);
		String username=user.getUsername();
		String studentid=username.substring(7);//student=7
		List lends= LibraryManagementServiceManager.select("select l from Lend l where l.student.id="+studentid, Lend.class);
		mav.addObject("lends", lends);
		for (Object object : lends) {
			Lend lend=(Lend) object;
			System.out.println(lend.getStatus());
		}
		
		return mav;
	}
	@RequestMapping("renewBook")
	public ModelAndView renewBook(WebRequest request,SessionStatus status,@RequestParam("id")String lend_id){
		ModelAndView mav=new ModelAndView("studentLends");
		User user=(User) request.getAttribute("user", WebRequest.SCOPE_SESSION);
		if(user==null){
			ModelAndView mav2=new ModelAndView("login");
			mav2.addObject("user",new User());
			return mav2;
		}
		mav.addObject("user",user);
		String username=user.getUsername();
		String studentid=username.substring(7);//student=7
		
		//--------------------------------------------------------------------------------------------------
		// added days to lend
		Lend studentLend=(Lend) LibraryManagementServiceManager.find(Integer.parseInt(lend_id), Lend.class);
		studentLend.setDays(28);
		LibraryManagementServiceManager.update(studentLend);
		mav.addObject("book_renewed", "true");
		//--------------------------------------------------------------------------------------------------
		List lends= LibraryManagementServiceManager.select("select l from Lend l where l.student.id="+studentid+" and l.status='lend'", Lend.class);
		
		for (Object object : lends) {
			Lend lend=(Lend) object;
			Calendar calendar=Calendar.getInstance();
			calendar.setTime(lend.getLendDate());
			calendar.add(Calendar.DATE, lend.getDays());
			lend.setReturnDate(calendar.getTime());
//			System.out.println(lend.getStatus());
		}
		mav.addObject("lends", lends);
		
		return mav;
	}
	

}
