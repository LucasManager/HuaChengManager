package com.huacheng.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.huacheng.bean.Car;
import com.huacheng.bean.Customer;
import com.huacheng.bean.Project;
import com.huacheng.bean.ProjectParts;
import com.huacheng.dao.DAO;
import com.huacheng.exception.AddException;
import com.huacheng.exception.UpdateException;
import com.huacheng.service.IProjectManagerService;

import junit.framework.Assert;

@Service("projectManagerService")
public class ProjectManagerService implements IProjectManagerService {

	@Resource(name = "daoSupport")
	private DAO dao;

	public List<Project> findProject(Project project, PageBounds pb) throws Exception {
		List<Project> projects = (List<Project>) dao.findForListlimit("ProjectManagerMapper.findProject", project, pb);
		return projects;
	}

	public void addProject(Project project) throws Exception {
		Assert.assertNotNull("服务为空！", project);
		project.setStartDate(new Date());
		int save = dao.save("ProjectManagerMapper.addProject", project);
		Assert.assertEquals("插入Project 失败！", 1, save);
		if (project.getUseParts() != null && project.getUseParts().size() != 0) {
			List<ProjectParts> parts = project.getUseParts();
			for (ProjectParts pp : parts) {
				pp.setProjectId(project.getId());
			}
			int save2 = dao.save("ProjectParts.addpParts", parts);
			Assert.assertEquals(parts.size(), save2);
		}
	}

	public void updateProject(Project project) throws Exception {
		int update = dao.update("", project);
		if (update == 0) {
			throw new UpdateException();
		}
	}

	public List<Car> findCarCus(Customer customer, PageBounds pb) throws Exception {
		List<Car> cusCar = (List<Car>) dao.findForListlimit("CarMapper.findCarByCus", customer, pb);
		return cusCar;
	}

}
