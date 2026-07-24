Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FC3207DF7;
	Fri, 24 Jul 2026 05:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784870201; cv=none; b=i0JwEtdHza9xgoloN9zl7mtnfBPdG9lUpc56dwf/Q3lwbE8UsDf2RsNjzZIXhl5m6zyMl9ZzS++Rpdyi4h09lvfyjh/dSukn+lSjpuUJ8/7tKRepXAFFKMXfgtM09EOjLjauLITNoSPmbtwsgbCyj1Q1qts0H8t7m0ynMaskAUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784870201; c=relaxed/simple;
	bh=7NrKShzkxYepDdIDigR031HAY6/Kz0kePnkfaowID0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kJ3EKauIPSaENXBTwU0i8EHRqSkT994of4+GkA94P/o0mzm+KS9Nd/A/P3gpycAnhPzs3b7fSytxjZsBhscJAjb3P2gyuHDUcF7yO1aLEOYCk8+jBPs/IP1XiGjRWTziivAp31HIU6CB1tPuMoKQgGpyk0DTDx675ZeSDfPjrNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7sczxDZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7sczxDZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4ssIV1897940;
	Fri, 24 Jul 2026 05:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mIf/u8MKdxtQ4AQybXyaqU
	kO+H1vJ01fOwZ0bkAI3SY=; b=N7sczxDZsTzNp9Wbt68vQxGp2ch7KYDV1jpxIL
	Zu1F9yDZOoZbJEUNmNpNjwLXyv53WIO/typd8rvfjPlnNP3eT4gBuA2icSHSK0Iq
	0ajq9SFg2/athjXjIMPIc8bMOhiHsuGIRLceEaw8qwOxDAaMo/xtkshYje4KAVS4
	XsfKPKByTmRmbDapUd9WDUK6Lqh4S/xU9y3CXFL+bil/qrgHGILmESzSn1Kuu5m4
	aPzuPB7r6px9KYFDc4kYQibMJn1wfaOq63RY1/SBOVgPROJpP76OuDCWJtcEOhmW
	uyVHutJox/NVpzsGoG2ySB00nls2KtFiTkwpZx1dmoQLS5Ag==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm1em81ww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 05:16:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66O5GYTx025544;
	Fri, 24 Jul 2026 05:16:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fgj3xcdmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 05:16:34 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66O5GYFb025539;
	Fri, 24 Jul 2026 05:16:34 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-hsk-hyd.qualcomm.com [10.147.246.125])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 66O5GXIC025537
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 05:16:34 +0000 (GMT)
Received: from hu-hsk-hyd.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-hyd-u22-c.qualcomm.com (Postfix) with ESMTP id F1626667;
	Fri, 24 Jul 2026 10:46:32 +0530 (+0530)
From: Haritha S K <haritha.k@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 10:46:27 +0530
Subject: [PATCH] arm64: dts: qcom: eliza: Enable cpufreq cooling devices
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-eliza-cpufreq-v1-1-38f01e47f0f1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACr1YmoC/yXMSw5AMBRG4a3IHWvSdkDYihhQf7kiHi0ixN4Vw
 29wzkUejuEpjy5y2NnzNAaoOCLTVWMLwU0waakTmWotMPBZCTNv1mERyKRSdYrEmoxCMztYPr5
 fUf72W93DrO+E7vsBryCPFXEAAAA=
X-Change-ID: 20260722-eliza-cpufreq-e9011b7e6fc9
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gaurav.kohli@oss.qualcomm.com,
        Haritha S K <haritha.k@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784870192; l=2200;
 i=haritha.k@oss.qualcomm.com; s=20260422; h=from:subject:message-id;
 bh=7NrKShzkxYepDdIDigR031HAY6/Kz0kePnkfaowID0Y=;
 b=f9CWy73hu01Wo/W6KSYdqM1/1RZRVD9f8hkH5CYHrAWzIr0nKLRQM8mAQwjfiDEkybOVG/jkp
 6r/46sBwIHqDdQedrrZbT2XQk9go6wqJQhYx1rEr6Ti+yf6TNFiOA3y
