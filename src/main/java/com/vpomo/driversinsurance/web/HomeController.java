package com.vpomo.driversinsurance.web;

import com.vpomo.driversinsurance.model.Drivers;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.security.Principal;
import java.util.ArrayList;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    public ArrayList<Drivers> queueDrivers = new ArrayList<>();

    /**
     * Simply selects the home view to render by returning its name.
     *
     * @param principal
     * @param model
     * @return
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Principal principal, Model model) {
        queueDrivers.clear();
        queueDrivers.trimToSize();

        Drivers driver1 = new Drivers("Иванов Геннадий Петрович", "19.12.1960", 55, "М", 1);
        Drivers driver2 = new Drivers("Васильев Петр Сергеевич", "19.12.1964", 51, "М", 2);
        Drivers driver3 = new Drivers("Харченко Иван Владимирович", "19.12.1982", 33, "М", 3);
        Drivers driver4 = new Drivers("Суворов Александр Иванович", "29.03.1971", 44, "M", 3);
        Drivers driver5 = new Drivers("Самсонов Игорь Юрьевич", "19.04.1978", 37, "M", 2);
        Drivers driver6 = new Drivers("Петров Кирилл Павлович", "05.08.1966", 49, "M", 1);
        Drivers driver7 = new Drivers("Сидоров Андрей Игоревич", "23.09.1985", 30, "M", 3);
        Drivers driver8 = new Drivers("Козлов Александр Александрович", "19.12.1969", 45, "M", 1);
        queueDrivers.add(driver1);
        queueDrivers.add(driver2);
        queueDrivers.add(driver3);
        queueDrivers.add(driver4);
        queueDrivers.add(driver5);
        queueDrivers.add(driver6);
        queueDrivers.add(driver7);
        queueDrivers.add(driver8);

        return "index";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Drivers driverFromJson(@RequestBody Drivers driver) {
        queueDrivers.add(driver);

        logger.info("Все объекты: " + queueDrivers);
        return driver;
    }

    @RequestMapping(value = "/restful/getall", method = RequestMethod.GET)
    public @ResponseBody ArrayList<Drivers> getDriversAll() {
        return queueDrivers;
    }

}
