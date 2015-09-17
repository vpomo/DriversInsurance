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

        Drivers obj1 = new Drivers("Иванов Геннадий Петрович", "19.12.1960", 55, "М", 1);
        Drivers obj2 = new Drivers("Васильев Петр Сергеевич", "19.12.1964", 51, "М", 2);
        Drivers obj3 = new Drivers("Харченко Иван Владимирович", "19.12.1982", 33, "М", 3);
        Drivers obj4 = new Drivers("Суворов Александр Иванович", "29.03.1971", 44, "M", 3);
        queueDrivers.add(obj1);
        queueDrivers.add(obj2);
        queueDrivers.add(obj3);
        queueDrivers.add(obj4);

        return "index";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Drivers ObjFromJson(@RequestBody Drivers obj) {

        logger.info("Попытка приема данных");
        queueDrivers.add(obj);

        logger.info("Все объекты: " + queueDrivers);
        return obj;
    }

    @RequestMapping(value = "/restful/getall", method = RequestMethod.GET)
    public
    @ResponseBody
    ArrayList<Drivers> getDriversAll() {
        return queueDrivers;
    }

}
