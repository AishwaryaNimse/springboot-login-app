package com.ResturantManagement.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ResturantManagement.Repo.DishRepo;
import com.ResturantManagement.entity.CartItem;
import com.ResturantManagement.entity.Dish;

import jakarta.servlet.http.HttpSession;

@Controller
@SessionAttributes("cart")
public class DishController {

	@Autowired
	private DishRepo repo;

	@GetMapping("/")
	public String showHome() {
		return "home.jsp";
	}

	@RequestMapping("/addDish")
	public String addProduct(Dish dish) {
		System.out.println(dish);
		repo.save(dish);
		return "addDish.jsp";
	}

	@RequestMapping("/ViewDish")
	public ModelAndView showProduct() {

		List<Dish> dish = (List<Dish>) repo.findAll();

		ModelAndView mv = new ModelAndView();
		mv.addObject("listDish", dish);
		mv.setViewName("ViewDish.jsp");

		return mv;
	}

	@RequestMapping("/deleteById/{id}")
	public String deleteById(@PathVariable("id") int id) {
		System.out.println(".......deleteById .......id = " + id);
		repo.deleteById(id);

		return "/ViewDish";
	}

	@RequestMapping("/UpdateDishById")
	public ModelAndView updateDishById(@RequestParam("dish_id") int id) {
		System.out.println("update by id = " + id);
		Dish dish = repo.findById(id).orElse(new Dish());
		System.out.println(dish);
		ModelAndView mv = new ModelAndView();
		mv.addObject("dish", dish);
		mv.setViewName("UpdateDish.jsp");
		return mv;
	}

	@RequestMapping("/updateDish")
	public String updateDishById(Dish dish) {
		System.out.println(dish);
		repo.save(dish);
		return "/ViewDish";
	}

	@ModelAttribute("cart")
	public List<CartItem> cart() {
		return new ArrayList<>();
	}

	@PostMapping("/cart/addDish")
	public String addToCart(@RequestParam("id") int id, @ModelAttribute("cart") List<CartItem> cart) {
		Dish dish = repo.findById(id).orElse(null);
		if (dish != null) {
			boolean found = false;
			for (CartItem item : cart) {
				if (item.getDish().getId() == id) {
					item.setQuantity(item.getQuantity() + 1);
					found = true;
					break;
				}
			}
			if (!found) {
				cart.add(new CartItem(dish, 1));
			}
		}
		return "redirect:/cart";
	}

	@GetMapping("/cart")
	public String showCart(@ModelAttribute("cart") List<CartItem> cart, Model model) {
		model.addAttribute("cartItems", cart);
		return "cart.jsp";
	}

	@PostMapping("/cart/order")
	public String placeOrder(@ModelAttribute("cart") List<CartItem> cart, RedirectAttributes redirectAttributes) {
		if (cart.isEmpty()) {
			redirectAttributes.addFlashAttribute("message", "Your cart is empty!");
			return "redirect:/cart";
		}
		System.out.println("Order placed:");
		for (CartItem item : cart) {
			System.out.println(item.getDish().getName() + " x " + item.getQuantity());
		}

		cart.clear();

		redirectAttributes.addFlashAttribute("message", "Order placed successfully!");
		return "redirect:/cart";
	}

	@GetMapping("/category/{categoryName}")
	public ModelAndView category(@PathVariable("categoryName") String category) {

		System.out.println("category name : " + category);

		List<Dish> list = repo.findByDish_category(category);

		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("category", category);
		mv.setViewName("/category.jsp");

		return mv;
	}
	
	@GetMapping("/category2/{categoryName}")
	public ModelAndView category2(@PathVariable("categoryName") String category2) {

		System.out.println("category name : " + category2);

		List<Dish> list = repo.findByDish_category(category2);

		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.addObject("category2", category2);
		mv.setViewName("/category2.jsp");

		return mv;
	}

	@GetMapping("/adminHome")
	public String adminHome(HttpSession session, Model model) {
		String role = (String) session.getAttribute("role");
		if (role == null || !role.equalsIgnoreCase("ADMIN")) {
			return "redirect:/login";
		}
		List<Dish> dishes = (List<Dish>) repo.findAll();
		model.addAttribute("listDish", dishes);

		return "ViewDish.jsp";
	}

	@GetMapping("/userHome")
	public String userHome(@ModelAttribute("cart") List<CartItem> cart, Model model, HttpSession session) {
		String role = (String) session.getAttribute("role");
		if (role == null || !role.equalsIgnoreCase("USER")) {
			return "redirect:/login";
		}

		List<Dish> dishes = (List<Dish>) repo.findAll();
		model.addAttribute("listDish", dishes);
		model.addAttribute("cartItems", cart);

		return "userHome.jsp";
	}

}
