.pragma library

let rock = 1;
let paper = 2;
let scissor = 3;

let draw = 1;

function getComputerResult() {
    return Math.floor(Math.random() * 3) + 1
}

function getText(type) {
    if(type === rock)
        return "Rock";
    else if(type === paper)
        return "Paper";
    else if(type === scissor)
        return "Scissor";
    else
        return "Unknown";
}
