# FinanceHub - Project Information

## 📋 Project Details

- **Project Name**: FinanceHub
- **Original Name**: MyAccountBalanceKit
- **Created Date**: 2025/10/29
- **Created By**: Henry Lin
- **Platform**: iOS 15.0+
- **Language**: Swift 5.7+
- **Architecture**: MVVM (Model-View-ViewModel)

## 🎯 Project Purpose

FinanceHub is a modern iOS banking application that allows users to:
- Manage multiple currency accounts (USD, KHR)
- View account balances across different account types
- Receive and manage notifications
- Access favorite transactions quickly
- Use various payment methods
- View promotional banners

## 📁 Project Structure Overview

```
FinanceHub/
├── FinanceHub/                      # Main application target
│   ├── Common/                      # App lifecycle & styling utilities
│   │   ├── AppDelegate.swift        # App entry point
│   │   ├── SceneDelegate.swift      # Scene management
│   │   └── Style.swift              # UI styling utilities
│   │
│   ├── Models/Business/             # Data layer (MVVM - Model)
│   │   ├── Account.swift            # Account data structures
│   │   ├── Banner.swift             # Banner data
│   │   ├── Favorite.swift           # Favorite transaction data
│   │   ├── Notification.swift       # Notification data
│   │   ├── PaymentMethod.swift      # Payment method data
│   │   └── Response.swift           # Generic API response wrapper
│   │
│   ├── ViewModels/                  # Business logic layer (MVVM - ViewModel)
│   │   ├── BaseViewModel.swift      # Base ViewModel with common functionality
│   │   └── MyAccountViewModel.swift # Account screen business logic
│   │
│   ├── Views/                       # Reusable UI components (MVVM - View)
│   │   ├── MyAccount/               # Account screen components
│   │   │   ├── MyAccountTopView.swift
│   │   │   ├── AccountBalanceView.swift
│   │   │   ├── PaymentMethodView.swift
│   │   │   ├── BannerView.swift
│   │   │   ├── FavoriteView.swift
│   │   │   └── ... (more views)
│   │   └── Notification/            # Notification components
│   │       └── NotificationTableViewCell.swift
│   │
│   ├── ViewControllers/             # Coordination layer (MVVM - View Controller)
│   │   ├── BaseViewController.swift
│   │   ├── MyAccount/
│   │   │   └── MyAccountViewController.swift
│   │   ├── Notification/
│   │   │   ├── NotificationViewController.swift
│   │   │   └── NotificationTableViewDataSource.swift
│   │   └── Panel/
│   │       └── PanelChildViewController.swift
│   │
│   ├── Extensions/                  # Swift extensions
│   │   ├── Extension_String.swift   # String formatting utilities
│   │   ├── NibOwnerLoadable.swift   # XIB loading protocol
│   │   ├── GradientView.swift       # Gradient view component
│   │   └── ShimmerView.swift        # Shimmer loading effect
│   │
│   ├── Manager/                     # Service layer
│   │   ├── APIManager.swift         # Network request manager
│   │   ├── ImageManager.swift       # Image downloading & caching
│   │   └── APIInfo.swift            # API endpoint configuration
│   │
│   ├── Resources/                   # Assets & images
│   │   ├── Assets.xcassets/
│   │   └── images/
│   │
│   ├── Base.lproj/                  # Storyboards
│   │   └── Main.storyboard
│   │
│   ├── Info.plist                   # App configuration
│   └── ViewController.swift         # Legacy view controller
│
├── FinanceHubTests/                 # Unit tests
│   └── FinanceHubTests.swift
│
├── FinanceHubUITests/               # UI tests
│   ├── FinanceHubUITests.swift
│   └── FinanceHubUITestsLaunchTests.swift
│
├── README.md                        # Project documentation
├── PROJECT_INFO.md                  # This file
└── .gitignore                       # Git ignore rules
```

## 🏛 Architecture Details

### MVVM Pattern Implementation

