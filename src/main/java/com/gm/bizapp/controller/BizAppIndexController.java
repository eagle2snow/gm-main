package com.gm.bizapp.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gm.api.websocket.WebSokectSender;
import com.gm.base.dto.Top;
import com.gm.base.model.AppInfo;
import com.gm.base.model.DuanZu;
import com.gm.base.model.House;
import com.gm.base.model.HouseType;
import com.gm.base.model.Premise;
import com.gm.base.model.Tenement;
import com.gm.base.model.sys.User;
import com.gm.base.query.Page;
import com.gm.service.IAdvService;
import com.gm.service.IAppInfoService;
import com.gm.service.IDuanZuService;
import com.gm.service.IHouseService;
import com.gm.service.IHouseTypeService;
import com.gm.service.INoticeService;
import com.gm.service.IPremiseService;
import com.gm.service.IStoreService;
import com.gm.service.ITenementService;
import com.gm.service.sys.IUserService;
import com.gm.utils.StringUtil;

/**
 * 首页
 * 
 * @author ying
 *
 */
@RestController
@RequestMapping("/bizapp")
public class BizAppIndexController extends BaseBizAppController {

	private static final Logger logger = LoggerFactory.getLogger(BizAppIndexController.class);

	@Resource
	private WebSokectSender sender;
	@Resource
	private IUserService userService;
	@Resource
	private IHouseService houseService;
	@Resource
	private IPremiseService premiseService;
	@Resource
	private ITenementService tenementService;
	@Resource
	private INoticeService noticeService;
	@Resource
	private IDuanZuService duanZuService;
	@Resource
	private IAdvService advService;
	@Resource
	private IHouseTypeService houseTypeService;
	@Resource
	private IStoreService storeService;
	
	@Resource
	private IAppInfoService appInfoService;

	/**
	 * 注册
	 * 
	 * @param model
	 * @param resStr
	 * @return
	 */
	@RequestMapping("regAction")
	public Map<String, Object> addAction(User model) {
		Map<String, Object> map = new HashMap<>();

		boolean a = userService.exist("imei", model.getImei());
		if (a) {
			map.put("s", "注册失败，当前设备已被注册");
			return map;
		}
		boolean b = userService.exist("username", model.getUsername());
		if (b) {
			map.put("s", "注册失败，已存在此用户名的员工");
			return map;
		}

		boolean c = userService.exist("mobile", model.getMobile());
		if (c) {
			map.put("s", "注册失败，已存在此手机号的员工");
			return map;
		}

		if (userService.save(model)) {
			map.put("s", "ok");
		} else {
			map.put("s", "注册失败，后台异常");
		}
		return map;
	}

	/**
	 * 登录
	 * 
	 * @param username
	 * @param password
	 * @param imei
	 * @param request
	 * @return
	 */
	@PostMapping("/loginAction")
	public Map<String, Object> loginAction(String username, String password, String imei, HttpServletRequest request) {
		Map<String, Object> map = userService.login(username, password, imei);
		return map;
	}

	/**
	 * 扫完二维码后触发
	 * 
	 * @param uuid
	 * @return
	 */
	@RequestMapping("/scanQrEvtent")
	@ResponseBody
	public String qrLogin(String uuid) {
		sender.appSendScanQrEvtToAdminPc(uuid);
		return "{\"s\":\"ok\"}";
	}

	/**
	 * 二维码登录确认后
	 * 
	 * @param uuid
	 * @return
	 */
	@RequestMapping("/qrLogin.json")
	@ResponseBody
	public String qrLogin(String uuid, String userId, Integer enable, HttpServletRequest request) {
		sender.appSendAuthToAdminPc(uuid, enable);
		ServletContext application = request.getServletContext();
		application.setAttribute(uuid, userId + "@" + enable);
		return "{\"s\":\"ok\"}";
	}

