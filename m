Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C627C3D091A
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176470; cv=none; b=UUo4ctfejYiHkyr8iB5b/5gsFwhdVxDxYkQQm+4Vb9TYui5VqtV6Z/njL103R1h6VQ8OhQOqfSe7XPghILonPfVmuODIA49rFGs8uQvqNWglkULaYEWEPOxe/k5KS8R/gV+1q1nOSTTFtzGfXQ9wELAJpdpZhbjEdBtJlUJH9g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176470; c=relaxed/simple;
	bh=KZnHZBSLSMpB3NoM0qPWgRe3yVcNSNMcooAkdHqMozc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HvO6U1uLPIJjWaJ5ycasU1kwcN8tovC0K9w6fhpFwjedh4HvfWV6+C4Jg9vzdiOqCJlrQQSwRlIqfMdge6bbjR89gObYKh9/nRAfqO1FrWbQUWyiMXzns6I1dMHrKQmbYX+bGbuSX23G2VYrxz6t8DMTaZoMKK1TIgIiHiMu73c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e4UKvTan; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jz/GBKZd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e4UKvTan";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jz/GBKZd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J7L9xq353051
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/J/OIJT7DRrHkarchUlhqWqh7n138q1ZhKA
	zjC2X97Q=; b=e4UKvTanqgcy25VgTXVn0puqZEdnZmvvQ52JHzKFqz5F+e9mT5y
	PUaLRzqRcSTMQmjYOLJpykOw0CJMN3FWLYxQe59iMq5f57cHfYHyZUgxaIehKqv5
	MhhjSwNLLgwrvf8HDQ0ND6VQhEj+zuNHtnw+2OZtyZCRcPyS01c6z0DDWAhpiTx8
	URw+dp3qE7MwZ7OQnCIR5BR5V0NRpnDX1a2+i28OlusjFN9/fRqz9mrqSC5ax1LZ
	g+86JPzSXxC2FzOi/eqauV/FNLK9D1RAoD5SAk5+MbSO4embb8BiDQ+9qgykSOWb
	Gv8uqOmuqDqblxsqGyvShnWbgthuzBdto6Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xjamytv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:41:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d6bf346adso76394061cf.1
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 00:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779176467; x=1779781267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/J/OIJT7DRrHkarchUlhqWqh7n138q1ZhKAzjC2X97Q=;
        b=Jz/GBKZdGlU8Y3Wh0uWKBh79G1DzG5vFlMJ4kUCGc/daNJfItfuecZLsXISw28fHCi
         k/Xt3rqOk+MOEWLEADWZ8WDdNt1IxLi8acsbj5keP4X111bW6t4GDRBqk5eGWDnTDAKC
         MecHtWcSwaFcZf+bVYfI5HdQtdxSU9fM2uAwWHmw168nghXrLQTW+hbvCX0V+oLVssEZ
         JKEvzs2tN0hdDrFfBaoRf9SUHgs6NVBTnCGSBzxRnjlJZsiOdkYfxpWueCCJVivc3W9g
         D3iRml5PFIsbLrHRXw0B2L5OaeubdUi1sOeb1Ts94CwgggsUATqCbQe2TWsqOQ3OENr8
         NwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779176467; x=1779781267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/J/OIJT7DRrHkarchUlhqWqh7n138q1ZhKAzjC2X97Q=;
        b=rGJOc82scaU8t+B5aYxVo8WXtaQQ8LFPjHb5ZXqPTbyCQ83y1yuCnfXrrZvRqHuFDg
         c7L6y2sJtMOZr/HVNh678SO0vRFAY6i9oGz3+rF0HljrSreWsAJ9lew8hfVaWZHgKu3w
         MB8ldatUiI4TyVqIKaCUOjWAmWHc6oTFsOSLNh/9FHzUB9jW6JR9mTYmZcOFBYpAWMxu
         0VchoYlBre7tKtqqrxG7pY2MX9E7ZLcP6DfN+jKo+9HE84Gqv0mbO+jk4OJR7dfX9dvg
         9Hdg+ZIzJlqhZ+tFLSaqxsVTe4lyqPQFjo3jF41OAzMp40IyDowfg44p8qnda8AlawO2
         caVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hG1/qN1Yq9F3yEbJ07AZYomjxG39TzKeUWlVMhLT0Lh1ohwxcDJD8RFoU+4D89IxuoMUztEa6lJem@vger.kernel.org
