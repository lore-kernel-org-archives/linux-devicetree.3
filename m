Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170D536DA07
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 05:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774934685; cv=none; b=cx+GumTjOr31jmVj7rc67+Qfzz5r3vwworpjIUYHUgoKyu07X1D9d+0GpIPBm4JBXjbg9Jl+0fALnspBBuyzgV80SBtj/2vZoSMM27mG8dZlROt3qxS+eKL0ATh3Y5m7WwV6k6Ie6HazNIv54D4jkrZu34F2Skfpso/+s0rdD8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774934685; c=relaxed/simple;
	bh=DHYJYO3wXSFgCC6+uxk8R1Ye3F0J1gMgx29yqTPfgGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NrdAvD2TAE/+IzxTMtB1sviV3rHt6NZ27IMjZbJfE6xNivPYC/8LE0imFkZ+BvcTfLq5wBcrdvZdj4+S6ejqbn1rqSE213tjH/9sstxd2A5ks77Pan0su+oFd7GrgJ6xKQiMY1mjwcvf/mz5+nlsrk2iESV4ycmdhbwSu7dcWks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A2Dw4oBT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FuugEoVt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A2Dw4oBT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FuugEoVt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UMfssl2391396
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 05:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+roEa3DW6pSM+Jf8c1kl1v5+8E01NVs1jJPOcGFCCEk=; b=A2Dw4oBT+nuUUzVZ
	g9g5GrQftKEf1LD9yEjFMGRrIsitcbBC2GcAqt/Fjhri1wTIiUvqGu7HjSsVnARA
	+hP+dSq1qM6ocKnue+1MT8Bd2/Lfb1QMMO3NmfdwgQDfpuuM7hkoX2b3lGJYNf70
	Rf5ny70S+ERfK32JUGP0xZf0skSJjmwChmyN+IKUDTC+dtRJ4vSgAwgz/7SZ6XFx
	uMJIJfmVmLsL33Km/vVrtmA30c5Bn0AHx80EJ/QLI3y77xPoKQlmNDbGHKhvzeoa
	LYbzY1A/Dtu6GE3NJjkOZy2GQBt54MgHvX5EtsLCf3ljtr7hLLDjE82Xhgy/HCkf
	nGXvbg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7ue7jsbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 05:24:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c714cb672so2992028b3a.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 22:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774934683; x=1775539483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+roEa3DW6pSM+Jf8c1kl1v5+8E01NVs1jJPOcGFCCEk=;
        b=FuugEoVt4Jd5RseQ+H20UpiSp8Y8O//Byl5sdI4TIoo/gI6IyJx8tomdyRK929Z8jZ
         bBiEDR06pOdLKaJPJq6u/mTncu48MurIUzyKnBRYOBUsr1xuc0pzspTnzfR1+9fitqwr
         sR3pCOCB2vkvXhnZYtTfyczNLpxhc2/lO7sLqeJivVjg3K9Av79wxvxaBgn3WBp5FdUd
         raqfzxNEaen/H2oqH/ce51eEZ02ZZV+CHht82B+v/ptK44+ahs21QQvFJuAlraPXpWWH
         JQQbcPZ4yoLxIgyNowI6H2CgP1lM/LSUHIeEFHjXfC0AfOzu2RlLWmDZKzGqFEfAczCK
         gZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774934683; x=1775539483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+roEa3DW6pSM+Jf8c1kl1v5+8E01NVs1jJPOcGFCCEk=;
        b=AFRBRzLdDFaFSxp/G1A4WCFWqSuOTEjo616HDQxgRqIykfWR5WhT6O3NCDnrjasG4b
         O4IrNTCtXEaXV83vJwehrwSypWU0taRnlDfd+RYu69SMvoWitFkiXW0soymtquqxcRrE
         fhlLu6o2J0LkITIu7e3kqCymc3TOicRsoEXDJAHcPuacL8elHDWhw0Rl248SsbxvoyE0
         TirC5NXjc/6ImcrkMh6iUDYwbujy5cneMriHl6gLgkeHcfWbWKYg1C1PbYoTqLhDBxrf
         gj5142Y9OcGveevk46V9GMH46x1omCMOQffw2Tlv7Wbb3xkDQsjWGKALwEU+TBoK5zTk
         81xw==
