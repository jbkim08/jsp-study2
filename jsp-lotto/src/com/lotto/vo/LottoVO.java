package com.lotto.vo;

import java.util.Arrays;

public class LottoVO {

	public static int count = 0;

	private int id;
	private int[] nums;

	public LottoVO(String lottoNumStr) {
		this.id = ++count;
		String[] lottoNumStrArr = lottoNumStr.split(",");
		this.nums = new int[lottoNumStrArr.length];
		for (int i = 0; i < nums.length; i++) {
			nums[i] = Integer.parseInt(lottoNumStrArr[i]);
		}

		Arrays.sort(nums);
	}

	public LottoVO(int[] nums) {
		this.id = 0;
		Arrays.sort(nums);
		this.nums = nums;
	}

	public String getNumsStr() {
		return String.format("%d, %d, %d, %d, %d, %d", nums[0], nums[1], nums[2], nums[3], nums[4], nums[5]);
	}

	public int getId() {
		return id;
	}
	
	public int countCorrectNum(LottoVO target) {
		int count = 0;
		
		for (int i = 0; i < nums.length; i++) {
			if (target.nums[i] == this.nums[i]) {
				count++;
			}
		}
		
		return count;
	}
}