X-Gm-Message-State: AOJu0YwQkHI6P3s+ZfXg8w4LZzNAgNDbhnof3MabS1sPGmxjkq5VlES9
	mkIdkDMVIP3cCmh1YLcRSq2/kkMTIcZK/vSbh0wvv1lGuirkt47vXfqcRZhL6/QljqS7ljzsvrX
	EyAxSLd+ir8VNC/qwE8/Sr/UD34Tvt2bwZjPDmJkrvD4sdA/+cQvN5+71N33qFwap
X-Gm-Gg: Acq92OEGMBFAXCBSX2WRIXm8Js40copQ3ZLcM0f7wzx7Beg7xFq1UkdKoCa8oM8LMvt
	Cq02Y4DfFGDX490V9wg8fhJYr2twW1MWISQez5hxMPpaQB0bPvcBCCDdwUR8MLoyxWf9oHUhIJX
	kpE6fpoltn9KUxWnOeH8MROA5/a+3w0CZQIcHAXEuIUJOalu22sRtHI+xcOpS/wiCDq6rQpXchv
	LJBqjz5akqxm3Y8O12CIrYQMNvJtan/bxywpbMSpfqYkAO2OkQGxBKp0oXrrv0RVVq+ZLftjUYe
	9Tx4qMK0bnKuyOtoJYaXyL3uJwN2aXL64ch0y5CPv8ZCX5T3PRjPGQvQHo4rPF7zAHA1UJgI9UP
	xTAmvWukLs3JbvT8DhwKvUceTGWvlw+nZNkag
X-Received: by 2002:a05:622a:430d:b0:510:41b3:f1f9 with SMTP id d75a77b69052e-5165a1eb755mr196313901cf.38.1779176467158;
        Tue, 19 May 2026 00:41:07 -0700 (PDT)
X-Received: by 2002:a05:622a:430d:b0:510:41b3:f1f9 with SMTP id d75a77b69052e-5165a1eb755mr196313741cf.38.1779176466693;
        Tue, 19 May 2026 00:41:06 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe1a41sm47266843f8f.31.2026.05.19.00.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:41:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: arm-smmu: Constrain clocks for newer Qualcomm variants
Date: Tue, 19 May 2026 09:41:00 +0200
Message-ID: <20260519074059.61405-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3108; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=KZnHZBSLSMpB3NoM0qPWgRe3yVcNSNMcooAkdHqMozc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDBQLmYb4h9fo1eUreNP62Frw+N5foIgep81TM
 ww/LLf+CfOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagwUCwAKCRDBN2bmhouD
 15MnD/99fRBVxOlQj+DbCgE5EWma0FpIsoLv2jCf2Wt6MLsSbcfMVVGCxpjclQ8XHq65xE+2V4+
 nxfBf1u7I7Eu+c7Xgny1Q8BQ5UgRVVsjnN2ay5Wz/UadlmJq80pZfsRFhvKUcAFs+al7eDV9u3g
 T47SBuOLeL0x15kymqK9FyjvFgBRdXW9af4LwTGs397Rzp2XdjzIu8Tdym2A9dsJS6D83OUFz1M
 +SftOtopi+8INf/jxmKuTfm7wXG2KW2JtiREdhtTViPxcBvypkp4FdA5ozVUefLFvOdVbYD4Iyo
 8Hx9KhhMxeES3kk44rcWAZtUfHIAnkBkpp1ckqe7ghVAutuesu4WbB4/qO8t+KNXR/bQG1EOVRt
 bzCk7hcUwSARgxy8Pma7gl3638Y3+gV0Ze36ypjrUAhBJFgLN8VWw2meQmnj4CKUY4wKjf+VwY9
 pXcNiSGd9hQBotrd/GwQnMador+1BmopQuY3J2YpsinsSiWEe83o2HYHVZl7bZ3UOhZmsJAgOO0
 HzoRL1ZvubwzOaxxs80ZrPPUre7gS3Zu/ATdVqApZWbmfLKiomQFx2m4YaDddXCwl2OJUP74JT1
 qdjMK2muxcci2I+AfXHxY1viB0WkZ+beyXjcPCgZl10ciEBwOyc/jqRQBxwKzRBB6ZL4e1siicE 4vZLHF/YSXXUtvQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MyBTYWx0ZWRfX0ig075pt5U5T
 mqsnzvplNMuRvzW4ql43aCeqyQUn9Lsv4yvJOdYCfiA442mVFPp/EXzMelVO0ilMcrQbSNjtlRw
 mUrVYTWMwws7Zzt8+2S5OSkCkvaj80I1y/ul+GsnGEk8XbkKECvUGZbVrAwW9HMmWUEu6MLdm4u
 xmxWL4iFpP2d6DufphkjgQQ3meyxxGr4W2l53QS0VKxUsaxKxHj6OveNmSqG+z3BUYkeUHF5PzV
 P1ToSB0KgC+KTHbmniFrry+TS4pkTSNsi/AR6diSii6lojdEugfVEDu1oM7EBMgN1yDATLtFChU
 uUfeLBxbhr0U23taxWORj1pPNr2oOPAbLJA93h1dMBic6OK1YkfUCgZRSXge0NBvBJ9uFdNLBB3
 G2VULHYNKfKiapGLvXCyp3VGG1v8PB3gjxv1uL4c3NJHz1V8mY2t2tDAT55JqM9c3yignL6ZaqJ
 hjZxZM5uwD4MWSHrQaA==
