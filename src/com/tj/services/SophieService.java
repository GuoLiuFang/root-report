package com.tj.services;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.tj.beans.Sophie;
import com.tj.db.SophieDb;

public class SophieService {
	
	
	
	public List<Sophie> getResultList() {
		//SophieDb应该返回的就是一个List<Sophie>
		//Service在这里做的工作就是对List<Sophie>进行加工
		//主要就一个工作就是，把path解析成为超链接。。是可以点击的。。这样，，通过点击就可以查看错误的详情了。
		List<Sophie> sophies = new ArrayList<>();
		SophieDb sophieDb = new SophieDb();
		sophies = sophieDb.ExtractDatabase();
		//对sophie的数据进行简单加工。
		for(Sophie sophie : sophies){
			//1.修改record_time的格式
			String record_time = sophie.getRecord_time();
			try {
				Date record_date = new SimpleDateFormat("yyyy-MM-dd").parse(record_time);
				sophie.setRecord_time(record_date.toString());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//2.如果为info，不为零处理成超链接模式。
			if(!"0".equalsIgnoreCase(sophie.getVld_info())){
				String vldInfo = "<a href=\"" + this.replacePath(sophie.getVld_info()) + "\">查看详情</a>";
				sophie.setVld_info(vldInfo);
			}
			if(!"0".equalsIgnoreCase(sophie.getFlt_info())){
				String fltInfo = "<a href=\"" + this.replacePath(sophie.getFlt_info()) + "\">查看详情</a>";
				sophie.setFlt_info(fltInfo);
			}
			if(!"0".equalsIgnoreCase(sophie.getErr_info())){
				String errInfo = "<a href=\"" + this.replacePath(sophie.getErr_info()) + "\">查看详情</a>";
				sophie.setErr_info(errInfo);
			}
			if(!"0".equalsIgnoreCase(sophie.getDb_log())){
				String dbLog = "<a href=\"" + this.replacePath(sophie.getDb_log()) + "\">查看详情</a>";
				sophie.setDb_log(dbLog);
			}
			if(!"0".equalsIgnoreCase(sophie.getDb_err())){
				String dbErr = "<a href=\"" + this.replacePath(sophie.getDb_err()) + "\">查看详情</a>";
				sophie.setDb_err(dbErr);
			}
			if(!"0".equalsIgnoreCase(sophie.getDb_bad())){
				String dbBad = "<a href=\"" + this.replacePath(sophie.getDb_bad()) + "\">查看详情</a>";
				sophie.setDb_bad(dbBad);
			}
			
		}
		
		return sophies;
		
	}
	
	private String replacePath(String src){
		String result = "";
		result = src.replace("/home/hadoop/hadoop-job/sophie-job/WWW", "sophieDetails");
		return result;
	}

}
