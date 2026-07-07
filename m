Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDEC43C7C7
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 18:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783448050; cv=none; b=KT15qfhfVln9/gsmX70zh0Ucm+CcgDmL460tRgbc9E6NxPmDD/YC/6SHtSIyNoOrKI2itClmwxEcAxv8EN0O8mHta/7mTK2BHAaNwmN+4s4jSAGc3gfeu+hvwbJDy9lKoi3PblpxxtbGd3sQNcZoc1HkWIMYMTho1HkF1qAl1Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783448050; c=relaxed/simple;
	bh=ZVo2+PYmKzH58zl1Mu0LYWtv2AZPMxLsH9FtdHkNoRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LmmLhfKzZ2GU0Liq4ECpvkZEVgA/Fm2bnG+np+qA8NNffZ8kbjU2y33IShendFipt1Xcp5fJ0F62gwmvtNkE/WwhiBq0L6RwdYD4hW4AsSPkFj9H+xXMG2bfVP/5LW3vYvQXPIGRfATGC6LRujPBw3wq614RPgKAq+/Gw1JBnYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZbuoeO6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KNpkMo6K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZbuoeO6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KNpkMo6K"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FT7ip4045093
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 18:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aTtAXNPOzx0l73ZyAiH4LCOhEpBudaRMo+eDCe0KHEE=; b=WZbuoeO6zcCoVD4u
	Bm3sYReqpYHHkT/nrAs/CrVeCMhadZOQuRmmBlU6y9DdduDzMbBeBo4YMgpzffV4
	6BZXcK2No+4mhk9qLM2mvFrUy7ji7kX2AZFM+awFjimeYFF24aPFbh10LYtuJR04
	mrgq1UDZF6IaE1FV6Thal0pKtRMv0SE9G9/lTVRhSjLa9M19/LIjcp1MEWQjcCt0
	l1eS03gewHz5Pv44oDRAAIu0D5Ne+8Jha3tXZ4+C360kiHr3eXPNBXrxo6QE5FFE
	crPUaZou2eBP/mcOAJNs7yhToqHdCUaw8GsZ8pADNYzfYKWz3YC+7dUpD61BxQDQ
	ppbJ4A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2uarhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 18:14:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38869800848so1010749a91.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 11:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783448047; x=1784052847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTtAXNPOzx0l73ZyAiH4LCOhEpBudaRMo+eDCe0KHEE=;
        b=KNpkMo6Kaw8wHWJTQvXr221KJ69tbW9ZKtNyTwCvmLuORsSsXG4/V+6Qldm5vDjQaQ
         XjV0oD+7jUHHSQdTfQmby2GWzM9COdgbWtuliyKYP+l4mwJgyJWDrb2O/WoEO30iw5Vu
         EAmgCQmitTDURPAF2IUbZbqZihiegWLqhOW2oGgXGk/27sp4jHdo82pNpD6uDw6DasF1
         G/emDjSrXa6lPlXdjXBr+NvqAQlLvCE8bGCFCuI3fC7BOA7IJ0vnBgf0qKeR71iNzMZo
         r9RkICAIrMj+YvhJqkMO1dS21AP001gXvVRJtOR5mVOKBAdejHSBhA5HXPLPxDVANpLv
         +PeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783448047; x=1784052847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aTtAXNPOzx0l73ZyAiH4LCOhEpBudaRMo+eDCe0KHEE=;
        b=ETCtlt5rIOtrBP/EweqHwgJ3PnSerpNozcc3twQoa7UV67+Vm0btHZYXq6Ui58owgZ
         5speEHObsnA7I2sPXrllJEODcaChZg/DTLCTCAaNzjGPGT8iSWgrN40YNe4N4o0ZxsH7
         J26/ekU/p491TY0T077Ppn5UM0VK5esPs2uExJidMVkcqNv8yS4G4G+tjlzOkedJgrUJ
         JZslbf8AumFBQFJn7isff8l/iYF7A18TBsuzmO2NiV0FC1wNgQas7v735Lo58U0Z6wWY
         FgH19FESZHcR0rxmcMVoUstVgQtjlOQnMs0tnliqmeNOweF10ZWj85k2aRa/4XUHwIBN
         X2Ww==
