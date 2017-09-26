package example.customer.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import example.common.DtPaging;
import example.customer.model.Customer;
import example.customer.model.JsExtraCusResult;
import example.customer.model.JsGridData;
import example.listener.HibernateListener;
import java.math.BigDecimal;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.cfg.Configuration;

public class CustomerAction extends ActionSupport
        implements ModelDriven {

    Customer customer = new Customer();
    List<Customer> customerList = new ArrayList<Customer>();
    HttpServletRequest request;
    JsExtraCusResult jsExtraCusResult;
    JsGridData jsGridData;
    static String customer_id;
    String location;
    final int DEFAULT_PAGE_RECORD = 10;
    int start;

    public String execute() throws Exception {

        return SUCCESS;
    }

    public Object getModel() {
        return customer;
    }

    public List<Customer> getCustomerList() {
        return customerList;
    }

    public void setCustomerList(List<Customer> customerList) {
        this.customerList = customerList;
    }

    public JsExtraCusResult getJsExtraCusResult() {
        return jsExtraCusResult;
    }

    public void setJsExtraCusResult(JsExtraCusResult jsExtraCusResult) {
        this.jsExtraCusResult = jsExtraCusResult;
    }

    public JsGridData getJsGridData() {
        return jsGridData;
    }

    public void setJsGridData(JsGridData jsGridData) {
        this.jsGridData = jsGridData;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public String getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(String customer_id) {
        this.customer_id = customer_id;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    //save customer
    public String addCustomer() throws Exception {

        //get hibernate session from the servlet context
        SessionFactory sessionFactory =
                (SessionFactory) ServletActionContext.getServletContext().getAttribute(HibernateListener.KEY_NAME);

        Session session = sessionFactory.openSession();

//        Session session = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
        request = ServletActionContext.getRequest();
        //save it
        customer.setCreatedDate(new Date());
        Random rand = new Random();

        long n = rand.nextInt(1000000) + 1;
        customer.setCustomerId(n);

        session.beginTransaction();
        session.save(customer);
        session.getTransaction().commit();

        //reload the customer list
        StringBuilder sql = new StringBuilder();
        sql.append("select * from customer");
        customerList = null;
        SQLQuery query = session.createSQLQuery(sql.toString());
        query.addEntity(Customer.class);
        customerList = query.list();
        request.setAttribute("customer", customer);
        return SUCCESS;

    }

    //list all customers
    public String listCustomer() throws Exception {
//        request = ServletActionContext.getRequest();
//        HttpSession httpsSession = request.getSession();
//        httpsSession.setAttribute("contextPath", request.getContextPath());
        StringBuilder sql = new StringBuilder();
//        sql.append("select * from customer where address = :address");
        sql.append("select * from customer");
        //get hibernate session from the servlet context
        SessionFactory sessionFactory =
                (SessionFactory) ServletActionContext.getServletContext().getAttribute(HibernateListener.KEY_NAME);

        Session session = sessionFactory.openSession();
//        Session session = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
        SQLQuery query = session.createSQLQuery(sql.toString());
//        query.setParameter("address", "hn");
        query.addEntity(Customer.class);
        customerList = query.list();
        return SUCCESS;

    }

    public String searchExtraCusList() throws Exception {

        String pageForward = "json";

        try {
            StringBuilder sql = new StringBuilder();
//        sql.append("select * from customer where address = :address");
            sql.append("select * from customer");

            StringBuilder sqlCount = new StringBuilder();
            sqlCount.append(" select count(1) from customer");
            //get hibernate session from the servlet context
            SessionFactory sessionFactory =
                    (SessionFactory) ServletActionContext.getServletContext().getAttribute(HibernateListener.KEY_NAME);

            Session session = sessionFactory.openSession();
//        Session session = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
            SQLQuery selectQuery = session.createSQLQuery(sql.toString());

            jsGridData = new JsGridData();
            DtPaging<Customer> dtPaging = new DtPaging<Customer>(DEFAULT_PAGE_RECORD);
            dtPaging.setPage(this.start / DEFAULT_PAGE_RECORD);
            //Get list extra subscriber from database
//            CustomerCheckBusiness.getListCustomerCheck(getSession(Constant.DB_SESSION_CM_PRE), dtPaging, userToken.getLoginName());
            Query countQuery = session.createSQLQuery(sqlCount.toString());
            //TODO - Set parameters (if any)
            selectQuery.setFirstResult(dtPaging.getPage() * dtPaging.getPageSize());
            selectQuery.setMaxResults(dtPaging.getPageSize());
            dtPaging.setList(selectQuery.list());

            int totalRows = ((BigDecimal) countQuery.uniqueResult()).intValue();
            dtPaging.setTotalRows(totalRows);
            List<Customer> resultList = dtPaging.getList();

            jsGridData.setRecordsTotal(dtPaging.getTotalRows());
            jsGridData.setRecordsFiltered(dtPaging.getTotalRows());
            jsGridData.setData(resultList);
        } catch (Exception ex) {
            ex.printStackTrace();

        }

        return pageForward;
    }

    public String viewDetailCustomer() throws Exception {
        String pageForward = "success";
        StringBuilder sql = new StringBuilder();
        List listParam = new ArrayList();
        listParam.add(this.customer_id);//849812
        System.out.println("location = " + location);
        System.out.println("customer_id = " + customer_id);

//        sql.append("select * from customer where address = :address");
        sql.append("select * from customer");
        sql.append(" where customer_id = ?");

        //get hibernate session from the servlet context
        SessionFactory sessionFactory =
                (SessionFactory) ServletActionContext.getServletContext().getAttribute(HibernateListener.KEY_NAME);

        Session session = sessionFactory.openSession();
//        Session session = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
        SQLQuery selectQuery = session.createSQLQuery(sql.toString());
        for (int i = 0; i < listParam.size(); i++) {
            selectQuery.setParameter(i, listParam.get(i));
        }
        selectQuery.addEntity(Customer.class);
        request = ServletActionContext.getRequest();
        Customer customerDetail = (Customer) selectQuery.uniqueResult();
        request.setAttribute("customerDetail", customerDetail);

        return pageForward;
    }

    public String updateCustomer() throws Exception {
        String pageForward = "success";
        StringBuilder sql = new StringBuilder();
        StringBuilder sql2 = new StringBuilder();
        List listParam = new ArrayList();
        listParam.add(customer.getName());
        listParam.add(customer.getAddress());
        listParam.add(this.customer_id);
        request = ServletActionContext.getRequest();
//        sql.append("select * from customer where address = :address");
        sql.append("update customer");
        sql.append(" set name = ? ,");
        sql.append(" address = ? ");
        sql.append(" where customer_id = ?");

        //get hibernate session from the servlet context
        SessionFactory sessionFactory =
                (SessionFactory) ServletActionContext.getServletContext().getAttribute(HibernateListener.KEY_NAME);

        Session session = sessionFactory.openSession();
//        Session session = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
        Query selectQuery = session.createSQLQuery(sql.toString());
        for (int i = 0; i < listParam.size(); i++) {
            selectQuery.setParameter(i, listParam.get(i));
        }

        session.beginTransaction();
        selectQuery.executeUpdate();
        session.getTransaction().commit();
        sql2.append("select * from customer");
        SQLQuery query = session.createSQLQuery(sql2.toString());
//        query.setParameter("address", "hn");
        query.addEntity(Customer.class);
        customerList = query.list();

        return pageForward;
    }
}
