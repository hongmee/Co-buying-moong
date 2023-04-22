package moo.ng.san.dm.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import moo.ng.san.dm.model.service.DmService;
import moo.ng.san.dm.model.vo.DirectMessage;
import moo.ng.san.member.model.vo.Member;

@Controller
public class DmController {
	
	@Autowired
	private DmService service; 

	@ResponseBody
	@RequestMapping(value = "/myDmList.do",produces = "application/json;charset=utf-8")
	public String myPageDmReceive(DirectMessage dm) {
		ArrayList<DirectMessage> list = service.selectAllDm(dm);
		return "dm/receiveDmList";
	}
	

	
	@RequestMapping(value = "/dmWriteFrm.do")
	public String myPageDmWriteFrm(Model model, @SessionAttribute(required=false) Member m) {
		model.addAttribute("memberId", m.getMemberId());
		model.addAttribute("receiver", "");
		return "dm/dmWriteFrm";
	}
	

	@ResponseBody
	@RequestMapping(value = "/insertDm.do")
	public String insertDm(String dmSender, String dmReceiver, String dmContent) {
		DirectMessage dm = new DirectMessage();
		dm.setDmSender(dmSender);
		dm.setDmReceiver(dmReceiver);
		dm.setDmContent(dmContent);
		int result = service.insertDm(dm);
		if(result==1) {
			return "ok";
		}else {
			return "error";
		}
	}//insertDm
	
	
	@RequestMapping(value = "/dmReply.do")
	public String dmReply(Model model, @SessionAttribute(required=false) Member m, String receiver) {
		model.addAttribute("memberId", m.getMemberId());
		model.addAttribute("receiver", receiver);
		return "dm/dmWriteFrm";
	}
	
	
	
}//DmController
