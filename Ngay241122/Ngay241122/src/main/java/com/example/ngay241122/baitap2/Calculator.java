package com.example.ngay241122.baitap2;

public class Calculator {
    public static float calculate(float firstOperand, float secondOperand, char operator ){
        switch (operator){
            case '+':
                return firstOperand + secondOperand;
            case '-':
                return firstOperand - secondOperand;
            case '*':
                return firstOperand * secondOperand;
            case '/':
                if(firstOperand != 0 || secondOperand !=0){
                    return firstOperand / secondOperand;
                }else {
                    return 0;
                }
            default:
                throw new RuntimeException("Invalid operation");
        }
    }
}
