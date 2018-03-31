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

import com.gm.base.model.BizNews;
import com.gm.base.query.Page;
import com.gm.service.IBizNewsService;
import com.gm.service.sys.IUserService;
import com.gm.utils.StringUtil;

/**
 * 商汇
 * 
 * @author Guet
 *
 */
@Controller
@RequestMapping("/admin/biznews/")
public class AdminBizNewsController extends BaseAdminController {

	private final static String path = "admin/biznews/";

	@Resource
	private IBizNewsService bizNewsService;
	@Resource
	private IUserService userService;

	@RequestMapping("add.htm")
	@RequiresPermissions("admin:biznews:add")
	public String addView(ModelMap map) {

		map.put("path", path);
		map.put("userList", userService.list());
		return path + "add";
	}

	@RequiresPermissions("admin:biznews:add")
	@ResponseBody
	@RequestMapping("add.json")
	public Map<String, Object> addAction(BizNews model) {
		Map<String, Object> map = new HashMap<>();
		model.setUser(getCurUser());
		if (bizNewsService.save(model)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:biznews:update")
	@RequestMapping("update/{id}.htm")
	public String updateView(@PathVariable Integer id, ModelMap map) {
		BizNews model = bizNewsService.get(id);
		map.put("path", path);
		map.put("model", model);
		map.put("userList", userService.list());
		return path + "update";
	}

	@RequiresPermissions("admin:biznews:update")
	@RequestMapping("update.json")
	@ResponseBody
	public Map<String, Object> updateAction(BizNews model) {
		Map<String, Object> map = new HashMap<>();
		if (bizNewsService.update(model)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:biznews:show")
	@RequestMapping("show/{id}.htm")
	public String showView(@PathVariable Integer id, ModelMap map) {
		BizNews model = bizNewsService.get(id);
		map.put("model", model);
		map.put("path", path);
		return path + "show";
	}

	@RequiresPermissions("admin:biznews:show")
	@RequestMapping("list/{pageIndex}/{pageSize}.htm")
	public String manager(ModelMap map, @PathVariable Integer pageIndex, @PathVariable Integer pageSize, String k) {
		DetachedCriteria dc = DetachedCriteria.forClass(BizNews.class);
		if (!StringUtil.strNullOrEmpty(k)) {
			dc.add(Restrictions.ilike("name", k.trim(), MatchMode.ANYWHERE));
		}
		Page<BizNews> list = bizNewsService.list(dc, pageIndex, pageSize);
		map.put("page", list);
		map.put("path", path);
		map.put("key", k);
		return path + "list";
	}

	@RequiresPermissions("admin:biznews:delete")
	@RequestMapping("deleteById/{id}.json")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable Integer id) {
		Map<String, Object> map = new HashMap<>();
		if (bizNewsService.deleteById(id, false)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:biznews:delete")
	@RequestMapping("deleteByIds/{ids}.json")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable String ids) {
		Map<String, Object> map = new HashMap<>();
		List<Integer> arrayId = StringUtil.splitToInt(ids, ",");
		if (bizNewsService.deleteByIds(arrayId, false)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:biznews:update")
	@RequestMapping("updatePVById/{p}/{v}/{id}.json")
	@ResponseBody
	public Map<String, Object> updatePVById(@PathVariable String p, @PathVariable Integer v, @PathVariable Integer id) {
		Map<String, Object> map = new HashMap<>();
		if (bizNewsService.update(p, v, id)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

}
