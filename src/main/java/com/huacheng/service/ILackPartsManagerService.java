package com.huacheng.service;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.huacheng.bean.LackParts;

/**
 * @author Bert
 *
 * @date 2016年7月19日
 *
 */
public interface ILackPartsManagerService {

	/**
	 * 查询缺件
	 * @param parts
	 * @param pb
	 * @return
	 */
	public List<LackParts> findLackParts(LackParts parts,PageBounds pb) throws Exception;
	
	/**
	 * 新增缺件记录
	 * @param parts
	 */
	public void addLackParts(LackParts parts) throws Exception;
	
	/**
	 * 修改缺件记录
	 * @param parts
	 */
	public void updateLackParts(LackParts parts) throws Exception;
	/**
	 * 删除缺件记录
	 * @param id
	 */
	public void deleteLackPartsById(Long id) throws Exception;
	
	/**
	 * 修改缺件记录状态 
	 * @param parts
	 */
	public void updateLackPartsStatus(LackParts parts) throws Exception;
	
}
