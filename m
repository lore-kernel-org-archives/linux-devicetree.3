Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA9C26159E
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 05:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778132338; cv=none; b=CwqDZ6KBcAnAZO6pFGsFbgEaGGHQ77al/g4bAdmylK/it+wcLRfAc4XoIZD0SDCHKeeWheptN6RaxBAPItu03boG4Kc7FR32zQ0BofYgjzSNvfChY79u01F2jzoo1dTVWNET948nxM15dEuktlyoj6MYNBtxCXcOetkH4L5xjvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778132338; c=relaxed/simple;
	bh=9LVPDuJ+bbF3M//gO5UB8E/RBRqneTorEHz9vTPLB4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JZ/cI5o57DOlAFaF663ujZnClL5ZgtLsFvd96QZVMr3SyEcTAKCTpFQ8vN+cIWwro0Umz15OVSWKMwe6kr4mJjYtzBw5j/L2DyP4tCce6ltyxTmecVQHfdF93VrafjPZzko2GnWLz7W2X8urcwEcwdr1SlVaropydDzH+41PpAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7bThpzr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTdhyLUE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7bThpzr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KTdhyLUE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64745qIK879602
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 05:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N9J8Lr6E9bbD9B+p607x4/uZxrVa1/FpLHxMJTguA8Y=; b=M7bThpzr2dUJHR2u
	evBoRBs1LEvaMcJ39WkViK9ejYhhYF1hykWaGLD/SqvzBZslELNlPoOZ4UZ8uq/e
	DcVkNapLTQut3jX+xYtBui4mFsZccZLwUCpwe10gI1A/WKomywT1e8QubkdbeBBA
	hBTY9Wf/10QrhVVMK5bJaVCASv3SmPIcvIghyNwBgAaZyc19Up0CMUGWyh6zOsxc
	BHF7WObH6NQDnHjVILG7+qtUQyLxmislIvPJqq9pNgPKUIuZc/rnRPJ2joh8CxsG
	y2KTdfxI1o0UJO9Ge244a1kkWQ/l8nvyfWmAdc50KtgAKge7XbfqmMSxpPK+W8xJ
	X462sg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq08fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 05:38:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-836d0184333so442619b3a.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 22:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778132334; x=1778737134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N9J8Lr6E9bbD9B+p607x4/uZxrVa1/FpLHxMJTguA8Y=;
        b=KTdhyLUEqSXVbdq8dWn5DQXLPi9QkgdGs16lu7B4RV0iHGfrS3f7jga5baMbTOOw2u
         4S+K2xYoVoC9PXEos1XTT1nZSL3oReEVP1btE3aZL8OQmISOn/7z0yeG7RxjHLBlFant
         lQuUG412hxQZAJwiOLtsYqdYHprbwKBRQdnZE4riPotqUXGHvfdlvSfrqss2lEgjpbBL
         f34oIaU/VGh8zOvDrkolAz5lECInpiSnVSxGe6URetDiH4xYlS9arDBc0h/WYdmt38Hu
         NPH92FZUl+XC6LcA3MgmlkauLkeDsxiShhX8zHLOG1Et/efO2aCB3+UgNDJIO9f7/9q5
         OYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778132334; x=1778737134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N9J8Lr6E9bbD9B+p607x4/uZxrVa1/FpLHxMJTguA8Y=;
        b=hOQxTSuO8HxyQtqRNh+jCQdCO+5bIXf8yOFgMKjbOnpstOhLUyzgwZg1XMza1inEb5
         XCDfE9njxfoZdnYn7b5/Ax2WFWfmqQxSk4TAUcl2sCE6UxXVuP2oY1N4o8RrR7XNzFy1
         wm4b+h0JWq+kGd6jnEEpkG4OZEnw83Z+mDk994z1eljNctRWAsU5x2UvQ/li3bvIS2/f
         u9ZaJv8oKVC3SpXTMvuwtXpES5YXnDrVQ0m7Je42OlUJp/XLgxqWvO65k1Okaq7n8nus
         TONqWR+W3EE4RXbshDIl8xyICcThCG6WIhNL7oSRIeA4XPYjY5Hm/HopbYgWY20/D+8R
         ONsw==