X-Forwarded-Encrypted: i=1; AJvYcCVg1XDdQTHKhM0Kv/Jplx3E7cWvwRf8qNGVfJOUBOayB29qg5VZ95Ezav8ck7uvMKSsa0ZZavBZ9ZsW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd60gHUedz4kHeAO/JY6ClzcYjutF2CdBDLt7AvQ28BbbOmpjz
	n9mIZGu7lF3dCUWDV9Q0EmS6GWlLs9/HHkj3TG1NwcKFVF5lownNPKBlZPGrTbZGq7vR4suE5OW
	7NRo71/1T5+5h4q1iAo1jamKkhpecp8bmAoMj9P8j8l6xR6SbMT1unTjk0ZK4V1te
X-Gm-Gg: ATEYQzxw9eA7F5R49lfaJQMb5YlNzsm6Xv/ZeKQ1kT9yqqKgMAIGSSGTcA0ONVGf6pN
	pFkVENDMZr7YGz6rayHuvks5FpkIGrMt4/lv4xmRxL6T1JBVZl18IWg/8RAirH8130NlPAleisQ
	0TiPriGOl7EFg5IP9HLJQbwV/KPgn9R2gWR1aBOOBYqgbYr7hrVXZ/HLrwWaEz8jzCWFzGs1/yH
	kpx4k3nfg7HNh83ND/HiRqP9dSusvnwiTs7f6M76iJCS7TM1ifBBGbx4aaxUsLJija38VvlOZbV
	pJsS81vdKLAQd3sSaeM+m5GbqI86YHuWomhhdon249zwzuMeIO3nmn/Dz1Q7tUbjxaTO7m4Hfey
	bMzz27eCZT8fGrWGsDHnaLyvPfIiyEsnPr2hz97l+q0VcSsVERW7A
X-Received: by 2002:a05:6a00:b4d:b0:82c:9266:624b with SMTP id d2e1a72fcca58-82c960a3472mr14695209b3a.47.1774934682728;
        Mon, 30 Mar 2026 22:24:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:b4d:b0:82c:9266:624b with SMTP id d2e1a72fcca58-82c960a3472mr14695171b3a.47.1774934682212;
        Mon, 30 Mar 2026 22:24:42 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843db09sm10270751b3a.7.2026.03.30.22.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:24:41 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:54:10 +0530
Subject: [PATCH v3 1/7] dt-bindings: clock: qcom: Add X1P42100 video clock
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-purwa-videocc-camcc-v3-1-6daca180a4b1@oss.qualcomm.com>
References: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
In-Reply-To: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA0OCBTYWx0ZWRfXzc/O34jIq2iJ
 8IPoI37+/MOgPSrRVFsO1ttD2C0hWLx2zBJ5fr3cLVhnGNEvikWC9SrY1cV0SL586h6+5EZ0zkJ
 QPq/VB7zTTxKKgVVLTsXGNYKX9nyfSfRkOQWn0PUuJVudbIL8v4zwAobslXyougHpMyogNRpIoz
 j5eEQqWcra8SOC4hboOExas/RQCLIrIR+Hjb33sVn6QR2f5Mm72SKdWs4Jk51LeF/TN+NOFEu6n
 0sNKkL/CJ77ccx94ZM+BI2gu66D8C2kWeC2t40jeOfNcr3rCKubS9D86jmJmkVFlmXt0rw9ghZm
 Ij9ANkujhGu8sTKtljmTV1LlBfT1TLcHr/3IiSdYgE9be8SbLuJYe8WB7slbO0xz4hcWh5Qnpi5
 NYa60PTzJVuthQNlqb5Q0KBMw4GR+l9nm/Qll1M9Mm2AioWBBtwtVVqoY8Hl9fmKEdEvUx7fMpg
 rC9jkNu0iGr8iSIFk0A==