X-Forwarded-Encrypted: i=1; AHgh+RoATd6dU8ux5d6gaT6+SPG8xg9eSeKE29I1icdg8IRwP7fELYa77EOux6qHKnohtYwGy60xXX1di3t7@vger.kernel.org
X-Gm-Message-State: AOJu0YwxV6L7Ue1FBK6Mx0tgocbiuSfr2p8980kN7J9FWoHei1Z09Vbc
	xtVBoOCtk2THKxxalnv2fvU/nxx92OXzGE5IZHPZ5RfJkYBmJdYH0zFfDzeCO6NK6G8bYIxnbFe
	IoyZ8NEf5wi8lI0bGzseovizL6RPSEEGOnIyDBVgbYd4pXuxg1j6ntwtUIccG5PdIoPUpjLbG
X-Gm-Gg: AfdE7cm0JaLEoRzgmFfmuy4gM2F998BkGLyBYXHf3t7WB1TA1zSGq89llm5cDOJBeDq
	VYP5mrkzicX6eJpxV1cFRoCje5ro/wpviSrHfjFA+m+bjAUISMZgGlAu5LaYXFs2a/l0HV4bkOt
	AS3iUo0NujM1+vuv5ZM68KDgVXhvD75Nm8+5V8kxJKTdWgkKEYn+DuxoWlwVL+msuHa/IY2dGKR
	oYP0TDEJYKK3KCgsQu1Yapm9FASiGsvEfNgiU3+dXEqg2yDTPrsZ8Puslh5tPP2Eth6Lb3DVEY7
	TmOTyvBOIbL4OyOzvJ4xVjxqdxuGlFrsos5fJKZ5GXfluUazzSvIzuAQc3dmlzwfq/VyYVidrxB
	4rW/yYjMX3Mjq2/aNbjiEYKoMZr8ljNKn+ajdT3oE5Q==
X-Received: by 2002:a17:90b:270b:b0:381:bc4c:da5b with SMTP id 98e67ed59e1d1-387572b45fbmr5907563a91.18.1783448047043;
        Tue, 07 Jul 2026 11:14:07 -0700 (PDT)
X-Received: by 2002:a17:90b:270b:b0:381:bc4c:da5b with SMTP id 98e67ed59e1d1-387572b45fbmr5907535a91.18.1783448046531;
        Tue, 07 Jul 2026 11:14:06 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm15731521eec.29.2026.07.07.11.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 11:14:06 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 23:43:10 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add Qualcomm Maili video
 clock controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-maili_videocc-v1-1-ef0828c0bf6e@oss.qualcomm.com>
References: <20260707-maili_videocc-v1-0-ef0828c0bf6e@oss.qualcomm.com>
In-Reply-To: <20260707-maili_videocc-v1-0-ef0828c0bf6e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE3OSBTYWx0ZWRfX2bKJjGSvSt1f
 6dYxAWrB8tinaAuWDQusgTH3bNg0w7OtjfjX5Kzoy0ZWKPBloH8W0dp5XoneL9G/xfYqYXxiHT6
 vVJUEg1R8eGd/2LQn52b1lfTnwH+CDo=
X-Proofpoint-GUID: 5CXAbtJmKH7JY4O2foz3HIvzu0yzU3CV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE3OSBTYWx0ZWRfX8zZRlH83wPug
 Ytaiuha0JDNEGZudw+HlTVOyLsRfIkqfAcOMF/Fm3TijjhZz2wg2V7Ul4BBlGKy+rChRLpKuLIW
 xItH5xi/FttQrhzWihiDZU2ZBf44bk/bvO8ywakFgh84Z4rlqpIiYc1xV64pqgQTrDirLVOd2NV
 mxbn6AJ6dKYwZWl9iEF5TyZUJV0Ak40/10zPRqKlcI0il7H+HcPpRRyfp3GEg3gjP8qgiW/aCBI
 Tzy5cgF1YE8R2b5wVKekw+wG5ieeVZtgdNki5A1M6Sbkxo7P9eOiyOOtYGEQGyq4DXEIdypfLfs
 JDLpb2dXBlQ9SujnvfOmodxvzutyH3k3XwTLBmCoj04nF+tGX+/Op/tDE+dXHBqZucoZi9S6IA+
 Y5DxNBJV95A+geisQn4AwQgThYhujSyjQESlvxtdq5nLOzWsMtVi8Yvj2ipXLP6QZ132Cf0h5pM
 4AEXz4Zu41BFoGSDkww==
