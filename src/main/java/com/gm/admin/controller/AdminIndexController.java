package com.gm.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gm.base.model.sys.Res;
import com.gm.base.model.sys.User;
import com.gm.base.model.sys.UserRes;
import com.gm.service.sys.IResService;
import com.gm.service.sys.IUserResService;
import com.gm.service.sys.IUserService;
import com.gm.utils.QRCodeUtils;
import com.gm.utils.StringUtil;

@Controller
@RequestMapping("/admin")
public class AdminIndexController extends BaseAdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminIndexController.class);

	private final static String path = "/admin/";
	@Resource
	private IUserService userService;
	@Resource
	private IResService resService;
	@Resource
	private IUserResService userResService;

	@GetMapping({ "/login", "login.htm", "login.html" })
	public String login(ModelMap map) {
		String uuid = UUID.randomUUID().toString();
		String qrString = QRCodeUtils.createQrcode("", "{\"uuid\":\"" + uuid + "\"}");
		map.put("uuid", uuid);
		map.put("qrString", qrString);
		return path + "login";
	}

	@GetMapping("/aplogin")
	public String aplogin(ModelMap map) {
		return path + "aplogin";
	}

	@PostMapping("/loginAction")
	@ResponseBody
	public Map<String, Object> loginAction(String username, String password, HttpServletRequest request) {
		User user = userService.login(username, password);
		Map<String, Object> map = new HashMap<>();
		if (user != null) {
			if (user.getEnable() == 2) {
				map.put("s", "disable");// 账户被禁用
				return map;
			}
			if ("admin".equals(user.getUsername())) {
				List<Res> res = resService.list();
				setRess(request, res);
			} else {
				List<UserRes> userRes = userResService.listEq("user.id", user.getId());
				List<Res> res = userRes.stream().map(UserRes::getRes).collect(Collectors.toList());
				setRess(request, res);
			}
			request.getSession().setAttribute("curUser", user);
			map.put("s", "ok");
		} else {
			map.put("s", "no");
		}
		return map;
	}

	private void setRess(HttpServletRequest request, List<Res> res) {
		List<Res> first = res.stream().filter(p -> null != p.getParent() && p.getParent().getId().equals(1))
				.collect(Collectors.toList());

		first.stream()
				.forEach(p -> p.setSons(
						res.stream().filter(q -> null != q.getParent() && q.getParent().getId().equals(p.getId()))
								.collect(Collectors.toList())));
		request.getSession().setAttribute("menu", first);

		List<String> ress = res.stream().filter(p -> !StringUtil.strNullOrEmpty(p.getCode())).map(p -> p.getCode())
				.collect(Collectors.toList());
		request.getSession().setAttribute("ress", ress);
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/admin/login";
	}

	@GetMapping({ "", "/", "/index", "index.htm", "index.html" })
	public String index(ModelMap map, HttpSession session) {
		return path + "index";
	}

	@RequestMapping("/userList.json")
	@ResponseBody
	public Map<String, Object> getUserList() {
		Map<String, Object> m = new HashMap<>();
		return m;
	}

	/**
	 * 获取二维码
	 * 
	 * @return
	 */
	@RequestMapping("getQrcode.json")
	@ResponseBody
	public Map<String, Object> getQrcode() {
		String uuid = UUID.randomUUID().toString();
		String qrString = QRCodeUtils.createQrcode("", "{\"uuid\":\"" + uuid + "\",\"type\":\"9\"}");
		Map<String, Object> map = new HashMap<>();
		map.put("qrString", qrString);
		map.put("uuid", uuid);
		return map;
	}

	/**
	 * pc 收到socket后请求后台
	 * 
	 * @param uuid
	 * @param request
	 * @return
	 */
	@RequestMapping("qrLogin")
	@ResponseBody
	public Map<String, Object> qrLogin(String uuid, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		ServletContext application = request.getServletContext();
		String userId = (String) application.getAttribute(uuid);
		System.out.println(userId);
		if (null != userId) {
			String enable = userId.substring(userId.indexOf("@") + 1);
			if ("2".equals(enable)) {
				map.put("s", "notAllow");
			} else {
				Integer mid = Integer.parseInt(userId.substring(0, userId.indexOf("@")));
				User user = userService.get(mid);
				if (user != null) {
					if (user.getEnable() == 2) {
						map.put("s", "disable");// 账户被禁用
						return map;
					}
					if ("admin".equals(user.getUsername())) {
						List<Res> res = resService.list();
						setRess(request, res);
					} else {
						List<UserRes> userRes = userResService.listEq("user.id", user.getId());
						List<Res> res = userRes.stream().map(UserRes::getRes).collect(Collectors.toList());
						setRess(request, res);
					}
					request.getSession().setAttribute("curUser", user);
					map.put("s", "ok");
				} else {
					map.put("s", "noUser");
				}

			}
		} else {
			map.put("s", "timeout");
		}
		application.removeAttribute(uuid);
		return map;
	}

}
