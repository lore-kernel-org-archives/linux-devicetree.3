Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87878342539
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 17:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783012168; cv=none; b=myKcDlJPK7CZ3T9A948MbYTgxhlyW/QW07DKImZ0TNHRt9SLLQ4UJ7esn+4sptSAuoApms8n2q8HL2f6Iu4bvxqS0Kqzp+Pxd+J8zP6c/EMCnBqE4pL7S/H6aC8/++6bxGIqB7wK6lJukK0cYFMiZ+f8A9eJ4vA/2sebSIVbI6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783012168; c=relaxed/simple;
	bh=cKqwClXNxU7u+xSUDBQ9Brn00QjM1FW6vPXxe9i3ims=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k/GMK7MfHVGL2vLBgPYObuSdc8PlHmIrvsc3dHZG5NxOpLZU1WbcKbAv8fPdY5YKPdMF7oMeIKLE9+Q0ct8lDXItxufScIWq9cZFpAVsYdLTRmUQj9JEJ0F3xay6zolpDWrkS7LKYWqNp1rZZ2GEgMD2USuX0LTr54RdXYUyjuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsGJ454y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PUIQWzZf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsGJ454y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PUIQWzZf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3K4t622924
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 17:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CsRqF/VVe9Ur+OBuk+UfrGRhTIFOLaL6m6mXFREYy5c=; b=fsGJ454yyr1xZktf
	h/a+dcSLDwpl7VwHIpnJfuSWOP0RLAvmnHZWhXwe6YchsWf0YGXZ5wi/+drJ8tqy
	Y/ZalibyX3TWpXPsR/HfrYeMogmuiTCoXd6q/9tTN49+SKodf/KBk0b53ojes7qZ
	X1jb3VK/z8zljLQXnF+T5Msg7wf0jyvhVeP4L8tKcLMAlZVjhnMC6UTpWXG3DNxk
	YtmMvgP/WC+w0QGvuyuxeAqFnWjt4tifMfI3OjJgVr3DIFqjztCu8BZRG3nCInG+
	ZrX52Dmwk7OtzZz7znW4AThMYIjH5RmCx28BJCHQSuJ/sWKf3TKxMsUoirx/ii9l
	Ka6QZw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s250ym4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 17:09:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-37dedbd1cf1so317941a91.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 10:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783012166; x=1783616966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CsRqF/VVe9Ur+OBuk+UfrGRhTIFOLaL6m6mXFREYy5c=;
        b=PUIQWzZfUfNFg9EYVzal7Qmhyc9rLdZBrVAdiLtktWN5zyDuWF6pMekAHL1Ue9JO2F
         Yg2eGYHIgvFMwnY4lZMxVAoIAtjtTyDY+9wbbWy0E8RaVTtm5YHFcUkKTrEJIm7uftUx
         7vf47Lz/pOZcBS68UENkcXPJn3JDPwYpVbzdfR0zriwlMsjO2evuGCHQZUIfRFsAEdyZ
         RXr+Ku6WK+Cp8CwuxLlhhwGVH+/ryCuEueResFQZRHEe+cI9rMEDJaCOLwgmc1lIs8PU
         0m5RtPst3MwGpQceIQJZlL4B5/JXWh/JN9v7BqNGZ9lHlafNt/PFeqD1NzOiZz3TyOap
         m9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783012166; x=1783616966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CsRqF/VVe9Ur+OBuk+UfrGRhTIFOLaL6m6mXFREYy5c=;
        b=EyErIA+whbYpSavS4txuODyzbke+WSXQJdnHQMssfiiMyKTikwOQBYqCH3xm8kmfEJ
         HtJrB4tji7goR4mPqIFzdb5q0ln+hLi14OPb2P+w6lRkFxger4qh8kTBirmKpBjB664z
         I0ITOQdTaAif4YGub29BwavLrjfSstlQZ4i6ZcrDGHbhInu3Ua2RDPnklBSrY5KDWGd3
         zigVR128X00PeW5peSG4/106Xn6Pm4ySXFZMiCC2I6QEjlO+PoAyEBDjaNb/Wqo4ee1U
         ftIu6q+XxAbbGVm1QxlGcfqpyYEUHO/Y+6pepbZHBFJDYtfexNECRpOy5Tta5bUfSwd7
         Lt+g==
X-Forwarded-Encrypted: i=1; AHgh+RqLihr7iFTAxLFFvDwDP/Sz1AtvvWYfJC+GiWDudfKgQ+eLxNQEjQpTfU77oVAt97FDGlhPgJaan04K@vger.kernel.org
X-Gm-Message-State: AOJu0YzCzRsT7jI+u2RHxyQycwOEe9PTuuSF3eejt28JdXG0oiIRSNNI
	anXnq7JhYx0yXPmhDBJZ+LikqNmsdj/HHpKhfzJWQ9Vg3gdCfk+QBgo5uG3grsS+cDUES08BGHw
	Tjr2smr9ENVGjAzTZ2MHcVCUivKwNlaf6X9RRKMxV5mUp2OWnWjU6pPE+4sKIPX8v