X-Proofpoint-ORIG-GUID: 5CXAbtJmKH7JY4O2foz3HIvzu0yzU3CV
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4d41f0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_g2Ecp_Vah_XpkdnnNEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070179

Add device tree bindings for the video clock controller on Qualcomm
Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
 include/dt-bindings/clock/qcom,maili-videocc.h     | 49 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index a6fd1992d6d2f9c05751de2dbf2b53fb96de2958..6281e5ec8036b99ca21740c7f679f4b55edbb87c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -18,6 +18,7 @@ description: |
     include/dt-bindings/clock/qcom,glymur-videocc.h
     include/dt-bindings/clock/qcom,hawi-videocc.h
     include/dt-bindings/clock/qcom,kaanapali-videocc.h
+    include/dt-bindings/clock/qcom,maili-videocc.h
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
     include/dt-bindings/clock/qcom,sm8750-videocc.h
@@ -29,6 +30,7 @@ properties:
       - qcom,glymur-videocc
       - qcom,hawi-videocc
       - qcom,kaanapali-videocc
+      - qcom,maili-videocc
       - qcom,sm8450-videocc
       - qcom,sm8475-videocc
       - qcom,sm8550-videocc
@@ -72,6 +74,7 @@ allOf:
               - qcom,glymur-videocc
               - qcom,hawi-videocc
               - qcom,kaanapali-videocc
+              - qcom,maili-videocc
               - qcom,sm8450-videocc
               - qcom,sm8550-videocc
               - qcom,sm8750-videocc
diff --git a/include/dt-bindings/clock/qcom,maili-videocc.h b/include/dt-bindings/clock/qcom,maili-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..ae52686639db3231b8705e28667d3a65192d4de7
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,maili-videocc.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_MAILI_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_MAILI_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_FREERUN_CLK				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0_VPP0_CLK					6
+#define VIDEO_CC_MVS0_VPP0_FREERUN_CLK				7
+#define VIDEO_CC_MVS0B_CLK					8
+#define VIDEO_CC_MVS0B_CLK_SRC					9
+#define VIDEO_CC_MVS0B_FREERUN_CLK				10
+#define VIDEO_CC_MVS0C_CLK					11
+#define VIDEO_CC_MVS0C_CLK_SRC					12
+#define VIDEO_CC_MVS0C_DEBUG_CLK				13
+#define VIDEO_CC_MVS0C_FREERUN_CLK				14
+#define VIDEO_CC_MVS0C_SHIFT_CLK				15
+#define VIDEO_CC_PLL0						16
+#define VIDEO_CC_PLL1						17
+#define VIDEO_CC_PLL2						18
+#define VIDEO_CC_SLEEP_CLK					19
+#define VIDEO_CC_XO_CLK						20
+#define VIDEO_CC_XO_CLK_SRC					21
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0_VPP0_GDSC					1
+#define VIDEO_CC_MVS0C_GDSC					2
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_BCR					1
+#define VIDEO_CC_MVS0_CLK_ARES					2
+#define VIDEO_CC_MVS0_FREERUN_CLK_ARES				3
+#define VIDEO_CC_MVS0_VPP0_BCR					4
+#define VIDEO_CC_MVS0C_BCR					5
+#define VIDEO_CC_MVS0C_CLK_ARES					6
+#define VIDEO_CC_MVS0C_FREERUN_CLK_ARES                         7
+#define VIDEO_CC_XO_CLK_ARES					8
+
+#endif

-- 
2.34.1

