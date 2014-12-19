package app.cq.hmq.service.teachercomm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import common.cq.hmq.model.JqGridData;
import common.cq.hmq.model.JqPageModel;
import common.cq.hmq.pojo.sys.Org;
import common.cq.hmq.pojo.sys.User;

import core.cq.hmq.dao.PageList;
import core.cq.hmq.modal.SessionModal;
import core.cq.hmq.service.BaseService;
import core.cq.hmq.util.tools.StringUtil;

@Service
public class TeacherCommService extends BaseService{

	/**
	 * for easy data
	 * @return
	 */
	public Map<String, Object> obtailOrgDataForComm(){
	 Map<String, Object> map = null;
	 Org org = (Org) dao.findOne("from Org where parent is null and type = ?",0);
	 if(null != org){
		 map = new HashMap<String, Object>();
		 map.put("id", org.getId());
		 map.put("text", org.getName());
		 map.put("state", "opend");
		 List<Org> list =  findOrgByPid(org.getId(),4);
		 if(null != list && list.size() > 0){
			 List<Object> childList = new ArrayList<Object>();
			 for(Org o : list){
				 Map<String, Object> newmap = new HashMap<String, Object>();
				 newmap.put("id", o.getId());
				 newmap.put("text", o.getName());
				 childList.add(newmap);
			 }
			 map.put("children", childList);
		 }
	 }
	 return map;
	}
	
	public List<Org> findOrgByPid(Long id,int type){
		return dao.find("from Org where parent.id = ? and type = ?", id,type);
	}
	
	/**
	 * for ace data
	 * @return
	 * var str = "{'1' : {id : 8,name: '涓崕浜哄悕鍏卞拰鍥戒竷涓�, type: 'folder',additionalParameters:{"
		+"children:{'11' : {id : 8,name: '灏忓閮�, type: 'item'},'12' : {id : 12,name: '鍒濅腑閮�', type: 'item'},'13' : {id : 13,name: '楂樹腑閮�, type: 'item'}}}}}"
	 
	 */
	public List obtailOrgDataForCommForAce(Long id){
		 Map<String, Object> map = null;
		 Map<String, Object> childmap = null;
		 List result = new ArrayList<>();;
		 if(null == id || id < 1){
			 Org org = (Org) dao.findOne("from Org where parent is null and id = ?", 2L);
			 if(null != org){
				 map = new HashMap<String, Object>();
				 map.put("id", org.getId());
				 map.put("name", org.getName());
				 map.put("type", "folder");
				 result.add(map);
			}
		 }else{
				 List<Org> list =  findOrgByPid(id,4);
				 if(null != list && list.size() > 0){
					 for(Org o : list){
						 childmap = new HashMap<String, Object>();
						 childmap.put("id", o.getId());
						 childmap.put("name", o.getName());
						 childmap.put("type", "item");
						 if(!StringUtil.isEmpty(o.getTel())){
							 childmap.put("phone", o.getTel());
						 }
						 result.add(childmap);
					 }
				 }
		 }
		 return result;
		}
	
	/**
	 * for jqgrid data
	 * @param jqPagemodel
	 * @param sessionModal
	 * @param orgId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public JqGridData<List<?>> findTeachCommunicationInfos(JqPageModel jqPagemodel,SessionModal sessionModal,Long orgId){
		JqGridData jqGridData = new JqGridData<List<?>>();
		List<Map<String, Object>> list = null;
		Map<String, Object> map = null;
		StringBuffer hql = null;
		if(User.STUDENTTYPE.equals(sessionModal.getUserType())){
			hql =  new StringBuffer("select t.id_f,t.name_f,t.telephone_f,t.email_f,s.name_f as sname from TeacherInfo_t t, SubjectMapping_t sm,subjectinfo_t s");
			hql.append(" where t.id_f = sm.teacher_f");
			hql.append(" and sm.subjectInfo_f = s.id_f");
			hql.append(" and sm.org_f = "+ sessionModal.getOrgId());
			if(!StringUtil.isEmpty(jqPagemodel.getSearchKey())){
				hql.append(" and t.name_f "+ escapeChar(jqPagemodel.getSearchKey()));
			}
			if(!StringUtil.isEmpty(jqPagemodel.getSort()) && !StringUtil.isEmpty(jqPagemodel.getOrder())){
				hql.append(" order by t."+jqPagemodel.getSort()+"_f " + jqPagemodel.getOrder());
			}
		}else{
			/*查询了每个教师所授科目hql = new StringBuffer("select te.id_f,te.name_f,te.telephone_f,te.email_f,sub.name_f as sname");
			hql.append("  from (select t.id_f,t.name_f,t.telephone_f,t.email_f from teacherinfo_t t where 1=1 ");
			
			if(null != orgId){
				hql.append(" and t.org_f = "+ orgId);
			}
			if(!StringUtil.isEmpty(jqPagemodel.getSearchKey())){
				hql.append(" and t.name_f "+ escapeChar(jqPagemodel.getSearchKey()));
			}
			
			if(!StringUtil.isEmpty(jqPagemodel.getSort()) && !StringUtil.isEmpty(jqPagemodel.getOrder())){
				hql.append(" order by t."+jqPagemodel.getSort()+"_f " + jqPagemodel.getOrder());
			}
			hql.append(") te");
			hql.append(" left join subjectmapping_t s on te.id_f = s.teacher_f");
			hql.append(" left join subjectinfo_t sub on s.subjectinfo_f = sub.id_f");*/
			
