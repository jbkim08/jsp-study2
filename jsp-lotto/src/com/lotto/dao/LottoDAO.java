package com.lotto.dao;

import java.util.ArrayList;

import com.lotto.vo.LottoVO;

public class LottoDAO {

	private static LottoDAO instance = new LottoDAO();

	private ArrayList<LottoVO> userInputs;

	private LottoDAO() {
		userInputs = new ArrayList<LottoVO>();
	}

	public static LottoDAO getInstance() {
		return instance;
	}

	public void create(LottoVO userLottoInput) {
		userInputs.add(userLottoInput);
	}

	public ArrayList<LottoVO> selectAll() {
		return userInputs;
	}
}
