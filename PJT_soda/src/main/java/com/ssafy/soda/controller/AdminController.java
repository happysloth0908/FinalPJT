package com.ssafy.soda.controller;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssafy.soda.model.dto.SearchCondition;
import com.ssafy.soda.model.dto.User;
import com.ssafy.soda.model.service.AdminUserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private final AdminUserService adminUserService;
	
	public AdminController(AdminUserService adminUserService) {
		this.adminUserService = adminUserService;
	}

	@GetMapping("/main")
	public String adminMain() {
		return "admin/adminMain";
	}

	// user 모두 조회하기
	@GetMapping("/adminUserBoard")
	public String adminUserBoard(Model model) {
		List<User> list = adminUserService.getUserlist();
//		System.out.println(list);
		model.addAttribute("list", list);
		return "admin/adminUserBoard";
	}
	@GetMapping("/adminUserDetail")
		public String adminUserBoardDetail(@RequestParam("no") int no, Model model) {
		User user = adminUserService.getUser(no);
		model.addAttribute("user", user);
		return "admin/adminUserDetail";
	}
	@GetMapping("/adminUserUpdateForm")
	public String adminUserUpdate(@RequestParam("no") int no, Model model) {
		User user = adminUserService.getUser(no);
		model.addAttribute("user", user);
		System.out.println("adminUserUpdateForm 에서 보내주는 유저: " + user);
		return "admin/adminUserUpdateForm";
	}
	
	// user 정보 수정하기
	@PostMapping("/adminUserUpdate")
	public String adminUserUpdate(User user, RedirectAttributes ra) {
//		model.addAttribute("user", user);
		// 원래 아이디 저장해둬야 함. 
		System.out.println("adminUserUpdated 에서 받은 유저: "+ user);
		adminUserService.updateUser(user);
		System.out.println("서비스도 다녀옴!");
		
		// user 디테일로 가려면 id 저장해둬야 함. 
		ra.addAttribute("no", user.getUserNo());
		return "redirect:/admin/adminUserDetail";
	}
	

	// 로그인 화면으로 넘어가기
	@GetMapping("/adminLogin")
	public String adminLogin(Model model, Authentication authentication) {
		// 이미 로그인된 사용자라면 메인 페이지로 
		if (authentication != null && authentication.isAuthenticated()
				&& "admin".equals(authentication.getName())) {
		        return "redirect:/admin/main";
		    }
		
		System.out.println("되는건가?");
		return "admin/adminLogin";
	}

	//spring security에서 처리
	
//	// 로그인하기
//	@PostMapping("/login")
//	public String adminLogin(User user) {
//		System.out.println("로그인 이름: " + user.getUserId());
//		System.out.println("로그인 비번: " + user.getPassword());
//		
//		if (("admin").equals(user.getUserId()) && ("admin").equals(user.getPassword())) {
//			return "admin/adminMain";
//		} else {
//			System.out.println("왜 안됨?");
//			return "admin/adminLogin";
//		}
//	}

	
	@GetMapping("/logout")
	public String adminLogout() {
		return "admin/adminLogin";
	}

	// 검색해서 리스트 나오게 하기 
		@GetMapping("/searchAdminUserBoard")
		public String searchAdminUserBoard(SearchCondition searchCondition, Model model) {
			System.out.println("파라미터 잘 받아왔나: " + searchCondition);
			List<User> list = adminUserService.getSearchedUserlist(searchCondition);
			model.addAttribute("list", list);
			System.out.println("검색된 리스트!:" + list);
			return "admin/adminUserBoard";
		}

	

	// user 삭제하기
	@GetMapping("/adminUserDelete")
	public String adminUserDelete(@RequestParam("no") int no) {
		adminUserService.deleteUser(no);
		System.out.println("삭제 메서드 실행");
		return "redirect:/admin/adminUserBoard";
	}
		
	

	// user 중 신고된 유저만 조회하기

}
