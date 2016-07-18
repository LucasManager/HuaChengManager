package com.huacheng.service.impl;

import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.huacheng.bean.Parts;
import com.huacheng.bean.PartsStore;
import com.huacheng.dao.DAO;
import com.huacheng.exception.AddException;
import com.huacheng.exception.DeleteException;
import com.huacheng.exception.UpdateException;
import com.huacheng.service.IPartsManagerService;
import com.huacheng.utils.Common;

/**
 * @author Bert
 *
 * @date 2016年7月13日
 *
 */
@Service("partsManagerService")
public class PartsManagerService implements IPartsManagerService {

	@Resource(name="daoSupport")
	private DAO dao;

	@Override
	public List<Parts> findParts(Parts parts,PageBounds page) throws Exception {
		List<Parts> partsList = (List<Parts>) dao.findForListlimit("PartsManagerMapper.findParts", parts,page);
		return partsList;
	}

	@Override
	public void addParts(Parts parts) throws Exception {
		Object save = dao.save("PartsManagerMapper.addParts", parts);
		System.out.println("insert result:"+save);
	}

	@Override
	public void addPartsStore(PartsStore store) throws Exception {
		if (store.getIncreaseDate()==null) {
			store.setIncreaseDate(new Date(Common.SYSTEMTIME));
		}
		Integer save = (Integer) dao.save("PartsManagerMapper.addStore", store);
		if (save==null || save==0) {
			throw new AddException("添加库存失败！");
		}
	}

	@Override
	public List<PartsStore> findPartsStore(PartsStore store,PageBounds bp) throws Exception {
		List<PartsStore> stores = (List<PartsStore>) dao.findForListlimit("PartsManagerMapper.findPartsStore", store,bp);
		return stores;
	}

	@Override
	public void updateParts(Parts parts) throws Exception {
		Integer update = (Integer) dao.update("PartsManagerMapper.updatePartsById",parts);
		if(update==null || update==0)
		{
			throw new UpdateException("update parts "+parts.getName()+" fail ！");
		}
	}
	@Override
	public void deleteParts(Parts parts) throws Exception {
		Integer delete = (Integer) dao.update("PartsManagerMapper.deletePartsById", parts);
		if(delete==null || delete==0)
		{
			throw new DeleteException("delete parts "+parts.getName()+" fail ！");
		}
	}

	@Override
	public void deleteStore(PartsStore store) throws Exception {
		Integer delete =(Integer) dao.update("PartsManagerMapper.deleteStoreById", store);
		if(delete==null || delete==0)
		{
			throw new UpdateException("delete store  fail ！ "+store.getId());
		}
	}
}
