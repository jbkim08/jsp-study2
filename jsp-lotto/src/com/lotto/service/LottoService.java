package com.lotto.service;

import java.util.ArrayList;

import com.lotto.vo.LottoVO;

public interface LottoService {

	public void buy(LottoVO userLottoInput);
	
	public ArrayList<LottoVO> myNumbers();

	public LottoVO winningLotto();
}
