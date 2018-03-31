package com.gm.bizapp.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gm.base.model.Adviser;
import com.gm.base.model.HouseType;
import com.gm.base.model.sys.User;
import com.gm.service.IAdviserService;
import com.gm.service.IHouseTypeService;
import com.gm.service.IPremiseService;
import com.xiaoleilu.hutool.util.RandomUtil;

/**
 * 户型
 *
 */
@RestController
@RequestMapping("/bizapp/housetype/")
public class BizAppHouseTypeController extends BaseBizAppController {

	@Resource
	private IHouseTypeService houseTypeService;
	@Resource
	private IPremiseService premiseService;
	@Resource
	private IAdviserService adviserService;

	@RequestMapping("add")
	public Map<String, Object> addAction(HouseType model) {
		Map<String, Object> map = new HashMap<>();
		String pics = model.getPics();
		model.setPics(addWaterMark(pics));
		if (houseTypeService.save(model)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	@RequestMapping("update")
	public Map<String, Object> updateAction(HouseType model) {
		Map<String, Object> map = new HashMap<>();
		if (houseTypeService.update(model)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	/**
	 * 户型详情
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/show")
	public Map<String, Object> show(Integer id) {
		Map<String, Object> map = new HashMap<>();
		HouseType houseType = houseTypeService.get(id);
		List<Adviser> advisers = adviserService.listEq("premise.id", id);
		List<HouseType> list = houseTypeService.list(
				" from houseType ht where ht.deleted=1 and ht.premise.id=" + houseType.getPremise().getId() + " and ht.id !=" + id);
		map.put("houseType", houseType);
		map.put("advisers", advisers);
		map.put("list", list);
		return map;
	}

	/**
	 * 根据楼盘id获取户型列表
	 * 
	 * @return
	 */
	@RequestMapping("listByPremiseId")
	public Map<String, Object> list(Integer premiseId) {
		Map<String, Object> map = new HashMap<>();
		List<HouseType> list = houseTypeService.listEq("premise.id", premiseId);
		map.put("list", list);
		return map;
	}

	@RequestMapping("deleteById")
	public Map<String, Object> delete(Integer id) {
		Map<String, Object> map = new HashMap<>();
		if (houseTypeService.deleteById(id, false)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;

	}
}
