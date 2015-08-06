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
		for (Address address : addresses) {
			//1.地址不唯一的数量校验
			int multiple = address.getMultiple();
			int multiple_partment = address.getMultiple_in_black() + address.getMultiple_in_white() + address.getMultiple_in_other();
			if (multiple == multiple_partment) {
				address.setMultiply_ok(true);
			} else {
				address.setMultiply_ok(false);
			}
			//2.总数看能不能对上
			int total = address.getTotal();
			int unique = address.getUniq();
			if (total == unique + multiple) {
				address.setTotal_ok(true);
			} else {
				address.setTotal_ok(false);
			}
			//3.地址唯一的数量校验
			int unique_partment = address.getUniq_in_black() + address.getUniq_in_white() + address.getUniq_lt_threshold_gt_rate() + address.getUniq_lt_threshold_lt_rate() + address.getUniq_gt_threshold_lt_rate() + address.getNew_num();
			if (unique == unique_partment) {
				address.setUnique_ok(true);
			} else {
				address.setUnique_ok(false);
			}
			//4.

		}

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
