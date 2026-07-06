Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDBA3E7BCC
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 08:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328263; cv=none; b=J9NoVydbP+CuPDPOOjHmI+TsGE8z5R4Ovm4+b6F8gEDTOQbJuvMynG0y2JYSl/zgJr3r8epZmWfPYrIMmFXHFOuBEkQMqmedt59x6UTeqy/jkmV4t/QFAY04DRprgQX/F6SYElJmWiM+iDdDAMWZRWjxTmCe9PrP3BF1OfNRJjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328263; c=relaxed/simple;
	bh=CI6k72yT7p3oLTIjONdogZ70kn31jcn/ngorwqMG4/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OlEKnBPKITd4SSjyGAVcv1EG3kM9NpUcMceN7E2Muv++u8YVhCMZBSBP/JyUaDhDqFdxoBPi1Hg2Qfe4vjWyoGjg4daO4Hq+WY6MOkwIg7i4vZ/eKwTKZVLeuXLVHAq7MEl8s6gHR5v7dKQMCvcOWns3CQOWCBr1bnCo6Yukap8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FcV5UvkV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jABjZTB/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FcV5UvkV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jABjZTB/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6668dLmO048986
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 08:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J9sX53wPV2F+rnCSZtAI/0tgdY7PnnmuU8OKyspcfCE=; b=FcV5UvkV0nhXjZMI
	aJU9N5HlxHQ9jYV22jcaj83LC8omXIaqmuG63oNPUqxX1fj3LBUEx4rdT92Y1zvi
	W5dycFCXaDvPn8sUwF+VY7zoFdvpSpL7kTWxockxVzaVka6K+vkOXgs4xWEvcnjB
	SSnUksCVWEF3ue91p6fIV+2YKOi3BZ1tjD3m9JRU6nwDej7lLfLVz73m4HW+su9/
	+4+t4TUWE2ZS4cryA/R3LugZ6VKedeKqePaNG3M2Hqt6qiulANaO4Z/eMnCuwhFV
	8Gccq7D6tqwCntd7FksRaDksHUVFRZ4cfmDiSsXCWScqSjbD8NI55pAbCC3UcJZr
	yX4KtQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891ur252-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:57:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cacd6d37edso40335455ad.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 01:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328248; x=1783933048; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9sX53wPV2F+rnCSZtAI/0tgdY7PnnmuU8OKyspcfCE=;
        b=jABjZTB/sov+K1c5rUIEf/OCz7OreIcU1iQwoLZHvm73xlNFtF/wrq8TaZIHi1+ceA
         F0UU3AQBsKwOVgCRtXfUr5t4zbPwwTCF19MOLd0bAFZ2dVhs5fTu4oWcufjE/Ly/flK1
         T9U2azJm35B6FvCGzIvhWIkdV7Xy+6G0+r880NLf9Dpub1SZ7xoLb/Q29UFQ8Y1g8sXe
         DhrJXepEsOhbMMxqcRdWZG1IWydIMimV/KvlblV73s6RmIvQo+e1xnAP5b6MSA5Z+VT7
         IomDwBBTXk7r1d7bKxNo9q4FRON/rvclajVCHZhoWUuE6wPGqrdFk7Mi7QvPvQdQ9QT3
         46Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328248; x=1783933048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J9sX53wPV2F+rnCSZtAI/0tgdY7PnnmuU8OKyspcfCE=;
        b=iIJEbNo1Lnm3v4Rz8n9uh1VhecNiY1Mu/ChPRMXBSggPp2/AR47ejdo1GhUf+U+FgT
         Ag8Ry6RfyZOODPvViK42wbhmSbJi6e4Dsq8dyfN4DpN+ns8AcbT0BXjeieVat7qHRKLM
         MoWb2stH3iwh7uIrVpB7oTdu/Ut2ixqHIN03JAtay2y/Qmpe6oZ7ry0fK2YiHWLkOQHm
         9bztZhsdhzFfZhDSa2NRJyaHKZ/75tqUvUbL3ef40rb7OXFisE8tyutJwkPEultWSjGq
         FfwpWqsmxeyTT/DnIKF2FCChsYWKnPdsn8ZzIaNO1gTtP770s2sbPrtFnhtybbsB9i58
         Pxsw==
X-Forwarded-Encrypted: i=1; AHgh+Rrtq0agMzr0XX+t5oNFaEJZu5EnG9PMgBYTwbOekEz2sSPwu4DB3zLx9thoSO8NzzXHrOk+pRY2hTOU@vger.kernel.org
X-Gm-Message-State: AOJu0YzUuxAY4cWAKoXO7v3jeVoBCHl/KMCnNYHDBV2Xl9YbVteuELz6
	4XNr7tPeLjsFf9Nn9Z/VFX+Q1LS9sQPOY4Mrw8avhafelK6HLBuxTvPXPiISosQprQ1UsGzmkcX
	QeA+e/SjUvnj4VlZAo8kherUTt1j77fLX/wLNQ1SBGndpykvseqpczy5gAXph0RM6