X-Gm-Gg: AfdE7ckevOIuM5FDcQJ+/4BRbgGGSJkJaVfnoTSRjdVmJ2SREwY89UWah7fIwtssu8h
	xd7Jyt5jO0tmJNacKh7e+2rR+7lhhLTXAgCQHIt49+wfcFUbl3Bmf0ssKBJ/kNh+SVZIIhjD3af
	tbE0v5jT5UgnM7QSUlf6VND9VQobhvITqM8iK1OtBqr5SGXV8rPgckd+/8WqNqcALgTQ9qFtdnc
	9PjTTFwRb/saEdpbiNft2wUMME5J3psGAd8O8s5eIE9EqZVDC4tX6rjnk6/LH0TndBztsPjRTXJ
	Qd7T1Tyxeh8uRwJN+KTbTmJNIlJAPOpeAjGfwKEm6bkPeaLJzFExvPH8ig4PPSp5NC/OAwuumUC
	eZHxFijBWvJUz7835TzqR6WXXDVn2l+r763lUH1o6V5krsMebjeduhx25Y5c=
X-Received: by 2002:a17:90b:1649:b0:380:83bc:84de with SMTP id 98e67ed59e1d1-380aa1bebccmr4331878a91.6.1783012165419;
        Thu, 02 Jul 2026 10:09:25 -0700 (PDT)
X-Received: by 2002:a17:90b:1649:b0:380:83bc:84de with SMTP id 98e67ed59e1d1-380aa1bebccmr4331855a91.6.1783012164980;
        Thu, 02 Jul 2026 10:09:24 -0700 (PDT)
Received: from hu-linzl-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb80f5csm16505031eec.15.2026.07.02.10.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:09:24 -0700 (PDT)
From: Lin Li <zhuolin.li@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 10:08:07 -0700
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add Hawi video clock
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-hawi-videocc-v1-1-6c1e640b0954@oss.qualcomm.com>
References: <20260702-hawi-videocc-v1-0-6c1e640b0954@oss.qualcomm.com>
In-Reply-To: <20260702-hawi-videocc-v1-0-6c1e640b0954@oss.qualcomm.com>
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
        Lin Li <zhuolin.li@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783012163; l=3926;
 i=zhuolin.li@oss.qualcomm.com; s=20260512; h=from:subject:message-id;
 bh=cKqwClXNxU7u+xSUDBQ9Brn00QjM1FW6vPXxe9i3ims=;
 b=pmnf/yHxl+D4DXqlIRJCzVN03uie8l7XViEY1AiJkBCR3PX8fQUDNZnFXdpdtXYVtfFfWx15b
 IBUQEevyoKKCCOQkvXSwlCjdsF9dF5gWxsmBLGZxYb/HCUNkunolJme
X-Developer-Key: i=zhuolin.li@oss.qualcomm.com; a=ed25519;
 pk=MHXg6mCJoooUzb0vMzMIbkL59skKuD2BVgAX/XneLrU=
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a469b46 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Es2KtYj6OvgIQp6ayCIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: sRgLW9exrlMHiZz52YxLLyoer2uoh77F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE4MCBTYWx0ZWRfX1AGbr8MuIdtP
 eAIbde6v/SwOLq9Lta4758P7jDcosIoGA5rbDiJzXikBh8jN9AexYC14l8ScYlvw3YsJwfzqIx7
 rr/dkQmimMbOcFpi8Ubn1+qse0C4kLCaBzo78wL+Axp/hK3SVQ1RL6EBsQnaByOSdai5HPOVV3f
 etkzDwjf16iN2w+BKDxVdLoGDOq2V2p/IKs4wQfxFjXmbYVjV7CTx3yhSsSXYxe3vpkDhQez3Fa
 +5n3hxTTAVc4um7ekFOGRdESb+La8VJbXqOdBEsEIWgRnmGA8MykB5pJSj+BlPMUSQoRXyANCF3
 xX2qZVkRd/HStnie3gEPu6vINl4Seh08c3FHeJzLBZeK5W+gUtuOLAEBwkrpFCGQXXnkG2EoNZG
 n6KwQ2tgI2Y9wDQ2fUrEazJsuO1bcgSvpFBDIjGIAbQ36EJCC0AbVnv5nwaHD/nS5BLBRYw90xJ
 7FrvgslcN6QRQloxMxQ==
