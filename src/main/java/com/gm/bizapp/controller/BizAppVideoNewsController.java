package com.gm.bizapp.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gm.base.model.VideoNews;
import com.gm.service.IVideoNewsService;

/**
 * 直播视频
 * 
 * @author ying
 *
 */
@RestController
@RequestMapping("/bizapp/vidoeNews")
public class BizAppVideoNewsController extends BaseBizAppController {

	@Resource
	private IVideoNewsService vidoeNewsService;

	/**
	 * 视频列表
	 * 
	 * @param catId
	 * @return
	 */
	@RequestMapping("/list")
	public Map<Object, Object> list() {
		Map<Object, Object> map = new HashMap<>();
		List<VideoNews> vidoeNewss = vidoeNewsService.list();
		Collections.sort(vidoeNewss, (a, b) -> a.getIsTop().compareTo(b.getIsTop()));
		map.put("vidoeNews", vidoeNewss);
		return map;
	}

	/**
	 * 视频详情
	 * 
	 * @param id
	 * @return
	 */
	@PostMapping("/show")
	public Map<String, Object> show(Integer id) {
		Map<String, Object> map = new HashMap<>();
		VideoNews vidoeNews = vidoeNewsService.get(id);
		vidoeNews.setHit(vidoeNews.getHit() + 1);
		vidoeNewsService.update(vidoeNews);
		map.put("vidoeNews", vidoeNews);
		return map;
	}

}
