-- Notifications Module
local notifications = {}

-- Function to create and display a notification
function notifications.NewNotification(notification_info)
    -- Default notification settings
    notification_info.Title = notification_info.Title or "Notification"
    notification_info.Body = notification_info.Body or "This is a notification!"
    notification_info.Time = notification_info.Time or 2 -- Time in seconds

    -- Parent container for notifications
    local Notifications_Folder = Instance.new("Folder")
    Notifications_Folder.Name = "Notifications"

    -- Executor-specific protection for secure parenting
    if syn and syn.protect_gui then
        syn.protect_gui(Notifications_Folder)
        Notifications_Folder.Parent = game:GetService("CoreGui")
    elseif gethui then
        Notifications_Folder.Parent = gethui()
    else
        Notifications_Folder.Parent = game:GetService("CoreGui")
    end

    -- Notification UI components
    local Notification = Instance.new("Frame")
    local Notif_Title = Instance.new("TextLabel")
    local Border = Instance.new("Frame")
    local Body = Instance.new("TextLabel")
    local Progress = Instance.new("Frame")

    -- Configure Notification container
    Notification.Name = "Notification"
    Notification.Parent = Notifications_Folder
    Notification.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Notification.BorderColor3 = Color3.fromRGB(25, 25, 25)
    Notification.ClipsDescendants = true
    Notification.Size = UDim2.new(1, 0, 0, 0)
    Notification.Position = UDim2.new(0.5, -150, 0, 50) -- Center the notification
    Notification.AnchorPoint = Vector2.new(0.5, 0)
    Notification.ZIndex = 10001

    -- Configure title
    Notif_Title.Name = "Notif_Title"
    Notif_Title.Parent = Notification
    Notif_Title.BackgroundTransparency = 1.000
    Notif_Title.Position = UDim2.new(0, 5, 0, 0)
    Notif_Title.Size = UDim2.new(1, -5, 0, 20)
    Notif_Title.ZIndex = 10002
    Notif_Title.Font = Enum.Font.GothamSemibold
    Notif_Title.Text = notification_info.Title
    Notif_Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Notif_Title.TextSize = 12.000
    Notif_Title.TextXAlignment = Enum.TextXAlignment.Left

    -- Configure border
    Border.Name = "Border"
    Border.Parent = Notification
    Border.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Border.BorderSizePixel = 0
    Border.Position = UDim2.new(0, 0, 0, 20)
    Border.Size = UDim2.new(1, 0, 0, 1)
    Border.ZIndex = 10002

    -- Configure body text
    Body.Name = "Body"
    Body.Parent = Notification
    Body.BackgroundTransparency = 1.000
    Body.Position = UDim2.new(0, 5, 0, 25)
    Body.Size = UDim2.new(1, -10, 1, -30)
    Body.ZIndex = 10002
    Body.Font = Enum.Font.Gotham
    Body.Text = notification_info.Body
    Body.TextColor3 = Color3.fromRGB(255, 255, 255)
    Body.TextSize = 12.000
    Body.TextWrapped = true
    Body.TextXAlignment = Enum.TextXAlignment.Left
    Body.TextYAlignment = Enum.TextYAlignment.Top

    -- Configure progress bar
    Progress.Name = "Progress"
    Progress.Parent = Notification
    Progress.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    Progress.BorderSizePixel = 0
    Progress.Position = UDim2.new(0, 0, 1, -1)
    Progress.Size = UDim2.new(0, 0, 0, 1)
    Progress.ZIndex = 10002

    -- Display and animate the notification
    coroutine.wrap(function()
        -- Fade in
        local FadeIn = game:GetService("TweenService"):Create(
            Notification,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
            {Size = UDim2.new(0, 300, 0, 70)}
        )
        FadeIn:Play()
        FadeIn.Completed:Wait()

        -- Progress bar animation
        local ProgressTween = game:GetService("TweenService"):Create(
            Progress,
            TweenInfo.new(notification_info.Time, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
            {Size = UDim2.new(1, 0, 0, 1)}
        )
        ProgressTween:Play()
        ProgressTween.Completed:Wait()

        -- Fade out
        local FadeOut = game:GetService("TweenService"):Create(
            Notification,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
            {Size = UDim2.new(0, 300, 0, 0)}
        )
        FadeOut:Play()
        FadeOut.Completed:Wait()

        Notification:Destroy()
    end)()
end

return notifications
