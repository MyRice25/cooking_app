🚀 Outstanding features
- **1. HomeMenuPage**
- Search bar supports debounce and saves search history.
- Display dishes horizontally (ListView):
- Each item has a large image, cooking time, dish name, and creator.
- Play icon, rating badge, and Favorite button have real status.
- The Dish Category section is presented in horizontal Chip.
- Display recent recipes.
- The last part is the ingredient list in Wrap chip format.
- **2. Dish details - DetailScreen**
- Large image displayed from MealModel or Meal (depending on the type).
- Dish name, rating, creator.
- TabBar with 2 tabs:
- Ingredients: taken from API (if using Meal) or static (if using MealModel).
- Cooking method: displayed from meal.instructions.
- TabBar has a beautiful design:
- Has a rounded corner background Box.
- Has a yellow horizontal bar above to separate.
- **3. SearchPage**
- Use GetX to manage search status.
- GridView interface displays large images.
- Search results display realtime by debounce.
- Click on item to open details.
- **4. Favorites**
- Use Hive to store favorite dishes locally.
- Use FavoriteController (GetX) to toggle favorite status.
- Use Obx to reactively update heart icon ❤️.

|🛠️ Technology | Description |
| ------------ | ----------------------------------------------- |
| **Flutter** | Main interface |
| **Dart** | Main language |
| **GetX** | State management |
| **Hive** | Offline storage (favorites) |
| **REST API** | Get food data from the Internet |
| **SQLite** | (planned integration for caching search data) |
| **Figma** | Initial UI design |

**📦 Features in development**
Integrated video tutorials.
Filter by category.
Dark mode.
Login/Register an account.
