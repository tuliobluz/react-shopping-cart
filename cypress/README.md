# Cypress Project react-shopping-cart

This repository contains a cypress project for setting up and running tests on the react-shopping-cart. Below you will find information on the project setup, running tests, and reports.

## Requirements

To run this project, you need to have the following dependencies installed:

- Node.js (version 14.17.3 or compatible)
- Cypress

## Installation

To install the project dependencies, run the following command in your terminal:

```shell
npm install
```

This will install the required dependencies for the Cypress project.

## How to Run

Before running the tests, make sure to set up the following configurations in the `cypress.json` file:

- `baseUrl`: The base URL for your application. By default, it is set to `http://localhost:3000/`, but you can modify it to match your application's URL.
- `viewportWidth` and `viewportHeight` are commented on the `cypress.config.ts`, however when it has decided the resolution we can update it
  - `viewportWidth`: The width of the viewport for the tests. By default, it is set to `1920`, but you can modify it as needed.
  - `viewportHeight`: The height of the viewport for the tests. By default, it is set to `1080`, but you can modify it as needed.

### Opening Cypress Test Runner

To open the Cypress Test Runner, run the following command:

```shell
npm run cypress:open
```

This will launch the Cypress Test Runner, where you can interactively run and manage your tests.

### Running Cypress E2E Tests

To run the Cypress E2E tests in headless mode, use the following command:

```shell
npm run test:cypress:e2e
```

This command will execute the tests using the Chrome browser.


### Running Cypress E2E Tests using docker

To run your Cypress project using Docker, there is the `docker-compose.yml`  configuration. The configuration allows you to set up two services: "react-fe" for your React front-end application and "cypress" for running Cypress tests. 

To get started, make sure you have Docker installed on your machine. Then, follow the steps below:


1. Run the following command to build our images

```shell
docker-compose build
```

2. Run the following command to start the Docker containers:

```shell
docker-compose up --exit-code-from cypress
```

This command will build the React front-end application, start the containers, and run your Cypress tests against the React application. The test results will be displayed in the terminal.

## Custom Selector

A custom selector has been provided to simplify selecting elements in your tests. The selector is defined in the `commands.js` file located in the `support` folder. Here's an example usage of the custom selector:

```javascript
cy.getBySel('selector-name').click();
```

Replace `'selector-name'` with the appropriate value for your test case.

## Folder Structure

The following is the suggested folder structure for your Cypress project:

- `cypress`
  - `downloads`: This folder is used to store files downloaded during a test.
  - `e2e`: This folder contains your end-to-end test files.
    - `sample_test.cy.js`: This is a sample specification file. You can create additional test files in this folder.
  - `fixtures`: Use this folder to store mock data for your tests.
  - `support`:
    - `commands.js`: This file contains custom commands or overrides for existing commands.
    - `e2e.js`: This file is loaded before the test files and can be used for global configurations.

## Reporting

This project uses the `cypress-mochawesome-reporter` to generate test reports. You can access the reports at `reports/index.html` after running the tests.

## GitHub Actions Integration

This project includes a GitHub Actions workflow for running Cypress end-to-end tests. The workflow is triggered when you push changes to the repository. The following steps are executed:

1. Checkout the repository.
2. Install the project dependencies.
3. Start React app
4. Run Cypress tests and generate a Mochawesome report.
5. Upload the Mochawesome report as an artifact.

The generated Mochawesome report can be accessed through the GitHub Actions summary. Additionally, you can configure the workflow to upload videos if needed.

## Slack Integration

After running the react-shopping-cart cypress, the GitHub Actions workflow sends a message to Slack channels. Currently, the message is sent only when the job succeeds. In a real scenario, notifications can be sent for both successful and failed jobs.

If you want to join the Slack channel for integration, please use the following invitation link: [Slack Invitation Link](https://join.slack.com/t/github-integrationhq/shared_invite/zt-1uzcgmgde-j6JNKORGMNZgAI2ayyvUYg)
