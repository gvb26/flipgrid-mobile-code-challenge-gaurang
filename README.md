<!-- ABOUT THE PROJECT -->
## flipgrid-mobile-code-challenge-gaurang

This is my attempt at an onboarding screen according to the requirements provided to me with a few additions. This project consists of two main pages:


![ezgif-5-83dfdc1119](https://user-images.githubusercontent.com/25397326/165194322-eb2bc0f8-c209-40f8-b796-db879aeef332.gif)


- **Sign Up Page** -> This page takes in sign up data and allows you to submit. The email and password fields are required to proceed
- **Confirmation Page** -> This page displays the confirmation that your onboarding was successful, addresses you by name and lists your provided onboarded information

I took a few liberties to enhance the project:

- I made the sign up page dynamic so that the number of fields (and types), are provided by a json file that can be configured accordingly. I did this so that if requirements were ever to change in regards to sign up information being collected, the UI will require zero maintenance to update it. (This of course does not include the API call to sign up since actually signing up was beyond the scope of the project)
- Email and Password validation utilizes regex so that the are actually valid inputs for each of them. I wrote a procedure that could be expanded upon to support all types of validation in the future as well

### Built With

* [Swift](https://www.swift.org/)

## Build

Open the project and you should be able to click run or CMD-R to build and run the project on either a simulator (Via Mock Data) or on your device (iOS 13 and above supported). You will likely have to accept my development signatue to test on a device. (Settings)

## Running unit tests

Navigate to mobile_coding_challengeTests.swift. From there you can run individual tests or the entire test suite.
