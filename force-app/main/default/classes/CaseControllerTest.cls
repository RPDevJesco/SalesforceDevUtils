/**
 * Created by jglov on 7/29/2023.
 */

@IsTest
private class CaseControllerTest {
    @TestSetup
    static void createTestData() {
        // Create some test Case records
        List<Case> testCases = new List<Case>();
        for (Integer i = 0; i < 10; i++) {
            Case testCase = new Case();
            testCase.Subject = 'Test Case ' + i;
            testCase.Status = 'Open';
            testCases.add(testCase);
        }
        insert testCases;
    }

    @IsTest
    static void testGetCases() {
        Test.startTest();
        List<Case> cachedCases = CaseController.getCases();
        Test.stopTest();

        // Verify the number of cases returned (should be 10)
        System.assertEquals(10, cachedCases.size(), 'Incorrect number of cases returned.');

        // Verify that the cases are ordered by CreatedDate DESC
        Datetime previousCreatedDate = cachedCases[0].CreatedDate;
        for (Integer i = 1; i < cachedCases.size(); i++) {
        Datetime currentCreatedDate = cachedCases[i].CreatedDate;
        System.assert(currentCreatedDate <= previousCreatedDate, 'Cases are not ordered by CreatedDate DESC.');
        previousCreatedDate = currentCreatedDate;
    }

    // Verify the fields of the first case (latest created case)
    Case latestCase = cachedCases[0];
    System.assertEquals('Test Case 0', latestCase.Subject, 'Incorrect Subject for the latest case.');
    System.assertEquals('Open', latestCase.Status, 'Incorrect Status for the latest case.');
    }
}