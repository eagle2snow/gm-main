package com.gm.bizapp.controller;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.annotation.Resource;

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

import com.gm.base.model.Adviser;
import com.gm.base.model.HouseType;
import com.gm.base.model.Premise;
import com.gm.base.model.PremiseNews;
import com.gm.service.IAdviserService;
import com.gm.service.IHouseService;
import com.gm.service.IHouseTypeService;
import com.gm.service.INoticeService;
import com.gm.service.IPremiseNewsService;
import com.gm.service.IPremiseService;
import com.gm.service.sys.IUserService;
import com.gm.utils.DateUtil;
import com.gm.utils.StringUtil;

/**
 * 楼盘
 * 
 * @author ying
 *
 */
@RestController
@RequestMapping("/bizapp/premise")
public class BizAppPremiseController extends BaseBizAppController {

	private static final Logger logger = LoggerFactory.getLogger(BizAppPremiseController.class);

	@Resource
	private IUserService userService;

	@Resource
	private IHouseService houseService;
	@Resource
	private IHouseTypeService houseTypeService;
	@Resource
	private IPremiseService premiseService;

	@Resource
	private INoticeService noticeService;
	@Resource
	private IAdviserService adviserService;
	@Resource
	private IPremiseNewsService premiseNewsService;

	/**
	 * 楼盘列表
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
	@PostMapping("/list")
	public Map<String, Object> list(Integer zone, Integer price, Integer type, String shi, String k) {
		Map<String, Object> map = new HashMap<>();
		DetachedCriteria dc = DetachedCriteria.forClass(Premise.class);
		dc.add(Restrictions.eq("enable", 1));
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

				Optional<HouseType> minArea = houseTypes.stream()
						.filter(p -> p.getPremise().getId().equals(premise.getId()))
						.max((a, b) -> b.getArea().compareTo(a.getArea()));
				Optional<HouseType> maxArea = houseTypes.stream()
						.filter(p -> p.getPremise().getId().equals(premise.getId()))
						.max((a, b) -> a.getArea().compareTo(b.getArea()));

				String rangeArea = "暂无户型";
				String rangeShi = "";
				String minPrice = "";
				if (minArea.isPresent()) {
					if (minArea.equals(maxArea)) {
						rangeArea = minArea.get().getArea() + "㎡";
					} else {
						rangeArea = minArea.get().getArea() + "-" + maxArea.get().getArea() + "㎡";
					}

					Integer minShi = houseTypes.stream().filter(p -> p.getPremise().getId().equals(premise.getId()))
							.max((a, b) -> b.getShi().compareTo(a.getShi())).get().getShi();
					Integer maxShi = houseTypes.stream().filter(p -> p.getPremise().getId().equals(premise.getId()))
							.max((a, b) -> a.getShi().compareTo(b.getShi())).get().getShi();

					if (minShi.equals(maxShi)) {
						rangeShi = minShi + "室";
					} else {
						rangeShi = minShi + "-" + maxShi + "室";
					}

					minPrice = BigDecimal.valueOf(minArea.get().getArea()).multiply(premise.getAvgPrice())
							.divide(BigDecimal.valueOf(10000)).setScale(2, BigDecimal.ROUND_DOWN) + "万起";
				}
				premise.setRangeArea(rangeArea);
				premise.setRangeShi(rangeShi);
				premise.setMinPrice(minPrice);
			}
		}

		map.put("list", list);
		return map;
	}

	/**
	 * 楼盘详情
	 * 
	 * @param id
	 * @return
	 */
	@PostMapping("/show")
	public Map<String, Object> show(Integer id) {
		Map<String, Object> map = new HashMap<>();
		Premise premise = premiseService.get(id);
		map.put("premise", premise);
		List<HouseType> types = houseTypeService
				.list(" from houseType ht where ht.deleted=1 and ht.enable=1 and ht.premise.id=" + id);
		List<Adviser> advisers = adviserService
				.list(" from adviser a where a.deleted=1 and a.enable=1 and  a.premise.id=" + id);
		map.put("types", types);
		map.put("advisers", advisers);
		return map;
	}

	/**
	 * 动态列表
	 * 
	 * @param id
	 *            楼盘id
	 * @return
	 */
	@RequestMapping("/listPremiseNews")
	public Map<String, Object> listPremiseNews(Integer id) {
		Map<String, Object> map = new HashMap<>();
		Premise premise = premiseService.get(id);
		map.put("premise", premise);
		List premiseNews = premiseNewsService.go().eq("deleted", 1).eq("enable", 1).eq("premise.id", id).pq("id")
				.pq("name").pq("createTime").pq("content").pqList();
		List<Map<String, Object>> list = new ArrayList<>();
		for (Object object : premiseNews) {
			Map<String, Object> map2 = new HashMap<>();
			HashMap<Object, Object> o = (HashMap<Object, Object>) object;
			Integer nid = (Integer) o.get("id");
			String name = (String) o.get("name");
			LocalDateTime createTime = (LocalDateTime) o.get("createTime");
			String content = (String) o.get("content");
			map2.put("id", nid);
			map2.put("name", name);
			map2.put("createTime", DateUtil.convertDateTimeToStr(createTime));

			System.out.println(DateUtil.convertDateTimeToStr(createTime));

			map2.put("content", content);
			list.add(map2);
		}
		map.put("premiseNews", list);
		return map;
	}

	/**
	 * 动态详情
	 * 
	 * @param id
	 *            动态id
	 * @return
	 */
	@PostMapping("/showPremiseNews")
	public Map<String, Object> showPremiseNews(Integer id) {
		Map<String, Object> map = new HashMap<>();
		PremiseNews premiseNews = premiseNewsService.get(id);
		map.put("premiseNews", premiseNews);
		return map;
	}

	/**
	 * 添加楼盘
	 * 
	 * @param model
	 * @return
	 */
	@PostMapping("add")
	public Map<String, Object> addAction(Premise model) {
		Map<String, Object> map = new HashMap<>();
		String pics = model.getPics();
		model.setPics(addWaterMark(pics));
		if (premiseService.save(model)) {
			map.put("status", "ok");
		} else {
			map.put("status", "no");
		}
		return map;
	}

	/**
	 * 所有楼盘
	 * 
	 * @return
	 */
	@PostMapping("listAll")
	public Map<String, Object> listAll() {
		Map<String, Object> map = new HashMap<>();
		map.put("list", premiseService.go().pq("id").pq("name").pqList());
		return map;
	}
	
	/**
	 * 所有楼盘
	 * 
	 * @return
	 */
	@PostMapping("listByName")
//	@GetMapping("listByName")
	public Map<String, Object> listByName(String name) {
		Map<String, Object> map = new HashMap<>();
		
//		map.put("list", premiseService.go().pq("id").pq("name").eq("name",name).pqList());
		DetachedCriteria dc = DetachedCriteria.forClass(Premise.class);
		dc.add(Restrictions.eq("enable", 1));
		
		if (!StringUtil.strNullOrEmpty(name)) {
			dc.add(Restrictions.or(Restrictions.ilike("name", name.trim(), MatchMode.ANYWHERE)));
		}
		
		List<Premise> list = premiseService.list(dc);
		List<Map<String, Object>> plist = new ArrayList<>();
		list.forEach(p->{
			Map<String,Object> pmap = new HashMap<>();
			pmap.put("id", p.getId());
			pmap.put("name", p.getName());
			plist.add(pmap);
		});
		map.put("plist",plist);
		return map;
	}

}
