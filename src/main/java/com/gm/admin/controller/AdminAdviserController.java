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

import com.gm.base.model.Adviser;
import com.gm.base.query.Page;
import com.gm.service.IAdviserService;
import com.gm.service.IPremiseService;
import com.gm.utils.StringUtil;

/**
 * 后台用户操作
 * 
 * @author Guet
 *
 */
@Controller
@RequestMapping("/admin/adviser/")
public class AdminAdviserController extends BaseAdminController {

	private final static String path = "admin/adviser/";

	@Resource
	private IAdviserService adviserService;
	@Resource
	private IPremiseService premiseService;

	@RequestMapping("add.htm")
	@RequiresPermissions("admin:adviser:add")
	public String addView(ModelMap map) {

		map.put("path", path);
		map.put("premiseList", premiseService.list());
		return path + "add";
	}

	@RequiresPermissions("admin:adviser:add")
	@ResponseBody
	@RequestMapping("add.json")
	public Map<String, Object> addAction(Adviser model) {
		Map<String, Object> map = new HashMap<>();
		if (adviserService.save(model)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:adviser:update")
	@RequestMapping("update/{id}.htm")
	public String updateView(@PathVariable Integer id, ModelMap map) {
		Adviser model = adviserService.get(id);
		map.put("path", path);
		map.put("model", model);
		map.put("premiseList", premiseService.list());
		return path + "update";
	}

	@RequiresPermissions("admin:adviser:update")
	@RequestMapping("update.json")
	@ResponseBody
	public Map<String, Object> updateAction(Adviser model) {
		Map<String, Object> map = new HashMap<>();
		if (adviserService.update(model)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:adviser:show")
	@RequestMapping("show/{id}.htm")
	public String showView(@PathVariable Integer id, ModelMap map) {
		Adviser model = adviserService.get(id);
		map.put("model", model);
		map.put("path", path);
		return path + "show";
	}

	@RequiresPermissions("admin:adviser:show")
	@RequestMapping("list/{pageIndex}/{pageSize}.htm")
	public String manager(ModelMap map, @PathVariable Integer pageIndex, @PathVariable Integer pageSize, String k) {
		DetachedCriteria dc = DetachedCriteria.forClass(Adviser.class);
		if (!StringUtil.strNullOrEmpty(k)) {
			dc.createAlias("premise", "premise");
			dc.add(Restrictions.or(Restrictions.ilike("name", k.trim(), MatchMode.ANYWHERE),
					Restrictions.ilike("premise.name", k.trim(), MatchMode.ANYWHERE)));
		}
		Page<Adviser> list = adviserService.list(dc, pageIndex, pageSize);
		map.put("page", list);
		map.put("path", path);
		map.put("key", k);
		return path + "list";
	}

	@RequiresPermissions("admin:adviser:delete")
	@RequestMapping("deleteById/{id}.json")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable Integer id) {
		Map<String, Object> map = new HashMap<>();
		if (adviserService.deleteById(id, false)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:adviser:delete")
	@RequestMapping("deleteByIds/{ids}.json")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable String ids) {
		Map<String, Object> map = new HashMap<>();
		List<Integer> arrayId = StringUtil.splitToInt(ids, ",");
		if (adviserService.deleteByIds(arrayId, false)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:adviser:update")
	@RequestMapping("updatePVById/{p}/{v}/{id}.json")
	@ResponseBody
	public Map<String, Object> updatePVById(@PathVariable String p, @PathVariable Integer v, @PathVariable Integer id) {
		Map<String, Object> map = new HashMap<>();
		if (adviserService.update(p, v, id)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

}
