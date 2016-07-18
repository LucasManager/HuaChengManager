package com.huacheng.service;

import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.huacheng.bean.Parts;
import com.huacheng.bean.PartsStore;

/**
 * @author Bert
 *
 * @date 2016年7月13日
 *
 */
public interface IPartsManagerService {

	
	/**
	 * 查找配件
	 * @param parts
	 * @return
	 */
	public List<Parts> findParts(Parts parts,PageBounds page) throws Exception;
	
	
	/**
	 * 添加配件
	 * @param parts
	 * @throws Exception
	 */
	public void addParts(Parts parts) throws Exception;
	
	/**
	 * 修改配件信息
	 * @param parts
	 * @throws Exception
	 */
	public void updateParts(Parts parts) throws Exception;
	
	/**
	 * 删除配件信息
	 * @param parts
	 * @throws Exception
	 */
	public void deleteParts(Parts parts) throws Exception;
	
	/**
	 * 添加库存
	 * @param store
	 * @throws Exception
	 */
	public void addPartsStore(PartsStore store) throws Exception;
	
	/**
	 * 查找当前配件库存
	 * @param store
	 * @return
	 * @throws Exception
	 */
	public List<PartsStore> findPartsStore(PartsStore store,PageBounds pb) throws Exception;
	/**
	 * 删除库存
	 * @param store
	 * @throws Exception
	 */
	public void deleteStore(PartsStore store) throws Exception;
	
}
