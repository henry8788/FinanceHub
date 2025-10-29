# FinanceHub 

A modern, optimized iOS banking application built with Swift and UIKit, following the MVVM architecture pattern.

## 📱 Features

### Account Management
- **Multi-currency Support**: View balances in USD and KHR
- **Multiple Account Types**: Savings, Fixed Deposit, and Digital accounts
- **Real-time Updates**: Live balance updates using Combine framework
- **Privacy Controls**: Toggle balance visibility with eye icon

### Notifications
- **Notification Center**: View all account notifications
- **Read/Unread Status**: Track which notifications have been viewed
- **Bell Icon Indicator**: Visual indicator for unread notifications

### Quick Actions
- **Favorite Transactions**: Quick access to frequently used transactions
- **Payment Methods**: 6 payment options (Transfer, Payment, Utility, QR scan, My QR, Top up)
- **Promotional Banners**: Auto-scrolling carousel for promotions

### User Experience
- **Pull-to-Refresh**: Refresh account data with a simple swipe
- **Shimmer Loading**: Elegant loading animations
- **Smooth Animations**: Professional UI transitions
- **Empty States**: User-friendly placeholder views

## 🏗 Architecture

### MVVM Pattern
This project strictly follows the Model-View-ViewModel architecture:

- **Models** (`Models/Business/`): Pure data structures with business logic
  - `Account.swift` - Account data with currency formatting
  - `Banner.swift` - Promotional banner data
  - `Favorite.swift` - Favorite transaction data with type safety
  - `Notification.swift` - Notification data with read/unread status
  - `PaymentMethod.swift` - Payment method configuration
  - `Response.swift` - Generic API response wrapper

- **ViewModels** (`ViewModels/`): Business logic and data transformation
  - `BaseViewModel.swift` - Common ViewModel functionality
  - `MyAccountViewModel.swift` - Account screen business logic

- **Views** (`Views/`): Reusable UI components
  - Custom views for account balance, banners, favorites, etc.
  - XIB-based views for easy customization

- **ViewControllers** (`ViewControllers/`): Coordination layer
  - `BaseViewController.swift` - Common VC functionality
  - `MyAccountViewController.swift` - Main account screen
  - `NotificationViewController.swift` - Notifications list
  - `PanelChildViewController.swift` - Tab container



