Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B76187346
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273556; cv=none; b=dyZIwx+8OdTuYyq7eb5z9rAwmnseljUR6P5IgyIsHj9LLq1kwf/RzC64pSIQJ+swQSQdAlrnNm4+K4H8R/VwRCAOJDbfVbWT9rg6wzl4f3g+bQ2YXVFPVYAzuPN08ZYG3PqLuGrysSheEfIxQJdDjiCBu/R75fg0BezfKEnWZ8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273556; c=relaxed/simple;
	bh=B3TLsDqArP03LQKcA8ngy2MaXdpHgeOMi+R6ynsdPHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XxAZt52HfQHHaDnsxLc8/RBtM9MFkqbnVnWPX6V0YWr1b5Szc6d2VYJ5HipAa6SzfCSHLraWgjrb0rBqtBu/WZlmxRp87JNOGdx9M99l6rrTB9yfKwgiTiBnMKOpc3MRDvS/Dpvx1VFVfxdSun0IMFrzl4IK0DHZ0vIzR8rkuac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VzVaTHXf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B0jR1hK0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VzVaTHXf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B0jR1hK0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cavV851901
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:32:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=; b=VzVaTHXf74prcAeU
	DSBgbbdmA6hjw1hc6acb2iUzSr87Qaml5boUwtfa23hkMTlAFLEG9qjjXdro9+Vz
	WeR5tzOMyI54FhnwIv/6uCAc8r876pjTzf5k9pTs//bGmbkRhaL74CPdpketAfF1
	VjDwKIzVbHUxHwWIdNhKpcPwTvt0Nlai3hOs7srMAR6di2ASksiTVTuYTbHumLzl
	cq0+uWdh7mWnESq6Jp/s3PZ+VSd0gUX9w7+e76kiCbUOPwATu7dzK0iI42wyeca6
	BYXJ9kVc8M5QkNW2Kr5RcCfc6wYg6xYnE4OJHWyt+GTEFyEScdVmP58Aw5YLlCjB
	a8Df8g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9p878h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:32:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc88e22f92so154529335ad.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 00:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784273545; x=1784878345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=;
        b=B0jR1hK0XtA0XeXGAXmJuZulGJLlO4pXDciRoJttoa1KfzdLyF7wL1NvCtnnfmbs3q
         kHtEOJrVNz9yq5qt6tjuE+YFZ5LfUEjyjK3JGjHVEbLZyixjcMhP8C2QfocOsTJpVlk2
         JovcG2xLd52ZO9kDA+FOT4oMhr3cdyJFTQqsC0FpCx3DYnwjCdMB4NP0EIcE5Z8UBpfH
         A2qxBjypEatOv10cSE7MMl//uROHz/iz6d7v/DwZdE3MeF8CIkY00OIWg/Xyn/fRQtIm
         NizKn9uDpCn9P7EFpU3RhRsItkcYhs69+fMrdgW8Z1gepgezqIayMqdvHzMukbD8wp1X
         r7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273545; x=1784878345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=;
        b=CYp4bAngWoFBp0Xv5+IYjLpv7Gjtu9GugMeC3SCctaWhWtgoTm8NYJ8SrVbdNR9t4D
         E5tzviB+dKOkAibJgAHeds73bhkW9onqmzk1Byzi/GDR1pnA6G4BRUL76BBnOKI5P4sO
         2YMNO5cF7aDkflyC+oWq0e1FuKLN56/dTFTdsH8855L14mqbJzGo8TkWSzIP0ltnqvvk
         k+Kp3kdoQII7HVjwDuo5WWnzADneNDB820iRXduxEjhUuRaiL2DNXffhOQ3qeoavRe7c
         5QwHR6uh82+STHCv28tIqgCyOSUkC5QlCshT6av24yUs5584v7oLEQk5k0wXLPAkp/82
         Rmyw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1fAab8hMznBVPcrlBgcg8eX+3HVam2Flz6qJOUy2XCiFyAWXejWx36LEEAXg0HMQ2Y5bN5dpuhXqQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzgWwY38vChhhkP3dZjbNyDaI08sG04kYvMEBxu12xbeuovYSns
	/Kr6SNaRDCRFgZpokq/mIT7HWl898bYaTH9563SNNzYfMq8t4NNvM6xlZAS8HUs9ByKsqzvoe4Z
	aS9pO2PIGzX5VS3UzR5KVBWKdo/EVgzqryb+rvtmywkWFbQegb8htHcICDLJR5J/V