**Model Layer**
- Pure data structures conforming to `Codable` and `Hashable`
- Contains business logic in computed properties
- No dependencies on View or ViewModel
- Examples: Account balance formatting, transaction type enums

**ViewModel Layer**
- Inherits from `BaseViewModel` for common functionality
- Uses Combine framework for reactive programming
- Publishes data changes to View Controllers
- Handles all business logic and data transformation
- Manages API calls and error handling

**View Layer**
- Custom UIView components loaded from XIBs
- Reusable across different screens
- No business logic - only UI configuration
- Delegates user actions to View Controller

**View Controller Layer**
- Coordinates between Views and ViewModels
- Binds ViewModel publishers to Views using Combine
- Handles user interaction and navigation
- Manages view lifecycle

### Key Design Patterns

1. **Singleton Pattern**: APIManager, ImageManager
2. **Delegate Pattern**: View to ViewController communication
3. **Observer Pattern**: Combine publishers and subscribers
4. **Repository Pattern**: Centralized API manager
5. **Decorator Pattern**: Swift extensions for enhanced functionality

## 🔧 Technical Highlights

### Reactive Programming with Combine
- All network requests return Combine publishers
- ViewModels use `@Published` properties for automatic UI updates
- Proper cancellable management to prevent memory leaks

### Networking
- Generic request method for type-safe API calls
- Automatic JSON decoding with Codable
- Error handling with custom NetworkError enum
- Main thread callbacks for UI updates

### Image Caching
- NSCache for efficient memory management
- Configurable cache size limits (100 images, 50MB)
- Thread-safe image downloading
- Automatic cache invalidation

### Code Quality
- MARK comments for clear code organization
- Comprehensive documentation on public APIs
- Memory safety with weak self in closures
- Thread safety with DispatchQueue.main
- Type safety with strongly-typed enums

## 📊 Statistics

- **Total Swift Files**: 40
- **Lines of Code**: ~3,000+ (optimized)
- **Code Reduction**: 200+ lines eliminated through DRY principles
- **Models**: 6 data structures
- **ViewModels**: 2 (Base + MyAccount)
- **Views**: 17 custom components
- **View Controllers**: 5 screen controllers
- **Managers**: 3 service managers
- **Extensions**: 4 utility extensions

## 🚀 Optimization Highlights

### Code Improvements
✅ Eliminated duplicate code in API calls (90+ lines reduced)
✅ Eliminated duplicate code in ViewModel (60+ lines reduced)
✅ Eliminated duplicate code in account balance fetching (50+ lines reduced)
✅ Improved error handling across all layers
✅ Enhanced memory management with proper cleanup
✅ Better thread safety with main thread dispatching
✅ Consistent naming conventions following Swift guidelines

### Performance Improvements
✅ Image caching reduces network requests
✅ Efficient Combine publishers with proper disposal
✅ Optimized view reuse in collection views
✅ Lazy loading of view controllers

### Maintainability Improvements
✅ Clear separation of concerns (MVVM)
✅ Single responsibility principle
✅ DRY (Don't Repeat Yourself) principle
✅ Comprehensive code documentation
✅ Organized file structure

## 📝 Notes

### Bundle Identifier
When creating the Xcode project, use:
- Bundle ID: `com.henrylin.FinanceHub`
- Organization: Your organization name
- Team: Your development team

### API Configuration
Update the base URL in `Manager/APIInfo.swift` to point to your backend:
```swift
static let baseUrl = "https://your-api-server.com"
```

### Storyboards
The project uses Main.storyboard for the initial view controller setup. Custom views are loaded from XIB files for better reusability.

## 🎓 Learning Resources

This project demonstrates:
- Modern iOS development with Swift
- MVVM architecture implementation
- Reactive programming with Combine
- UIKit best practices
- Code organization and maintainability
- Memory management and performance optimization

## 📞 Contact

Created by Henry Lin - 2025/10/29

---

**FinanceHub** - A professionally architected iOS banking application 💼
