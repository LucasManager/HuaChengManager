package com.huacheng.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.huacheng.bean.Project;
import com.huacheng.dao.DAO;
import com.huacheng.service.IProjectManagerService;

public class ProjectManagerService implements IProjectManagerService {

	@Resource(name="daoSupport")
	private DAO dao;
	
	@Override
	public List<Project> findProject(Project project) throws Exception {
		return null;
	}

	@Override
	public void addProject(Project project) throws Exception {
		Object save = dao.save("", project);
	}

	@Override
	public void updateProject(Project project) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
