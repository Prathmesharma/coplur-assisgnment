using System;

class Program
{
    static List<string> menu = new List<string>();
    static Dictionary<int, List<string>> orders = new Dictionary<int, List<string>>();
    static Queue<int> pending = new Queue<int>();
    static Stack<int> delivered = new Stack<int>();
    static HashSet<string> categories = new HashSet<string>();

    static void Main()
    {
        while (true)
        {
            Console.WriteLine("1. Enter Food Item");
            Console.WriteLine("2. Menu");
            Console.WriteLine("3. Make Order");
            Console.WriteLine("4. Deliver");
            Console.WriteLine("5. Pending Orders");
            Console.WriteLine("6. Show Delivered Orders");
            Console.WriteLine("7. Show Categories");
            Console.WriteLine("8. Exit");
            Console.WriteLine("Enter choice: ");

            string input = Console.ReadLine();
            int choice = 0;

            if(input.Length==1 && input[0]>='1' && input[0] <= '8')
            {
                choice = input[0] - '0';
            }
            else
            {
                Console.WriteLine("Invalid choice");
                continue;
            }

            if(choice==1)
            {
                Console.WriteLine("Enter food item: ");
                string item = Console.ReadLine();
                menu.Add(item);
                Console.WriteLine("Enter category: ");
                string category = Console.ReadLine();
                categories.Add(category);
            }
            else if (choice == 2)
            {
                Console.WriteLine("Menu: ");
                foreach (string item in menu)
                {
                    Console.WriteLine(item);
                }
            }
            else if (choice == 3)
            {
                Console.WriteLine("Enter order id: ");
                int id = int.Parse(Console.ReadLine());
                List<string> order = new List<string>();
                while (true)
                {
                    Console.WriteLine("Enter food item: ");
                    string item = Console.ReadLine();
                    if (item == "0")
                    {
                        break;
                    }
                    order.Add(item);
                }
                orders[id] = order;
                pending.Enqueue(id);
            }
            else if (choice == 4)
            {
                if (pending.Count == 0)
                {
                    Console.WriteLine("No pending orders");
                    continue;
                }
                int id = pending.Dequeue();
                List<string> order = orders[id];
                Console.WriteLine("Delivering order: ");
                foreach (string item in order)
                {
                    Console.WriteLine(item);
                }
                delivered.Push(id);
            }
            else if (choice == 5)
            {
                Console.WriteLine("Pending orders: ");
                foreach (int id in pending)
                {
                    List<string> order = orders[id];
                    Console.WriteLine("Order id: " + id);
                    foreach (string item in order)
                    {
                        Console.WriteLine(item);
                    }
                }
            }
            else if (choice == 6)
            {
                Console.WriteLine("Delivered orders: ");
                foreach (int id in delivered)
                {
                    List<string> order = orders[id];
                    Console.WriteLine("Order id: " + id);
                    foreach (string item in order)
                    {
                        Console.WriteLine(item);
                    }
                }
            }
            else if (choice == 7)
            {
                Console.WriteLine("Categories: ");
                foreach (string category in categories)
                {
                    Console.WriteLine(category);
                }
            }
            else if (choice == 8)
            {
                break;
            }
        }
    }
}