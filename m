Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAEC3D0935
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782212075; cv=none; b=RYYyI9287M1+hpZxn750Yydd1J+FygfsMGo6quQ+K0KO5zkP/bASGLt9q2zr2zW6eLU7v8bFBF5CiUhSaB/ROcW41RyLy9LJpEXkalrdGIJ/f8PVDqpPAFchO8lZxakDci+yTOvZRIPgjKYdAgEv0x8d1eHgsaQoETNuUosFDV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782212075; c=relaxed/simple;
	bh=Rn9sgAThp5DUmMMN/w1JBkfowQefte+nsWTY8bQEa3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m1avvAPzP7fKRhRI6LHoQD+wRhWz3p2ik3DbUteq0BA+s3FyDLjOOhbxdlZS/L+4WQyBcTUAWiH28sSp99pCs9ggXXM8qi4WerY3f1JsDAtEWK9cCFtB5NMahqO2tm7Bpmwy4CKOegzAezGPdsLZXHFjiZcTRmDdkccmTgX0avI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekWCq1J9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CSZEtP9j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ekWCq1J9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CSZEtP9j"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsWgI3925784
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cxxT/aWeuOsA/juQ4AWiZnlanZ8STtVeglZWKtx7aJo=; b=ekWCq1J9fBvvaiwA
	lyUUb3C45scnzWLtyFOVDXHr4mNGW6N+DhQp91KCfOq5+E5fwkyfjArUbHNpi3d6
	/LlfDmq/9SIaFWacIl0tGrof+uxY//PdXVsXu8dnZAbgCGfS1neUHjNnx704X0rO
	/048pS7YeYbngqI3EOwT5BE8LLBconbH3P2K9nzuv9Sh/kP918hvLfQQWUI+OTf8
	V9Mjo+lfxuVAk2OuB+WVXayz8NW/2rMj4RwwH2+OonFvYy5JTPZqpOYro+xD9Pnl
	B7q4gkOjxJkGWkds7iUsmqDGMnJZIDqNoP4CVgf6uW41+GjZL9qdFPc9ocMKxeak
	ZAsOtg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjhxva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 10:54:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0b1bb53a8so4944605ad.0
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 03:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782212070; x=1782816870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxxT/aWeuOsA/juQ4AWiZnlanZ8STtVeglZWKtx7aJo=;
        b=CSZEtP9jrlbKgKNnUH4CfTcg6Oof2Z6hFDk9O7nK+9bZ1w2ElPEnS68dgFcY/XOWra
         UucJV1VKq14HLN1bcDjdGyZ8wZf9Lnhvo2BBCZXOjl0vtcweXtWV8yja+erPaAri8x4A
         EZCNDq/b9WHjEGJ717RHuEUJ2X3wwyflNHzLFn35+37eo1ezVdy3v8KfdawVILA2SxEP
         famxMTtUEX6Tv1wIy2RsyHSaaMQ5SyJc6GjgU8ZdNhf2gI2Udne1eqwGVytc0cVF3bPo
         eHW0mX1TpSlc21ltibJQgbSoHxSKrQ7IxF+1KUt6N0ijtpDEYfxrMqBFUEGx8/99xYzB
         kMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212070; x=1782816870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cxxT/aWeuOsA/juQ4AWiZnlanZ8STtVeglZWKtx7aJo=;
        b=p7I3Zc+QVtqwQXG7xSffdNoZEDck5DYcoP4TmYw3thDATXDAqVHYAD36Fzfw/JMHgf
         NPuwPtqr5A77CU/xLl9TBfjtoiELQ+TtsJPkoKs+GAIiDlDjG2nQUmP+TsK07wr0bh4q
         kERW+c7bgtaKAOIFF4RdWo7kU7c7wj4Gzk3Jpg0DyYK2oGr91rrfq1kp7w/YilE3iDB8
         OWansLtff/CpRw4PY5Q6ndwMJnYdjjBEYOe8Gt8CVKhmZxhd3Q1HWMX7XHwmJ9om/ZmC
         tDdhsS/14dVrYDw4Y7WqkaCRrExTubUH5qDsEErg+QlL7ZRjzs9mhNJwuB23Zq8Dh/aV
         hStQ==
