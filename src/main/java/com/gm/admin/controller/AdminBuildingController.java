package com.gm.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.hibernate.tool.schema.spi.DelayedDropAction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gm.base.model.Building;
import com.gm.base.model.BuildingHouseType;
import com.gm.base.model.HouseType;
import com.gm.base.query.Page;
import com.gm.service.IBuildingHouseTypeService;
import com.gm.service.IBuildingService;
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
@RequestMapping("/admin/building/")
public class AdminBuildingController extends BaseAdminController {

	private final static String path = "admin/building/";

	@Resource
	private IBuildingService buildingService;
	@Resource
	private IPremiseService premiseService;
	@Resource
	private IHouseTypeService houseTypeService;
	@Resource
	private IBuildingHouseTypeService buildingHouseTypeService;

	@RequestMapping("add.htm")
	@RequiresPermissions("admin:building:add")
	public String addView(ModelMap map) {
		map.put("path", path);
		map.put("premiseList", premiseService.list());
		return path + "add";
	}

	@RequiresPermissions("admin:building:add")
	@ResponseBody
	@RequestMapping("add.json")
	public Map<String, Object> addAction(Building model, String houseTypeIds) {
		Map<String, Object> map = new HashMap<>();
		if (buildingService.save(model, houseTypeIds)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequestMapping("getHouseType/{premiseId}")
	@ResponseBody
	public List<HouseType> getHouseType(@PathVariable Integer premiseId) {
		return houseTypeService.listEq("premise.id", premiseId);
	}

	@RequiresPermissions("admin:building:update")
	@RequestMapping("update/{id}.htm")
	public String updateView(@PathVariable Integer id, ModelMap map) {
		Building model = buildingService.get(id);
		map.put("path", path);
		map.put("model", model);
		map.put("premiseList", premiseService.list());

		List<HouseType> types = houseTypeService.listEq("premise.id", model.getPremise().getId());
		List<BuildingHouseType> buildingHouseTypes = buildingHouseTypeService.listEq("building.id", id);
		List<HouseType> hadTypes = buildingHouseTypes.stream().map(BuildingHouseType::getHouseType)
				.collect(Collectors.toList());
		types.forEach(t -> t.setHad(hadTypes.contains(t)));

		map.put("types", types);
		return path + "update";
	}

	@RequiresPermissions("admin:building:update")
	@RequestMapping("update.json")
	@ResponseBody
	public Map<String, Object> updateAction(Building model, String houseTypeIds) {
		Map<String, Object> map = new HashMap<>();
		if (buildingService.update(model, houseTypeIds)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:building:show")
	@RequestMapping("show/{id}.htm")
	public String showView(@PathVariable Integer id, ModelMap map) {
		Building model = buildingService.get(id);
		map.put("model", model);
		map.put("path", path);
		return path + "show";
	}

	@RequiresPermissions("admin:building:show")
	@RequestMapping("list/{pageIndex}/{pageSize}.htm")
	public String manager(ModelMap map, @PathVariable Integer pageIndex, @PathVariable Integer pageSize, String k) {
		DetachedCriteria dc = DetachedCriteria.forClass(Building.class);
		if (!StringUtil.strNullOrEmpty(k)) {
			dc.add(Restrictions.ilike("name", k.trim(), MatchMode.ANYWHERE));
		}
		Page<Building> list = buildingService.list(dc, pageIndex, pageSize);
		map.put("page", list);
		map.put("path", path);
		map.put("key", k);
		return path + "list";
	}

	@RequiresPermissions("admin:building:delete")
	@RequestMapping("deleteById/{id}.json")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable Integer id) {
		Map<String, Object> map = new HashMap<>();
		if (buildingService.deleteById(id, false)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:building:delete")
	@RequestMapping("deleteByIds/{ids}.json")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable String ids) {
		Map<String, Object> map = new HashMap<>();
		List<Integer> arrayId = StringUtil.splitToInt(ids, ",");
		if (buildingService.deleteByIds(arrayId, false)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequiresPermissions("admin:building:update")
	@RequestMapping("updatePVById/{p}/{v}/{id}.json")
	@ResponseBody
	public Map<String, Object> updatePVById(@PathVariable String p, @PathVariable Integer v, @PathVariable Integer id) {
		Map<String, Object> map = new HashMap<>();
		if (buildingService.update(p, v, id)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

}
