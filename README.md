# Checkout & Dynamic Discount Engine

## Overview
This repository provides a modular, production-ready checkout and discount engine built for retail and e-commerce applications. The system replaces a legacy checkout implementation with a clean, extensible, object-oriented architecture that supports dynamic pricing rules, promotional logic, and flexible discount configurations.

## Features
- **Object-Oriented Checkout Core** with clear separation of responsibilities.  
- **Rule-Based Discount System** where each discount is implemented as an independent class.  
- **Quantity-Based Promotions**, including a “Buy 3 Get 1 Free” example for Mango SKUs.  
- **Dynamic Discount Loading** using a mock `DiscountRepository`, easily replaceable with a database or external config service.  
- **High Test Coverage** with a complete, maintainable RSpec suite.  
- **Extensible Architecture** allowing new discount types without modifying existing core logic.

## Architecture & Design
The system follows modern software engineering principles:

### Encapsulation & Clarity
Each discount rule encapsulates its own logic, removing branching complexity from the checkout engine and improving readability and testability.

### Open/Closed Principle
New discount types can be introduced by creating new rule classes and updating the repository, without changing existing checkout logic.

### Dynamic Configuration
Discounts are loaded at runtime via the `DiscountRepository`, simulating real-world scenarios where stores control pricing rules through admin dashboards, APIs, or config services.

### Maintainability & Testability
The project is structured to support long-term growth, with a focus on clean abstractions, predictable behavior, and comprehensive RSpec coverage.

## Tech Stack
- Ruby  
- RSpec  
- OOP / Clean Architecture  
- Configurable Rules Engine  

## Getting Started

### Install Dependencies
```bash
bundle install
```

### Run Test Suite
```bash
bundle exec rspec
```

Expected output:
```bash
8 examples, 0 failures
```

## Project Structure
```
/lib
  /checkout
  /discount_rules
  discount_repository.rb
/spec
  ...
README.md
```

## Future Enhancements
- Integrate the discount repository with a real data source (PostgreSQL, Redis, or external API).  
- Add percentage-based, tiered, and time-bound promotions.  
- Support customer-specific pricing or loyalty-program logic.  
- Introduce multi-currency support for global e-commerce deployments.  
- Package the engine as a reusable gem for broader integration.

## Summary
This checkout engine demonstrates a scalable, production-focused approach to handling complex promotional logic in a clean and maintainable way. It is designed to evolve, adapt, and integrate seamlessly into real-world retail and e-commerce systems.
