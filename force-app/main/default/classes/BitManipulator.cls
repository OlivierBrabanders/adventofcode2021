public with sharing class BitManipulator {
    public List<String> getInputWithMostCommons(List<String> input, String bit, Integer position) {
        List<String> mostCommons = new List<String>();
        for (String inputLine : input) {
            if (inputLine.split('')[position] == bit) {
                mostCommons.add(inputLine);
            }
        }
        return mostCommons;
    }
    public Map<String,Integer> getBitCount(List<String> lines, Integer position) {
        Integer ones = 0;
        Integer zeroes = 0;
        Map<String,Integer> result = new Map<String,Integer>();
        for (String line: lines) {
            String currentBit = line.split('')[position];
            if (currentBit == '1') {
                ones++;
            } else {
                zeroes++;
            }
        }
        result.put('ones', ones);
        result.put('zeroes', zeroes);
        return result;
    }
    /*
    * Totally not stolen on stackoverflow
    */
    public Integer byteStringToInteger(String byteString) {
        Integer result = 0;
        if (byteString != null && byteString.containsOnly('01')) {
            result = 0;
            for(String s: byteString.split('')) {
                result = (result << 1) | (s == '1'? 1: 0);
            }
        }
        return result;
    }
}