X-Proofpoint-GUID: ZIh3ojJhq6jBD56uV9lbUauDjP4G7Co-
X-Authority-Analysis: v=2.4 cv=G7sR0tk5 c=1 sm=1 tr=0 ts=69cb5a9b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=E1hum5-uswxXays7BlUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: ZIh3ojJhq6jBD56uV9lbUauDjP4G7Co-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310048

Add device tree bindings for the video clock controller on Qualcomm
X1P42100 (Purwa) SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
 include/dt-bindings/clock/qcom,x1p42100-videocc.h  | 48 ++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 7bbf120d928cc506a4f7aaeaa1c24e5da760e450..5d77029bfaf8830e2bc0c3b8f323c818ee48dba2 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -20,6 +20,7 @@ description: |
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
     include/dt-bindings/clock/qcom,sm8750-videocc.h
+    include/dt-bindings/clock/qcom,x1p42100-videocc.h
 
 properties:
   compatible:
@@ -32,6 +33,7 @@ properties:
       - qcom,sm8650-videocc
       - qcom,sm8750-videocc
       - qcom,x1e80100-videocc
+      - qcom,x1p42100-videocc
 
   clocks:
     items:
@@ -70,6 +72,7 @@ allOf:
               - qcom,sm8450-videocc
               - qcom,sm8550-videocc
               - qcom,sm8750-videocc
+              - qcom,x1p42100-videocc
     then:
       required:
         - required-opps
diff --git a/include/dt-bindings/clock/qcom,x1p42100-videocc.h b/include/dt-bindings/clock/qcom,x1p42100-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..996408d1a0c32e175e5d4dd65c09bdc8dd47dacf
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,x1p42100-videocc.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_X1P42100_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_X1P42100_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_MVS0_CLK					0
+#define VIDEO_CC_MVS0_CLK_SRC					1
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				2
+#define VIDEO_CC_MVS0C_CLK					3
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS1_CLK					5
+#define VIDEO_CC_MVS1_CLK_SRC					6
+#define VIDEO_CC_MVS1_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS1C_CLK					8
+#define VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC				9
+#define VIDEO_CC_PLL0						10
+#define VIDEO_CC_PLL1						11
+#define VIDEO_CC_MVS0_SHIFT_CLK					12
+#define VIDEO_CC_MVS0C_SHIFT_CLK				13
+#define VIDEO_CC_MVS1_SHIFT_CLK					14
+#define VIDEO_CC_MVS1C_SHIFT_CLK				15
+#define VIDEO_CC_XO_CLK_SRC					16
+#define VIDEO_CC_MVS0_BSE_CLK					17
+#define VIDEO_CC_MVS0_BSE_CLK_SRC				18
+#define VIDEO_CC_MVS0_BSE_DIV4_DIV_CLK_SRC			19
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0C_GDSC					0
+#define VIDEO_CC_MVS0_GDSC					1
+#define VIDEO_CC_MVS1C_GDSC					2
+#define VIDEO_CC_MVS1_GDSC					3
+
+/* VIDEO_CC resets */
+#define CVP_VIDEO_CC_INTERFACE_BCR				0
+#define CVP_VIDEO_CC_MVS0_BCR					1
+#define CVP_VIDEO_CC_MVS0C_BCR					2
+#define CVP_VIDEO_CC_MVS1_BCR					3
+#define CVP_VIDEO_CC_MVS1C_BCR					4
+#define VIDEO_CC_MVS0C_CLK_ARES					5
+#define VIDEO_CC_MVS1C_CLK_ARES					6
+#define VIDEO_CC_XO_CLK_ARES					7
+#define VIDEO_CC_MVS0_BSE_BCR					8
+
+#endif

-- 
2.34.1

