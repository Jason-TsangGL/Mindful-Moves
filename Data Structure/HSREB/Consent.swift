/*
 Copyright © 2021 Apple Inc. All rights reserved.

 Apple permits redistribution and use in source and binary forms, with or without
 modification, providing that you adhere to the following conditions:

 1. Redistributions of source code must retain the above copyright notice, this
 list of conditions, and the following disclaimer.

 2. Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions, and the following disclaimer in the documentation and
 other distributed materials.

 3. You may not use the name of the copyright holders nor the names of any contributors
 to endorse or promote products that derive from this software without specific prior
 written permission. Apple does not grant license to the trademarks of the copyright
 holders even if this software includes such marks.

 THE COPYRIGHT HOLDERS AND CONTRIBUTORS PROVIDE THIS SOFTWARE "AS IS”, AND DISCLAIM ANY
 EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
 OR CONSEQUENTIAL  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) WHATEVER THE CAUSE AND
 ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF YOU
 ADVISE THEM OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import Foundation
import ResearchKit

let ConsentDocuments = "Onboarding.ConsentDocument"
public var Signature : ORKConsentSignature { let Signatures = ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: Surveys.ConsentSignature)
    Signatures.requiresSignatureImage = true
    Signatures.requiresName = false
    return Signatures
}

public var ConsentDocument : ORKConsentDocument {
    let consentDocument = ORKConsentDocument()

    consentDocument.htmlReviewContent = informedConsentHTML
    consentDocument.addSignature(Signature)
    consentDocument.sections = [ORKConsentSection(type: .onlyInDocument)]
    
    return consentDocument
}
public var ConsentSignatureStep : ORKConsentReviewStep {
    let CSS = ORKConsentReviewStep(identifier: Surveys.ConsentForm, signature: Signature, in: ConsentDocument)
    
    CSS.iconImage = UIImage(named: "FeaturedIcon")
    CSS.requiresScrollToBottom = true
    CSS.reasonForConsent =  "I have read the Letter of Information and have had the nature of the study explained to me, and I agree to participate. All questions have been answered to my satisfaction. "
    return CSS
}
public var ConsentDocController : ORKConsentReviewStepViewController {
    let CSController = ORKConsentReviewStepViewController(consentReviewStep: ConsentSignatureStep, result: ORKConsentSignatureResult(identifier: Surveys.ConsentSignature))
    return CSController
}

let informedConsentHTML = """
    <!DOCTYPE html>
    <html lang="en" xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="viewport" content="width=400, user-scalable=no">
        <meta charset="utf-8" />
        <style type="text/css">
            ul, p, h1, h3 {
                text-align: left;
            }
        </style>
    </head>
    <body>
    <h1>Information &amp; Consent Form</h1>
    <p>Study Title: Adherence of Canadian 24-hr Movement Guideline Profiles in young adults through personal mobile devices and the potential links to depressive symptoms. A Pilot Study</p>
    <p>Principal Investigator:&nbsp;Harry Prapavessis, Ph.D. (519 661 -2111 x 80173),&nbsp;<a href="mailto:hprapave@uwo.ca">hprapave@uwo.ca</a></p>
    <p>Co-Investigator:&nbsp;Jason Tsang,&nbsp;<a href="mailto:jtsang83@uwo.ca">jtsang83@uwo.ca</a></p>
    <p>Address:&nbsp;Room 2107B Thames Hall, Western University, London, Ontario, Canada N6A 5B9&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;</p>
    <h2>Invitation to Participate.</h2>
    <p>You are invited to participate in this study if you are a current student of Western University with an Apple iPhone and Apple Watch that meet the minimum technical requirements. Individuals must be a minimum age of 18 and have the ability to read and comprehend instructions in English.&nbsp;</p>
    <p>Study participation requires you to have an iPhone 8 or later, operating on iOS 16 or newer, and with access to a data plan and Wi-Fi. In addition, participation requires an Apple Watch SE(1st Gen., or later), Series 4 or later, operating on WatchOS 9 or newer.</p>
    <h2>Why is the study being done?</h2>
    <p>We are looking to advance our understanding of the causes and trajectories of mental health symptoms, particularly depression, and its potential relationship to physical activity, sedentary behaviour and sleep.&nbsp;</p>
    <p><br></p>
    <p>How will participation data be used?</p>
    <p>The data we collect through your participation will help answer this question by advancing our investigation into the potential relationship between physical activity, sedentary behaviour and sleep with mental health symptoms.</p>
    <h2>How long will you be in the study?</h2>
    <p>Study participation is expected to require at most 60 minutes of dedicated time over two weeks.</p>
    <h2>What are the study procedures?</h2>
    <p>This study is a project conducted under the direction and supervision of Dr. Harry Prapavessis. Research participation involves completing weekly and daily assessments for two weeks.</p>
    <p>You will be asked to complete an eligibility questionnaire initially to determine eligibility before proceeding. Then you will be asked to answer a demographic questionnaire. Participants will conduct these two questionnaires only once at the beginning of the study.</p>
    <p>This study will be conducted remotely without direct contact between researchers and participants. The researcher will provide participants with a link to the Apple App Store to download the study application&nbsp;&ldquo;Mindful Moves.&rdquo;</p>
    <p>Once you have signed the study consent form (Provided within the application) and enrolled in the study, we will use sensors embedded in your iPhone and Watch to record information about:</p>
    <ul>
        <li>
            <p>Specifically, Researchers will obtain sleep information in the Health app.</p>
        </li>
        <li>
            <p>The device and application data include the number of steps taken, distance walked, phone usage, survey data, and other collected motion sensor data.</p>
        </li>
        <li>
            <p>The Apple Watch, paired with the iPhone, will record health metrics such as calories burned, minutes spent exercising, and heart rate.</p>
        </li>
    </ul>
    <p>This application will not keep any identifiable information about you.</p>
    <p>Researchers will only collect the data described above if you sign the study consent form.</p>
    <p>Over the two weeks, we will ask you to:</p>
    <ul>
        <li>
            <p>Use these devices daily, which includes wearing the Apple Watch that is provided by the study for at least 20 hours each day (including sleeping with the Apple Watch on)</p>
        </li>
        <li>
            <p>Meet daily charging requirements, which require charging your Apple Watch and iPhone for at least two consecutive hours each day (twice if needed) while the devices are connected via Bluetooth and on the same Wi-Fi.</p>
        </li>
        <li>
            <p>Report daily on recreational screen time using the app installed on your iPhone</p>
        </li>
        <li>
            <p>Complete weekly assessments using&nbsp;&ldquo;Mindful Moves.&rdquo;</p>
        </li>
        <li>
            <p>Do not share your Apple Watch with anybody else for the study.</p>
        </li>
        <li>
            <p>Continue your day-to-day routine.</p>
        </li>
    </ul>
    <p>Participants will conduct bi-weekly questionnaires&nbsp;on the&nbsp;initial&nbsp;day of study enrollment and the&nbsp;last&nbsp;day of the study duration regarding their sleep over the previous two weeks. (~10 mins)</p>
    <p>Participants will conduct weekly questionnaires&nbsp;on the initial day of enrollment, day seven, and the last day of the study duration. A mental health questionnaire will be administered to look into depressive symptoms, and a self-reported weekly exercise questionnaire will also be. (~5 mins)</p>
    <p>Daily Questionnaires&nbsp;will consist of a simple questionnaire asking you to report the previous day&rsquo;s recreational screen time on the iphone. (~10 mins)</p>
    <h2>What are the potential risks and harms of participating in this study?</h2>
    <p>This study does not provide any potentially beneficial treatment or expose one to harm.</p>
    <p>This study will inconvenience participants for charging adherence (~4h/day) and completing assigned questionnaires (&lt;1hr/day).</p>
    <h2>What are the potential benefits of participating in this study?</h2>
    <p>You may benefit from participation in this study. You do not have to participate in this study to receive any potential benefits. However, researchers hope this study will fulfill its purpose and help others in the future.</p>
    <h2>Can participants choose to leave the study after they have enrolled?</h2>
    <p>Yes. Participation in research is entirely voluntary. You may withdraw without penalty, which can be done on the settings page in the application by pressing the &ldquo;Withdraw from Study&rdquo; button. Withdrawal will prompt the application to overwrite all data collected and reset the application to factory settings. Another option is to delete the application and follow the instructions about deleting data stored from the &ldquo;Mindful Moves&rdquo; application.</p>
    <p>Withdrawal will mean that study staff will not have access to your research data, and &ldquo;Mindful Moves&rdquo; will send no data before study completion.</p>
    <p>If you have completed the study and wish to remove your data, that will not be possible, as all data is unidentifiable. However, Researchers will report all published participant data in an aggregate and anonymized way. If you wish to leave the study part way through, you may do so, but any data collected up to that point will remain part of the study data as we cannot identify which data is specifically yours, but no more data about you will be collected.&nbsp;</p>
    <h2>How will participants&rsquo; information be kept confidential?</h2>
    <p>The Principal Investigator and Co-Investigator will be the only individuals authorized to access the collected information.&nbsp;A secure on-campus storage drive holds all information provided to the researcher in the strictest confidence. You will be assigned an identification number, and all data collected will be recorded and stored under this number.&nbsp;</p>
    <p>Study researchers will not connect you to your data.&nbsp;The application will remove all personal identifiers and assign a random ID to the data. All data will remain securely stored locally until the completion of the study. All relevant data will be aggregated and sent to the lab&apos;s secured storage server on campus with additional security measures to ensure data safety.&nbsp;</p>
    <p>Delegated institutional representatives of Western University or its Research Ethics Boards (REBs) may require access to your study-related records to monitor the conduct of the research per regulatory requirements.</p>
    <p>How long will your data be stored?&nbsp;</p>
    <p>The laboratory will store your data for seven years per Western University policy or one year after the last use.</p>
    <p>The laboratory will take all security and protection protocols to ensure the privacy of your research data.</p>
    <p>All Coded Study Data will be treated per this consent form and its privacy policy (<a href="https://www.apple.com/legal/privacy/apple-health-studies/en-ww/">https://www.apple.com/legal/privacy/apple-health-studies/en-ww/</a>).</p>
    <p><br></p>
    <p>Once the study is complete, how will your data be destroyed?&nbsp;&nbsp;</p>
    <p>Once the study and analysis of the collected confidential information are completed, the researchers will erase all stored participant data per the DoD 5220.22-M standards.&nbsp;</p>
    <h2>Are participants compensated for being in this study?</h2>
    <p>Participants are not compensated in this study.</p>
    <h2>What are the rights of Participants?</h2>
    <p>Taking part in this research study is voluntary.</p>
    <ul>
        <li>
            <p>You DO NOT have to participate in this study.</p>
        </li>
        <li>
            <p>If you choose to participate in this study, you HAVE the right to STOP at any time.</p>
        </li>
        <li>
            <p>If you decide not to be in this research or if you decide to withdraw voluntarily, there will be no penalty of loss of benefits to which you are entitled.</p>
        </li>
        <li>
            <p>If you withdraw voluntarily and then choose to participate again, you may be allowed to enroll as long as the study is still active.</p>
        </li>
    </ul>
    <h2>Whom do participants contact for questions?</h2>
    <p>A frequently asked questions (<a href="https://docs.google.com/document/u/0/d/1vTbRaA9B6Dbioew2KGXBwrb_bufUcxSmv1xoA93HB_Y/edit">FAQ)</a> document is provided, which answers most of the common questions. If you still need to meet your satisfactory requirements, feel free to get in touch with the co-investigator/app developer, Jason Tsang (jtsang83@uwo.ca). In addition, the principal investigator Dr. Harry Prapavessis Ph.D. (hprapave@uwo.ca), may also be contacted if the options mentioned above need to be revised.</p>
    <p>You may also contact the Privacy Office at Western University at (519)-661-2111 extension 84543 or privacy.office@uwo.ca &nbsp;if you have questions about protecting your data.&nbsp;</p>
    <p>You may also contact the Office of Research Ethics at Western University at (519)-661-3036,&nbsp;<a href="mailto:ethics@uwo.ca">ethics@uwo.ca</a> if you:</p>
    <ul>
        <li>
            <p>Have questions regarding your rights as a person in a research study.</p>
        </li>
        <li>
            <p>Have concerns, complaints, or general questions about the research.</p>
        </li>
        <li>
            <p>You may also call this number if you are still trying to reach any research team. Or if you wish to offer input or talk to someone else about any concerns related to the research.</p>
        </li>
    </ul>
    <h2>What does providing informed consent mean?</h2>
    <ul>
        <li>
            <p>You understand the information given to you in this document.</p>
        </li>
        <li>
            <p>You have been able to have any questions or concerns answered to your satisfaction.</p>
        </li>
        <li>
            <p>You believe you understand the research study and the potential benefits and risks.</p>
        </li>
    </ul>
    </body>
    </html>
    """
