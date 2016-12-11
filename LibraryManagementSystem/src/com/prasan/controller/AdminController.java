package com.prasan.controller;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.prasan.data.LibraryManagementServiceManager;
import com.prasan.model.Book;
import com.prasan.model.Lend;
import com.prasan.model.Student;
import com.prasan.model.User;

@Controller
public class AdminController {
	@InitBinder
	protected void initBinder(WebDataBinder binder){
		SimpleDateFormat dateFormat=new SimpleDateFormat("dd/MM/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}
	
	@RequestMapping("admin/adminHome")
	public ModelAndView adminHomeContent(){
		ModelAndView mav=new ModelAndView("admin/adminHome");
		String hql="select sum(b.quantity) as total from Book b";
		List list=LibraryManagementServiceManager.select(hql, Book.class);
		long totalBooks=(long) list.get(0);
		mav.addObject("totalBooks", totalBooks);
		
		hql="select count(s.id) as total from Student s";
		list=LibraryManagementServiceManager.select(hql, Student.class);
		long totalStudents=(long) list.get(0);
		mav.addObject("totalStudents", totalStudents);
		
		hql="select count(l.id) as total from Lend l where l.status='lend'";
		list=LibraryManagementServiceManager.selectLimit(hql, Lend.class,4);
		long totalLends=(long) list.get(0);
		mav.addObject("totalLends", totalLends);
		
		hql="select b from Book b order by b.id desc";
		List books=LibraryManagementServiceManager.selectLimit(hql, Book.class,4);
		mav.addObject("books", books);
		
		hql="select s from Student s order by s.id desc";
		List students=LibraryManagementServiceManager.selectLimit(hql, Student.class,4);
		mav.addObject("students", students);
		
		
		
		return mav;
	}
	
	@RequestMapping("admin/addBook")
	public ModelAndView addBook(@RequestParam(value="id",required=false) String id){
		Book book;
		String mode;
		if(id!=null){
			book=(Book) LibraryManagementServiceManager.find(Integer.parseInt(id), Book.class);
			mode="Edit";
			
		}
		else{
			book=new Book();
			mode="Add";
		}
		
		ModelAndView mav=new ModelAndView("admin/addBook");
		
		mav.addObject("book",book);
		mav.addObject("mode",mode);
		return mav;
	}
	@RequestMapping("admin/addBookAction")
	public ModelAndView addBook(@ModelAttribute("book") Book book){
		if(book.getId()==0){
			LibraryManagementServiceManager.save(book);
		}
		else {
			LibraryManagementServiceManager.update(book);
		}
		ModelAndView mav=new ModelAndView("admin/addBook");
		Book book2=new Book();
		mav.addObject("book",book2);
		mav.addObject("mode","Add");
		mav.addObject("book_saved", "book_saved");
		return mav;
	}
	@RequestMapping("admin/viewBooks")
	public ModelAndView viewBooks(){
		ModelAndView mav=new ModelAndView("admin/viewBooks");
		List books= LibraryManagementServiceManager.select("select b from Book b", Book.class);
		mav.addObject("books",books);
		return mav;
	}
	
	@RequestMapping("admin/deleteBook")
	public ModelAndView deleteBook(@RequestParam(value="id",required=false) String id){
		LibraryManagementServiceManager.remove(Integer.parseInt(id), Book.class);
		System.out.println("Remove entered");
		ModelAndView mav=new ModelAndView("admin/viewBooks");
		List books= LibraryManagementServiceManager.select("select b from Book b", Book.class);
		mav.addObject("books",books);
		mav.addObject("book_deleted", "book_deleted");
		return mav;
	}
	
	@RequestMapping("admin/addStudent")
	public ModelAndView addStudent(@RequestParam(value="id",required=false) String id){
		ModelAndView mav=new ModelAndView("admin/addStudent");
		Student student;
		String mode;
		if(id!=null){
			student=(Student) LibraryManagementServiceManager.find(Integer.parseInt(id), Student.class);
			mode="Edit";
			mav.addObject("date",new SimpleDateFormat("dd/mm/yyyy").format(student.getDob()));
			
		}
		else{
			student=new Student();
			mode="Add";
		}
		
		
		
		mav.addObject("student",student);
		mav.addObject("mode",mode);
		return mav;
	}
	@RequestMapping("admin/addStudentAction")
	public ModelAndView addStudent(@ModelAttribute("student") Student student){
		if(student.getId()==0){
			LibraryManagementServiceManager.save(student);
			User user_student=new User();
			user_student.setFirstname(student.getFname());
			user_student.setLastname(student.getLname());
			user_student.setUsername("student"+student.getId());
			user_student.setPassword(new SimpleDateFormat("dd/MM/yyyy").format(student.getDob()));
			user_student.setRole("student");
			LibraryManagementServiceManager.save(user_student);
		}
		else {
			LibraryManagementServiceManager.update(student);
		}
		ModelAndView mav=new ModelAndView("admin/addStudent");
		Student student2=new Student();
		mav.addObject("book",student2);
		mav.addObject("student_saved", "student_saved");
		return mav;
	}
	@RequestMapping("admin/viewStudents")
	public ModelAndView viewStudents(){
		ModelAndView mav=new ModelAndView("admin/viewStudents");
		List students= LibraryManagementServiceManager.select("select s from Student s", Student.class);
		mav.addObject("students",students);
		return mav;
	}
	
	@RequestMapping("admin/deleteStudent")
	public ModelAndView deleteStudent(@RequestParam(value="id",required=false) String id){
		List lends=LibraryManagementServiceManager.select("select l from Lend l where l.student.id="+id, Lend.class);
		for (Object object : lends) {
			Lend lend=(Lend) object;
			LibraryManagementServiceManager.remove(lend.getId(), Lend.class);
			
		}
		LibraryManagementServiceManager.remove(Integer.parseInt(id), Student.class);
		System.out.println("Remove entered");
		ModelAndView mav=new ModelAndView("admin/viewStudents");
		List students= LibraryManagementServiceManager.select("select s from Student s", Student.class);
		mav.addObject("students",students);
		mav.addObject("student_deleted", "student_deleted");
		return mav;
	}
	@RequestMapping("admin/lendBook")
	public ModelAndView lendBook(@RequestParam(value="id",required=false) String id){
		ModelAndView mav=new ModelAndView("admin/lendBook");
		Book book=(Book) LibraryManagementServiceManager.find(Integer.parseInt(id), Book.class);
		mav.addObject("book",book);
		Lend lend=new Lend();
		mav.addObject("lend",lend);
		return mav;
	}
	@RequestMapping("admin/getStudentDetails")
	public ModelAndView getStudentDetails(@RequestParam(value="id",required=false) String id){
		ModelAndView mav=new ModelAndView("admin/getStudentDetails");
		Student student=(Student) LibraryManagementServiceManager.find(Integer.parseInt(id), Student.class);
		mav.addObject("student",student);
		return mav;
	}
	
	@RequestMapping("admin/addLendAction")
	public ModelAndView addLendAction(@ModelAttribute("lend") Lend lend){
		lend.setLendDate(new Date());
		lend.setStatus("lend");
		Book lendedBook=(Book)LibraryManagementServiceManager.find(lend.getBook().getId(), Book.class);
		lend.setBook(lendedBook);
		Student student=(Student) LibraryManagementServiceManager.find(lend.getStudent().getId(), Student.class);
		lend.setStudent(student);
		LibraryManagementServiceManager.save(lend);
		Book book=(Book) LibraryManagementServiceManager.find(lend.getBook().getId(), Book.class);
		book.setQuantity(book.getQuantity()-1);
		LibraryManagementServiceManager.update(book);
		ModelAndView mav=new ModelAndView("admin/viewBooks");
		List books= LibraryManagementServiceManager.select("select b from Book b", Book.class);
		mav.addObject("books",books);
		return mav;
	}
	
	@RequestMapping("admin/viewLends")
	public ModelAndView viewLends(){
		ModelAndView mav=new ModelAndView("admin/viewLends");
		List lends=LibraryManagementServiceManager.select("select l from Lend l where l.status='lend'", Lend.class);
		for (Object object : lends) {
			Lend lend=(Lend) object;
//			Date date=lend.getLendDate();
			Calendar calendar=Calendar.getInstance();
			calendar.setTime(lend.getLendDate());
			calendar.add(Calendar.DATE, lend.getDays());
			lend.setReturnDate(calendar.getTime());
			Calendar now=Calendar.getInstance();
			now.setTime(new Date());
//			System.out.println(calendar.getTime());
//			System.out.println(now.getTime());
			
			int diff=(int) ((now.getTime().getTime() - calendar.getTime().getTime())/(1000*60*60*25));
//			System.out.println("==>>"+diff);
//			System.out.println("--->>"+lend.getDays());
			if(diff>0){
				lend.setFine(diff*5);// 5 rupee fine per day
			}
		}
		mav.addObject("lends",lends);
		return mav;
	}
	
	@RequestMapping("admin/returnBook")
	public ModelAndView returnBook(@RequestParam("id")String id){
//		ModelAndView mav=new ModelAndView("admin/returnBook");
		Lend lend=(Lend) LibraryManagementServiceManager.find(Integer.parseInt(id), Lend.class);
		lend.setStatus("returned");
		LibraryManagementServiceManager.update(lend);
		Book book=(Book) LibraryManagementServiceManager.find(lend.getBook().getId(), Book.class);
		book.setQuantity(book.getQuantity()+1);
		LibraryManagementServiceManager.update(book);
		
		return null;
	}
	
	@RequestMapping("admin/lostBook")
	public ModelAndView lostBook(@RequestParam("id")String id){
		Lend lend=(Lend) LibraryManagementServiceManager.find(Integer.parseInt(id), Lend.class);
		lend.setStatus("lost");
		LibraryManagementServiceManager.update(lend);
		return null;
	}
}
