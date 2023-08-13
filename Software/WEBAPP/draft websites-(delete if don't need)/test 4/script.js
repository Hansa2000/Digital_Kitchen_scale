$(document).ready(function() {
  var currentMeal = {
    foodName: '',
    weight: '',
    calories: 0
  };

  $("#recordButton").click(function() {
    var weight = $("#weight").text();
    $("#weight").val(weight);
    $("#mealWeight").text(weight);
  });

  $("#submitMeal").click(function(event) {
    event.preventDefault();
    var foodName = $("#foodName").val();
    var weight = $("#weight").val();
    var calories = $("#calories").val();

    if (foodName !== "" && weight !== "" && calories !== "") {
      // Handle adding the meal to the tracker
      console.log("Added to meal: " + foodName + " - " + weight + " grams - " + calories + " calories");

      currentMeal.foodName = foodName;
      currentMeal.weight = weight;
      currentMeal.calories = parseInt(calories);
      updateCurrentMeal();
    }
  });

  $("#unitButton").click(function() {
    var unitLabel = $("#unitLabel");
    var currentUnit = unitLabel.text();

    if (currentUnit === "grams") {
      unitLabel.text("ounces");
    } else if (currentUnit === "ounces") {
      unitLabel.text("grams");
    }
  });

  function updateCurrentMeal() {
    $("#mealFoodName").text(currentMeal.foodName);
    $("#mealCalories").text(currentMeal.calories);
  }
});
