/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vanlt.cart;

import java.io.Serializable;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;
import javax.naming.NamingException;
import vanlt.daos.FoodDAO;
import vanlt.dtos.FoodDto;


/**
 *
 * @author AVITA
 */
public class CartObject implements Serializable {

    private FoodDto foodDto;
    public Map<Integer, Integer> items;
    public Map<Integer, FoodDto> food;

    public FoodDto getFoodDto() {
        return foodDto;
    }

    public void setFoodDto(FoodDto foodDto) {
        this.foodDto = foodDto;
    }

    public Map<Integer, FoodDto> getFood() {
        return food;
    }

    public void setFood(Map<Integer, FoodDto> food) {
        this.food = food;
    }

    

    public Map<Integer, Integer> getItems() {
        return items;
    }


    public void addItemToCart(int foodId) throws SQLException, NamingException {
        if (foodId == 0) {
            return;
        }
        if (this.items == null) {
            this.items = new HashMap<>();
        }
        int amount = 1;
        if (this.items.containsKey(foodId)) {
            amount = this.items.get(foodId) + 1;
        }

        this.items.put(foodId, amount); // id tua và số lượng
        FoodDAO dao = new FoodDAO();
        FoodDto dto = dao.getFoodByID(foodId); // trả về 1 dtoFood theo ID

        if (food == null) {
            food = new HashMap<>();
        }
        food.put(foodId, dto); // lưu

    }

    public boolean updateItem(int foodId, int amount) {
        if (amount <= 0) {
            return false;
        }

        if (items.containsKey(foodId)) {
            items.put(foodId, amount);
        }
        return true;
    }

    public void removeItemFromCart(int foodId) {
        if (this.items == null) {
            return;
        }
        if (this.items.containsKey(foodId)) {
            this.items.remove(foodId);
        }

        if (this.food == null) {
            return;
        }
        if (this.food.containsKey(foodId)) {
            this.food.remove(foodId);
        }
    }

    public float getTotalPrice() {
        float total = 0;
        if (food != null && items != null) {
            for (Integer foodId : food.keySet()) {
                if (items != null) {
                    int amount = items.get(foodId);
                    float price = food.get(foodId).getFoodprice();
                    total += amount * price;   
                }
            }
        }
        return total;
    }
      
    public String getTotalPriceDisplay() {
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        return formatter.format(getTotalPrice());
    }

    public float getPriceOfItems(int foodId) {
        float priceOfItems = 0;
        if (food != null && items != null) {
            int amount = items.get(foodId);
            float price = food.get(foodId).getFoodprice();
            priceOfItems = amount * price;

        }
        return priceOfItems;
    }
    public String getPriceOfEachItemDisplay(int foodId) {
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        return formatter.format(getPriceOfItems(foodId));
    }
  
    public String getPriceOfItemsDisplay(int tourId) {
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        return formatter.format(getTotalPrice());
    }

    public String getPriceDisplay(int foodId) {
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        return formatter.format(food.get(foodId).getFoodprice());
    }
}
