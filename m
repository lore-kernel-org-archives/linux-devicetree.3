Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC0A340293
	for <devicetree@vger.kernel.org>; Thu,  9 Apr 2026 20:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775767904; cv=none; b=V4QKUP/42ZhIYyXSvO+B3lI44fmVLCwQsDf2ncNFRhJzn50xI2KaB5KOiqBd6Y8j9swIV09MncIPI92pzEehOh/+1vdMFzD8Q1zNgX55qAmy3ttL3f44uw/YGVHJpdrpAjv/FLTJUcwyYQcsjapxCMfA4CnZUGqH+A+oNmKqHWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775767904; c=relaxed/simple;
	bh=kw5p604sbjJFeAivMXaikZg9U9dbYF+grAyPdCKJAL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DE4S545ugUngoaYsLc2+ImWwTkSOOJ0tG3VFVziHcWKpYWpT23HgcSgSmLzKtfwlntbh5d2So1IfCQukAeUp09aZFn36kiVK+vrFfiaoehhHOALG7XA35bMc9kSFJ/c79Ypq9MnzlBfDgh1o1qpV3lEtUE69MorYow+fVz+okps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jHF+F5Lz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UtSH0i1l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHF+F5Lz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UtSH0i1l"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639Eqli7115215
	for <devicetree@vger.kernel.org>; Thu, 9 Apr 2026 20:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HGAns8TtVYlWz//SBhmqVWlH128v9f2U+hS4veYG2jY=; b=jHF+F5LzuamBqyxZ
	Te9qE/PXcVLCfpQApZ4glQmFVp0DA5oFliJHyWCNOzuyP/tCqEt4veZ+cTqCDuvB
	9e4SLH2M2MuPhCXT58sL8MpW7uytB3M5B/ucRdmgnrFHfuGuEml67KTOYZTDpLv5
	EqycJ+Lu0l9lcMTKIksHMRv+q/dYFDZibBvVnYe3U3ig464b4cnLgv625Mkj7V2u
	dPwgwJd5pGh/lDwsH6w9acItRMyBh1SyhOUoNLqsq3W+VjJSfRPpnRF4uZhrWjx3
	WwIyj1Ldayy6f1eS+q5wKACqsXx0759VURFQhkBJOxxRzWYrFGDYPj5ANP+6b9tb
	VAqtRQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dee8x97uh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 20:51:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2d51aed14bcso2060914eec.1
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 13:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775767901; x=1776372701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGAns8TtVYlWz//SBhmqVWlH128v9f2U+hS4veYG2jY=;
        b=UtSH0i1lZ0l1AmRZ8kUmfQsqOhIRAT7eVm2yuHKU7/9zURJp7jqgyuYJ8JppkdzyyY
         9M1wMSB8CLjgLChqRCOAshFemSTfHmmIA0MJPY5OaU1mXTPaUYVOAv909nrMdeUVXJ7l
         II+5tSExozAp7+w+pMhBSAeCb5JSR1ahCCQVTERvo2oka05CiVPsoKVRFUFVwT62x5uV
         UedtNVEQIGdA8Nl2EyzT/mvu5+aZ3/T2xlMKYAcdkMv8WdonL7kHeFT5ms1PtTd7Dp4e
         U2yLjZ5o+tTiR4m5dRUdsfsYD41Zbi7Hmph99xT3j4qvV6IxmsHFTroPLagXnUttWuFY
         +t9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775767901; x=1776372701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HGAns8TtVYlWz//SBhmqVWlH128v9f2U+hS4veYG2jY=;
        b=OIK8EtEqVjLM2JHXiOTdj3hp/p4P6SmG91kodw1P17Nyd0Otf3HX/kMG0ec9WEknNE
         in0mQPJRAGP8AUdmxye8SILyNNKLiF7Y7/bgX/RTDTDCrYSynB2K5wE5ppLV0D0VIBxJ
         df3KcJMhwcXl3D9CXxXWz4Qj4Lr6sz/t7CtcZuy6SW4nkgk/Is/JICx9plXti/lAuxm7
         zmiudZUoGyPNZiMOX30mgTlR4Aug6s4BJ4jRYmq/xO+JEetf5hUKwXINbR6V9g2cJeG5
         q7vMLaLegh49wBRc2LclQ5tnmPKS7sF2XFrf8p8+MVNvxF3XV6bi2LO2Megq/i2RYeBW
         kSEg==
X-Forwarded-Encrypted: i=1; AJvYcCXB5WXhOVt4t+DjPpwabGs2OGT/mOJ5fMg7LVoEROjLmpDOqImADV2XNyMVZ1Kw1RSAI62lb+99jFpm@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4SV57Iq69qWQ77Kl9I4pyEMPlImXONa3dxXxFufl/LQhUetGS
	vndPH+NvBj4hwlWIspBahDhxoFUaWauqssGQ512IU08fQuPvOp8J3e9ukjhFQi96iFMP3mvoFEs
	WKH/frhxuY83/PWyBrzY2YVLF3jkPfcJQGbUdpWibaJoWvjCvyoh0QFKtz4c+kFxP
