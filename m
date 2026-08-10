Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DF83C1966;
	Mon, 10 Aug 2026 11:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361287; cv=none; b=CSLnqwsPv0Fa8mQB8M2RF3Fg4PWSOn9ZezH2AzLe8+MyIr59/PqMiqHdsozL29ezxqxLesFlLQjW5hkcXHEUJWi26Utah/PwS7rLGp2yhPPCVpxSCxh81HTKrODXNKoXmKoXeboatzoHoaWnmgVuKMQIy+TAS7x8Ny/UK/eZvn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361287; c=relaxed/simple;
	bh=BNrHlBXfdBlV3F4/Syfz5lobapYaXgTzX057V7a73VA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GL/nv9yo4ETYHWTVnw8YXoHo4CpMKHcKo2wcytc9IajAh7YcZG4yWLmNNqqnHe+GwBbRLxgOqN6x+1i8zQQx0WqCFjAxQjfawi5XYcPyqKCV1w6YPsZ4QY79eZLQabYQQQ2gxv0xgDa76/jdiChEbOXuKmoeCV3NlEf+M1QmQ3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YzAaieyB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YzAaieyB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9SCM51119397;
	Mon, 10 Aug 2026 11:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gCIEoiQj5FW
	E6dNClPcARcX0P9ATqcr9TafpudAcuGo=; b=YzAaieyBBnKXCpnV4gupaGDx/5E
	2D3/GmgbRFw4MlsSoIVbmb2TLUrsG4SV97OIjBP2y3cMWp+eRapmylfNbswrOTq8
	Sz7skRl8jOrhA1stSLgTud7HauXiAuiSEmjEyECEGh7rje0gIhoqV1N4NNWF5uhi
	auf2b8T9p3+QBOEijXV0sagjDb38WfQw1DcEx6UdHUGHmZIpyaqMyhGZXChn9y+h
	n/MzleLjO7FhOGn7/Ur8tE9UFmMDCOGSWHO3f3tyltIwwNoAoMKLD2Pu8jR+kd9s
	BWFM1+rGtw6mhpEyP897yOw1Ef+6YCcYiOVurRi2QFuD52KuxeHtFix1ptg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v6s8ky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 11:28:00 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67ABRu53026817;
	Mon, 10 Aug 2026 11:27:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fwwhhvwc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 11:27:56 +0000 (GMT)
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67ABRu1Y026799;
	Mon, 10 Aug 2026 11:27:56 GMT
Received: from cse-cd02-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 67ABRtkJ026791
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 11:27:56 +0000 (GMT)
Received: by cse-cd02-lnx.qualcomm.com (Postfix, from userid 4438065)
	id 7B37348E1C; Mon, 10 Aug 2026 19:27:54 +0800 (CST)
From: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add vdda-refgen and refgen supply properties
Date: Mon, 10 Aug 2026 19:27:32 +0800
Message-ID: <20260810112735.1326807-2-ziyue.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810112735.1326807-1-ziyue.zhang@oss.qualcomm.com>
References: <20260810112735.1326807-1-ziyue.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwMSBTYWx0ZWRfX1CzcUphN8kO7
 bLu9vj/fP5G2asO+QTneAd5P+mp/rvaFavgBeNc2xOaMrVqW124NMAywIGsBGI0S9TYJfgfYSS4
 mw8bKxg0VWV2WgeAbbKhhZ9PoyczIqU=
X-Authority-Analysis: v=2.4 cv=PvijqQM3 c=1 sm=1 tr=0 ts=6a79b5c1 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=AF2lrSSGt1_3PscgMUQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwMSBTYWx0ZWRfXyxbQKoJUJJpM
 bqFCP5IcTf41yWLdzrXXo3BSLi+/wMGclme9Si6iGOhyTdC9gunXUn0xDaBs4pYiPFrMAIn9SBI
 tu0RUApgFBcKtZNFfeGHruVSfcNG6xa6MJ/MpPBRj5gCHNrKBDi8mCFepY7PPqK4n0u23WOPpfn
 /IYxcOwdIJlU1wqch2SMBG+QNnRj9ORGHRJk9/VJMl5RQBkNA4Dtzysyb+GIscqbSBOMYQOUpHi
 BlSOBlOU4QOOl/yDyzSJAhB7NygK72VegzQkDYfxesFlPoGjpfk42l6yX/fBpiUPXi/OLQRaKAl
 wPzHXc+0Vl7gUQB0VvQEkagh5AfueQZAUS4BdppQpvgDddzuqbd0Gxk6L9tgpGXHzqtUmCk9MCS
 V4ZoCjB6meyDKWoTC6aVmnRPGbxM2EcVWPBoo+ugl26T/nVcAZTZvbaNpZgsB8WsCl4pxP7UX0o
 tpUYjD9THPycZRX/A/w==
X-Proofpoint-GUID: rLaEIMNhNn7dm0NE3XpOpMw0uGVN0a5l
X-Proofpoint-ORIG-GUID: rLaEIMNhNn7dm0NE3XpOpMw0uGVN0a5l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1011
 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100101

QCS8300 and SA8775p PCIe PHYs require dedicated vdda-refgen and refgen
LDO supplies for QREF to provide a stable reference clock. Without these
supplies, the PCIe PHYs cannot work properly. Mark them as required for
the affected compatibles even though it breaks ABI.

vdda-refgen-supply is required for all three QCS8300 and SA8775p PHY
compatibles. refgen-supply is required for QCS8300 only, as a workaround
for a hardware issue where QREF actually depends on refgen3 rather than
refgen2 as documented, so the PHY driver votes for refgen3 directly via
this supply.

Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
---
 .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 259ed9678393..ec66675638a8 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -93,6 +93,11 @@ properties:
 
   vdda-qref-supply: true
 
+  vdda-refgen-supply: true
+
+  # Only required on platforms where the hardware voting doesn't work properly
+  refgen-supply: true
+
   qcom,4ln-config-sel:
     description: PCIe 4-lane configuration
     $ref: /schemas/types.yaml#/definitions/phandle-array
@@ -267,6 +272,28 @@ allOf:
         "#clock-cells":
           const: 0
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs8300-qmp-gen4x2-pcie-phy
+              - qcom,sa8775p-qmp-gen4x2-pcie-phy
+              - qcom,sa8775p-qmp-gen4x4-pcie-phy
+    then:
+      required:
+        - vdda-refgen-supply
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs8300-qmp-gen4x2-pcie-phy
+    then:
+      required:
+        - refgen-supply
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>
-- 
2.43.0

