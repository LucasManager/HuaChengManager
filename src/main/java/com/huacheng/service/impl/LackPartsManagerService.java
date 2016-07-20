package com.huacheng.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.huacheng.bean.Customer;
import com.huacheng.bean.LackParts;
import com.huacheng.dao.DAO;
import com.huacheng.exception.AddException;
import com.huacheng.exception.UpdateException;
import com.huacheng.service.ILackPartsManagerService;

@Service("lackPartsManagerService")
public class LackPartsManagerService implements ILackPartsManagerService {

	@Resource(name="daoSupport")
	private DAO dao;
	
	@Override
	public List<LackParts> findLackParts(LackParts parts, PageBounds pb) throws Exception {
		List<LackParts> results = (List<LackParts>) dao.findForListlimit("PartsManagerMapper.selectLackParts", parts, pb);
		return results;
	}

	@Override
	public void addLackParts(LackParts parts) throws Exception {
		Integer save = (Integer)dao.save("PartsManagerMapper.saveLackParts", parts);
		if (save==null || save==0) {
			throw new AddException("增加缺件失败,客户名称："+parts.getCustomerName());
		}
	}

	@Override
	public void updateLackParts(LackParts parts) throws Exception {
		Integer update = (Integer) dao.update("PartsManagerMapper.updateLackById", parts);
		if (update==null || update==0) {
			throw new UpdateException("update lackParts fail");
		}
	}

	@Override
	public void deleteLackPartsById(Long id) throws Exception {
		dao.delete("PartsManagerMapper.deleteById", id);
	}

	@Override
	public void updateLackPartsStatus(LackParts parts) throws Exception {
		dao.update("PartsManagerMapper.updateStatusById", parts);
	}

}