X-Gm-Gg: AfdE7clDXQPETUvRdf0o/MkXdLH0I5L5cbQydJzbyNGpQipqdVwa5uDCgog+VkdiqNN
	0awCYoU1KmhYsAH/xZmYPIKJO7fPFg45dAbfVabRFsfs+nJ+iMG1GlB+qSxn3CSXQOk144KfTNc
	eKoruqDf1CI8xlSsDsbyabVEfc9y8q+fMnq1Kj4QPmiuMnF9Nb9LSg4OsA5bAhxWwIO+TIWTfIL
	ChJOsi7wRlqMUzOl75VfLn8ifiNxDQ++0ei+bYZOjgpxoHadcbWJdleKmBOBCyJR5y9MXkRi9nE
	Pz1QzMYytkGHS3EZrAZkT84t2AwIw+KKygynUVrHIaP6T94lCQBJt9CBdL074Bh017x6TuzO8+9
	4Db5GHfUDWX4GRDIZxawXgUKt
X-Received: by 2002:a17:903:2a8b:b0:2c2:bd0d:3cf0 with SMTP id d9443c01a7336-2cf3497f5dfmr16503305ad.25.1784273545179;
        Fri, 17 Jul 2026 00:32:25 -0700 (PDT)
X-Received: by 2002:a17:903:2a8b:b0:2c2:bd0d:3cf0 with SMTP id d9443c01a7336-2cf3497f5dfmr16502845ad.25.1784273544677;
        Fri, 17 Jul 2026 00:32:24 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448fba7sm5882525ad.6.2026.07.17.00.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:32:24 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:01:48 +0530
Subject: [PATCH v8 04/10] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-eliza_mm_cc_v6-v8-4-5cca1bef2e48@oss.qualcomm.com>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: s69q6NvUj9F5W9rCRlbMWl7agdO_yhPV
X-Proofpoint-ORIG-GUID: s69q6NvUj9F5W9rCRlbMWl7agdO_yhPV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX9e83mDKTi7cT
 NOHFhriJjQH1ggbUagdj/mqRCOyqAHAO0btilPFN1ipfOpPZfurtA22bf5ztJPgXYfj82lA6hCj
 VY+P6Bt5oFZE6dtO70nE6i8ENKNcVdFvSARCoEW3Fq2FQHoU+TTFi12dtxOx0sy4MaKTQ5F7vKK
 qx9RTJmmENkG6KqiKxZTlC3LS8fNnIdR3P29LE0iyiJOAsL2rYA/Tme42a614UzxeD7VzgkvB5C
 EYqWhd3zcy4o4+Z2Ka9WID8nx+mxFwXwD65wO487pZxb9fjAOZtbRgE4E4PSRLu7YTlM3U83iQR
 CnHYh3FLiBB8wh1Kppg99yKdYFRIAqYuutECcRXueTf5sGyzu70Km3yjglqjQkl0i4aUrKg/YDY
 mGQTCPOvYh9WNQgznJn2jwz5x11dmtOZB0WXR/nvO4rDzcy0eAvzih6/UJRaRMJn2itBreqONDE
 hPxSjRDPKMtGqbkM/HA==
X-Authority-Analysis: v=2.4 cv=TaqmcxQh c=1 sm=1 tr=0 ts=6a59da8a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=hPke8q22Y-dA_sy_I1MA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfXzUjez0aIhNTy
 rJ0d1L/wUdpGF4NBs8Yxgej6NbFyPlslPN6e169yOUU4zMHBBQKyUzlp+ga74O2ALEzUUfok0mS
 DWh9/s/OfF6M4ZZY1kfVHBt/QqevjjA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170073

Eliza Video clock controller is on CX and MX rails similar to Milos.
Add compatible string for Eliza video clock controller to the existing
Milos videocc binding and add the dt-bindings header for Eliza.

The video clock controller exposes power domains, so '#power-domain-cells'
must be present in the device node. Add it to the required properties list
to enforce this in binding validation.

There is no ABI breakage and no impact to the existing devices, since the
nodes using this binding already specify the '#power-domain-cells' property
for videocc.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         | 10 ++++--
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 4d8d109cd304ef0f5afc5c3fc7961a6156003d4b..08898f1d74e4ef0a3921eb7cc5f13d14bd02975b 100644
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
@@ -41,6 +46,7 @@ required:
   - clocks
   - power-domains
   - required-opps
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