X-Gm-Gg: AeBDieursfWYvlrqgvZ0FSU5ZalJHDb01c7RDxpgz3QlPGUYY8vR9LaQ2jo82Vjdc3R
	htfEXNyCDS/c3eRqheMxHlWrUCDzy2OP43nipqNRz1f0mmDv1tn0cMM8/sbjDA+veGsYfrkXjCI
	NeOVFpSp7qPtU9CPv99rsTK/2v+SJsyIb9j13kgFStQEjDiueCrz+ZbPemmawWpMTj12ibfrxEs
	gIpQFS50+ATsjiMK/Q/bayVMsPhc5gv3BX4qhhYfrqD+Cuyj0ltALwkF6nN/E7l9yBQBBaW3dzS
	UDbUqhML/v7LBenE+G9yvLhB7NQyS04Ei1LOdCIk4Tk27j/VOCAHjjh7Iyppc0sdRQA1jdQTJIz
	91dsBqZgcUoc5NRJ+xIIN/GWWfjQzHeOJ/jFJo1vFzrq88xYkWrab8vsWmvTReVuhazFwIjn7Kc
	ui
X-Received: by 2002:a05:7301:6788:b0:2c0:cc90:a71 with SMTP id 5a478bee46e88-2d5873b3c6amr406686eec.8.1775767900760;
        Thu, 09 Apr 2026 13:51:40 -0700 (PDT)
X-Received: by 2002:a05:7301:6788:b0:2c0:cc90:a71 with SMTP id 5a478bee46e88-2d5873b3c6amr406661eec.8.1775767900210;
        Thu, 09 Apr 2026 13:51:40 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562eb05fcsm1327869eec.28.2026.04.09.13.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:51:39 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 13:51:36 -0700
Subject: [PATCH v2 2/7] dt-bindings: clock: qcom: Add Hawi TCSR clock
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-clk-hawi-v2-2-c7a185389d9a@oss.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
In-Reply-To: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775767897; l=2021;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=kw5p604sbjJFeAivMXaikZg9U9dbYF+grAyPdCKJAL8=;
 b=4pD13kccQfxd6jgzeZ0BBw7DCR4BkeKryU+4+rINs4J4HqwrxtVOldRrc7ns0eTDXI4fOB3bI
 M6kW/O5oumjAJOgZoi5a6x/Z4FMIFLk9nOoARb8W1soJCyOfAbb87+R
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5MiBTYWx0ZWRfX2l679Zo6bu8y
 RsDsjnVJbNTRpxttjsjCzhUPVMDbnSEcQyZ+cSqPBKHIPrc9p2jL1FUwKyFrLESuAL6I0kKa5MU
 Xph30jrT8A/xtQxl+t2jLthfPmXxSs5zXlldeiWuKDEamphhEJrmaKbmW+AE4rdcyXvyixpsGh/
 YAw2YYMuhGiKVu1yt/2yf9D1ZgxFHLo1voCdHKCD7hiisV+0C88nUxRdVxro2YVxYhdd888mTlj
 gMsycNBT0ks6x1tFfsbOfeZg8Ym36u6SES3asCBjM4N4wx0i/C1uTVAf6ZL7Yg/Yxpjt3KytD78
 +XYZ1jHCTj1pD2kP+xbDLeHEOYJ+GQepVn1e+onKIj4gFmJNjMDora8QfiUkAN7RO0+ayQY3M1H
 JLI6ejauai43kNbR8z0jgccI5fNekXJpU04qTMWGmDJkoBGAZHD3MCt3y4x4sggrRCMSV3mOzCq
 NUWbQ1VJZsIGlZjp0tA==
X-Proofpoint-GUID: aTrklB5oY9RIOF6rAu_kv9BTfEbNawK8
X-Proofpoint-ORIG-GUID: aTrklB5oY9RIOF6rAu_kv9BTfEbNawK8
X-Authority-Analysis: v=2.4 cv=O7YJeh9W c=1 sm=1 tr=0 ts=69d8115d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GhicybczBOgKxo7yvssA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090192

Add bindings documentation for TCSR clock controller on the
Qualcomm Hawi SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,sm8550-tcsr.yaml      |  2 ++
 include/dt-bindings/clock/qcom,hawi-tcsrcc.h             | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index ae9aef0e54e8..bec3d8b4c70a 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -17,6 +17,7 @@ description: |
   See also:
   - include/dt-bindings/clock/qcom,eliza-tcsr.h
   - include/dt-bindings/clock/qcom,glymur-tcsr.h
+  - include/dt-bindings/clock/qcom,hawi-tcsrcc.h
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
   - include/dt-bindings/clock/qcom,sm8650-tcsr.h
   - include/dt-bindings/clock/qcom,sm8750-tcsr.h
@@ -27,6 +28,7 @@ properties:
       - enum:
           - qcom,eliza-tcsr
           - qcom,glymur-tcsr
+          - qcom,hawi-tcsrcc
           - qcom,kaanapali-tcsr
           - qcom,milos-tcsr
           - qcom,sar2130p-tcsr
diff --git a/include/dt-bindings/clock/qcom,hawi-tcsrcc.h b/include/dt-bindings/clock/qcom,hawi-tcsrcc.h
new file mode 100644
index 000000000000..957bc5f75bb7
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,hawi-tcsrcc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_HAWI_H
+#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_HAWI_H
+
+/* TCSR_CC clocks */
+#define TCSR_PCIE_0_CLKREF_EN					0
+#define TCSR_PCIE_1_CLKREF_EN					1
+#define TCSR_UFS_CLKREF_EN					2
+#define TCSR_USB2_CLKREF_EN					3
+#define TCSR_USB3_CLKREF_EN					4
+
+#endif

-- 
2.34.1

