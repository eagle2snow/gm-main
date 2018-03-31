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

import com.gm.base.model.Villa;
import com.gm.base.query.Page;
import com.gm.service.IPremiseService;
import com.gm.service.IVillaService;
import com.gm.utils.StringUtil;

/**
 * 后台用户操作
 * 
 * @author Guet
 *
 */
@Controller
@RequestMapping("/admin/villa/")
public class AdminVillaController extends BaseAdminController{

	private final static String path = "admin/villa/";

	@Resource
	private IVillaService villaService;
	 @Resource private IPremiseService premiseService; 

	@RequestMapping("add.htm")
	@RequiresPermissions("admin:villa:add")
	public String addView(ModelMap map) {
		
		map.put("path", path);
		map.put("premiseList",premiseService.list());
		return path + "add";
	}

	
	@RequiresPermissions("admin:villa:add")
	@ResponseBody
	@RequestMapping("add.json")
	public Map<String, Object> addAction(Villa model) {
		Map<String, Object> map = new HashMap<>();
		if (villaService.save(model)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	
	@RequiresPermissions("admin:villa:update")
	@RequestMapping("update/{id}.htm")
	public String updateView(@PathVariable Integer id, ModelMap map) {
		Villa model = villaService.get(id);
		map.put("path", path);
		map.put("model", model);
		map.put("premiseList",premiseService.list());
		return path + "update";
	}

	
	@RequiresPermissions("admin:villa:update")
	@RequestMapping("update.json")
	@ResponseBody
	public Map<String, Object> updateAction(Villa model) {
		Map<String, Object> map = new HashMap<>();
		if (villaService.update(model)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	
	@RequiresPermissions("admin:villa:show")
	@RequestMapping("show/{id}.htm")
	public String showView(@PathVariable Integer id, ModelMap map) {
		Villa model = villaService.get(id);
		map.put("model", model);
		map.put("path", path);
		return path + "show";
	}

	
	
	@RequiresPermissions("admin:villa:show")
	@RequestMapping("list/{pageIndex}/{pageSize}.htm")
	public String manager(ModelMap map, @PathVariable Integer pageIndex, @PathVariable Integer pageSize,String k) {
		DetachedCriteria dc = DetachedCriteria.forClass(Villa.class);
		if (!StringUtil.strNullOrEmpty(k)) {
			dc.add(Restrictions.ilike("name", k.trim(),MatchMode.ANYWHERE));
		}
		Page<Villa> list = villaService.list(dc, pageIndex, pageSize);
		map.put("page", list);
		map.put("path", path);
		map.put("key", k);
		return path + "list";
	}

	
	@RequiresPermissions("admin:villa:delete")
	@RequestMapping("deleteById/{id}.json")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable Integer id) {
		Map<String, Object> map = new HashMap<>();
		if (villaService.deleteById(id, false)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	
	@RequiresPermissions("admin:villa:delete")
	@RequestMapping("deleteByIds/{ids}.json")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable String ids) {
		Map<String, Object> map = new HashMap<>();
		List<Integer> arrayId = StringUtil.splitToInt(ids, ",");
		if (villaService.deleteByIds(arrayId, false)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}
	
	@RequiresPermissions("admin:villa:update")
	@RequestMapping("updatePVById/{p}/{v}/{id}.json")
	@ResponseBody
	public Map<String, Object> updatePVById(@PathVariable String p, @PathVariable Integer v, @PathVariable Integer id) {
		Map<String, Object> map = new HashMap<>();
		if (villaService.update(p, v, id)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}
	
}
