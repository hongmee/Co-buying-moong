package moo.ng.san.gonggu.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import moo.ng.san.dayCheck.model.vo.Point;
import moo.ng.san.gonggu.model.vo.Gonggu;
import moo.ng.san.gonggu.model.vo.GongguAllInfo;
import moo.ng.san.gonggu.model.vo.GongguPay;

@Repository
public class GongguDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<GongguAllInfo> selectGongguList(int productNo) {
		List list = sqlSession.selectList("gonggu.selectGongguList",productNo);
		return (ArrayList<GongguAllInfo>)list;
	}

	public int insertGonggu(Gonggu g) {
		int result = sqlSession.insert("gonggu.insertGonggu",g);
		return result;
	}

	public Gonggu selectInsertGonggu() {
		Gonggu gonggu = sqlSession.selectOne("gonggu.selectInsertGonggu");
		return gonggu;
	}

	public int insertDetailGonggu(Gonggu gonggu) {
		int result = sqlSession.insert("gonggu.insertDetailGonggu",gonggu);
		return result;
	}

	public int insertPoint(Point p) {
		int result = sqlSession.insert("point.insertGongguPoint",p);
		return result;
	}

	public int insertGongguPay(GongguPay gp) {
		System.out.println("gongguDao에서 gp값"+gp);
		int result = sqlSession.insert("gongguPay.insertGongguPay",gp);
		return result;
	}
	
	public int selectGongguPayCount(int gongguNo) {
		System.out.println("Sysout극혐");
		int result = sqlSession.selectOne("gonggu.selectGongguPayCount",gongguNo);
		System.out.println(result);
		return result;
	}

//	public int selectCount() {
//		int countNumber = sqlSession.selectOne("gonggu.selectCountNumber");
//		return countNumber;
//	}
}
