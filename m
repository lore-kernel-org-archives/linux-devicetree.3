Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62046340410
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 15:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783870137; cv=none; b=b4G9MQ380T8p0uih3DocpoqHQKWZB/0fqa/ggbD7nd8TKWsc0jCc8DNcZQQxF+tMkjKT6pdyLNsUKKujN511V+uwuMod5f7H9xCuqBMJgpJ8HD95YNec08ioC1EyDWL8FMnZStOdP1Xw5teqUHMCm9pUfz5DcjgozZGhrEc89U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783870137; c=relaxed/simple;
	bh=pa1uBKrJaaxo4mIls2wPcMnmCJPRxvh1/dRvY121X/4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IXnFeuCQpHAVgG/GPJ4NDC5pszmOC0XC3cdlR/5ys5xawKzcxZxzhDoJRaMAul8Q2j607gnOqRR52TrmjSVkjgvTyzhjlwqOwfieMmCCFbzuN/sQhPodNzpYaL3ZzbPXwuD8cUvGauDAr+18671JyLyEuypdSrBbxCjLk64Ut4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxua+DoV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VliNW3lC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxua+DoV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VliNW3lC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CDZhOE2685088
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 15:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CTLfXqR33lpyP52Ix+0HK2NQsXaqxIC8ssOzv9Yh/EA=; b=lxua+DoVZHw5hhbI
	SxC/laIajh+K2OaRYCRFrOVPgrN09M0EZ9dxAJtgmT0dq28g37lT3FJyWVGBBeLp
	C438GzKsI4sj7FV8j2e4MgWUddsCWWHTz80QVs4bp9RJTSSF0h0isMN4p8bxeBH8
	Gf8Jwn1oom8B0tRykpeg/kspDLZs+GkFa/iSQCO5UIuO0RD70dhqxkWyX6y8DTZI
	Eziff8rjeZs1BxM8OqAATAgDj0UfNXdE8lzgnRe9xhiR3kdTJOj06U+I+qKkBeOb
	RmGAKwYnIIFD3crkwofkBn30sgV1CpBgcbGEot6IY3acawds+iUTGzUVBEO2sEQD
	6j/t4Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeehk2kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 15:28:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so3405688a91.1
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 08:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783870134; x=1784474934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CTLfXqR33lpyP52Ix+0HK2NQsXaqxIC8ssOzv9Yh/EA=;
        b=VliNW3lCPk6Fj+hsYOkgIf2dsCCVNIkiyok/5nNWHk5PgK4Slk3G0E9RyFbx/1n/4Z
         DzXSDUy3HHXiQvZZ5RIEUIcAZsFpjzkOujwEqCkSisRjXOlWc65M0M3hEo+UGnXRaqJw
         9YfVhxQRAvTueP9WrSaF/8xyZh8BjFNQhd+WHeKAQEuLo/5hLRMYdsHfyhjTzp32uJIH
         gJbDB+n7VrE9O3JyxuNsu6z8ka0N8+mHjwevBVwKxymzwB3JUpIpiqRFolp31PsD4XaI
         EvPVHcyOPVwPnf9du5Kk6hBhAHeAv8ZDIvSg2KA9RZtvz2S/ml63pCyviURixAsKkbzC
         SF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783870134; x=1784474934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CTLfXqR33lpyP52Ix+0HK2NQsXaqxIC8ssOzv9Yh/EA=;
        b=jwoGQOwIRV7ToEWEHrB91Qv7YJpoyVT2AMNtEqAhxoL4GMDR2+8ORl6alfyl/YK7u9
         PZAEHUPD1aRkIjIQMxSCzWfGeCZ0R1Z7Tj3PHpSMVA9Y/YBB0IOK+7LfSVP2z4jWLjlI
         3zHwuVouOqFs9/POjuOFEyWR6iIT70ZzqdC59RMKEo9e2Ns4foj2WLG5zN+DGqt01FDc
         r8ht6CYp5jV5mC40i6r1TaWu+2TgEur6NQWP4apgH2+vKtk+NgkeeN9W+UJ1mgsKRyxi
         S3LPTYtewhZnYgu+0p4cSLKVibSQdaNWPVoJBPi0TfWYofcRGcXWzRtyXiTua8hEwEnj
         /UGQ==
X-Forwarded-Encrypted: i=1; AHgh+RpuY8gZLTOc0hOXOOzNlD7veMcHA3qML33/RmGlP4VmJfYkUkUF8Ou/8kktEXoOoHt7tJp8Q+UiHRic@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu1PUPPSqZKpx6hxRPNSdKh5hNiZKBiU9Zw0iFCEDeCT0erk6w
	h6XUSoUIQbWZXV2vS7gL45bp5XC2bBDFSgvgkYfFzcJvD5OnmsdDjO8Y7kuwlmzd/AxWHdxwf2v
	bGETN9lkdLQgzW0AfiBIFYspHeKVXhKvVqgaIKc13sDO+uiKXcrgXaIzEGKg9yfpx
X-Gm-Gg: AfdE7cnML3uxF3Pa5zkywOReU8ESXN4G99h80vtsSmzDYohGFSxoLBXZkPWUh1zzlu9
	8Cw0Nn+5pPiX8R14o1dUI4aqTAcIKfLMsuZZGec0vjifH09m/ngftCHbgXgyCs7CMasg5yDJc4o
	RMycO4h3Am3Cyj+Zl6j9mkHD1jH0m9KdN6R020ANTSAqrJ2S01aEKTANqryAAaTdC2OQ2J/1YrY
	lEGnmZkYMImGg+I3gWJ4UwINNinjEAnSunFWMDbaQQkhBa18YD4cvJkkK+hmYsKw7gXKllevDhX
	wUbTn6dHfRSnhr/PdjQvqpzr+5GJzueC73tzqWuiKA6+Od7TMqY0FBHiBdzvjSqRv2u7UeBNt7G
	7P7Vkr7B588cwX8SPkq0zg1/rdgOjp5tK7axjMxA1JcCWDXgBIBfRnFxrlxWSSBGrLXVx8rQWJn
	OUKTR/
