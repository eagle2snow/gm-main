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

import com.gm.base.model.HouseType;
import com.gm.base.query.Page;
import com.gm.service.IHouseTypeService;
import com.gm.service.IPremiseService;
import com.gm.utils.StringUtil;

/**
 * 后台用户操作
 * 
 * @author Guet
 *
 */
@Controller
@RequestMapping("/admin/housetype/")
public class AdminHouseTypeController extends BaseAdminController {

	private final static String path = "admin/housetype/";

	@Resource
	private IHouseTypeService houseTypeService;
	@Resource
	private IPremiseService premiseService;

	@RequestMapping("add.htm")
	@RequiresPermissions("admin:housetype:add")
	public String addView(ModelMap map) {

		map.put("path", path);
		map.put("premiseList", premiseService.list());
		return path + "add";
	}

	@RequiresPermissions("admin:housetype:add")
	@ResponseBody
	@RequestMapping("add.json")
	public Map<String, Object> addAction(HouseType model) {
		Map<String, Object> map = new HashMap<>();
		if (houseTypeService.save(model)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:housetype:update")
	@RequestMapping("update/{id}.htm")
	public String updateView(@PathVariable Integer id, ModelMap map) {
		HouseType model = houseTypeService.get(id);
		map.put("path", path);
		map.put("model", model);
		map.put("premiseList", premiseService.list());
		return path + "update";
	}

	@RequiresPermissions("admin:housetype:update")
	@RequestMapping("update.json")
	@ResponseBody
	public Map<String, Object> updateAction(HouseType model) {
		Map<String, Object> map = new HashMap<>();
		if (houseTypeService.update(model)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:housetype:show")
	@RequestMapping("show/{id}.htm")
	public String showView(@PathVariable Integer id, ModelMap map) {
		HouseType model = houseTypeService.get(id);
		map.put("model", model);
		map.put("path", path);
		return path + "show";
	}

	@RequiresPermissions("admin:housetype:show")
	@RequestMapping("list/{pageIndex}/{pageSize}.htm")
	public String manager(ModelMap map, @PathVariable Integer pageIndex, @PathVariable Integer pageSize, String k) {
		DetachedCriteria dc = DetachedCriteria.forClass(HouseType.class);
		if (!StringUtil.strNullOrEmpty(k)) {
			dc.createAlias("premise", "premise");
			dc.add(Restrictions.or(Restrictions.ilike("name", k.trim(), MatchMode.ANYWHERE),
					Restrictions.ilike("premise.name", k.trim(), MatchMode.ANYWHERE)));
		}
		Page<HouseType> list = houseTypeService.list(dc, pageIndex, pageSize);
		map.put("page", list);
		map.put("path", path);
		map.put("key", k);
		return path + "list";
	}

	@RequiresPermissions("admin:housetype:delete")
	@RequestMapping("deleteById/{id}.json")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable Integer id) {
		Map<String, Object> map = new HashMap<>();
		if (houseTypeService.deleteById(id, false)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:housetype:delete")
	@RequestMapping("deleteByIds/{ids}.json")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable String ids) {
		Map<String, Object> map = new HashMap<>();
		List<Integer> arrayId = StringUtil.splitToInt(ids, ",");
		if (houseTypeService.deleteByIds(arrayId, false)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:housetype:update")
	@RequestMapping("updatePVById/{p}/{v}/{id}.json")
	@ResponseBody
	public Map<String, Object> updatePVById(@PathVariable String p, @PathVariable Integer v, @PathVariable Integer id) {
		Map<String, Object> map = new HashMap<>();
		if (houseTypeService.update(p, v, id)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

}