X-Forwarded-Encrypted: i=1; AHgh+RqITGxnBg6+g/4+vo4p4d1iQ39bwklRVvDMunrn1ifO8d39dfvzIAhz6QPBKLdxTsJAZqvNLx83zwVf@vger.kernel.org
X-Gm-Message-State: AOJu0YylM+YBI93tfQHerHqrxw5raVcTMc4aO4CivVn0Uokay+xIKRKt
	EwW41ba9VGDx8BbEKLLIsTGP/8YF3syXxMu5G83rOSGCdv1n2CgxQ+6fmwvEetvmM14nYHAZws+
	c5M2ebji3r/HAl2X+2U5gvXNaeMvIylgFUSDN2fbKi3Uc++u7kuyuHHqF5qilkzp1
X-Gm-Gg: AfdE7clgTVUiOQdsBTLqKr4PUbKI7lt0gj4Yhn3H73VndpfV7QOrVFkOZ+Vj1n1J/jG
	H7Ez2m68sSm8t13FqHvs+VTC78HbO3MWRBXtyEHja3Kc04BnORpEApuIQ9nPPXmm1Cl2R2g3gJK
	MUis4RNulq/XjXOiXF6pQO+mTEuyMC5kWmYrLX1plaDEoyuRLb2LsGOD9TXsgN+XGQdmV9suEu0
	vo9EeMaLUFQhG8i0gtreyaPkAxxknzd+/broVPLeEqedkjZsGQ5fkx2ugkfaCVfMAJDRXW5YnzI
	WG07j8Qu9/N14sqWbB9DBxo2vyS2ZyBcN+8M/68Ez3R7MNOWelZdER7gHUCtsJ1j/78Wiz1nyAh
	CMEbQICiWNiyQp3vmJYtTay5hNs+K1KebTAs=
X-Received: by 2002:a17:903:228a:b0:2c6:829b:b0c2 with SMTP id d9443c01a7336-2c7c3e8f497mr23452155ad.11.1782212069882;
        Tue, 23 Jun 2026 03:54:29 -0700 (PDT)
X-Received: by 2002:a17:903:228a:b0:2c6:829b:b0c2 with SMTP id d9443c01a7336-2c7c3e8f497mr23451945ad.11.1782212069395;
        Tue, 23 Jun 2026 03:54:29 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7437002aesm105788365ad.37.2026.06.23.03.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:54:28 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 16:24:06 +0530
Subject: [PATCH 3/6] dt-bindings: clock: qcom: Document Nord display clock
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-nords_mm_v1-v1-3-860c84539804@oss.qualcomm.com>
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
In-Reply-To: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX3Px1Hx9qBA0B
 mgA2YF95OjRT4uAnIyNnvYGlB4IqU/DnSDWDKJ7JHAQAGflNkpneDev0ZT+QLR197QEv/gJrxKF
 Ixjj4M8diC/65PCNcTBFbS22gNqKwaqFSYC6+wHyFUCpS7DgFCD9UsyJpBOdqElR0hsO0uKpWuP
 upqhKMxM8TbJK2NdmBrnnMXhMQqgros6oqg6SAL6v7ZRUZFENDsNKjQ+f37xXybTvmC8InhfvSx
 FQa3D5IYMUMkTDCGXbA5BHx2UoRD0CTqWs0j4vDxJGMdWjx+Ir2ThIaMsXiJ4UZPiDLxj57LHj8
 KiF92GsFN3fDNRSS7LbOdkLFDWIc+ehPsT7S3w0t9dfyj2RqPl3P4fO5I0s0QieDrzTWWcGLY8S
 bPikgf+Aicsh7lxC7LcYqN4AhrghLgZfr11qlfGfkVdHA/YnENaFdpPdaZgWrVVS1hMhfu4xBSk
 E/7FswxdixKAu5byQHg==
X-Proofpoint-GUID: 8H4V1igPyOb-UbYlTrdenSesUW-vKOlR
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a65e9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=EEkIxoOJKZrbPHcHuzUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX2LCK6HFlEEnK
 b6hZ2IzecJXDfL3+5OOIyVLRcD8apSYBgYBQTqne54znUAUvCrZhHlnxH74xhA/tz5VF+lBcQeR
 c1EBaz+W+atUC/RiF8JOvjporhvRdj4=
