package com.willysalazar.example.driver;

import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.manager.SeleniumManager;

import java.util.UUID;

class ChromeOptionsFactory {

    ChromeOptions build(){
        ChromeOptions optionsChrome = new ChromeOptions();
        
        // Check if running in container
        boolean isRunningInContainer = System.getenv("JENKINS_HOME") != null;
        
        if (isRunningInContainer) {
            // Container-specific options
            optionsChrome.addArguments("--no-sandbox");
            optionsChrome.addArguments("--disable-dev-shm-usage");
            optionsChrome.addArguments("--headless");
            optionsChrome.addArguments("--disable-gpu");
            optionsChrome.addArguments("--window-size=1920,1080");
            optionsChrome.addArguments("--user-data-dir=/tmp/chrome-" + UUID.randomUUID().toString());
        } else {
            // Local execution options
            optionsChrome.addArguments("start-maximized");
            optionsChrome.addArguments("--user-data-dir=/tmp/chrome-" + UUID.randomUUID().toString());
        }
        
        // Common options for both environments
        optionsChrome.addArguments("--disable-extensions");
        optionsChrome.addArguments("--disable-popup-blocking");
        optionsChrome.addArguments("--disable-notifications");
        optionsChrome.addArguments("--remote-allow-origins=*");

        String driverPath = SeleniumManager.getInstance().getDriverPath(optionsChrome, false).driverPath;
        System.out.println(driverPath);

        return optionsChrome;
    }
}
