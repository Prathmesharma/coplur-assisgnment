
using System;
public class Program
{
    public static void Main(string[] args)
    {
        Customer cust = new Customer();
        cust.CustomerId = 52;
        cust.FirstName = "Prathmesh";
        cust.LastName = "Sharma";
        cust.Email = "prathmesh2004sharma@gmail.com";
        cust.Type = CustomerType.Silver;

        cust.ProcessOrder(cust);
        cust.Register(cust);

        Console.WriteLine(cust.GetDiscountPercentage() + " percent");
        Leads lead = new Leads();
        lead.Name = "Gappu";
        lead.Email = "gappu@gmail.com";
        lead.Check();



    }
}


public class Customer
{
    //srp
    public int CustomerId { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Email { get; set; }
    public CustomerType Type { get; set; }

    //ocp
    public void Register(Customer cust)
    {
        try
        {
            Console.WriteLine(cust.FirstName + " " + cust.LastName + "  ->" + cust.Type + " customer");
            
            if (cust.Type == CustomerType.Bronze)
            {
                //some logic
                Console.WriteLine("Checking Bronze customer details");
            }

            if (cust.Type == CustomerType.Silver)
            {
                //some logic
                Console.WriteLine("Checking Silver customer details");  
            }

            if (cust.Type == CustomerType.Gold)
            {
                //some logic
                Console.WriteLine("Checking Gold customer details");
            }

            if (cust.Type == CustomerType.Platinum)
            {
                //some logic
                Console.WriteLine("Checking Platinum customer details");
            }

            SaveCustomer();

        }
        catch (Exception ex)
        {
            //Logger 
            Console.WriteLine($"Log Error: {ex.Message}");
        }
    }
//lsp
    public virtual bool SaveCustomer()
    {
        //save customer details to database
        Console.WriteLine("Details Saved ");
        return true;
    }

    public int GetDiscountPercentage()
    {
        if (this.Type == CustomerType.Bronze)
        {
            return 15;
        }

        if (this.Type == CustomerType.Silver)
        {
            return 20;
        }

        if (this.Type == CustomerType.Gold)
        {
            return 25;
        }

        if (this.Type == CustomerType.Platinum)
        {
            return 27;
        }

        return 12;
    }

    //dip

    public void ProcessOrder(Customer cust)
    {
        GetDiscountPercentage();
        //Process Payment after Discount
        Console.WriteLine("Processing for->" + cust.FirstName + " " + cust.LastName);
        //Send confirmation
        int dis=cust.GetDiscountPercentage();

        //Log Order Activity
        Console.WriteLine(dis + " percent discount ");
        Console.WriteLine("Order Placed Successfully");
    }
}
//isp
public class Leads : Customer
{
    //It is just a lead so need to save it in the database
    public string Name { get; set; }
    public string Email { get; set; }

    public void Check()
    {
        Console.WriteLine(Name+" Checked details");
    }
}

public enum CustomerType
{
    Bronze,
    Silver,
    Gold,
    Platinum
}
