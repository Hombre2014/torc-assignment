# Torc Challenge for Ruby + PostgreSQL developer (SCH) position

> A Ruby take home assignment from Coderbyte.com

## Description

### General Requirements

Use either Ruby or Javascript. If you feel more comfortable with another language, please let us know and we can discuss.
Do not use any external libraries to solve this problem. You may only use external libraries or tools for building or testing purposes (e.g., Rspec, Jest, Mocha, etc.).

Include detailed instructions on how to run the application and an explanation of assumptions you make (if any).

### IMPORTANT

Please limit the amount of time you spend on the problem to 4 hours. If you haven't completed the challenge within the allotted time, please submit the work you have completed. Focus on implementing the requirements with the best code you can produce within the given time frame.

### Problem Statement

This problem requires some kind of input. You are free to implement any mechanism for feeding the input into your solution. You should provide sufficient evidence that your solution is complete by, as a minimum, indicating that it works correctly against the supplied test data.

Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt. Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

When I purchase items I receive a receipt which lists the name of all the items and their price (including tax), finishing with the total cost of the items, and the total amounts of sales taxes paid. The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.

Write an application that prints out the receipt details for these shopping baskets:

### Examples

Input 1:<br>
2 book at 12.49<br>
1 music CD at 14.99<br>
1 chocolate bar at 0.85<br>

Input 2:<br>
1 imported box of chocolates at 10.00<br>
1 imported bottle of perfume at 47.50<br>

Input 3:<br>
1 imported bottle of perfume at 27.99<br>
1 bottle of perfume at 18.99<br>
1 packet of headache pills at 9.75<br>
3 imported boxes of chocolates at 11.25<br>

### Outputs

Output 1:<br>
2 book: 24.98<br>
1 music CD: 16.49<br>
1 chocolate bar: 0.85<br>
Sales Taxes: 1.50<br>
Total: 42.32<br>

Output 2:<br>
1 imported box of chocolates: 10.50<br>
1 imported bottle of perfume: 54.65<br>
Sales Taxes: 7.65<br>
Total: 65.15<br>

Output 3:<br>
1 imported bottle of perfume: 32.19<br>
1 bottle of perfume: 20.89<br>
1 packet of headache pills: 9.75<br>
3 imported boxes of chocolates: 35.55<br>
Sales Taxes: 7.90<br>
Total: 98.38<br>

## Instructions

### Assumptions

I assume the inputs are as above examples and each line includes four parts as follows:

- first part is the number of items. It is integer for example 2.
- second part is the name of the item and it is string, description for example "imported boxes of chocolates". It should include "imported" if the item is imported. It should include "book" if the items is book, which is tax exempt. It should include "chocolate" or "chocolates" if the item is food, which is also a tax exempt. It should include 'pills' if the item is medical product, which is also a tax exempt.
- there is a "at" just before the price as a third part.
- the last part is the price of the item in decimal form with two digits after the decimal point like "12.49".

### Clone the repository

`git clone (https://github.com/Hombre2014/torc-assignment.git)`

### Change the directory

`cd torc-assignment`

### Run the app

`ruby tax.rb`

### Run the tests

`rspec`

## Author

👤 **Yuriy Chamkoriyski**

- GitHub: [@Hombre2014](https://github.com/Hombre2014)
- Twitter: [@Chamkoriyski](https://twitter.com/Chamkoriyski)
- LinkedIn: [axebit](https://linkedin.com/in/axebit)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Hombre2014/torc-assignment/issues).

## Show your support

Give a ⭐️ if you like this project!
