# MAD Shop - Flutter E-commerce Application
## Батов Даниил, ЭФБО-10-23

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
<img width="576" height="1280" alt="image" src="https://github.com/user-attachments/assets/3a6c39c0-3790-4035-b4e1-6741eb97e30d" />


### Экран входа (Login Screen)
<img width="576" height="1280" alt="image" src="https://github.com/user-attachments/assets/9c3be3ea-c3c6-45dd-91ef-51220fd6b16b" />


### Экран регистрации (Register Screen)
<img width="576" height="1280" alt="image" src="https://github.com/user-attachments/assets/a6d42834-dfde-4bc5-9de3-4c1bb7f5d675" />


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



