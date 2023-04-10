# method list + input method
function three_dsix()
    println("To be continued")
end

function four_dsix_drop()
    println("To be continued")
end

function method()
    options = ["roll 3d6 and add them", "roll 4d6, drop lowest number and add them"]
    printstyled("METHOD MENU:\n"; color= :magenta)
    for (i, option) in enumerate(options)
        println("[$i] $option")
    end

    while true
        println("Enter your choice (1 or 2): ")
        input = readline()
        choice = parse(Int, input)

        if choice in 1:length(options)
            if choice == 1
                three_dsix()
            elseif choice == 2
                four_dsix_drop()
            end
            break
        else
            println("Invalid choice. Please enter a valid option number.")
        end
    end
end

method()
