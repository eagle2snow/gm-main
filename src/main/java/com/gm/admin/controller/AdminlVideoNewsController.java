package com.gm.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gm.base.model.VideoNews;
import com.gm.base.query.Page;
import com.gm.service.IVideoNewsService;
import com.gm.utils.StringUtil;

/**
 * 后台用户操作
 * 
 * @author Guet
 *
 */
@Controller
@RequestMapping("/admin/videonews/")
public class AdminlVideoNewsController extends BaseAdminController {

	private final static String path = "admin/videonews/";

	@Resource
	private IVideoNewsService videoNewsService;

	@RequestMapping("add.htm")
	@RequiresPermissions("admin:videonews:add")
	public String addView(ModelMap map) {

		map.put("path", path);

		return path + "add";
	}

	@RequiresPermissions("admin:videonews:add")
	@ResponseBody
	@RequestMapping("add.json")
	public Map<String, Object> addAction(VideoNews model) {
		model.setUser(getCurUser());
		Map<String, Object> map = new HashMap<>();
		if (videoNewsService.save(model)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:videonews:update")
	@RequestMapping("update/{id}.htm")
	public String updateView(@PathVariable Integer id, ModelMap map) {
		VideoNews model = videoNewsService.get(id);
		map.put("path", path);
		map.put("model", model);

		return path + "update";
	}

	@RequiresPermissions("admin:videonews:update")
	@RequestMapping("update.json")
	@ResponseBody
	public Map<String, Object> updateAction(VideoNews model) {
		Map<String, Object> map = new HashMap<>();
		if (videoNewsService.update(model)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:videonews:show")
	@RequestMapping("show/{id}.htm")
	public String showView(@PathVariable Integer id, ModelMap map) {
		VideoNews model = videoNewsService.get(id);
		map.put("model", model);
		map.put("path", path);
		return path + "show";
	}

	@RequiresPermissions("admin:videonews:show")
	@RequestMapping("list/{pageIndex}/{pageSize}.htm")
	public String manager(ModelMap map, @PathVariable Integer pageIndex, @PathVariable Integer pageSize, String k) {
		DetachedCriteria dc = DetachedCriteria.forClass(VideoNews.class);
		if (!StringUtil.strNullOrEmpty(k)) {
			dc.add(Restrictions.ilike("name", k.trim(), MatchMode.ANYWHERE));
		}
		Page<VideoNews> list = videoNewsService.list(dc, pageIndex, pageSize);
		map.put("page", list);
		map.put("path", path);
		map.put("key", k);
		return path + "list";
	}

	@RequiresPermissions("admin:videonews:delete")
	@RequestMapping("deleteById/{id}.json")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable Integer id) {
		Map<String, Object> map = new HashMap<>();
		if (videoNewsService.deleteById(id, false)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:videonews:delete")
	@RequestMapping("deleteByIds/{ids}.json")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable String ids) {
		Map<String, Object> map = new HashMap<>();
		List<Integer> arrayId = StringUtil.splitToInt(ids, ",");
		if (videoNewsService.deleteByIds(arrayId, false)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:videonews:update")
	@RequestMapping("updatePVById/{p}/{v}/{id}.json")
	@ResponseBody
	public Map<String, Object> updatePVById(@PathVariable String p, @PathVariable Integer v, @PathVariable Integer id) {
		Map<String, Object> map = new HashMap<>();
		if (videoNewsService.update(p, v, id)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

}
