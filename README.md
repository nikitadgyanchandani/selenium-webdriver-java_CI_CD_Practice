# Selenium WebDriver Java CI/CD Project

A comprehensive Selenium WebDriver automation framework built with Java, Maven, and TestNG, integrated with Jenkins CI/CD pipeline for automated testing.

## 📋 Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Setup Instructions](#setup-instructions)
- [Running Tests](#running-tests)
- [CI/CD Pipeline](#cicd-pipeline)
- [Reports](#reports)
- [Technologies Used](#technologies-used)

## 🎯 Introduction

This project demonstrates a complete Selenium WebDriver automation framework with CI/CD integration. It includes automated tests for web applications using the Page Object Model pattern, integrated with Jenkins for continuous testing and deployment.

The framework is designed to run both locally and in containerized environments, with automatic detection of the execution environment to apply appropriate configurations.

## ✨ Features

- **Cross-platform compatibility**: Runs on Windows, Linux, and macOS
- **Containerized execution**: Docker support for consistent CI/CD environments
- **Page Object Model**: Maintainable and scalable test architecture
- **Extent Reports**: Detailed HTML test reports with screenshots
- **Jenkins Integration**: Automated CI/CD pipeline
- **Parallel execution**: Support for concurrent test execution
- **Environment-aware**: Automatic configuration based on execution environment
- **Logging**: Comprehensive logging with Log4j2

## 🔧 Prerequisites

Before setting up this project, ensure you have the following installed:

### For Local Development
- **Java JDK 8 or higher** (JDK 11 recommended)
- **Maven 3.6+**
- **Git**
- **Chrome Browser** (latest version)
- **IDE** (IntelliJ IDEA, Eclipse, or VS Code)

### For CI/CD Pipeline
- **Docker** (for containerized Jenkins)
- **Jenkins** (with Docker support)
- **GitHub Account** (for source code management)

## 📁 Project Structure

```
selenium-webdriver-java-example/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/willysalazar/example/
│   │   │       ├── driver/          # WebDriver configuration
│   │   │       ├── page/            # Page Object classes
│   │   │       ├── selenium/        # Selenium utilities
│   │   │       ├── utils/           # Test utilities
│   │   │       └── report/          # Reporting utilities
│   │   └── resources/
│   │       ├── config.properties    # Configuration file
│   │       ├── log4j2.properties    # Logging configuration
│   │       └── Jenkins success job.png
│   └── test/
│       ├── java/
│       │   └── com/willysalazar/example/
│       │       └── *.java           # Test classes
│       └── resources/
│           ├── extent.properties    # Extent Reports configuration
│           └── html-config.xml      # HTML report configuration
├── target/                          # Build output
├── Dockerfile                       # Docker configuration
├── Jenkinsfile                      # Jenkins pipeline
├── pom.xml                          # Maven configuration
└── README.md                        # This file
```

## 🚀 Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/selenium-webdriver-java-example.git
cd selenium-webdriver-java-example
```

### 2. Local Development Setup

1. **Install Dependencies**
   ```bash
   mvn clean install
   ```

2. **Configure Environment**
   - Ensure Chrome browser is installed
   - Verify Java and Maven are in your PATH
   - Check that all dependencies are resolved

3. **Run Tests Locally**
   ```bash
   mvn clean test
   ```

### 3. Jenkins CI/CD Setup

1. **Build Docker Image**
   ```bash
   docker build -t myjenkins .
   ```

2. **Run Jenkins Container**
   ```bash
   docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home myjenkins
   ```

3. **Configure Jenkins**
   - Access Jenkins at `http://localhost:8080`
   - Install required plugins (Git, Maven, Pipeline)
   - Configure global tools (JDK, Maven, Git)
   - Create a new pipeline job

4. **Configure Global Tools in Jenkins**
   - Go to "Manage Jenkins" > "Global Tool Configuration"
   - Configure JDK: Name="JDK", JAVA_HOME="/usr/lib/jvm/default-java"
   - Configure Maven: Name="Maven", MAVEN_HOME="/usr/share/maven"
   - Configure Git: Name="Default", Path="/usr/bin/git"

## 🧪 Running Tests

### Local Execution

```bash
# Run all tests
mvn clean test

# Run specific test class
mvn test -Dtest=WelcomeTest

# Run tests with specific suite
mvn test -DsuiteXmlFile=testng.xml
```

### Jenkins Pipeline Execution

The project includes a Jenkinsfile that defines the CI/CD pipeline:

1. **Checkout**: Clones the source code
2. **Build**: Compiles the project
3. **Test**: Executes the test suite
4. **Report**: Generates test reports

## 🔄 CI/CD Pipeline

The Jenkins pipeline is defined in `Jenkinsfile` and includes:

- **Multi-stage pipeline** with build and test stages
- **Tool integration** with Maven and JDK
- **Test reporting** with JUnit integration
- **Post-build actions** for success/failure handling

### Pipeline Stages

```groovy
stages {
    stage('Checkout') { ... }
    stage('Build') { ... }
    stage('Test') { ... }
}
```

## 📊 Reports

### Test Execution Report

After running tests, view the detailed HTML report:

```
target/report/test_execution.html
```

The report includes:
- Test execution summary
- Pass/fail statistics
- Screenshots for failed tests
- Detailed test logs
- Performance metrics

### Jenkins Success Example

![Jenkins Success Job](src/main/resources/Jenkins%20success%20job.png)

*Successful Jenkins pipeline execution with all tests passing*

## 🛠 Technologies Used

### Core Technologies
- **Java 8+**: Programming language
- **Selenium WebDriver 4.11.0**: Web automation framework
- **TestNG 7.5.1**: Testing framework
- **Maven**: Build and dependency management

### Testing & Reporting
- **Extent Reports 4.0.8**: HTML test reporting
- **WebDriverManager 5.8.0**: Automated driver management
- **Log4j2 2.17.1**: Logging framework

### CI/CD & Containerization
- **Jenkins**: Continuous Integration server
- **Docker**: Containerization platform
- **Git**: Version control

### Design Patterns
- **Page Object Model**: Test maintainability
- **PageFactory**: Element initialization
- **Fluent Interface**: Method chaining

## 🧪 Test Coverage

The framework includes tests for:

- **Welcome Page**: Basic page navigation and validation
- **A/B Testing**: Dynamic content testing
- **Add/Remove Elements**: Interactive element testing
- **Basic Authentication**: Security testing

## 🔧 Configuration

### Environment Configuration

The framework automatically detects the execution environment:

- **Local Execution**: Normal Chrome with visible browser
- **Container Execution**: Headless Chrome with container-specific options

### Key Configuration Files

- `config.properties`: Application URLs and settings
- `log4j2.properties`: Logging configuration
- `extent.properties`: Report configuration

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For issues and questions:
- Create an issue in the GitHub repository
- Check the existing documentation
- Review the test reports for debugging information

---

**Happy Testing! 🚀**
