package com.gm.bizapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gm.base.model.News;
import com.gm.base.model.Notice;
import com.gm.service.INewsService;
import com.gm.service.INoticeService;

/**
 * 公告
 * 
 * @author ying
 *
 */
@RestController
@RequestMapping("/bizapp/notice")
public class BizAppNoticeController extends BaseBizAppController {

	private static final Logger logger = LoggerFactory.getLogger(BizAppNoticeController.class);

	@Resource
	private INoticeService noticeService;

	@PostMapping("/list")
	public Map<String, Object> list(Integer pageIndex, Integer pageSize, String k) {
		Map<String, Object> map = new HashMap<>();
		List<Notice> notices = noticeService.list();
		map.put("notices", notices);
		return map;
	}

	@PostMapping("/show")
	public Map<String, Object> show(Integer id) {
		Map<String, Object> map = new HashMap<>();
		Notice notice = noticeService.get(id);
		map.put("notice", notice);
		return map;
	}

}
