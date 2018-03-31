package com.gm.bizapp.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gm.base.model.News;
import com.gm.base.model.NewsCat;
import com.gm.service.INewsCatService;
import com.gm.service.INewsService;

/**
 * 资讯
 * 
 * @author ying
 *
 */
@RestController
@RequestMapping("/bizapp/news")
public class BizAppNewsController extends BaseBizAppController {

	private static final Logger logger = LoggerFactory.getLogger(BizAppNewsController.class);

	@Resource
	private INewsService newsService;
	@Resource
	private INewsCatService newsCatService;

	@RequestMapping("/list")
	public Map<Object, Object> list(Integer catId) {
		Map<Object, Object> map = new HashMap<>();
		if (catId == 0) {
			List<NewsCat> cats = newsCatService.list();
			if (cats.size() > 0) {
				List<News> newss = newsService.listEq("newsCat.id", cats.get(0).getId());
				Collections.sort(newss, (a, b) -> a.getIsTop().compareTo(b.getIsTop()));
				map.put("news", newss);
			}
			map.put("cats", cats);
		} else {
			List<News> newss = newsService.listEq("newsCat.id", catId);
			Collections.sort(newss, (a, b) -> a.getIsTop().compareTo(b.getIsTop()));
			map.put("news", newss);
		}
		return map;
	}

	@PostMapping("/show")
	public Map<String, Object> show(Integer id) {
		Map<String, Object> map = new HashMap<>();
		News news = newsService.get(id);
		news.setHit(news.getHit() + 1);
		newsService.update(news);
		map.put("news", news);
		return map;
	}

}