X-Forwarded-Encrypted: i=1; AFNElJ8SEvqM/4D/SJeDlo1cTvYzEwdaOHItB9OuJAVcTPDsPsj7+WpZ1cf8dPLRkGUsh+exJsbPffhSHIsO@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ7HXtpBuynZMrbw4+P9Q+TZt3zxsIZamlx6LjKgBxuaIWfD7Q
	/eHxFwfrncY3enX6mhnmm65OT67ZATVnyhS2KWNlIAy1+hqaRKLjJn0CZ6yxtV6COwpxBDRjBg6
	a0uiVFauN/+Umav7ZlAtv8BMbkyXweKYmzMQ2jdyGt/wztYauh6j2anYWLzowEbQ/
X-Gm-Gg: AeBDies+/isoJZNi0zitnZZoWkV8iypP28Y+BVSi2NTRJF7ngoKI/L3TYemIjLus3e9
	NOsacO7rEMjVXfMFdfVV2LSXj/yXg426MJDU6vp4A6L30vCC3CwB9Gqv709Ytwu1tpZosPPBhpx
	hBgYi65RemyqbhUo1bx43Z9ZElTzRliuQ288geJW3bs+0AXjUeicddhzEAmqwYZEu3Mhc3yOlfy
	+uVdrF2+q9g9ivEDeVRbjCXyJQUfPVJvSb0g1wQx9zMtLIUG+NlwkjCe/RXyXrPdlVOP5fT4j+8
	PEKCCbFCHFmOBpkeGa9pX87RWBPESgEcD132zTAvsPsZj3Ri9KYTKySIetCGoVmybisBm5azkOX
	Chiu62pTIkanS4+Mzo0f/6Fv2EPy3/SlKYOd/QT5imYNbveD6z9o0Ktv8gMMQikc=
X-Received: by 2002:a05:6a00:4148:b0:835:3f51:7305 with SMTP id d2e1a72fcca58-83a5bfbfa17mr6533748b3a.15.1778132334328;
        Wed, 06 May 2026 22:38:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:4148:b0:835:3f51:7305 with SMTP id d2e1a72fcca58-83a5bfbfa17mr6533686b3a.15.1778132333571;
        Wed, 06 May 2026 22:38:53 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563ac51sm7389962b3a.2.2026.05.06.22.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 22:38:53 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 07 May 2026 11:08:26 +0530
Subject: [PATCH v5 1/6] dt-bindings: clock: qcom: Add X1P42100 video clock
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-purwa-videocc-camcc-v5-1-fc3af4130282@oss.qualcomm.com>
References: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
In-Reply-To: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc256f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=F2P3E8UZIP7xQym9adoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: SAf271PgOaODG4MiVCAyWe6Vj20IJmTC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA1MiBTYWx0ZWRfX4IYxrlbKvymU
 HtzVTt/B0BdKXayYBcPbPR1rrZ8koQhedxrqCI4ohOp1qhY0pollVaeNKMZZDq4nVEmxsejI1c5
 QTOnd4N2kENGrHOg68FibVUBW/cpk9cDKT6ia8bhl3PtPzsBfsg29EfKYZXTMZPBmtQM4SrhIJu
 hHGs3EAXh64ltw9AIX5FYDCvp2CHpy3d++cW9vRP+XigEWfUgdDyN4cAFpyAseQpiYG4H/jMxpi
 yunPc22225CDaNTJEwDdI06c8c04LmoVbHU1Ekjf7aH8tAaXq4/zPaMuZTdiQTaIlSYKsDo5Q+a
 xkmtta16ChX2r0RwdTxEuFk7L0bRS3j6YVjb4M6io08ejkznDcjg9jU2dqQgbll6M7a0OhPgF2Y
 XB5/mkP+p5d9dklDz0r/3BEUESIrXg3esxqrTnmF+ObHsywXIa8b3ao1TEoO67WkkJof+29fA7q
 /MlWKqSjG/MIuLGtqoA==
X-Proofpoint-GUID: SAf271PgOaODG4MiVCAyWe6Vj20IJmTC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070052

Add device tree bindings for the video clock controller on Qualcomm
X1P42100 (Purwa) SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

