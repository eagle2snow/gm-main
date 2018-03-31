package com.gm.h5.cotroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/download")
@Controller
public class DownloadController {

	@RequestMapping("/userApp")
	private String downloadUserApp() {
		return "/download/userAndroidDownload";
	}
}
