package moo.ng.san.product.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import common.FileManager;
import moo.ng.san.category.model.vo.Category;
import moo.ng.san.category.model.vo.DetailCategory;
import moo.ng.san.inquiry.model.service.InquiryService;
import moo.ng.san.inquiry.model.vo.Inquiry;
import moo.ng.san.product.model.service.ProductService;
import moo.ng.san.product.model.vo.FileVO;
import moo.ng.san.product.model.vo.Product;
import moo.ng.san.product.model.vo.ProductPageData;

@Controller
public class ProductController {
	@Autowired
	private ProductService service;
	@Autowired
	private FileManager fileManager;
	@Autowired
	private InquiryService iqService;
	
	
	
	
	
	
	
	
//	규린작업공간 20~100
	
	@RequestMapping(value="/photoReviewMore.do")
	public String photoReviewMore() {
		return "product/photoReviewMore";
	}
	
	@RequestMapping(value="/productList.do")
	public String productList(int category, Model model) {
		// reqPage cateogory
		// 상위 누르면 상위이름 + 하위는 전체 및 상위에 해당하는 모든 하위카테고리
		// 하위 누르면 상위이름 + 해당 하위 이름 및 상위에 해당하는 모든 하위카테고리
		
		System.out.println("카테고리 : " + category);
		
		
		////////// 카테고리 계산 //////////
		int fCategory = 0;
		int sCategory = 0;
		// 11 12 13 14 25 26 27 28 29 210 211 212 313 314 .. 1058 ..1066
		if (category > 10000) {
			// 상위 카테고리 (하위 카테고리 전체)
			fCategory = category % 10000;
//			sCategory = 10000;
			System.out.println("상위 카테고리 : "+fCategory+" 하위 카테고리 : "+sCategory);
		} else if (category > 100) {
			// 네 자리 이상면
			fCategory = category / 100; // 2 3 4 5 6 .. 10 11 12 13
			sCategory = category - fCategory * 100;
			System.out.println("상위 카테고리 : "+fCategory+" 하위 카테고리 : "+sCategory);
		}else {
			// 두 자리면
			fCategory = category / 10;
			sCategory = category % 10;
			System.out.println("상위 카테고리 : "+fCategory+" 하위 카테고리 : "+sCategory);
		}
		
		
		
		// 카테고리별 상품리스트
//		ArrayList<Product> list = service.selectInfiniteScrollProductList(1, 3, fCategory, sCategory, "recent-sort");
		// 하위 카테고리 리스트
		ArrayList<DetailCategory> detailCategoryList = service.selectCategoryNameOnList(fCategory);
		// 해당 카테고리의 총 상품 수
		int totalCount = service.selectProductCount(fCategory, sCategory);
		// 해당 하위 카테고리의 상위 카테고리 이름
		
		
		model.addAttribute("fCategory", fCategory);
		model.addAttribute("sCategory", sCategory);
//		model.addAttribute("list", list);
		model.addAttribute("detailCategoryList", detailCategoryList);
		model.addAttribute("totalCount", totalCount);
		
//		System.out.println(list);
//		System.out.println(detailCategoryList);
		
		return "product/productList";
	}
	
	@ResponseBody
	@RequestMapping(value="/productMore.do", produces = "application/json;charset=utf-8")
	public String productMore(int start, int amount, int fCategoryNo, int sCategoryNo, String sortType) {
		//start : startHidden, amount : 3, detailCategoryNo: sCategoryNo
		//ProductPageData ppd
		
//		ProductPageData ppd = new ProductPageData();
//		ppd.setStart(start);
//		ppd.setAmount(amount);
//		ppd.setDetailCategoryNo(sCategory1);
		
		System.out.println("sCategoryNo : "+sCategoryNo);
		System.out.println(sortType);
		ArrayList<Product> list = service.selectInfiniteScrollProductList(start, amount, fCategoryNo, sCategoryNo, sortType);
		
		System.out.println(list);
		
		return new Gson().toJson(list);
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	명훈작업공간 120~200
	
	@RequestMapping(value="/insertProductFrm.do")
	public String insertProductFrm() {
		return "product/insertProductFrm";
	}
	
	@RequestMapping(value="/insertProduct.do")
	public String insertProduct(Product p, MultipartFile[] productFile, HttpServletRequest request) {
		ArrayList<FileVO> fileList = new ArrayList<FileVO>();
		if(!productFile[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("resources/upload/product/");
			for(MultipartFile file : productFile) {
				String filepath = fileManager.upload(savePath, file);
				FileVO fileVO = new FileVO();
				fileVO.setFilepath(filepath);
				fileList.add(fileVO);
			}
		}
		int result = service.insertProduct(p, fileList);
		if(result == (fileList.size()+1)) {
			return "redirect:/";
		} else {
			return "redirect:/insertProductFrm.do";
		}
	}
	@RequestMapping(value="/productView.do")
	public String productView(int productNo, Model model) {
		Product p = service.selectProductByProductNo(productNo);
		ArrayList<Inquiry> list = iqService.selectInquiryList(productNo);
		model.addAttribute("p",p);
		model.addAttribute("iqList", list);
		return "product/productView";
	}
	@GetMapping("/main.do")
	public String selectProductList(Model model) {
		ArrayList<Product> list = service.selectProductList();
		model.addAttribute("productList",list);
		return "common/main";
	}
	@RequestMapping(value="/uploadSummernoteImageFile.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/productContentImg/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/resources/productContentImg/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	
}
