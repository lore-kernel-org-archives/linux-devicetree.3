Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C7A3E9C06
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779705984; cv=none; b=rjHCD5N67HZQftAOT4KMvblZgvUhIbDHEdHfwiqT5/wBrvX6l713LLhGgxe553iVJb16GVzKb7kganNHPLcHKMb89UqB26Xz6EeMjA0kaMQQ0loLWNQPAxLQ4T1i1pqNvyg2XU/Q865iUqEZM3CVp8vjIWbgaYuk6AjKDuTz1/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779705984; c=relaxed/simple;
	bh=SJXqLD1aYNlm1RXIuJnPgt1e1Zax5eUFUVWNuKi1EQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ajD9deCxjBui+FWyHhVPr5k3tyL5N0h8g3hNqnzEBlkghjUrolSe8to3dM6BsK7nhBxGJlG8yStCY/Z/Hw0CKHKb2g8YzC0gMn5o0FytoqvbLRKIFDu20SgwBpX/vOdypPyCJzC9Wly7aUda5ywOVRDBrAXKPq5/qXgbNobow94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iWUOeg4V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLz+UqXY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iWUOeg4V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLz+UqXY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9EOon079225
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iAGiRZXZQtrxqIY50PmQ+yjP1cs4RScr9Q+YrQrcqkg=; b=iWUOeg4ViKLcqOYz
	3tqo9umiPdnH+cYBOwSmQQSW6cjcSp9VmNGiUK9QGqNz614/qpLq8e4W4pSid+uZ
	NGqsmNHkl5wVLnqhI20GRUQ3CSSYp1iEi9ilusfKmx+xIlNEYcItVIBMeRPpTzzP
	M1AG2JaDixtQ6MrXFFDDrL61/JD+cIJxk9gF3wNnfCXYgAyuTb5vdBrEkzc/XPzB
	tMGydYH8QNZqjjjuJN8e17idzjFKmeNslgsA+dLcHKVOx2aEj1i3oO5BYgaeqoWv
	gX70VFyhUfLUm/U+Eih83QgcWvoFpz0fH2PzFPMfjMaxeiDRublf7iwvQ0DeKLvd
	Po3IDA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckma8aw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:46:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd1dbcccf6so19545225ad.2
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 03:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779705980; x=1780310780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iAGiRZXZQtrxqIY50PmQ+yjP1cs4RScr9Q+YrQrcqkg=;
        b=GLz+UqXYaaB5o3P4u5nXL3uhcBdqqd919ADwfcadb8m7AsrwN18bbx/hl0f32sa5pS
         qNqs0c7yR5N88iVZj6BjwfVkB+bVAFKY1pxbCTKJYpnBL3jzANTG4/bSNi1x9uAq+nTE
         GOINi9Bh5ov/JyYOckXZhw6RBPSlb/RSf85a2Un7pJ3NUPOBu5Pz9+g4He5uhgaQIxaD
         8+T/fQg+MXoZodeRVtX1fKplp6oJJ+728/taslrKPsJTueuuupAbgLXvbfqlySC3hj9u
         pwy6wXzE/MTrsnV45zex9ydoYlYI9I1M9eqFj5kBBIJ4YU/pZCtosF7NGlzKleJDaemp
         Aktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779705980; x=1780310780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iAGiRZXZQtrxqIY50PmQ+yjP1cs4RScr9Q+YrQrcqkg=;
        b=O+YERmbWEWfFjMvY9yF71L5m00jJtPomB1+JmA+CuJGkby4AN6StptzghLHuu/nFVA
         xJmLBWdcbAVgEJfpMEYjglYLvXrgjVa6V2+1yn4KGpQmYrkMKeaEM3AeBTtKwZ4MlDRK
         3rDHU7gB1RvXVhaxque/JYYQwkM4AQoUsozUijfoPdLWSxp6mxScHesKhYKzlXV1TVme
         oEsi4HbLF8TYF9SK/m03n7jYVbi/pWm9YeGoAJzCQdoi+6bL+dwcoD3Ps4nozMPblAZT
         IkXKIIggdOI5NlFTxrO/nHm3SuTuNyrZ7B0SUM3neeOo09Vr15CPsdJ4hzTheqqLdaJ4
         QSzQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Hxj6gEyMls8oOKqdRETcmsXs1iYEyipqtw6opewwz5tzGSElCmwINGc4YbmoXBqDhDP5tV+/GUK7v@vger.kernel.org
X-Gm-Message-State: AOJu0YxKip0192tWY2+a8IljA01q8zV4QB4OmKSsqbVkvwAtq5Vz7u4s
	9MXlifRSTR4KkuTHMXzIGG4H9BONHniXiTYBFE9YiqjHGyH+gdBY44pXoPDB7fPjvBMjHPcxYJh
	ucUkxHdYHSheyGs1jFxG52Kc2rUL8hCmbD6Lz1JfM9fwyL7d7ajSyTXs9FDI0rxBn
