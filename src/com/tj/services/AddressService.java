package com.tj.services;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.tj.beans.Address;
import com.tj.db.AddressDb;

public class AddressService {

	public List<Address> getResultList() {
		
		List<Address> addresses = new ArrayList<>();
		AddressDb addressDb = new AddressDb();
		addresses = addressDb.ExtractDatabase();
		// 对address的数据进行简单加工。
//		for (Address address : addresses) {
//
//		}

		return addresses;

	}

	public static void main(String[] args) {
		List<Address> addresss = new ArrayList<>();
		AddressService service = new AddressService();
		addresss = service.getResultList();
		for (Address address : addresss) {
			System.out.println("日期是：" + address.getRecord_time());
		}

	}

}
