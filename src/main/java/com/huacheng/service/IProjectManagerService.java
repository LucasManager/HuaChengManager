package com.huacheng.service;

import java.util.List;

import com.huacheng.bean.Project;

public interface IProjectManagerService {

	public List<Project> findProject(Project project) throws Exception;
	
	public void addProject(Project project) throws Exception;
	
	public void updateProject(Project project) throws Exception;
	
	
}
