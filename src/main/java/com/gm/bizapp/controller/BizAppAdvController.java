package com.gm.bizapp.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gm.base.model.Adv;
import com.gm.service.IAdvService;

/**
 * 广告
 *
 */
@RestController
@RequestMapping("/bizapp/adv/")
public class BizAppAdvController extends BaseBizAppController {

	
	@Resource
	private IAdvService iAdvService;
	/**
	 * 广告详情
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/show")
	public Map<String, Object> show(Integer id) {
		Map<String, Object> map = new HashMap<>();
		Adv adv = iAdvService.get(id);
		map.put("adv",adv);
		return map;
	}
 
 
}
