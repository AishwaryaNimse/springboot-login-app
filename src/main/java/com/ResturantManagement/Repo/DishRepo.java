package com.ResturantManagement.Repo;

import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import com.ResturantManagement.entity.Dish;

public interface DishRepo extends CrudRepository<Dish , Integer> {

	@Query("from Dish where category=:category")
	List<Dish> findByDish_category(@Param("category") String category);
}