X-Proofpoint-GUID: sRgLW9exrlMHiZz52YxLLyoer2uoh77F
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE4MCBTYWx0ZWRfXw8ptbHeWDYyV
 aRnViVTVDxWmyGNa9sA8Q1zcoCoFKyp1UZ0u9VEt26kSxg5aKGXAhGdP9V1wN1bL11OoF35eyYM
 B33OuPBTmtFfXImNKaZVsaJhjnC80Y4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020180

Add device tree bindings for the video clock controller on Qualcomm
Hawi SoC.

Signed-off-by: Lin Li <zhuolin.li@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 +
 include/dt-bindings/clock/qcom,hawi-videocc.h      | 64 ++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 5d77029bfaf8..a6fd1992d6d2 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -16,6 +16,7 @@ description: |
 
   See also:
     include/dt-bindings/clock/qcom,glymur-videocc.h
+    include/dt-bindings/clock/qcom,hawi-videocc.h
     include/dt-bindings/clock/qcom,kaanapali-videocc.h
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
@@ -26,6 +27,7 @@ properties:
   compatible:
     enum:
       - qcom,glymur-videocc
+      - qcom,hawi-videocc
       - qcom,kaanapali-videocc
       - qcom,sm8450-videocc
       - qcom,sm8475-videocc
@@ -68,6 +70,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-videocc
+              - qcom,hawi-videocc
               - qcom,kaanapali-videocc
               - qcom,sm8450-videocc
               - qcom,sm8550-videocc
diff --git a/include/dt-bindings/clock/qcom,hawi-videocc.h b/include/dt-bindings/clock/qcom,hawi-videocc.h
new file mode 100644
index 000000000000..8c97079ff1a7
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,hawi-videocc.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_HAWI_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_HAWI_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_CX_AXI0_CLK					2
+#define VIDEO_CC_CX_DBGCH_XO_CLK				3
+#define VIDEO_CC_CX_XO_CLK					4
+#define VIDEO_CC_DBGCH_XO_CLK					5
+#define VIDEO_CC_MVS0_CLK					6
+#define VIDEO_CC_MVS0_CLK_SRC					7
+#define VIDEO_CC_MVS0_SHIFT_CLK					8
+#define VIDEO_CC_MVS0_VPP0_CLK					9
+#define VIDEO_CC_MVS0_VPP0_VPP1_GATING_CLK			10
+#define VIDEO_CC_MVS0_VPP1_CLK					11
+#define VIDEO_CC_MVS0A_CLK					12
+#define VIDEO_CC_MVS0A_CLK_SRC					13
+#define VIDEO_CC_MVS0B_CLK					14
+#define VIDEO_CC_MVS0B_CLK_SRC					15
+#define VIDEO_CC_MVS0C_CLK					16
+#define VIDEO_CC_MVS0C_CLK_SRC					17
+#define VIDEO_CC_MVS0C_CTL_FREERUN_CLK				18
+#define VIDEO_CC_MVS0C_DEBUG_CLK				19
+#define VIDEO_CC_MVS0C_FREERUN_CLK				20
+#define VIDEO_CC_MVS0C_SHIFT_CLK				21
+#define VIDEO_CC_PLL0						22
+#define VIDEO_CC_PLL0_OUT_EVEN					23
+#define VIDEO_CC_PLL1						24
+#define VIDEO_CC_PLL2						25
+#define VIDEO_CC_PLL3						26
+#define VIDEO_CC_SLEEP_CLK					27
+#define VIDEO_CC_XO_CLK						28
+#define VIDEO_CC_XO_CLK_SRC					29
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_AXI0_CX_INT_GDSC				0
+#define VIDEO_CC_MM_INT_GDSC					1
+#define VIDEO_CC_MVS0_GDSC					2
+#define VIDEO_CC_MVS0_VPP0_GDSC					3
+#define VIDEO_CC_MVS0_VPP1_GDSC					4
+#define VIDEO_CC_MVS0A_GDSC					5
+#define VIDEO_CC_MVS0C_GDSC					6
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_AXI0_CX_INT_BCR				0
+#define VIDEO_CC_INTERFACE_BCR					1
+#define VIDEO_CC_MM_INT_BCR					2
+#define VIDEO_CC_MVS0_BCR					3
+#define VIDEO_CC_MVS0_VPP0_BCR					4
+#define VIDEO_CC_MVS0_VPP1_BCR					5
+#define VIDEO_CC_MVS0A_BCR					6
+#define VIDEO_CC_MVS0C_CLK_ARES					7
+#define VIDEO_CC_MVS0C_BCR					8
+#define VIDEO_CC_MVS0C_CTL_FREERUN_CLK_ARES			9
+#define VIDEO_CC_MVS0C_FREERUN_CLK_ARES				10
+#define VIDEO_CC_XO_CLK_ARES					11
+
+#endif

-- 
2.34.1

