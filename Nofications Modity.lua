local notifications = {}

function notifications.NewNotification(notification_info)
    -- Parent the notification system to CoreGui for executors
    local Notifications_Folder = cloneref(Instance.new("Folder")) 
    local Container = cloneref(nstance.new("Frame")) 
    local NotificationLayout = cloneref(Instance.new("UIListLayout")) 

    Notifications_Folder.Name = "Notifications"

    -- Use CoreGui for executors
    if syn and syn.protect_gui then
        syn.protect_gui(Notifications_Folder)
        Notifications_Folder.Parent = game:GetService("CoreGui")
    elseif gethui then
        Notifications_Folder.Parent = gethui()
    else
        Notifications_Folder.Parent = game:GetService("CoreGui")
    end

    -- Setup the container
    Container.Name = "Container"
    Container.Parent = Notifications_Folder
    Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Container.BackgroundTransparency = 1.000
    Container.BorderSizePixel = 0
    Container.Position = UDim2.new(1, -210, 0, -10)
    Container.Size = UDim2.new(0, 200, 1, 0)
    Container.ZIndex = 10000

    -- Setup layout
    NotificationLayout.Name = "NotificationLayout"
    NotificationLayout.Parent = Container
    NotificationLayout.SortOrder = Enum.SortOrder.LayoutOrder
    NotificationLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    NotificationLayout.Padding = UDim.new(0, 5)

    -- Notification info
    notification_info.Title = notification_info.Title or "Notification"
    notification_info.Body = notification_info.Body or "This is a notification!"
    notification_info.Time = notification_info.Time or 2 -- Seconds

    -- Create the notification
    local Notification = Instance.new("Frame")
    local Notif_Title = Instance.new("TextLabel")
    local Border = Instance.new("Frame")
    local Body = Instance.new("TextLabel")
    local Progress = Instance.new("Frame")

    -- Notification appearance
    Notification.Name = "Notification"
    Notification.Parent = Container
    Notification.BackgroundColor3 = Color3.fromRGB(30, 30, 30) -- Background
    Notification.BorderColor3 = Color3.fromRGB(25, 25, 25) -- Border
    Notification.ClipsDescendants = true
    Notification.Size = UDim2.new(1, 0, 0, 0)
    Notification.ZIndex = 10001

    -- Title
    Notif_Title.Name = "Notif_Title"
    Notif_Title.Parent = Notification
    Notif_Title.BackgroundTransparency = 1.000
    Notif_Title.Position = UDim2.new(0, 5, 0, 0)
    Notif_Title.Size = UDim2.new(1, -5, 0, 20)
    Notif_Title.ZIndex = 10002
    Notif_Title.Font = Enum.Font.GothamSemibold
    Notif_Title.Text = notification_info.Title
    Notif_Title.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
    Notif_Title.TextSize = 12.000
    Notif_Title.TextXAlignment = Enum.TextXAlignment.Left

    -- Border
    Border.Name = "Border"
    Border.Parent = Notification
    Border.BackgroundColor3 = Color3.fromRGB(25, 25, 25) -- Border
    Border.BorderSizePixel = 0
    Border.Position = UDim2.new(0, 0, 0, 20)
    Border.Size = UDim2.new(1, 0, 0, 1)
    Border.ZIndex = 10002

    -- Body
    Body.Name = "Body"
    Body.Parent = Notification
    Body.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- White background
    Body.BackgroundTransparency = 1.000
    Body.Position = UDim2.new(0, 5, 0, 25)
    Body.Size = UDim2.new(1, -10, 1, -30)
    Body.ZIndex = 10002
    Body.Font = Enum.Font.Gotham
    Body.Text = notification_info.Body
    Body.TextWrapped = true
    Body.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
    Body.TextSize = 12.000
    Body.TextXAlignment = Enum.TextXAlignment.Left
    Body.TextYAlignment = Enum.TextYAlignment.Top

    -- Progress bar
    Progress.Name = "Progress"
    Progress.Parent = Notification
    Progress.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Green progress bar
    Progress.BorderSizePixel = 0
    Progress.Position = UDim2.new(0, 0, 1, -1)
    Progress.Size = UDim2.new(0, 0, 0, 1)
    Progress.ZIndex = 10002

    -- Animation
    spawn(function()
        -- FADE IN
        Notification:TweenSize(UDim2.new(1, 0, 0, 70), "Out", "Quad", 0.2, true)
        wait(notification_info.Time)

        -- PROGRESS BAR
        Progress:TweenSize(UDim2.new(1, 0, 0, 1), "Out", "Linear", notification_info.Time, true)
        wait(notification_info.Time)

        -- FADE OUT
        Notification:TweenSize(UDim2.new(1, 0, 0, 0), "In", "Quad", 0.2, true)
        wait(0.2)
        Notification:Destroy()
    end)
end

return notifications
