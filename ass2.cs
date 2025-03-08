using System;
class Logger
{
    public virtual void Log(string message)
    {
        Console.WriteLine(message);
    }

}

class dbLogger : Logger
{
    public override void Log(string message)
    {
        Console.WriteLine("Log to database - " + message);
    }
}

class fileLogger : Logger
{
    public override void Log(string message)
    {
        Console.WriteLine("Log to file - " + message);
    }
}

class CloudLogger : Logger
{
    public override void Log(string message)
    {
        Console.WriteLine("Log to Cloud - " + message);
    }
}

class Code
{
    static void Main()
    {
        Logger dbLogger = new dbLogger();
        Logger fileLogger = new fileLogger();
        Logger CloudLogger = new CloudLogger();

        dbLogger.Log("Database ");
        fileLogger.Log("File");
        CloudLogger.Log("Cloud");
    }
}