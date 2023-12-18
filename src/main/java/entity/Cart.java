package entity;

public class Cart {
	 private int accountID;
	 private int productID;
	 private int amount;
	 private int maCart;
	 private String made_in;
	public Cart(int accountID, int productID, int amount, int maCart, String made_in) {
	
		this.accountID = accountID;
		this.productID = productID;
		this.amount = amount;
		this.maCart = maCart;
		this.made_in = made_in;
	}
	public Cart() {
		
	}
	public int getAccountID() {
		return accountID;
	}
	public void setAccountID(int accountID) {
		this.accountID = accountID;
	}
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getMaCart() {
		return maCart;
	}
	public void setMaCart(int maCart) {
		this.maCart = maCart;
	}
	public String getMade_in() {
		return made_in;
	}
	public void setMade_in(String made_in) {
		this.made_in = made_in;
	}
	@Override
	public String toString() {
		return "Cart [accountID=" + accountID + ", productID=" + productID + ", amount=" + amount + ", maCart=" + maCart
				+ ", made_in=" + made_in + "]";
	} 
	 
	
}