X-Developer-Key: i=haritha.k@oss.qualcomm.com; a=ed25519;
 pk=ivp2P9RgsC6IkOe8JaqweeahT9pd0BVtL2d1YD8ICSg=
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA0NSBTYWx0ZWRfX91S8gS/csRAS
 ItX6cdAhr2RsCBHlg4V5h3JWXqE0FyG3R3iygBCIXBJccynp3CGnSwuJ+H1oBsQMJVc4/bfdFjy
 OkG6q/7eQlVPa4EOl/zC3QNqvbEjPnY=
X-Authority-Analysis: v=2.4 cv=BIODalQG c=1 sm=1 tr=0 ts=6a62f535 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=9fT9DexGIXlaxvJGrFgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: jcLr9a4AbT2ZSZ3teVn4i9Ze3kcEGEt7
X-Proofpoint-GUID: jcLr9a4AbT2ZSZ3teVn4i9Ze3kcEGEt7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA0NSBTYWx0ZWRfX7ezc8lPRU9s2
 q+V+8ltleN31E/N/H8iAM/zAJZg5i1BdQLK0slwD/pNv4Vum8TvsWckI0NAy3tIcVjTuNJjx8yf
 g6ADSiYkMAFld2ob9TRLFh761FeXmWGsIh/XXBW8faDuoS/SIs/abDbmL/kaNwKfJqE8/AnoP7v
 f1UNp/+Eg5LOXhCT6ZmziwtfAzxkEdYczRRpDKAAURYOwVsbdKPC68dgpodcxSHqylaKOyub490
 1AYIMFbAp2AZjT3IWDmhGlkVZXKvRKIBItfGd4TrOmJ4Hm5eWWV9k7tWes6BJSOz/cDN7kwPuzE
 J9gCff/Up34MvRpEZ8EgTxoA81rrB4FJeCa4UD9XNBjPE7MmiolpEpDU9/VcDHHJfTuB00cCzQJ
 lp5fP9Ubing7W+zMHzvjoilhO0DW64sW/GVaPNzkKwLiWETcDfxNKFlEkUUnKOeByj6PH2+BcJl
 I42YtIcwQGoPrq2Hk3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240045

Add cooling-cells property to the CPU nodes to support
cpufreq cooling devices.

Signed-off-by: Haritha S K <haritha.k@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 357e8066c176..b331e3e1c2be 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -45,6 +45,7 @@ cpu0: cpu@0 {
 			dynamic-power-coefficient = <100>;
 
 			qcom,freq-domain = <&cpufreq_hw 0>;
+			#cooling-cells = <2>;
 
 			l2_0: l2-cache {
 				compatible = "cache";
@@ -76,6 +77,7 @@ cpu1: cpu@100 {
 			dynamic-power-coefficient = <100>;
 
 			qcom,freq-domain = <&cpufreq_hw 0>;
+			#cooling-cells = <2>;
 		};
 
 		cpu2: cpu@200 {
@@ -94,6 +96,7 @@ cpu2: cpu@200 {
 			dynamic-power-coefficient = <100>;
 
 			qcom,freq-domain = <&cpufreq_hw 0>;
+			#cooling-cells = <2>;
 
 			l2_2: l2-cache {
 				compatible = "cache";
@@ -119,6 +122,7 @@ cpu3: cpu@300 {
 			dynamic-power-coefficient = <238>;
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
+			#cooling-cells = <2>;
 
 			l2_3: l2-cache {
 				compatible = "cache";
@@ -144,6 +148,7 @@ cpu4: cpu@400 {
 			dynamic-power-coefficient = <238>;
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
+			#cooling-cells = <2>;
 
 			l2_4: l2-cache {
 				compatible = "cache";
@@ -169,6 +174,7 @@ cpu5: cpu@500 {
 			dynamic-power-coefficient = <238>;
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
+			#cooling-cells = <2>;
 
 			l2_5: l2-cache {
 				compatible = "cache";
@@ -194,6 +200,7 @@ cpu6: cpu@600 {
 			dynamic-power-coefficient = <238>;
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
+			#cooling-cells = <2>;
 
 			l2_6: l2-cache {
 				compatible = "cache";
@@ -219,6 +226,7 @@ cpu7: cpu@700 {
 			dynamic-power-coefficient = <588>;
 
 			qcom,freq-domain = <&cpufreq_hw 2>;
+			#cooling-cells = <2>;
 
 			l2_7: l2-cache {
 				compatible = "cache";

---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260722-eliza-cpufreq-e9011b7e6fc9

Best regards,
--  
Haritha S K <haritha.k@oss.qualcomm.com>