X-Gm-Gg: AfdE7ckaPZOYUUnZqgWghYrmEyoib5t/xuHsJi4quhQxFY7iW/GzJtCOOCThLgrAb01
	W02i5DrUo/m8elmHWiz/ckXtyZ6ofD4YTfdpDPwNafsPLzX6PU4ke5xBtIAtnoEgjH/tGeQZqJt
	0kD3I5tOxWTl01po3gIByZ7e5oDtdu/lVlLYEpoTHQvRL9gdcYF8VIMz9mBvCp5lk5wrW7020cf
	t3Yzn/0OIE4OB9amsf8Jo9x21sJpYOf+0+68+PJZ0GNkonIA2APx8cZNcw/C+BkPl5ouhkwhre+
	eq19DlpWrDTOitUNob/NE5COp3c/7ewcFvTyE7nhJqI0wZ3t6H95YUCyQTQddgmzBOEL8UERYtB
	8U6mutQ5jjg8KWEN2uQIiWFBSqV8zTu2qxqY=
X-Received: by 2002:a17:902:e78e:b0:2ca:e5c:7fba with SMTP id d9443c01a7336-2cbb9ee02a5mr104856975ad.39.1783328248455;
        Mon, 06 Jul 2026 01:57:28 -0700 (PDT)
X-Received: by 2002:a17:902:e78e:b0:2ca:e5c:7fba with SMTP id d9443c01a7336-2cbb9ee02a5mr104856655ad.39.1783328247997;
        Mon, 06 Jul 2026 01:57:27 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25f87sm46463665ad.3.2026.07.06.01.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:57:27 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:27:13 +0530
Subject: [PATCH 1/4] dt-bindings: clock: qcom: Add video clock controller
 on Nord SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-nord_videocc_camcc-v1-1-bae3be9e9770@oss.qualcomm.com>
References: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
In-Reply-To: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: Sw5Q0Ye6GfoFAUnKu_io4g5t8YRMfgdV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX91qwGIi1BHYo
 HS2UUVrzI/xhGeBStkg3iCYg0SxF6n9tywvefhO8jX82pDHOq5ADEuQkMqqI9Dt5/KrnPcob7ME
 AO5k0PEDLvRMRKmHzon+PD2ErVMR05U=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4b6df9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=RY-p5p5HfOYGDjfYP0cA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX3qqNIUKChlO8
 pXkeG1WodJxVrbI6+ktasFJWSJ7T36mgC56H+ccMKmYrxxa0L8PIyrOmlxYukiFhfsJLZMEiEkw
 5yM9HovGMiIzEKfQKzLZFaI83xoiw9QG4SXBj2LDWtC4a/Pomrf3EM4LThq/FPK+cQds3ZCO4Nf
 /wBpDTwyP6fF+31nQMtg9h8Cgc9M0clxsTJtwHs5x3fC65n6aATD+Abg1kiXkJ8Fvzs396InZhY
 PswOiXszvytGKD0dgB6FRsbh2DxUky7eNnFy7rp1cA0WX3VuG1WkBGRJdTTWIOr+fxyAdj8Iv+E
 UgQ0nwYE8D7xFLG1ouTG+Jki0q8WE9U/wauh5KxH7YWZTnX8Ga5cLolkrgcX0FSGY0Kfzuntu/l
 pjI+jal6z8BzWzXMgxRZ/hD/7QpWNmZBoq3sl/Je25NDQsIWNbcmsyATP08XnZjgI7k4hcujeig
 zIYSaiMlzoFkbI0Ym6g==
X-Proofpoint-ORIG-GUID: Sw5Q0Ye6GfoFAUnKu_io4g5t8YRMfgdV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060089

Add compatible string for Nord video clock controller and the bindings
for Nord Qualcomm SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  2 ++
 include/dt-bindings/clock/qcom,nord-videocc.h      | 40 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 5d77029bfaf8830e2bc0c3b8f323c818ee48dba2..9b9878e9b9cfc669e9b5f1c42a68e9e0c11eebd3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -17,6 +17,7 @@ description: |
   See also:
     include/dt-bindings/clock/qcom,glymur-videocc.h
     include/dt-bindings/clock/qcom,kaanapali-videocc.h
+    include/dt-bindings/clock/qcom,nord-videocc.h
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
     include/dt-bindings/clock/qcom,sm8750-videocc.h
@@ -27,6 +28,7 @@ properties:
     enum:
       - qcom,glymur-videocc
       - qcom,kaanapali-videocc
+      - qcom,nord-videocc
       - qcom,sm8450-videocc
       - qcom,sm8475-videocc
       - qcom,sm8550-videocc
diff --git a/include/dt-bindings/clock/qcom,nord-videocc.h b/include/dt-bindings/clock/qcom,nord-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..8d75460211099f3b2463c5c544ce3e85155c6466
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,nord-videocc.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_NORD_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_NORD_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK_SRC					0
+#define VIDEO_CC_MVS0_CLK					1
+#define VIDEO_CC_MVS0_CLK_SRC					2
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				3
+#define VIDEO_CC_MVS0_FREERUN_CLK				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0C_CLK					6
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS0C_FREERUN_CLK				8
+#define VIDEO_CC_MVS0C_SHIFT_CLK				9
+#define VIDEO_CC_MVS1_CLK					10
+#define VIDEO_CC_MVS1_DIV_CLK_SRC				11
+#define VIDEO_CC_MVS1_FREERUN_CLK				12
+#define VIDEO_CC_MVS1_SHIFT_CLK					13
+#define VIDEO_CC_PLL0						14
+#define VIDEO_CC_SLEEP_CLK_SRC					15
+#define VIDEO_CC_XO_CLK_SRC					16
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+#define VIDEO_CC_MVS1_GDSC					2
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_BCR					1
+#define VIDEO_CC_MVS0C_CLK_ARES					2
+#define VIDEO_CC_MVS0C_BCR					3
+#define VIDEO_CC_MVS1_BCR					4
+
+#endif

-- 
2.34.1