X-Authority-Analysis: v=2.4 cv=BYHoFLt2 c=1 sm=1 tr=0 ts=6a0c1413 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rJxAMVKw8lswYMJXinYA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 03lRo92oUFQddhh6yHfWAaAeZUj28keE
X-Proofpoint-GUID: 03lRo92oUFQddhh6yHfWAaAeZUj28keE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190073

Many of SMMU on Qualcomm SoCs come in two flavors using the same front
compatible but a bit different fallback:

1. For application processor, usually without any controllable
   clocks,

2. For the Adreno GPU, with some controllable clock(s) and using
   additionally qcom,adreno-smmu fallback compatible.

Add missing constraints for Glymur SMMU on Adreno GPU and several other
Qualcomm SMMUs for application processors, to restrict the clocks
property to a specific length.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Tags
2. Fix grammar in commit msg
---
 .../devicetree/bindings/iommu/arm,smmu.yaml   | 38 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547..ed0d10157bd6 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -566,7 +566,9 @@ allOf:
       properties:
         compatible:
           items:
-            - const: qcom,sm8750-smmu-500
+            - enum:
+                - qcom,glymur-smmu-500
+                - qcom,sm8750-smmu-500
             - const: qcom,adreno-smmu
             - const: qcom,smmu-500
             - const: arm,mmu-500
@@ -595,6 +597,7 @@ allOf:
               - qcom,sdm845-smmu-500
               - qcom,sdx55-smmu-500
               - qcom,sdx65-smmu-500
+              - qcom,sdx75-smmu-500
               - qcom,sm6350-smmu-500
               - qcom,sm6375-smmu-500
     then:
@@ -602,6 +605,39 @@ allOf:
         clock-names: false
         clocks: false
 
+  # Disallow clocks for all other platforms where specific compatible is used
+  # with different fallbacks and only one combination has no clocks
+  - if:
+      properties:
+        compatible:
+          items:
+            - enum:
+                - qcom,eliza-smmu-500
+                - qcom,glymur-smmu-500
+                - qcom,kaanapali-smmu-500
+                - qcom,milos-smmu-500
+                - qcom,qcs615-smmu-500
+                - qcom,qcs8300-smmu-500
+                - qcom,sa8775p-smmu-500
+                - qcom,sm6115-smmu-500
+                - qcom,sm6125-smmu-500
+                - qcom,sm6350-smmu-500
+                - qcom,sm6375-smmu-500
+                - qcom,sm8150-smmu-500
+                - qcom,sm8250-smmu-500
+                - qcom,sm8350-smmu-500
+                - qcom,sm8450-smmu-500
+                - qcom,sm8550-smmu-500
+                - qcom,sm8650-smmu-500
+                - qcom,sm8750-smmu-500
+                - qcom,x1e80100-smmu-500
+            - const: qcom,smmu-500
+            - const: arm,mmu-500
+    then:
+      properties:
+        clock-names: false
+        clocks: false
+
   - if:
       properties:
         compatible:
-- 
2.51.0

