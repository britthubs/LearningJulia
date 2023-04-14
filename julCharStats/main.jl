# import
import REPL
using REPL.TerminalMenus

# set up empty array and string (end summary)
names = []
stats_tot = []

function nameAndClear()
    println("What's your character's name?: ")
    charac = readline()
    push!(names, charac)  # add the name of the character to the list
    stats = []  # make sure the list is empty again before adding stats
    return charac, stats
end

function method()  # method list + input method
    options = ["roll 3d6 and add them", "roll 3d6 and add (3 times), pick the highest","roll 4d6, drop lowest number and add them"]
    menu = RadioMenu(options; charset=:ascii)
    choice = request("METHOD MENU:", menu)
    choice == 1 ? three_dsix() : (choice == 2 ? three_dsix_drop() : four_dsix_drop())  # call the respective function
end


function three_dsix()  # 3d6 per stat
    charac, stats = nameAndClear()
    for i in UnitRange(1,6)
        stat = rand(1:6) + rand(1:6) + rand(1:6)
        push!(stats, stat)  # add the stat to a list for this character's stats
    end
    push!(stats_tot, stats)  # put the list of the stats for this character in a list for the summary at the end

end

function three_dsix_drop()  # 3 times 3d6, pick highest
    charac, stats = nameAndClear()
    for i in UnitRange(1,6)
        stat = max(rand(1:6) + rand(1:6) + rand(1:6),
                rand(1:6) + rand(1:6) + rand(1:6),
                rand(1:6) + rand(1:6) + rand(1:6))  # take the highest number from the array containing 3 times 3d6 for one stat
        push!(stats, stat)  # add the stat to a list for this character's stats
    end
    push!(stats_tot, stats)  # put the list of the stats for this character in a list for the summary at the end
end

function four_dsix_drop()  # 4d6 drop the lowest
    charac, stats = nameAndClear()
    for i in UnitRange(1,6)
        dice = [rand(1:6), rand(1:6), rand(1:6), rand(1:6)]  # 4d6 in an array
        minVal = minimum(dice)
        index_to_delete = findfirst(x -> x == minVal, dice)
        index_to_delete !== nothing && deleteat!(dice, index_to_delete)  # remove the lowest value from the array
        stat = 0
        for number in dice
            stat += number  # add all the remaining numbers from the list
        end
        push!(stats, stat)  # add the stat to a list for this character's stats
    end
    push!(stats_tot, stats)  # put the list of the stats for this character in a list for the summary at the end
end


printstyled("CHARACTER STATS GENERATOR\n"; color= :magenta)
println("*" ^ 25)
method()  # show the method menu
printstyled("Stats are generated! Your character is ready!"; color= :magenta)

while true  # ask for repeat or not
    printstyled("Would you like to see a summary of the stats or roll for a new character?\n"; color= :magenta)
    printstyled("If you choose to roll for a new character, information won't be lost,\n")
    printstyled("a summary of all stats will be shown at the end.")
    options = ["See all stats","Roll new character"]
    menu = RadioMenu(options; charset=:ascii)
    choiceRep = request("", menu)
    choiceRep == 1 ? break : method()
end


println(stats_tot, names)