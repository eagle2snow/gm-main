package com.gm.bizapp.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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

import com.gm.base.model.House;
import com.gm.base.model.HouseType;
import com.gm.base.model.Premise;
import com.gm.base.query.Page;
import com.gm.service.IHouseService;
import com.gm.service.IHouseTypeService;
import com.gm.service.IPremiseService;
import com.gm.utils.StringUtil;

/**
 * 特价房
 * 
 * @author ying
 *
 */
@RestController
@RequestMapping("/bizapp/onSale")
public class BizAppOnSaleController extends BaseBizAppController {

	private static final Logger logger = LoggerFactory.getLogger(BizAppOnSaleController.class);

	@Resource
	private IPremiseService premiseService;
	@Resource
	private IHouseService houseService;
	@Resource
	private IHouseTypeService houseTypeService;

	/**
	 * 特价新房
	 * 
	 * @param zone
	 *            区域
	 * @param price
	 *            单价
	 * @param type
	 *            物业类型
	 * @param shi
	 *            户型字串
	 * @param pageIndex
	 * @param pageSize
	 * @param k
	 * @return
	 */
	@PostMapping("/listPremise")
	public Map<String, Object> listPremise(Integer zone, Integer price, Integer type, String shi, String k) {
		Map<String, Object> map = new HashMap<>();
		DetachedCriteria dc = DetachedCriteria.forClass(Premise.class);
		dc.add(Restrictions.eq("enable", 1));
		dc.add(Restrictions.eq("onSale", 1));
		if (zone != 0) {
			dc.add(Restrictions.eq("zone", zone));
		}

		if (1 == price) {
			dc.add(Restrictions.le("avgPrice", BigDecimal.valueOf(5000)));
		} else if (2 == price) {
			dc.add(Restrictions.between("avgPrice", BigDecimal.valueOf(5000), BigDecimal.valueOf(6000)));
		} else if (3 == price) {
			dc.add(Restrictions.between("avgPrice", BigDecimal.valueOf(6000), BigDecimal.valueOf(8000)));
		} else if (4 == price) {
			dc.add(Restrictions.between("avgPrice", BigDecimal.valueOf(8000), BigDecimal.valueOf(10000)));
		} else if (5 == price) {
			dc.add(Restrictions.ge("avgPrice", BigDecimal.valueOf(10000)));
		}

		if (0 != type) {
			dc.add(Restrictions.eq("type", type));
		}
		if (!StringUtil.strNullOrEmpty(shi)) {
			List<HouseType> houseTypes = houseTypeService.listIn("shi", shi);
			if (houseTypes.size() > 0) {
				List<Integer> ids = houseTypes.stream().map(HouseType::getPremise).map(Premise::getId)
						.collect(Collectors.toList());
				dc.add(Restrictions.in("id", ids));
			}
		}

		if (!StringUtil.strNullOrEmpty(k)) {
			dc.add(Restrictions.or(Restrictions.ilike("name", k.trim(), MatchMode.ANYWHERE),
					Restrictions.ilike("content", k.trim(), MatchMode.ANYWHERE)));
		}
		dc.addOrder(Order.asc("isTop"));
		List<Premise> list = premiseService.list(dc);
		if (list.size() > 0) {
			List<Integer> pids = list.parallelStream().map(Premise::getId).collect(Collectors.toList());
			List<HouseType> houseTypes = houseTypeService.listIn("premise.id", pids);
			for (Premise premise : list) {

				Integer minArea = houseTypes.stream().max((a, b) -> b.getArea().compareTo(a.getArea())).get().getArea();
				Integer maxArea = houseTypes.stream().max((a, b) -> a.getArea().compareTo(b.getArea())).get().getArea();

				String rangeArea = "";
				if (minArea.equals(maxArea)) {
					rangeArea = minArea + "㎡";
				} else {
					rangeArea = minArea + "-" + maxArea + "㎡";
				}
				premise.setRangeArea(rangeArea);

				Integer minShi = houseTypes.stream().max((a, b) -> b.getShi().compareTo(a.getShi())).get().getShi();
				Integer maxShi = houseTypes.stream().max((a, b) -> a.getShi().compareTo(b.getShi())).get().getShi();
				String rangeShi = "";
				if (minShi.equals(maxShi)) {
					rangeShi = minShi + "室";
				} else {
					rangeShi = minShi + "-" + maxShi + "室";
				}
				premise.setRangeShi(rangeShi);

				String minPrice = BigDecimal.valueOf(minArea).multiply(premise.getAvgPrice())
						.divide(BigDecimal.valueOf(10000)).setScale(2, BigDecimal.ROUND_DOWN) + "万起";
				premise.setMinPrice(minPrice);
			}
		}
		map.put("list", list);
		return map;
	}

	/**
	 * 特价二手房
	 * 
	 * @param zone
	 *            区域
	 * @param price
	 *            价格
	 * @param type
	 *            物业类型
	 * @param shi
	 *            户型
	 * @param pageIndex
	 * @param pageSize
	 * @param k
	 * @return
	 */
	@PostMapping("/listHouse")
	public Map<String, Object> listHouse(Integer zone, Integer price, Integer type, String shi, String k) {
		Map<String, Object> map = new HashMap<>();
		DetachedCriteria dc = DetachedCriteria.forClass(House.class);
		dc.add(Restrictions.eq("enable", 1));
		dc.add(Restrictions.eq("onSale", 1));
		if (zone != 0) {
			dc.add(Restrictions.eq("zone", zone));
		}

		if (1 == price) {
			dc.add(Restrictions.le("price", BigDecimal.valueOf(50)));
		} else if (2 == price) {
			dc.add(Restrictions.between("price", BigDecimal.valueOf(50), BigDecimal.valueOf(100)));
		} else if (3 == price) {
			dc.add(Restrictions.between("price", BigDecimal.valueOf(100), BigDecimal.valueOf(150)));
		} else if (4 == price) {
			dc.add(Restrictions.between("price", BigDecimal.valueOf(150), BigDecimal.valueOf(200)));
		} else if (5 == price) {
			dc.add(Restrictions.between("price", BigDecimal.valueOf(200), BigDecimal.valueOf(300)));
		} else if (6 == price) {
			dc.add(Restrictions.between("price", BigDecimal.valueOf(300), BigDecimal.valueOf(400)));
		} else if (7 == price) {
			dc.add(Restrictions.between("price", BigDecimal.valueOf(400), BigDecimal.valueOf(600)));
		} else if (8 == price) {
			dc.add(Restrictions.between("price", BigDecimal.valueOf(600), BigDecimal.valueOf(800)));
		} else if (9 == price) {
			dc.add(Restrictions.between("price", BigDecimal.valueOf(800), BigDecimal.valueOf(1000)));
		} else if (10 == price) {
			dc.add(Restrictions.ge("price", BigDecimal.valueOf(1000)));
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
		List<House> list = houseService.list(dc);
		map.put("list", list);
		return map;
	}

}