	@PostMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "";
	}

	@RequestMapping("/index")
	public Map<String, Object> index() {
		Map<String, Object> map = new HashMap<>();
		List<Premise> premises = premiseService
				.list("from premise p where p.enable=1 and p.deleted=1 order by isTop asc ", 5);

		if (premises.size() > 0) {
			List<Integer> pids = premises.parallelStream().map(Premise::getId).collect(Collectors.toList());
			List<HouseType> houseTypes = houseTypeService.listIn("premise.id", pids);
			for (Premise premise : premises) {

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

		List<House> houses = houseService.list("from house p where p.enable=1 and p.deleted=1 order by isTop asc ", 5);

		List<Tenement> tenements = tenementService
				.list("from tenement p where p.enable=1 and p.deleted=1 order by isTop asc ", 5);

		List notices = noticeService.go().pq("id").pq("name").eq("enable", 1).pqList(5);

		List advs = advService.go().pq("id").pq("name").pq("pic").pq("type").pq("src").ne("pic", "").eq("enable", 1)
				.pqList(10);

		map.put("premises", premises);
		map.put("houses", houses);
		map.put("tenements", tenements);
		map.put("notices", notices);
		map.put("advs", advs);

		List<Top> tops = new ArrayList<>();

		List<Premise> premiseTops = premiseService.listEq("slider", 1);

		for (Premise p : premiseTops) {
			Top top = new Top();
			top.setId(p.getId());
			top.setType(1);
			top.setPic(p.getPic());
			tops.add(top);
		}

		List<House> housesTops = houseService.listEq("slider", 1);

		for (House p : housesTops) {
			Top top = new Top();
			top.setId(p.getId());
			top.setType(2);
			top.setPic(p.getPic());
			tops.add(top);
		}

		List<Tenement> tenementTops = tenementService.listEq("slider", 1);

		for (Tenement p : tenementTops) {
			Top top = new Top();
			top.setId(p.getId());
			top.setType(3);
			top.setPic(p.getPic());
			tops.add(top);
		}

		List<DuanZu> duanZuTops = duanZuService.listEq("slider", 1);

		for (DuanZu d : duanZuTops) {
			Top top = new Top();
			top.setId(d.getId());
			top.setType(4);
			top.setPic(d.getPic());
			tops.add(top);
		}
		map.put("tops", tops);

		return map;
	}

	@PostMapping("/premise")
	public Map<String, Object> premise(Integer pageIndex, Integer pageSize, String k) {
		Map<String, Object> map = new HashMap<>();
		DetachedCriteria dc = DetachedCriteria.forClass(Premise.class);
		if (!StringUtil.strNullOrEmpty(k)) {
			dc.add(Restrictions.or(Restrictions.ilike("name", k.trim(), MatchMode.ANYWHERE),
					Restrictions.ilike("content", k.trim(), MatchMode.ANYWHERE)));
		}
		Page<Premise> page = premiseService.list(dc, pageIndex, pageSize);
		map.put("page", page);
		return map;
	}

	/**
	 * 获取所有门店
	 * 
	 * @return
	 */
	@PostMapping("/getStore")
	public Map<String, Object> getStore() {
		Map<String, Object> map = new HashMap<>();
		map.put("stores", storeService.go().pq("id").pq("name").pqList());
		return map;
	}
	
	/**
	 * 检查更新
	 * 
	 * @param type
	 *            类型，1用户版，2商家版
	 * @param platform
	 *            平台，1安卓，2苹果
	 * @return
	 */

	@RequestMapping(value = "/checkVersion", produces = "application/json;charset=UTF-8")
	public Map<String, Object> checkVersion(Integer type, Integer platform) {
		Map<String, Object> map = new HashMap<>();

		AppInfo appInfo = appInfoService
				.getOne("FROM appInfo b where b.versionIndex=(select MAX(a.versionIndex) from appInfo a where a.type="
						+ type + " and a.platform=" + platform + " and a.deleted=1 and a.enable=1) and b.type=" + type
						+ " and b.platform=" + platform +" and b.deleted=1");
		map.put("appInfo", appInfo);
		return map;
	}

}
