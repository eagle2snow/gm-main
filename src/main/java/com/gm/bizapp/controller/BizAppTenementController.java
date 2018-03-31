package com.gm.bizapp.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.persistence.criteria.Predicate;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gm.base.model.House;
import com.gm.base.model.Premise;
import com.gm.base.model.Tenement;
import com.gm.base.query.Page;
import com.gm.service.ITenementService;
import com.gm.service.INoticeService;
import com.gm.service.sys.IUserService;
import com.gm.utils.StringUtil;

/**
 * 租房
 * 
 * @author ying
 *
 */
@RestController
@RequestMapping("/bizapp/tenement")
public class BizAppTenementController extends BaseBizAppController {

	private static final Logger logger = LoggerFactory.getLogger(BizAppIndexController.class);

	@Resource
	private IUserService userService;

	@Resource
	private ITenementService tenementService;

	@Resource
	private INoticeService noticeService;

	/**
	 * 
	 * @param zone
	 *            区域
	 * @param price
	 *            租金
	 * @param type
	 *            物业类型
	 * @param shi
	 *            室数
	 * @param mat
	 *            配套
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @param k
	 * @return
	 */
	@PostMapping("/list")
	public Map<String, Object> list(Integer zone, Integer price, Integer type, String shi, String mat,
			Integer pageIndex, Integer pageSize, String k) {
		Map<String, Object> map = new HashMap<>();
		DetachedCriteria dc = DetachedCriteria.forClass(Tenement.class);
		dc.add(Restrictions.eq("enable", 1));
		if (zone != 0) {
			dc.add(Restrictions.eq("zone", zone));
		}

		if (1 == price) {
			dc.add(Restrictions.le("price", BigDecimal.valueOf(500)));
		} else if (2 == price) {
			dc.add(Restrictions.between("price", BigDecimal.valueOf(500), BigDecimal.valueOf(700)));
		} else if (3 == price) {
			dc.add(Restrictions.between("price", BigDecimal.valueOf(700), BigDecimal.valueOf(1000)));
		} else if (4 == price) {
			dc.add(Restrictions.between("price", BigDecimal.valueOf(1000), BigDecimal.valueOf(1500)));
		} else if (5 == price) {
			dc.add(Restrictions.between("price", BigDecimal.valueOf(1500), BigDecimal.valueOf(2500)));
		} else if (6 == price) {
			dc.add(Restrictions.ge("price", BigDecimal.valueOf(2500)));
		}

		if (0 != type) {
			dc.add(Restrictions.eq("type", type));
		}
		if (!StringUtil.strNullOrEmpty(shi)) {
			dc.add(Restrictions.in("shi", StringUtil.splitToInt(shi, ",")));
		}

		if (!StringUtil.strNullOrEmpty(mat)) {
			String[] matList = StringUtil.split(mat, ",");
			Criterion[] cc = new Criterion[matList.length];
			for (int i = 0; i < matList.length; i++) {
				cc[i] = Restrictions.like("mat", matList[i], MatchMode.ANYWHERE);
			}
			dc.add(Restrictions.or(cc));
		}

		if (!StringUtil.strNullOrEmpty(k)) {
			dc.add(Restrictions.or(Restrictions.ilike("name", k.trim(), MatchMode.ANYWHERE),
					Restrictions.ilike("content", k.trim(), MatchMode.ANYWHERE)));
		}
		dc.addOrder(Order.asc("isTop"));
		Page<Tenement> page = tenementService.list(dc, pageIndex, pageSize);
		map.put("page", page);
		return map;
	}

	@PostMapping("/show")
	public Map<String, Object> show(Integer id) {
		Map<String, Object> map = new HashMap<>();
		Tenement tenement = tenementService.get(id);
		map.put("Tenement", tenement);
		return map;
	}

	/**
	 * 添加租房
	 * 
	 * @param model
	 * @return
	 */
	@PostMapping("add")
	public Map<String, Object> addAction(Tenement model) {
		Map<String, Object> map = new HashMap<>();
		String pics = model.getPics();
		model.setPics(addWaterMark(pics));
		renameDoc(model.getDocs());
		if (tenementService.save(model)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

}
