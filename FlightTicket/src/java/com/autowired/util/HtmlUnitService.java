package com.autowired.util;

import java.io.IOException;
import java.util.List;

import com.autowired.model.Search;
import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.ElementNotFoundException;
import com.gargoylesoftware.htmlunit.ScriptException;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlForm;
import com.gargoylesoftware.htmlunit.html.HtmlInput;
import com.gargoylesoftware.htmlunit.html.HtmlOption;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import com.gargoylesoftware.htmlunit.html.HtmlPasswordInput;
import com.gargoylesoftware.htmlunit.html.HtmlRadioButtonInput;
import com.gargoylesoftware.htmlunit.html.HtmlSelect;
import com.gargoylesoftware.htmlunit.html.HtmlSubmitInput;
import com.gargoylesoftware.htmlunit.html.HtmlTextInput;

public class HtmlUnitService {

	private static WebClient webClient = null;

	public static WebClient getWebClient() {
		if (webClient == null) {
			webClient = new WebClient(BrowserVersion.CHROME_16);
		}
		return webClient;
	}

	public HtmlPage login(HtmlForm htmlForm,String username, String password) {
		HtmlPage pageResult = null;
		try {
			HtmlTextInput usernameInput = htmlForm.getInputByName("j_username");
			HtmlPasswordInput passwordInput = htmlForm.getInputByName("j_password");
			usernameInput.setValueAttribute(username);
			passwordInput.setValueAttribute(password);
			HtmlSubmitInput btnSubmit = htmlForm.getInputByValue("Log In");

			pageResult = btnSubmit.click();
//			
//			System.out.println(pageResult.getWebResponse().getContentAsString());
			System.out.println("Login Result : "+pageResult==null);
			System.out.println(pageResult.asXml());
		} catch (ScriptException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 	
		return pageResult;
	}
	
	public boolean checkIsLoginSuccess(HtmlPage htmlPage){
		
		try{
			htmlPage.getFormByName("form1");
		}catch (ElementNotFoundException e) {
			// TODO: handle exception
			return false;
		}
		return true;
	}
	
	public HtmlPage searchFlight(HtmlForm formSearch, Search search){
		HtmlPage searchResultPage=null;
		
		try{
		List<HtmlRadioButtonInput> radioIsReturn = formSearch.getRadioButtonsByName("isReturn");
		for (HtmlRadioButtonInput htmlRadioButtonInput : radioIsReturn) {
			if(htmlRadioButtonInput.getValueAttribute().equals(String.valueOf(search.isReturn()))){
				htmlRadioButtonInput.setChecked(true);
			}
		}
		HtmlSelect selectFrom = formSearch.getSelectByName("from");
		selectFrom.setSelectedAttribute(selectFrom.getOptionByValue(search.getFrom()), true);
		
		HtmlSelect selectTo = formSearch.getSelectByName("to");
		selectTo.setSelectedAttribute(selectTo.getOptionByValue(search.getTo()), true);
		
		HtmlSelect selectDepartDate1 = formSearch.getSelectByName("departDate1");
		selectDepartDate1.setSelectedAttribute(selectDepartDate1.getOptionByValue(search.getDepartDate1()), true);
		
		HtmlSelect selectDepartDate2 = formSearch.getSelectByName("departDate2");
		selectDepartDate2.setSelectedAttribute(selectDepartDate2.getOptionByValue(search.getDepartDate2()), true);
		
		HtmlSelect selectReturnDate1 = formSearch.getSelectByName("returnDate1");
		selectReturnDate1.setSelectedAttribute(selectReturnDate1.getOptionByValue(search.getReturnDate1()), true);
		
		HtmlSelect selectReturnDate2 = formSearch.getSelectByName("returnDate2");
		selectReturnDate2.setSelectedAttribute(selectReturnDate2.getOptionByValue(search.getReturnDate2()), true);
		
		HtmlSelect selectAdult = formSearch.getSelectByName("adult");
		selectAdult.setSelectedAttribute(selectAdult.getOptionByValue(String.valueOf(search.getAdult())), true);
		
		HtmlSelect selectChild = formSearch.getSelectByName("child");
		selectChild.setSelectedAttribute(selectChild.getOptionByValue(String.valueOf(search.getChild())), true);
		
		HtmlSelect selectInfant = formSearch.getSelectByName("infant");
		selectInfant.setSelectedAttribute(selectInfant.getOptionByValue(String.valueOf(search.getInfant())), true);
		
		HtmlInput inputReturnDateRange = formSearch.getInputByName("returndaterange");
		inputReturnDateRange.setValueAttribute("0");
		
		HtmlSubmitInput btnSubmit = formSearch.getInputByValue("Search");
		searchResultPage = btnSubmit.click();
		
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			return searchResultPage;
		}
		return searchResultPage;
	}
	
	
	
	
}