X-Received: by 2002:a17:90b:5903:b0:37f:9e21:91d8 with SMTP id 98e67ed59e1d1-38dc834de8fmr4853282a91.15.1783870134294;
        Sun, 12 Jul 2026 08:28:54 -0700 (PDT)
X-Received: by 2002:a17:90b:5903:b0:37f:9e21:91d8 with SMTP id 98e67ed59e1d1-38dc834de8fmr4853257a91.15.1783870133855;
        Sun, 12 Jul 2026 08:28:53 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311935fd091sm41458776eec.24.2026.07.12.08.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:28:53 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sun, 12 Jul 2026 20:58:35 +0530
Subject: [PATCH v6 2/4] dt-bindings: phy: qcs615-qmp-usb3dp: Add support
 for Shikra SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-usb-shikra-phy-v6-v6-2-1b3e51bf1541@oss.qualcomm.com>
References: <20260712-usb-shikra-phy-v6-v6-0-1b3e51bf1541@oss.qualcomm.com>
In-Reply-To: <20260712-usb-shikra-phy-v6-v6-0-1b3e51bf1541@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783870119; l=2707;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=pa1uBKrJaaxo4mIls2wPcMnmCJPRxvh1/dRvY121X/4=;
 b=jFQRmxwZFpX6DQoCl4CLus+aF7XaIltggdJxmaYCfTHV8GOZORXSipc6EXyDGh9UDr+F7P2u/
 SqghEsIgir8B6hnqwwuv8E9ZQ1A+LIyEMv6s/oN7Xr022gvVmucF2WQ
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDE2NSBTYWx0ZWRfX8UOhlGMObpx4
 2iJCXYZPJacEZKeCUtR/E55sDXCjCjl+sL0ZC2ZYEtXZCCY6wxkua4PRDD70TZmBZ46tiUw6I7I
 rpLkJN8a4/3FdzuHOSyPLm4DPJ9lGU0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDE2NSBTYWx0ZWRfX7ErH5y2JIgsl
 6NPmU4P3woBssJfI8dINuA/sPzeXLbpu2RNzP5YWV7Lkuw95XFa+rj0uLfUXQ0D6UOlKhrbWJ7w
 7B/Cdy1hjUp2vdobLw2+jtanZdEQ/L52QQ4rpU5cbj5rg9q/Jvrp+wXDwDJR2XE/fxERKww/uM+
 fuvJeZXSsynw3DvLzgiYMdurCkck8+873pHnJc6dJ9pE0bwP9PbirCqYPuXR/PV9b2YA2avfBj7
 Rct+93rqILUi9VfEEz7xAuDuro+xCzvBeq+w+n/R03PTOcuz/riEHoALv0yZoI/Hgjr5bzciKHN
 uAQmparOlrZVVM8fVJ31weTBfSp7Nh80lsa3I6rIYrlb0bbS+psbAOX7E+P9bUl0XrxNXJaqdAZ
 lZAAVLc1k4iromPotJlMMUuJcX1KU5eaBZq/0CXLLYLFDyETu2s+ESNrCkGrVCnyjKqphTJbtsl
 gtP+dvyJQpRobcQ6l1Q==
X-Proofpoint-GUID: CIEwvHulLmvF6sSH5ObU_0sJrthgE8yo
X-Proofpoint-ORIG-GUID: CIEwvHulLmvF6sSH5ObU_0sJrthgE8yo
X-Authority-Analysis: v=2.4 cv=aPvAb79m c=1 sm=1 tr=0 ts=6a53b2b7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ufZ60yBX7R2ALNXMlhoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120165

Declare the USB-C QMP PHY present on the Qualcomm Shikra SoC. Shikra uses
3 resets to be programmed before initialising the phy. As per the hardware
documentation, the third reset is PHY_PRIM_SP0_BCR, hence naming it "phy".

Also, add remote endpoints and orientation switch support for getting
Type-C orientation information.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 49 +++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
index efb465c71c1b..98397006fa62 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - qcom,qcs615-qmp-usb3-dp-phy
+      - qcom,shikra-qmp-usb3-dp-phy
 
   reg:
     maxItems: 1
@@ -33,12 +34,15 @@ properties:
       - const: pipe
 
   resets:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   reset-names:
+    minItems: 2
     items:
       - const: phy_phy
       - const: dp_phy
+      - const: phy
 
   vdda-phy-supply: true
 
@@ -63,6 +67,22 @@ properties:
           - description: offset of the PHY mode register
     description: Clamp and PHY mode register present in the TCSR
 
+  orientation-switch:
+    description:
+      Flag the PHY as possible handler of USB Type-C orientation switching
+    type: boolean
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output endpoint of the PHY
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the USB controller
+
 required:
   - compatible
   - reg
@@ -78,6 +98,33 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,shikra-qmp-usb3-dp-phy
+    then:
+      properties:
+        resets:
+          minItems: 3
+        reset-names:
+          minItems: 3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs615-qmp-usb3-dp-phy
+    then:
+      properties:
+        resets:
+          maxItems: 2
+        reset-names:
+          maxItems: 2
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,qcs615-gcc.h>

-- 
2.34.1

