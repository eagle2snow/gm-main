package com.gm.bizapp.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gm.base.model.DuanZu;
import com.gm.base.model.House;
import com.gm.base.model.Premise;
import com.gm.base.query.Page;
import com.gm.service.IDuanZuService;
import com.gm.service.IHouseService;
import com.gm.service.INoticeService;
import com.gm.service.sys.IUserService;
import com.gm.utils.StringUtil;

/**
 * 短租房
 * 
 * @author ying
 *
 */
@RestController
@RequestMapping("/bizapp/duanzu")
public class BizAppDuanzuController extends BaseBizAppController {

	private static final Logger logger = LoggerFactory.getLogger(BizAppDuanzuController.class);

	@Resource
	private IDuanZuService duanZuService;

	/**
	 * 
	 * @param zone
	 *            区域
	 * @param price
	 *            日租
	 * @param type
	 *            物业类型
	 * @param shi
	 *            户型
	 * @param pageIndex
	 * @param pageSize
	 * @param k
	 * @return
	 */
	@PostMapping("/list")
	public Map<String, Object> list(Integer zone, Integer price, Integer type, String shi, Integer pageIndex,
			Integer pageSize, String k) {
		Map<String, Object> map = new HashMap<>();
		DetachedCriteria dc = DetachedCriteria.forClass(DuanZu.class);
		dc.add(Restrictions.eq("enable", 1));
		if (zone != 0) {
			dc.add(Restrictions.eq("zone", zone));
		}

		if (1 == price) {
			dc.add(Restrictions.le("price", BigDecimal.valueOf(50)));
		} else if (2 == price) {
			dc.add(Restrictions.between("price", BigDecimal.valueOf(50), BigDecimal.valueOf(80)));
		} else if (3 == price) {
			dc.add(Restrictions.between("price", BigDecimal.valueOf(80), BigDecimal.valueOf(100)));
		} else if (4 == price) {
			dc.add(Restrictions.between("price", BigDecimal.valueOf(100), BigDecimal.valueOf(120)));
		} else if (5 == price) {
			dc.add(Restrictions.between("price", BigDecimal.valueOf(120), BigDecimal.valueOf(150)));
		} else if (10 == price) {
			dc.add(Restrictions.ge("price", BigDecimal.valueOf(150)));
		}

		if (0 != type) {
			dc.add(Restrictions.eq("type", type));
		}
		if (!StringUtil.strNullOrEmpty(shi)) {
			dc.add(Restrictions.in("shi", StringUtil.splitToInt(shi, ",")));
		}

		if (!StringUtil.strNullOrEmpty(k)) {
			dc.add(Restrictions.or(Restrictions.ilike("name", k.trim(), MatchMode.ANYWHERE),
					Restrictions.ilike("content", k.trim(), MatchMode.ANYWHERE)));
		}

		dc.addOrder(Order.asc("isTop"));

		Page<DuanZu> page = duanZuService.list(dc, pageIndex, pageSize);
		map.put("page", page);
		return map;
	}

	@PostMapping("/show")
	public Map<String, Object> show(Integer id) {
		Map<String, Object> map = new HashMap<>();
		DuanZu duanZu = duanZuService.get(id);
		map.put("duanZu", duanZu);
		return map;
	}

	/**
	 * 添加二手房
	 * 
	 * @param model
	 * @return
	 */
	@PostMapping("add")
	public Map<String, Object> addAction(DuanZu model) {
		Map<String, Object> map = new HashMap<>();
		String pics = model.getPics();
		model.setPics(addWaterMark(pics));
		renameDoc(model.getDocs());
		if (duanZuService.save(model)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

}
