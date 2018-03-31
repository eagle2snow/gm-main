package com.gm.bizapp.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gm.base.model.BizNews;
import com.gm.service.IBizNewsService;

/**
 * 
 * 商汇
 * 
 * @author ying
 *
 */
@RestController
@RequestMapping("/bizapp/bizNews")
public class BizAppBizNewsController extends BaseBizAppController {

	@Resource
	private IBizNewsService bizNewsService;

	/**
	 * 商汇列表
	 * 
	 * @param catId
	 * @return
	 */
	@RequestMapping("/list")
	public Map<Object, Object> list(Integer catId) {
		Map<Object, Object> map = new HashMap<>();
		List<BizNews> bizNewss = bizNewsService.list();
		map.put("bizNews", bizNewss);
		return map;
	}

	/**
	 * 商汇详情
	 * 
	 * @param id
	 * @return
	 */
	@PostMapping("/show")
	public Map<String, Object> show(Integer id) {
		Map<String, Object> map = new HashMap<>();
		BizNews bizNews = bizNewsService.get(id);
		bizNews.setHit(bizNews.getHit() + 1);
		bizNewsService.update(bizNews);
		map.put("bizNews", bizNews);
		return map;
	}

}
