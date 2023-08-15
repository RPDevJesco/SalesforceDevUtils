public with sharing class CaseController {
    @AuraEnabled(Cacheable=true)
    public static List<Case> getCases() {
        return [SELECT CaseNumber, CreatedDate, ClosedDate, IsClosed, Case_Age__c, Subject, Status FROM Case ORDER BY CreatedDate DESC LIMIT 10];
    }
}