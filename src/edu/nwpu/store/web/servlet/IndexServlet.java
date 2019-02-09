package edu.nwpu.store.web.servlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.nwpu.store.web.base.BaseServlet;

@WebServlet("/IndexServlet")
public class IndexServlet extends BaseServlet {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/*
		// 调用业务层功能：获取全部分类信息，返回集合
		CategoryService cs = new CategoryServiceImp();
		List<Category> categoryList = cs.getAllCategories();
		// 将返回的集合放入request
		request.setAttribute("allCategories", categoryList);
		*/
		// 转发到真实的首页
		//System.out.println("**************************IndexServlet****************************");
		return "/jsp/index.jsp";
	}

}