X-Proofpoint-ORIG-GUID: 8H4V1igPyOb-UbYlTrdenSesUW-vKOlR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230089

Add Device Tree binding documentation for the display clock controller
on the Qualcomm Nord SoC.

The Nord platform contains two instances of the display clock controller,
DISPCC_0 and DISPCC_1. Update the bindings to include compatible strings
for both instances.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |   3 +
 include/dt-bindings/clock/qcom,nord-dispcc.h       | 115 +++++++++++++++++++++
 2 files changed, 118 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
index 591ce91b8d54dd6f78a66d029882bcd94b53beda..61f58fbd5bd21c7f36081e7ae066176fd19a5811 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
@@ -16,6 +16,7 @@ description: |
 
   See also:
   - include/dt-bindings/clock/qcom,kaanapali-dispcc.h
+  - include/dt-bindings/clock/qcom,nord-dispcc.h
   - include/dt-bindings/clock/qcom,sm8550-dispcc.h
   - include/dt-bindings/clock/qcom,sm8650-dispcc.h
   - include/dt-bindings/clock/qcom,sm8750-dispcc.h
@@ -25,6 +26,8 @@ properties:
   compatible:
     enum:
       - qcom,kaanapali-dispcc
+      - qcom,nord-dispcc0
+      - qcom,nord-dispcc1
       - qcom,sar2130p-dispcc
       - qcom,sm8550-dispcc
       - qcom,sm8650-dispcc
