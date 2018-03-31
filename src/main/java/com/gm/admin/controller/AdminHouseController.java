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

import com.gm.base.model.Comment;
import com.gm.base.model.House;
import com.gm.base.model.Premise;
import com.gm.base.query.Page;
import com.gm.service.ICommentService;
import com.gm.service.IHouseService;
import com.gm.service.IPremiseService;
import com.gm.service.sys.IUserService;
import com.gm.utils.StringUtil;

/**
 * 后台用户操作
 * 
 * @author Guet
 *
 */
@Controller
@RequestMapping("/admin/house/")
public class AdminHouseController extends BaseAdminController {

	private final static String path = "admin/house/";

	@Resource
	private IHouseService houseService;
	@Resource
	private IPremiseService premiseService;
	@Resource
	private IUserService userService;	
	@Resource
	private ICommentService commentService;

	@RequestMapping("add.htm")
	@RequiresPermissions("admin:house:add")
	public String addView(ModelMap map) {

		map.put("path", path);
		map.put("premiseList", premiseService.list());
		return path + "add";
	}

	@RequiresPermissions("admin:house:add")
	@ResponseBody
	@RequestMapping("add.json")
	public Map<String, Object> addAction(House model) {
		Map<String, Object> map = new HashMap<>();
		model.setUser(getCurUser());
		String pics = model.getPics();
		model.setPics(addWaterMark(pics));
		renameDoc(model.getDocs());
		if (houseService.save(model)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:house:update")
	@RequestMapping("update/{id}.htm")
	public String updateView(@PathVariable Integer id, ModelMap map) {
		House model = houseService.get(id);
		map.put("path", path);
		map.put("model", model);
		map.put("userList", userService.list());
		map.put("premiseList", premiseService.list());
		return path + "update";
	}

	@RequiresPermissions("admin:house:update")
	@RequestMapping("update.json")
	@ResponseBody
	public Map<String, Object> updateAction(House model) {
		Map<String, Object> map = new HashMap<>();
		
		String pics = model.getPics();
		model.setPics(addWaterMark(pics));
		renameDoc(model.getDocs());
		if (houseService.update(model)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:house:show")
	@RequestMapping("show/{id}.htm")
	public String showView(@PathVariable Integer id, ModelMap map) {
		House model = houseService.get(id);
		map.put("model", model);
		map.put("path", path);
		return path + "show";
	}

	@RequiresPermissions("admin:house:show")
	@RequestMapping("list/{pageIndex}/{pageSize}.htm")
	public String manager(ModelMap map, @PathVariable Integer pageIndex, @PathVariable Integer pageSize, String k) {
		DetachedCriteria dc = DetachedCriteria.forClass(House.class);
		if (!StringUtil.strNullOrEmpty(k)) {
			dc.createAlias("premise", "premise");
			dc.add(Restrictions.or(Restrictions.ilike("name", k.trim(), MatchMode.ANYWHERE),
					Restrictions.ilike("premise.name", k.trim(), MatchMode.ANYWHERE)));
		}
		Page<House> list = houseService.list(dc, pageIndex, pageSize);
		map.put("page", list);
		map.put("path", path);
		map.put("key", k);
		return path + "list";
	}

	@RequiresPermissions("admin:house:delete")
	@RequestMapping("deleteById/{id}.json")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable Integer id) {
		Map<String, Object> map = new HashMap<>();
		if (houseService.deleteById(id, false)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:house:delete")
	@RequestMapping("deleteByIds/{ids}.json")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable String ids) {
		Map<String, Object> map = new HashMap<>();
		List<Integer> arrayId = StringUtil.splitToInt(ids, ",");
		if (houseService.deleteByIds(arrayId, false)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:house:update")
	@RequestMapping("updatePVById/{p}/{v}/{id}.json")
	@ResponseBody
	public Map<String, Object> updatePVById(@PathVariable String p, @PathVariable Integer v, @PathVariable Integer id) {
		Map<String, Object> map = new HashMap<>();
		if (houseService.update(p, v, id)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}
	@RequiresPermissions("admin:comment:show")
	@RequestMapping("showComment/{id}.htm")
	public String showComment(@PathVariable Integer id, ModelMap map) {
		House model = houseService.get(id);
		map.put("model", model);
		DetachedCriteria dc = DetachedCriteria.forClass(Comment.class);
		dc.add(Restrictions.eq("model", 2));
		dc.add(Restrictions.eq("modelId", id));
		Page<Comment> list = commentService.list(dc, 0, 5);
		map.put("page", list);
		map.put("path", path);
		return path + "comment/list";
	}
	@RequiresPermissions("admin:comment:show")
	@RequestMapping("showSingleComment/{id}.htm")
	public String showSingleComment(@PathVariable Integer id, ModelMap map) {
		Comment model = commentService.get(id);
		map.put("model", model);
		map.put("path", path);
		return path + "comment/show";
	}
	@RequiresPermissions("admin:comment:delete")
	@RequestMapping("comment/deleteById/{id}.json")
	@ResponseBody
	public Map<String, Object> deleteComment(@PathVariable Integer id) {
		Map<String, Object> map = new HashMap<>();
		if (commentService.deleteById(id, false)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:comment:delete")
	@RequestMapping("comment/deleteByIds/{ids}.json")
	@ResponseBody
	public Map<String, Object> deleteComment(@PathVariable String ids) {
		Map<String, Object> map = new HashMap<>();
		List<Integer> arrayId = StringUtil.splitToInt(ids, ",");
		if (commentService.deleteByIds(arrayId, false)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

}
