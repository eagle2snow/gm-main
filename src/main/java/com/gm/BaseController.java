package com.gm;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.gm.utils.FileUtil;
import com.gm.utils.StringUtil;
import com.gm.utils.WaterMarkUtil;

import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;

public class BaseController {

	private static String waterMarkPath = BaseController.class.getResource("/").getPath() + "watermark" + File.separator
			+ "mark.png";

	@Autowired
	private HttpSession session;

	public String addWaterMark(String pics) {
		String basePath = session.getServletContext().getRealPath("/");
		// p = p.substring(0, p.length() - 1);
		List<String> newPics = new ArrayList<>();
		if (!StringUtil.strNullOrEmpty(pics)) {
			String[] picArr = pics.split("\\|");
			for (String pic : picArr) {
				if (pic.indexOf("_wt") == -1) {
					String oldPath = basePath + pic;
					pic = FileUtil.getFileNameNoEx(pic) + "_wt.jpg";
					String newPath = basePath + pic;
					WaterMarkUtil.markImageByIcon(oldPath, newPath);
					try {
						Thumbnails.of(oldPath).size(720, 1280)
								.watermark(Positions.BOTTOM_RIGHT, ImageIO.read(new File(waterMarkPath)), 1f)
								.outputQuality(0.7f).toFile(newPath);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				newPics.add(pic);
			}
		}
		return String.join("|", newPics);
	}

	public void renameDoc(String docs) {
		String p = session.getServletContext().getRealPath("/");
		String[] docArr = docs.split("\\|");
		if (docArr.length > 0) {
			for (String s : docArr) {
				if (!StringUtil.strNullOrEmpty(s)) {
					String o = s.substring(0, s.indexOf("@"));
					File oldFile = new File(p + o);
					File newFile = new File(p + s);
					boolean flag = oldFile.renameTo(newFile);
					if (flag) {
						oldFile.delete();
					}
				}
			}
		}

	}

	public HttpSession getSession() {
		return session;
	}

}
