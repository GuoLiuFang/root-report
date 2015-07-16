package com.tj.services;

import java.util.ArrayList;
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
		
		return sophies;
		
	}

}