X-Gm-Gg: Acq92OHAQt9hqKwhuX0w1HD7AVK+F011GiRLcK3mgck1VvXBLAa84Z2Ct0c1Wo3oD9M
	8Bs64VFZ4FYw2dyF29VigyQNPMit5nk2Qqo64bAZJcbY9X9R+frZVTHOsJNCuFBt3ySvYZcEhrk
	bqfkaA0QEYez0IqpsNvepsxQtxpyo04x6IJtC2L/gD9eRSBykgp2vgFQl7rTlZA2ogWoyOGOTb/
	P5ZjamtrFO4DdIlFmef6lv2nZoT3ymFlPFz1bFJpOvor4iSPQVdeO4/13FXxcpoYbAZWg1T+ALE
	f9pRZtwMj0z2OboBWoxsqzhlqAFFCadnHtnuWqcNT9DUroYm6paG436UXxroyyhlApmXe1G9M+0
	RQWx9qvGaJ0RpHXpQR38eTsYzlWEq2qEUw326sY86BIAcfg==
X-Received: by 2002:a17:903:2381:b0:2bc:ac76:c1c9 with SMTP id d9443c01a7336-2beb05e8633mr145799395ad.16.1779705980468;
        Mon, 25 May 2026 03:46:20 -0700 (PDT)
X-Received: by 2002:a17:903:2381:b0:2bc:ac76:c1c9 with SMTP id d9443c01a7336-2beb05e8633mr145799125ad.16.1779705980019;
        Mon, 25 May 2026 03:46:20 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb591f63dsm118666175ad.83.2026.05.25.03.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:46:19 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 25 May 2026 16:16:03 +0530
Subject: [PATCH v5 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-eliza_mm_cc_v2-v5-1-a1d125619a5a@oss.qualcomm.com>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a14287d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=p7IodTP_qeDR1Assq60A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 5h3xs9Jy6K9SsDjrp2JmxBtIpOj1U4c2
X-Proofpoint-GUID: 5h3xs9Jy6K9SsDjrp2JmxBtIpOj1U4c2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwOSBTYWx0ZWRfX9Jlmm7mbFfiI
 XoJ8EWD3mue+gfoJKdXPTyemHsNG75P2d59YCtPz/SI1U3vK+H4//yDwwv0ASZnR9+nslYO9L8y
 cmT23owIPwBRqLXdz3vurxBvXMbF3DeETADGj9eniFOWyzX6LTk7AiHILXDqooCqLeoJMEoMC6+
 egXZishYuB6Fx/d4uYbJ4kComQVrtPc6DL/AOnGMGrDrGcjFWZbxT4Y4QiFyLBR4+7Pr6XJmlg6
 OsX/QzAiW2xQGyexn3xRe2xAdjcUGhAJUvFeXIIBI3tpryaC8pv9+Bv8mxy/H6OznvbZpmFdBvH
 22xb6Cnt9w1Jqns2yp3IoFoUOhINk3NawwyBlqCAMI/1MWlPqQ+nnWAizQkV1g35g5xsOXbcnml
 jo8YpLI+d8KSilGpKuJVcezLNLviC3rNlEOsIxqfE9wa1RhHvzgWJintm5KwMFPwDyvv4yo0dF+
 SUf+AOdr5UZCOTRQ+7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250109

Eliza Video clock controller is on CX and MX rails similar to Milos.
Add compatible string for Eliza video clock controller to the existing
Milos videocc binding and add the dt-bindings header for Eliza.

The video clock controller exposes power domains, so '#power-domain-cells'
must be present in the device node. Add it to the required properties list
to enforce this in binding validation.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         | 10 ++++--
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 14c31efe1308aadbea61eb7be7e56039a923aec5..c0c9e450b8cda53625b6f6bdb1bdfe5f2bfbee25 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Video Clock & Reset Controller on Milos
 
 maintainers:
   - Luca Weiss <luca.weiss@fairphone.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm video clock control module provides the clocks, resets and power
   domains on Milos.
 
-  See also: include/dt-bindings/clock/qcom,milos-videocc.h
+  See also:
+    include/dt-bindings/clock/qcom,eliza-videocc.h
+    include/dt-bindings/clock/qcom,milos-videocc.h
 
 properties:
   compatible:
-    const: qcom,milos-videocc
+    enum:
+      - qcom,eliza-videocc
+      - qcom,milos-videocc
 
   clocks:
     items:
@@ -29,6 +34,7 @@ properties:
 required:
   - compatible
   - clocks
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
diff --git a/include/dt-bindings/clock/qcom,eliza-videocc.h b/include/dt-bindings/clock/qcom,eliza-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..1e922250a7fae77f5c996208d50ff372b252aa51
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-videocc.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0C_CLK					6
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS0C_SHIFT_CLK				8
+#define VIDEO_CC_PLL0						9
+#define VIDEO_CC_SLEEP_CLK					10
+#define VIDEO_CC_SLEEP_CLK_SRC					11
+#define VIDEO_CC_XO_CLK						12
+#define VIDEO_CC_XO_CLK_SRC					13
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_CLK_ARES					1
+#define VIDEO_CC_MVS0_BCR					2
+#define VIDEO_CC_MVS0C_CLK_ARES					3
+#define VIDEO_CC_MVS0C_BCR					4
+#define VIDEO_CC_XO_CLK_ARES					5
+
+#endif

-- 
2.34.1

