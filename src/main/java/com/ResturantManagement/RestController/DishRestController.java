package com.ResturantManagement.RestController;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ResturantManagement.Repo.DishRepo;
import com.ResturantManagement.entity.Dish;

@RestController
@RequestMapping("/rest")
public class DishRestController {

	@Autowired
	private  DishRepo repo;
	
	@GetMapping("/getViewDish")
	public List<Dish> getAllProduct(){
		
		return (List<Dish>) repo.findAll();
	}
	
	@DeleteMapping("/deleteById/{id}")
	public boolean deleteById(@PathVariable("id") int id ) {
		System.out.println(".......deleteById .......id = "+id);
		
		
		repo.deleteById(id);
		return true;
	}
	
	@PostMapping("/addDish")
	public Dish addProduct(@RequestBody Dish dish) {
		System.out.println(dish);
		repo.save(dish);
		return repo.save(dish);
	}
	
	@PutMapping("/UpdateDish")
	public Dish updateProductById(@RequestBody Dish dish) {
		System.out.println(dish);
		repo.save(dish);
		return repo.save(dish);
	}
}

