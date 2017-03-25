package com.baicai.job.web.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Package com.baicai.job.web.controller
 * @ClassName PubController
 * @author 刘小军
 * @date 2017年3月25日 下午7:13:17
 */

@Controller
@Scope("prototype")
@RequestMapping("/publics")
public class PubController {
	@RequestMapping("/memberdetails/{id}")
	public ModelAndView basicInfo(@PathVariable Integer id, Model mapModel) {
		return new ModelAndView("redirect:/publics/details/basicinfo");
	}
}
