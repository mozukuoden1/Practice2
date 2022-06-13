package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DateData;
import bean.Kakeibo;
import model.DataControllerLogic;
import model.KakeikanriLogic;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	List<Kakeibo> addkakeibo = new ArrayList();

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		List<Kakeibo> kakeibolist = new ArrayList();

		KakeikanriLogic kakeikanrilogic = new KakeikanriLogic();
		DataControllerLogic datacontrollerlogic = new DataControllerLogic();
		Kakeibo kakeibo = null;
		DateData datedata = null;
		String errermessage = null;
		String forwordurl = "/Main.jsp";
		HttpSession session = request.getSession();

		String check = request.getParameter("check");
		if(check != null && check.equals("done")) {//Regist.jsp「家計簿メインに戻る」クリックでの制御
			addkakeibo.clear();
			session.removeAttribute("addkakeibo");
			session.removeAttribute("datedata");
		}

		//---------------------Regist.jsp「登録」クリックでの処理----------------------------------------------------------------------
		String action = request.getParameter("action");
		if(action != null && action.equals("done")) {
			kakeibo = datacontrollerlogic.kakeiboData(request);
			if(kakeibo != null) {
				kakeikanrilogic.create(kakeibo);

				kakeibo.setHimoku(datacontrollerlogic.himokuChange(kakeibo.getHimoku()));
				datacontrollerlogic.dateFormat(kakeibo);

				addkakeibo.add(0, kakeibo);

				session.setAttribute("addkakeibo", addkakeibo);
			} else {
				errermessage = "エラー：入金額,出金額には整数を入力してください";
			}

			forwordurl = "/Regist.jsp";
		}
		//ここまで-----------------------------------------------------------------

		//-----------------「Update.jsp」「Delete.jsp」の修正・削除ID決定クリックでの処理---------------------------------------------------------------
		String selectid = request.getParameter("selectid");
		if(selectid != null && selectid.equals("done")) {
			String recordid = request.getParameter("recordid");
			String deletejsp = request.getParameter("deletejsp");

			try {
				kakeibo = kakeikanrilogic.selectData(recordid);

				String year = kakeibo.getDate().substring(0, 4);
				String month =kakeibo.getDate().substring(5, 7);
				String day =kakeibo.getDate().substring(8, 10);
				datedata = new DateData(year, month, day);

				request.setAttribute("datedata", datedata);
				request.setAttribute("kakeibo", kakeibo);
			}
			catch(NumberFormatException e) {
				errermessage = "エラー：IDが未入力又は、一致するレコードがありません";
			}
			catch(NullPointerException e) {
				errermessage = "エラー：IDが未入力又は、一致するレコードがありません";
			}

			forwordurl = (deletejsp != null && deletejsp.equals("done")) ? "/Delete.jsp" : "/Update.jsp";
		}
		//ここまで------------------------------------------------------

		//---------------------「Update.jsp」修正ボタンクリックでの処理---------------------------------------------------------------
		String update = request.getParameter("update");
		if(update != null && update.equals("done")) {
			kakeibo = datacontrollerlogic.kakeiboData(request);
			forwordurl = "/Update.jsp";
			if(kakeibo != null) {
				try {
					kakeibo.setRecordid(Integer.parseInt(request.getParameter("id")));

					kakeikanrilogic.kakeiboUpdate(kakeibo);
				}
				catch(NumberFormatException e) {
					errermessage = "エラー：修正IDを入力してください";
				}
			} else {
				errermessage = "エラー：入出金額の項目が不正な値です";
			}
		}
		//ここまで-----------------------------------------------------------

		//---------------------「Delete.jsp」削除ボタンクリックでの処理----------------------------
		String delete = request.getParameter("delete");
		if(delete != null && delete.equals("done")) {
			kakeikanrilogic.recordDelete(request.getParameter("deleteid"));

			forwordurl = "/Delete.jsp";
		}
		//ここまで-------------------------------------------------------------

		String selectyear = request.getParameter("kikan_toshi");    //Main.jsp:絞り込み機能の制御
		String selectmonth = request.getParameter("kikan_tsuki");
		String datemessage = "";
		if(selectyear != null && selectmonth != null) {
			kakeibolist = kakeikanrilogic.find(selectyear, selectmonth);
			datemessage = selectyear + "年" + selectmonth + "月" + "の家計簿";
		} else {
			kakeibolist = kakeikanrilogic.find();
			datemessage = "過去28日分の家計簿";
		}

		kakeikanrilogic.calcZandaka();

		request.setAttribute("errermessage", errermessage);
		request.setAttribute("datemessage", datemessage);
		session.setAttribute("kakeibolist", kakeibolist);
		RequestDispatcher dispatcher = request.getRequestDispatcher(forwordurl);
		dispatcher.forward(request, response);
	}
}