			hql = new StringBuffer();
			hql.append("select t.id_f,t.name_f,t.telephone_f,t.email_f,'' from teacherinfo_t t where 1=1 ");
			
			if(null != orgId){
				hql.append(" and t.org_f = "+ orgId);
			}
			if(!StringUtil.isEmpty(jqPagemodel.getSearchKey())){
				hql.append(" and t.name_f "+ escapeChar(jqPagemodel.getSearchKey()));
			}
			
			if(!StringUtil.isEmpty(jqPagemodel.getSort()) && !StringUtil.isEmpty(jqPagemodel.getOrder())){
				hql.append(" order by t."+jqPagemodel.getSort()+"_f " + jqPagemodel.getOrder());
			}
		}
		
		PageList<?> ts = dao.getHelperDao().page(jqPagemodel.getPage(), jqPagemodel.getRows(), hql.toString());
		if(null != ts && ts.size() > 0 && ts.getList().size() > 0){
			list = new ArrayList<Map<String,Object>>();
			Object[] objs = {};
			for(Object o : ts.getList()){
				objs = (Object[]) o;
				map = new HashMap<String, Object>();
				map.put("id", objs[0]);
				map.put("name", objs[1]);
				map.put("suject", objs[4]);
				map.put("tel", objs[2]);
				map.put("email", objs[3]);
				list.add(map);
			}
		}
		
		jqGridData.setPage(ts.getPageNo());
		jqGridData.setRows(list);
		jqGridData.setRecords(ts.getTotalCount());
		jqGridData.setTotal(ts.getPageCount());
		return jqGridData;
	}
	
	public String escapeChar(String str) {
		return "like '%"
				+ str.replace("%", "/%").replace("'", "''").replace("_", "/_")
				+ "%' escape '/' ";
	}

	public JqGridData<List<?>> findTeacherGridDataByRole(
			JqPageModel jqPagemodel, Long roleId) {
		JqGridData jqGridData = new JqGridData<List<?>>();
		List<Map<String, Object>> list = null;
		Map<String, Object> map = null;
		StringBuffer hql =  new StringBuffer("select t.id_f, t.name_f,sub.name_f as sname, t.telephone_f, t.email_f ");
			hql.append("from (SELECT ur.userid_f FROM userrole_t ur  where ur.teacher_f = 1 ");
			hql.append("and ur.roleid_f = "+roleId+") r ");
			hql.append("left join teacherinfo_t t on t.id_f = r.userid_f  ");
			if(!StringUtil.isEmpty(jqPagemodel.getSearchKey())){
				hql.append("and t.name_f "+ escapeChar(jqPagemodel.getSearchKey()));
			}
			hql.append(" left join subjectmapping_t s on t.id_f =  s.teacher_f ");
			hql.append(" left join subjectinfo_t sub on s.subjectinfo_f = sub.id_f ");
			
			if(!StringUtil.isEmpty(jqPagemodel.getSort()) && !StringUtil.isEmpty(jqPagemodel.getOrder())){
				hql.append(" order by t."+jqPagemodel.getSort()+"_f " + jqPagemodel.getOrder());
			}
		
		PageList<?> ts = dao.getHelperDao().page(jqPagemodel.getPage(), jqPagemodel.getRows(), hql.toString());
		if(null != ts && ts.size() > 0 && ts.getList().size() > 0){
			list = new ArrayList<Map<String,Object>>();
			Object[] objs = {};
			for(Object o : ts.getList()){
				objs = (Object[]) o;
				map = new HashMap<String, Object>();
				map.put("id", objs[0]);
				map.put("name", objs[1]);
				map.put("suject", objs[2]);
				map.put("tel", objs[3]);
				map.put("email", objs[4]);
				list.add(map);
			}
		}
		
		jqGridData.setPage(ts.getPageNo());
		jqGridData.setRows(list);
		jqGridData.setRecords(ts.getTotalCount());
		jqGridData.setTotal(ts.getPageCount());
		return jqGridData;
	}
}
