
# Cash Register

This is a simple cash register application built with Ruby on Rails. It allows users to add products to a cart and compute the total price with special pricing rules. The application includes a web-based UI styled with Bootstrap and uses Importmap for managing JavaScript dependencies.

## Features

- Add products to a cart
- Remove products from a cart
- Compute the total price of items in the cart
- Special pricing rules:
  - Buy-one-get-one-free offer on Green Tea (GR1)
  - Bulk discount on Strawberries (SR1): If you buy 3 or more, the price drops to 4.50€ each
  - Discount on Coffee (CF1): If you buy 3 or more, the price drops to 2/3 of the original price

## Getting Started

### Prerequisites

- Ruby (>= 3.3.4)
- Rails (>= 7.1.3.4)
- PostgreSQL

### Installation

1. Clone the repository:
    ```
    git clone https://github.com/your-username/cash_register.git
    cd cash_register
    ```

2. Install the required gems:
    ```
    bundle install
    ```

3. Set up the database:
    ```
    rails db:create
    rails db:migrate
    rails db:seed
    ```

4. Start the Rails server:
    ```
    rails server
    ```

5. Visit `http://localhost:3000` in your web browser to view the application.

## Usage

### Web Interface

- The home page (`http://localhost:3000`) displays a list of products.
- You can add products to the cart by clicking the "Add to cart" button next to each product.
- Click on "View Cart" in the navigation bar to see the items in your cart and the total price.

## Testing

The application includes a comprehensive test suite using RSpec, FactoryBot, and Shoulda-Matchers.

### Running Tests

1. Ensure you have the test database set up:
    ```
    rails db:test:prepare
    ```

2. Run the tests:
    ```
    bundle exec rspec
    ```

## Pricing Rules Implementation

The pricing rules are implemented in the `PricingRules` service object, which calculates the total price based on the items in the cart and applies the special pricing rules.

## Project Structure

- `app/models`: Contains the application's models
- `app/controllers`: Contains the application's controllers
- `app/views`: Contains the application's views
- `app/services`: Contains service objects, including pricing rules
- `spec`: Contains the RSpec tests

## Dependencies

- `bootstrap`: Front-end framework for styling
- `jquery-rails`: Provides jQuery for Rails
- `importmap-rails`: Manages JavaScript dependencies in Rails without Node.js or Webpack
- `rspec-rails`: Testing framework for Rails
- `factory_bot_rails`: Fixtures replacement with a straightforward definition syntax
- `shoulda-matchers`: Provides RSpec with additional matchers to test common Rails functionality