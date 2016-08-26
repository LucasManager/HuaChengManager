package com.huacheng.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.huacheng.bean.Car;
import com.huacheng.bean.Customer;
import com.huacheng.bean.Project;
import com.huacheng.bean.ProjectParts;
import com.huacheng.dao.DAO;
import com.huacheng.exception.UpdateException;
import com.huacheng.service.IProjectManagerService;

@Service("projectManagerService")
public class ProjectManagerService implements IProjectManagerService {

	@Resource(name = "daoSupport")
	private DAO dao;

	public List<Project> findProject(Project project, PageBounds pb) throws Exception {
		List<Project> projects = (List<Project>) dao.findForListlimit("ProjectManagerMapper.findProject", project, pb);
		return projects;
	}

	public void addProject(Project project) throws Exception {
		Assert.notNull(project, "服务为空！");
		if (project.getStartDate() == null) {
			project.setStartDate(new Date());
		}
		int save = dao.save("ProjectManagerMapper.addProject", project);
		Assert.state(1 == save, "插入Project 失败！");
		if (project.getUseParts() != null && project.getUseParts().size() != 0) {
			List<ProjectParts> parts = project.getUseParts();
			for (ProjectParts pp : parts) {
				pp.setProjectId(project.getId());
			}
			int save2 = dao.save("ProjectParts.addpParts", parts);
			Assert.state(parts.size() == save2);
		}
	}

	public void updateProject(Project project) throws Exception {
		Assert.notNull(project);
		int update = dao.update("updateProject", project);
		Assert.isTrue(1 == update, "更新服务失败！");
		List<ProjectParts> useParts = project.getUseParts();
		if (useParts != null && useParts.size() != 0) {
			List<ProjectParts> parts = project.getUseParts();
			for (ProjectParts pp : parts) {
				pp.setProjectId(project.getId());
			}
			Assert.isTrue(dao.save("ProjectParts.addpParts", parts) == parts.size(), "保存服务配件失败！");
		}
	}

	public List<Car> findCarCus(Customer customer, PageBounds pb) throws Exception {
		List<Car> cusCar = (List<Car>) dao.findForListlimit("CarMapper.findCarByCus", customer, pb);
		return cusCar;
	}

	public void deleteproParts(ProjectParts pp) throws Exception {
		Assert.notNull(pp, "对象为空！");
		int result = dao.update("ProjectParts.deletepParts", pp);
		Assert.state(result == 1, "删除失败！");
	}

	public void deleteProject(Project project) throws Exception {
		Assert.notNull(project);
		Assert.isTrue(dao.update("ProjectManagerMapper.deleteProject", project) == 1, "删除服务失败！");
		Long id = project.getId();
		dao.update("ProjectParts.deleteByProject", id);
	}

}