diff --git a/include/dt-bindings/clock/qcom,nord-dispcc.h b/include/dt-bindings/clock/qcom,nord-dispcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..9f6c9979e0f358678f28a992af6083b0ae6c97e1
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,nord-dispcc.h
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_NORD_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_NORD_H
+
+/* DISP_CC_0 clocks */
+#define MDSS_DISP_CC_ACMU_CLK					0
+#define MDSS_DISP_CC_MDSS_ACCU_SHIFT_CLK			1
+#define MDSS_DISP_CC_MDSS_AHB1_CLK				2
+#define MDSS_DISP_CC_MDSS_AHB_CLK				3
+#define MDSS_DISP_CC_MDSS_AHB_CLK_SRC				4
+#define MDSS_DISP_CC_MDSS_BYTE0_CLK				5
+#define MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC				6
+#define MDSS_DISP_CC_MDSS_BYTE0_DIV_CLK_SRC			7
+#define MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK			8
+#define MDSS_DISP_CC_MDSS_BYTE1_CLK				9
+#define MDSS_DISP_CC_MDSS_BYTE1_CLK_SRC				10
+#define MDSS_DISP_CC_MDSS_BYTE1_DIV_CLK_SRC			11
+#define MDSS_DISP_CC_MDSS_BYTE1_INTF_CLK			12
+#define MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK				13
+#define MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK_SRC			14
+#define MDSS_DISP_CC_MDSS_DPTX0_CRYPTO_CLK			15
+#define MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK			16
+#define MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC			17
+#define MDSS_DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC		18
+#define MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK			19
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK			20
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC			21
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK			22
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC			23
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK			24
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC			25
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK			26
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC			27
+#define MDSS_DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK	28
+#define MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK				29
+#define MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK_SRC			30
+#define MDSS_DISP_CC_MDSS_DPTX1_CRYPTO_CLK			31
+#define MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK			32
+#define MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC			33
+#define MDSS_DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC		34
+#define MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK			35
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK			36
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC			37
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK			38
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC			39
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL2_CLK			40
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL2_CLK_SRC			41
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL3_CLK			42
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL3_CLK_SRC			43
+#define MDSS_DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK	44
+#define MDSS_DISP_CC_MDSS_DPTX2_AUX_CLK				45
+#define MDSS_DISP_CC_MDSS_DPTX2_AUX_CLK_SRC			46
+#define MDSS_DISP_CC_MDSS_DPTX2_CRYPTO_CLK			47
+#define MDSS_DISP_CC_MDSS_DPTX2_LINK_CLK			48
+#define MDSS_DISP_CC_MDSS_DPTX2_LINK_CLK_SRC			49
+#define MDSS_DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC		50
+#define MDSS_DISP_CC_MDSS_DPTX2_LINK_INTF_CLK			51
+#define MDSS_DISP_CC_MDSS_DPTX2_PIXEL0_CLK			52
+#define MDSS_DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC			53
+#define MDSS_DISP_CC_MDSS_DPTX2_PIXEL1_CLK			54
+#define MDSS_DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC			55
+#define MDSS_DISP_CC_MDSS_DPTX3_AUX_CLK				56
+#define MDSS_DISP_CC_MDSS_DPTX3_AUX_CLK_SRC			57
+#define MDSS_DISP_CC_MDSS_DPTX3_CRYPTO_CLK			58
+#define MDSS_DISP_CC_MDSS_DPTX3_LINK_CLK			59
+#define MDSS_DISP_CC_MDSS_DPTX3_LINK_CLK_SRC			60
+#define MDSS_DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC		61
+#define MDSS_DISP_CC_MDSS_DPTX3_LINK_INTF_CLK			62
+#define MDSS_DISP_CC_MDSS_DPTX3_PIXEL0_CLK			63
+#define MDSS_DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC			64
+#define MDSS_DISP_CC_MDSS_ESC0_CLK				65
+#define MDSS_DISP_CC_MDSS_ESC0_CLK_SRC				66
+#define MDSS_DISP_CC_MDSS_ESC1_CLK				67
+#define MDSS_DISP_CC_MDSS_ESC1_CLK_SRC				68
+#define MDSS_DISP_CC_MDSS_MDP1_CLK				69
+#define MDSS_DISP_CC_MDSS_MDP_CLK				70
+#define MDSS_DISP_CC_MDSS_MDP_CLK_SRC				71
+#define MDSS_DISP_CC_MDSS_MDP_LUT1_CLK				72
+#define MDSS_DISP_CC_MDSS_MDP_LUT_CLK				73
+#define MDSS_DISP_CC_MDSS_NON_GDSC_AHB_CLK			74
+#define MDSS_DISP_CC_MDSS_PCLK0_CLK				75
+#define MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC				76
+#define MDSS_DISP_CC_MDSS_PCLK1_CLK				77
+#define MDSS_DISP_CC_MDSS_PCLK1_CLK_SRC				78
+#define MDSS_DISP_CC_MDSS_PCLK2_CLK				79
+#define MDSS_DISP_CC_MDSS_PCLK2_CLK_SRC				80
+#define MDSS_DISP_CC_MDSS_RSCC_AHB_CLK				81
+#define MDSS_DISP_CC_MDSS_RSCC_VSYNC_CLK			82
+#define MDSS_DISP_CC_MDSS_VSYNC1_CLK				83
+#define MDSS_DISP_CC_MDSS_VSYNC_CLK				84
+#define MDSS_DISP_CC_MDSS_VSYNC_CLK_SRC				85
+#define MDSS_DISP_CC_PLL0					86
+#define MDSS_DISP_CC_PLL1					87
+#define MDSS_DISP_CC_PLL2					88
+#define MDSS_DISP_CC_PLL3					89
+#define MDSS_DISP_CC_SLEEP_CLK					90
+#define MDSS_DISP_CC_SLEEP_CLK_SRC				91
+#define MDSS_DISP_CC_SM_DIV_CLK_SRC				92
+#define MDSS_DISP_CC_XO_CLK					93
+#define MDSS_DISP_CC_XO_CLK_SRC					94
+
+/* DISP_CC_0 power domains */
+#define MDSS_DISP_CC_MDSS_CORE_GDSC				0
+#define MDSS_DISP_CC_MDSS_CORE_INT2_GDSC			1
+
+/* DISP_CC_0 resets */
+#define MDSS_DISP_CC_MDSS_CORE_BCR				0
+#define MDSS_DISP_CC_MDSS_CORE_INT2_BCR				1
+#define MDSS_DISP_CC_MDSS_RSCC_BCR				2
+
+#endif

-- 
2.34.1

