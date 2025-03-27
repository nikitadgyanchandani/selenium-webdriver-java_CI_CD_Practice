package com.willysalazar.example.selenium;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;

public class WaitElement {
    static Duration duration = Duration.ofSeconds(5);



    public static WebElement waitForMessage(WebDriver driver, WebElement webElement) {

        WebDriverWait explicitWaitByElement = new WebDriverWait(driver, duration);
        explicitWaitByElement.until(ExpectedConditions.visibilityOf(webElement));
        return webElement;
    }

    public static WebElement waitVisibilityOf(WebDriver driver, WebElement webElement) {

        WebDriverWait explicitWaitByElement = new WebDriverWait(driver, duration);
        explicitWaitByElement.until(ExpectedConditions.visibilityOf(webElement));
        return webElement;

    }
}
