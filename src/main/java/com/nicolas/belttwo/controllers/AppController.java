package com.nicolas.belttwo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nicolas.belttwo.models.LoginUser;
import com.nicolas.belttwo.models.Tablet;
import com.nicolas.belttwo.models.User;
import com.nicolas.belttwo.services.TabletService;
import com.nicolas.belttwo.services.UserService;
import com.nicolas.belttwo.validators.UserValidator;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class AppController {
	@Autowired
	private UserService service;
	@Autowired
	private TabletService tabletService;
	@Autowired
	private UserValidator validator;

	@RequestMapping("/register")
	public String registerForm(@ModelAttribute("user") User user) {
		return "register";
	}

	@RequestMapping("/login")
	public String loginForm(@ModelAttribute("loginUser") LoginUser loginUser) {
		return "login";
	}

	@RequestMapping("/home")
	public String dashboard(HttpSession session, Model model) {
		model.addAttribute("user", session.getAttribute("user"));
	
		return "dashboard";
	}

	@RequestMapping(value = "/tablet/new")
	public String registerTabletGet(HttpSession session, Model model, Tablet tablet) {
		return "newTable";
	}

	@RequestMapping(value = "/tablet/new", method = RequestMethod.POST)
	public String registerTablet(@Valid @ModelAttribute("tablet") Tablet tablet, BindingResult result,
			HttpSession session, Model model) {
		if (result.hasErrors()) {
			return "newTable";
		} else {
			tabletService.registerTablet(tablet, (User) session.getAttribute("user"));
			return "redirect:/home";
		}
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session,
			Model model) {
		validator.validate(user, result);
		if (service.findByEmail(user.getEmail()) == null) {
			if (result.hasErrors()) {
				return "register";
			} else {
				User u = service.registerUser(user);
				session.setAttribute("user", u);
				return "redirect:/home";
			}
		} else {
			model.addAttribute("errorRegister", "Email has been already taken");
			return "register";
		}

	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginUser(
			@Valid @ModelAttribute("loginUser") LoginUser loginUser,
			BindingResult result,
			HttpSession session,
			Model model) {
		if (result.hasErrors()) {
			return "login";
		}

		if (service.authenticateUser(loginUser)) {
			User user = service.findByEmail(loginUser.getEmail());
			System.out.println(user.getId());
			session.setAttribute("user", user);
			return "redirect:/home";
		} else {

			
			model.addAttribute("error", "Invalid credentials");
			return "login";
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}

}
