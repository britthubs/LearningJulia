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

    println("Enter your choice (1 or 2): ")
    choice = readline()

        while choice ∉ ["1", "2"]
            println("Invalid choice. Please enter a valid option number.")
            choice = readline()
        end
        if choice == "1"
            three_dsix()
        elseif choice == "2"
            four_dsix_drop()
        end
end

method()
