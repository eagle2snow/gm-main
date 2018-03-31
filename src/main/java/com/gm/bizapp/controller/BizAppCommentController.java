package com.gm.bizapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gm.base.model.Comment;
import com.gm.service.ICommentService;

/**
 * 点评
 *
 */
@RestController
@RequestMapping("/bizapp/comment/")
public class BizAppCommentController extends BaseBizAppController {

	@Resource
	private ICommentService commentService;

	/**
	 * 发表点评
	 * 
	 * 
	 * app端要传以下参数
	 * 
	 * @param model
	 *            模块 1|新房,2|二手房,3|租房,4|民宿
	 * @param modelId
	 *            数据id，如：房源id
	 * @param content
	 *            点评文本
	 * @param pics
	 *            点评图片
	 * @param user.id
	 *            当前登录用户id
	 * 
	 * @return
	 */
	@PostMapping("/add")
	public Map<String, Object> add(Comment comment) {
		Map<String, Object> map = new HashMap<>();
		if (commentService.add(comment)) {
			map.put("s", "ok");
		} else {
			map.put("s", "no");
		}
		return map;
	}

	/**
	 * 点评列表
	 * 
	 * @param model
	 *            模块 1|新房,2|二手房,3|租房,4|民宿
	 * @param modelId
	 *            房源id
	 * @return
	 */
	@PostMapping("/list")
	public Map<String, Object> add(Integer model, Integer modelId) {
		Map<String, Object> map = new HashMap<>();
		List<Comment> comments = commentService.go().eq("model", model).eq("modelId", modelId).list();
		map.put("comments", comments);
		return map;
	}

}
