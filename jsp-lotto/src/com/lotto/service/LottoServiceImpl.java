package com.lotto.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Random;

import com.lotto.dao.LottoDAO;
import com.lotto.vo.LottoVO;

public class LottoServiceImpl implements LottoService {

	private LottoDAO dao;

	public LottoServiceImpl() {
		dao = LottoDAO.getInstance();
	}

	@Override
	public void buy(LottoVO userLottoInput) {
		dao.create(userLottoInput);
	}

	@Override
	public ArrayList<LottoVO> myNumbers() {
		return dao.selectAll();
	}

	@Override
	public LottoVO winningLotto() {
		//Random rand = new Random();
		ArrayList<Integer> lottoBalls = new ArrayList<Integer>();
		for (int i = 1; i <= 45; i++) {
			lottoBalls.add(i);
		}

		Collections.shuffle(lottoBalls);
		int[] picked = new int[6];
		for (int i = 0; i < picked.length; i++) {
			picked[i] = lottoBalls.remove(0);
		}

		return new LottoVO(picked);
	}


}
