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

import com.gm.admin.controller.BaseAdminController;
import com.gm.base.model.PremiseNews;
import com.gm.base.query.Page;
import com.gm.service.IPremiseNewsService;
import com.gm.service.IPremiseService;
import com.gm.utils.StringUtil;

/**
 * 后台用户操作
 * 
 * @author Guet
 *
 */
@Controller
@RequestMapping("/admin/premisenews/")
public class AdminPremiseNewsController extends BaseAdminController {

	private final static String path = "admin/premisenews/";

	@Resource
	private IPremiseNewsService premiseNewsService;
	@Resource
	private IPremiseService premiseService;

	@RequestMapping("add.htm")
	@RequiresPermissions("admin:premisenews:add")
	public String addView(ModelMap map) {
		map.put("path", path);
		map.put("premiseList", premiseService.list());
		return path + "add";
	}

	@RequiresPermissions("admin:premisenews:add")
	@ResponseBody
	@RequestMapping("add.json")
	public Map<String, Object> addAction(PremiseNews model) {
		Map<String, Object> map = new HashMap<>();

		model.setUser(getCurUser());

		if (premiseNewsService.save(model)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:premisenews:update")
	@RequestMapping("update/{id}.htm")
	public String updateView(@PathVariable Integer id, ModelMap map) {
		PremiseNews model = premiseNewsService.get(id);
		map.put("path", path);
		map.put("model", model);
		map.put("premiseList", premiseService.list());
		return path + "update";
	}

	@RequiresPermissions("admin:premisenews:update")
	@RequestMapping("update.json")
	@ResponseBody
	public Map<String, Object> updateAction(PremiseNews model) {
		Map<String, Object> map = new HashMap<>();
		model.setUser(getCurUser());
		if (premiseNewsService.update(model)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:premisenews:show")
	@RequestMapping("show/{id}.htm")
	public String showView(@PathVariable Integer id, ModelMap map) {
		PremiseNews model = premiseNewsService.get(id);
		map.put("model", model);
		map.put("path", path);
		return path + "show";
	}

	@RequiresPermissions("admin:premisenews:show")
	@RequestMapping("list/{pageIndex}/{pageSize}.htm")
	public String manager(ModelMap map, @PathVariable Integer pageIndex, @PathVariable Integer pageSize, Integer pid,
			String k) {

		map.put("model", premiseService.get(pid));

		DetachedCriteria dc = DetachedCriteria.forClass(PremiseNews.class);
		dc.add(Restrictions.eq("premise.id", pid));
		if (!StringUtil.strNullOrEmpty(k)) {
			dc.add(Restrictions.ilike("name", k.trim(), MatchMode.ANYWHERE));
		}
		Page<PremiseNews> list = premiseNewsService.list(dc, pageIndex, pageSize);
		map.put("pid", pid);
		map.put("page", list);
		map.put("path", path);
		map.put("key", k);
		return path + "list";
	}

	@RequiresPermissions("admin:premisenews:delete")
	@RequestMapping("deleteById/{id}.json")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable Integer id) {
		Map<String, Object> map = new HashMap<>();
		if (premiseNewsService.deleteById(id, false)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:premisenews:delete")
	@RequestMapping("deleteByIds/{ids}.json")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable String ids) {
		Map<String, Object> map = new HashMap<>();
		List<Integer> arrayId = StringUtil.splitToInt(ids, ",");
		if (premiseNewsService.deleteByIds(arrayId, false)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:premisenews:update")
	@RequestMapping("updatePVById/{p}/{v}/{id}.json")
	@ResponseBody
	public Map<String, Object> updatePVById(@PathVariable String p, @PathVariable Integer v, @PathVariable Integer id) {
		Map<String, Object> map = new HashMap<>();
		if (premiseNewsService.update(p, v, id)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

}
