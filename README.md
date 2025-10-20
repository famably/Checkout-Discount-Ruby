# Backend Engineer Code Test

## Overview
This solution refactors the legacy checkout implementation into a clean, object-oriented structure with dynamic discount rules.

## Features
- Refactored `Checkout` class following OOP principles.
- Each discount type implemented as its own rule class.
- Added support for **Buy 3 Get 1 Free** on Mangos.
- Discounts are now loaded dynamically from a mock `DiscountRepository` (simulating a database).
- 100% RSpec coverage and all tests passing.

## Design Approach
1. **Encapsulation**: Each discount is encapsulated in its own class for clarity and testability.  
2. **Extensibility**: New discounts can be added by extending the repository and adding a new rule class.  
3. **Clean Code**: Removed branching logic from `Checkout#total`.  
4. **Dynamic Configuration**: DiscountRepository allows changes at runtime, simulating database configuration.

## How to Run
```bash
bundle install
bundle exec rspec
```

Output:
```bash
8 examples, 0 failures
```