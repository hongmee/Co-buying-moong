package moo.ng.san.gonggu.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GongguAllInfo {
	private String memberPath;
	private String memberId;
	private Integer gongguNumber;
	private Integer gongguNo;
	private Integer countNumber;
	private Integer useCnt;
}
