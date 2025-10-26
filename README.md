# MAD Shop - Flutter E-commerce Application

Мобильное приложение электронной коммерции, разработанное на Flutter с использованием принципов UI/UX дизайна и адаптивной верстки.

MAD Shop - это современное мобильное приложение для электронной коммерции, демонстрирующее перенос готового дизайна из Figma в Flutter. Приложение включает каталог товаров, детальную информацию о продуктах и корзину покупок.

## Структура проекта

```
lib/
├── main.dart                 # Точка входа приложения
├── screens/                  # Экраны приложения
│   ├── welcome_screen.dart  # Экран приветствия/онбординга
│   ├── login_screen.dart    # Экран входа
│   ├── register_screen.dart # Экран регистрации
│   ├── home_screen.dart     # Главный экран с каталогом товаров
│   ├── product_screen.dart  # Экран детальной информации о товаре
│   └── cart_screen.dart     # Экран корзины покупок
├── widgets/                  # Переиспользуемые компоненты
│   └── product_card.dart    # Виджет карточки товара
└── theme/                   # Стилизация приложения
    ├── colors.dart          # Цветовая палитра
    └── text_styles.dart     # Типографика
```

## 📱 Скриншоты экранов

### Экран приветствия (Welcome Screen)
![Экран приветствия](screenshots/welcome_screen.png)
- Иконка приложения в центре экрана
- Название приложения "MAD Shop"
- Слоган "Shop Smart, Live Happy"
- Кнопка "Continue" для перехода к входу

### Экран входа (Login Screen)
![Экран входа](screenshots/login_screen.png)
- Поля ввода Email и Password
- Чекбокс "Remember me"
- Ссылка "Forgot password"
- Кнопка "Sign In"
- Переход к регистрации

### Экран регистрации (Register Screen)
![Экран регистрации](screenshots/register_screen.png)
- Поля для ввода имени
- Поля для ввода Email
- Поля для ввода и подтверждения пароля
- Чекбокс для принятия условий
- Переход к входу

### Главный экран (Home Screen)
<img width="576" height="1280" alt="image" src="https://github.com/user-attachments/assets/e9e7e34a-1219-41cd-b737-1241d71455f9" />
<img width="576" height="1280" alt="image" src="https://github.com/user-attachments/assets/b0465ad1-abef-4ce8-bf81-3d901d6f7ae9" />
<img width="576" height="1280" alt="image" src="https://github.com/user-attachments/assets/43f5b6ed-6b53-4775-917b-e500bf8e770d" />
<img width="576" height="1280" alt="image" src="https://github.com/user-attachments/assets/97d7a7ad-da75-4d15-b1f6-7d979602b48e" />


### Экран товара (Product Screen)
<img width="576" height="1280" alt="image" src="https://github.com/user-attachments/assets/4bd43a35-aea8-409a-beec-e8f59fbb4778" />


### Экран корзины (Cart Screen)
<img width="576" height="1280" alt="image" src="https://github.com/user-attachments/assets/8d54c5df-b4d8-43f8-a4b4-f728b37b5927" />


### Реализованные переходы
- **Welcome → Login**: `Navigator.pushReplacement()` при завершении онбординга
- **Login → Register**: `Navigator.push()` при нажатии "Sign Up"
- **Register → Login**: `Navigator.pop()` при нажатии "Sign In"
- **Login → Home**: `Navigator.pushReplacement()` после успешного входа
- **Register → Home**: `Navigator.pushReplacement()` после успешной регистрации
- **Home → Product**: `Navigator.push()` с MaterialPageRoute
- **Product → Home**: `Navigator.pop()` при добавлении в корзину
- **Home → Cart**: `Navigator.push()` через иконку корзины
- **Cart → Home**: `Navigator.pop()` через кнопку "Назад"


### Сверстанные экраны

**1. Экран приветствия (Welcome Screen)**
- Иконка приложения в круглом контейнере
- Название "MAD Shop" с использованием `TextStyle`
- Слоган "Shop Smart, Live Happy"
- Кнопка "Continue" для навигации к экрану входа

**2. Экран входа (Login Screen)**
- Форма входа с `TextFormField`
- Валидация Email и Password
- Показ/скрытие пароля с иконкой глаза
- Чекбокс "Remember me"
- Ссылка "Forgot password"
- Кнопка "Sign In"
- Переход к регистрации

**3. Экран регистрации (Register Screen)**
- Форма регистрации с полями:
  - Полное имя
  - Email
  - Password
  - Confirm Password
- Валидация всех полей
- Чекбокс для принятия условий
- Кнопка "Create Account"
- Переход к входу

**4. Главный экран (Home Screen)**
- Сетка товаров с использованием `GridView.builder`
- Фильтрация по категориям с `FilterChip`
- Поисковая строка с `TextField`
- Индикатор корзины с количеством товаров
- Карточки товаров с изображениями, названиями, ценами и рейтингами

**5. Экран товара (Product Screen)**
- Большое изображение товара с `Image.asset`
- Детальная информация о товаре
- Селектор количества с кнопками +/- 
- Кнопка добавления в корзину
- Отображение рейтинга и количества отзывов

**6. Экран корзины (Cart Screen)**
- Список товаров с `ListView.builder`
- Миниатюры товаров
- Элементы управления количеством
- Кнопка удаления товаров
- Расчет общей стоимости
- Диалог оформления заказа

### Использованные элементы

**Layout элементы:**
- `Column`, `Row` - для размещения элементов
- `Container` - для стилизации и отступов
- `Padding`, `EdgeInsets` - для отступов
- `Expanded`, `Flexible` - для адаптивности
- `Card` - для карточек товаров
- `GridView`, `ListView` - для списков

**UI компоненты:**
- `AppBar` - верхняя панель навигации
- `TextField` - поисковая строка
- `FilterChip` - фильтры категорий
- `ElevatedButton` - кнопки действий
- `IconButton` - иконки действий
- `SnackBar` - уведомления
- `AlertDialog` - диалоги подтверждения

**Навигация:**
- `Navigator.push()` - переход к новому экрану
- `Navigator.pop()` - возврат на предыдущий экран
- `MaterialPageRoute` - анимация переходов

### Отличия от макета и причины

**1. Цветовая схема**
- **Отличие**: Использована стандартная Material Design палитра вместо оригинальных цветов из Figma
- **Причина**: Обеспечение консистентности с системными элементами Android/iOS

**2. Размеры и отступы**
- **Отличие**: Адаптированы под различные размеры экранов
- **Причина**: Обеспечение адаптивности и читаемости на разных устройствах

**3. Иконки**
- **Отличие**: Использованы стандартные Material Icons вместо кастомных
- **Причина**: Упрощение разработки



