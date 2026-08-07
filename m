Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E844503F5
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 06:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085604; cv=none; b=au6jfyk1Fwkns8QMeVwKPMmpr+t52n2AXXXUlmf0KuPWaai2+uPXaQwjKefZwrpnsd/qszo8aZVbT82sgy//oiI//9DzgRu7E5XOT36MYHtK0Vx0jy1oOMxZC3oX/InG1083AnZ2SYJQIiINl8EfhbVJ4e+HnJOH1XxNJsdXKnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085604; c=relaxed/simple;
	bh=OmaK7bW37P3eyItSwg18nRl9g7bQTw6jSi8315C8gbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DWwqfLhPQyfqtR7K19SAGOkPdMMX6UX0h/ACeWnUpUBLlebKYCYFrw66fFNEW7EsgLZlUAkS++ZvipxVln+zC23QCvbRGOXsA3AtjklqX7KxTnNIGTbyOqmGVHq8MF2wOH/uRoedlTA7Nw0WJbcAKB8YxmySTo1U3QGPGUpRrU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h0IrTyXY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FGj0LSLe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h0IrTyXY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FGj0LSLe"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770HBwG3478244
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 06:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYw5UkdMRwpjTZEowMSfHMuoGLq532YdN1bxt1k3YXQ=; b=h0IrTyXYv+o96Lqg
	wXeXSYNo+yDJFT0l2Z1bpbBiwWoKlgUKjcC8jfE4/KgStBvVFnW+/tYXQbjqIsIh
	jCVWi6EEp2maQMBfPpiWP/yE6DejTWZXA7jNyaUgolvbLn+4r4w6LHv37in0uXqF
	DAUG4A1/+Y8J02DQoBKJJ5KpUPxKeaY4wm1x9uPLqkaWL8epUKqsPNJrW6Qx+P//
	+N1ne/zI6U4mu1OIHV7BwKPX7g+p/xTI7EMB5K5OxDeyn4B4NFyq5stAgvoS06ys
	1oLNBDOdOb1hNRaMPLKMTy4oqcj9NyQ0hqwAHX4io3K8FtnFsTvJTVqmRJn+GSvi
	7koYSA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6hap3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 06:53:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so6654266a91.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 23:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786085600; x=1786690400; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HYw5UkdMRwpjTZEowMSfHMuoGLq532YdN1bxt1k3YXQ=;
        b=FGj0LSLeJ4PaDPh/dsa3WF8RKLsTVGWjcS/d/SRI1lwHSoLvGWJwYJPVicbcWlGZ2Z
         /vmhDom7Pwq80Bm8ZFOyqlEhcuIS0pfY96m/fWKAptYUDCQLIYgPFdaPa8uRIm+ItBGm
         6twVXVJVjlrIfQGwEF82VbnaX5pfe1oMqtp02x+w5jtGgmwnxQ0JzE7LgND3jpCyHr3x
         SP8eTMAja7v/CE0Nzb5HQrJxHzdSGv2cj5MHV3dJ2bzXYD6TbRkScaGTgXVkdLxzasPz
         UondeDl4E1tE41PV5cS6a7Xfy+udmDjUBV0L0AAeE4lHFhvOGH8XYQA9Sq27kdX4bbQb
         kcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085600; x=1786690400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HYw5UkdMRwpjTZEowMSfHMuoGLq532YdN1bxt1k3YXQ=;
        b=gKU8RjG2eAzFX/VXAetkz/SeCBMWaVmTolA9bUtdarkZ2AB2iIwltRC81S848alxHK
         dLFAzcDzQaf8hi8+DxviGwtdJA9AC+aLzMAkGVsL3nCyEKR0prhkqN5YiFwisaJb7bAn
         GBx2IyON10VVWuA8Vzt8IpYSupO6HMeobtsM2xq0657nLwDId96cEe4tAVtkbBicuzkq
         DqNnnrfR2O4GglzoaEYKi42rCKbZuJZiJz/eXCvTUffpUIOou3pNoFx9YlwzcJEDXP0m
         xq4xSjpw8rc/IfF1P566cPr5+XKXYriQ7/90ZrTHPV7XAd4nhb3xG2yT8zrs+z4v0Eme
         0WoA==
X-Forwarded-Encrypted: i=1; AHgh+RoDevSwek1cifX1OCBft3TcVsg1gIBYbiAFwwsJUKYe5rUyZZbNRqDtmvG3FU+qUkImNPrxhTEiIlzc@vger.kernel.org
X-Gm-Message-State: AOJu0YyJPMXkmHU5lzog4dTrGag7aDlZ/b1gUylG6nYb66Q3hhEEdxnJ
	GXn4MV6Gw6ogQL5H8knwa2NjgEjPQdXAHee/LAo8bT6TlJQZGyfv6pnRbJjQPYV59UPWnndjNyW
	H7KbWUl+bQVT8yBb0M9vuouamGzPrjE+o8DEgdP/ZPxgstgzYySG49s447WivC1hf
X-Gm-Gg: AR+sD13o0Ky8aUXO2aczqWekZFPh1ceci5HbVeZ1f1jXcQkZM4fPsj4JaYVeMW9R91L
	87inbSRupANOZ0uxcMJqakXgbuJzlrT9YjpnbYQ7eUahXGBYMFgLwK5yGxL8GTiRN4OWVGnRrEF
	x9cPy1o12A8OHKJ94hjUYvWMU8/58X5hn/sqdwl42dlkOyCVmIMgdcCZiSba1ou2eTzeLAIVV9d
	fRVtN79qspgmzxz1lS8IcUpZJ4oB0Ik1N4aI5h6GEvxdwn86X47MNyB35F3U/6aPDdaUyqRutHu
	cLyVJ7vmlRLbRuGG/5cRhYtANPiPZw5ABNxUKOIhAHsrkoMApRag38rZ/45kEkvbxumeKcm8Ojs
	TrZVN2fwrJyel/PQda2TxbcCyIHYpk53IvW8ZmJToZG8=
X-Received: by 2002:a05:6a20:9f09:b0:3b4:8f57:3205 with SMTP id adf61e73a8af0-3cbc04eb981mr2541223637.36.1786085600229;
        Thu, 06 Aug 2026 23:53:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:9f09:b0:3b4:8f57:3205 with SMTP id adf61e73a8af0-3cbc04eb981mr2541150637.36.1786085599577;
        Thu, 06 Aug 2026 23:53:19 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f19842bsm223493a12.4.2026.08.06.23.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:53:19 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 23:53:06 -0700
Subject: [PATCH v2 02/12] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5210 SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-qcom_ipq5210_cmnpll-v2-2-cce718b8ec17@oss.qualcomm.com>
References: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
In-Reply-To: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786085594; l=2318;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=OmaK7bW37P3eyItSwg18nRl9g7bQTw6jSi8315C8gbI=;
 b=yOoaek9BDb11MNV8USUdJLvsqlMZnxzTiKqvsO00m0m9rGb0cCjxByTIxHbYT+GMJGZd+DDhs
 +JFmoSMfphpDkOTNSVDG5K3IKV5/h3Zx0qsZRmta3UaJ8aQWjL5+zP7
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-GUID: llzRS7rjeKRbouD9IQgiSrhrUb47ACCh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfX6Ra/nhWh7Uqy
 CtQdbLkLCpLOrHyLwZhxmD+z7L7SdRysyT40uggKrZh/mnwXJjPshJMLiSghXeLhfI93WPMApqI
 Lu6ZTocGgajP5ARRLHHWOLVzrKGAMNU+n413eCPuqaxLX7rkj7MahkYrtJfiJJ3N4+UTdaXkzNk
 Od3AJ8+Xsz3KVH8Reyrej7v2Je/vxL1Uk5rtE29Zh5JWIeHhd6YFRKHFV8pMExRG0U44MXJQ0P2
 OcMH9Vm7Lhf7TknZFJm9HqP1uA2tSzhYX+jVSMWiXJl+3s3LVoALaikGHJbusahYuyexx9PWDAx
 vJ813o90viiacF1d9OeAF08TCK2vPxrqCQSs1kkrky78fV7dJH0cJekqTR0PZIDFyaYmzgUDWPn
 rlMbMq4OKPlQUwGq2uyKkggqR+Zx4Sh55gdoFdZ+1YpFhCnPowXDKnhrSLtuY//fSrFxNb2SKdD
 XDTLx4N31iK6U/a0Xpw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfX4dkC500q4t1P
 kOkmESawLDqE0qmVFHzC0qLZRuyJELaEQtSFj6Ou1gnefNd/LsY+2aAyZcjgC5et0GQJFsCHkja
 5dpJ0x3H9t66lNtR7UkIMnQoFtfVzM4=
X-Proofpoint-ORIG-GUID: llzRS7rjeKRbouD9IQgiSrhrUb47ACCh
X-Authority-Analysis: v=2.4 cv=MbpcfZ/f c=1 sm=1 tr=0 ts=6a7580e1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=JRX5g_4sfBZTL3UlNIAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070050

Add the compatible string for the IPQ5210 CMN PLL clock controller and
the dt-bindings clock ID header for IPQ5210.

The IPQ5210 CMN PLL supplies configurable clocks to the NSS (network
subsystem), PPE (packet process engine), and PON (passive optical
network) hardware blocks. It also supplies a raw EPHY output clock for
the integrated Ethernet PHY and several gated fixed-rate outputs to
Ethernet PHY and switch devices.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |  1 +
 include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h   | 30 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
index a4f9af8fa187..91e17f126a9b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
@@ -25,6 +25,7 @@ properties:
   compatible:
     enum:
       - qcom,ipq5018-cmn-pll
+      - qcom,ipq5210-cmn-pll
       - qcom,ipq5332-cmn-pll
       - qcom,ipq5424-cmn-pll
       - qcom,ipq6018-cmn-pll
diff --git a/include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h b/include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h
new file mode 100644
index 000000000000..191589fd5311
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,ipq5210-cmn-pll.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_IPQ5210_CMN_PLL_H
+#define _DT_BINDINGS_CLK_QCOM_IPQ5210_CMN_PLL_H
+
+/* Parent clock */
+#define IPQ5210_CMN_PLL_CLK		0
+
+/* Fixed-rate clocks */
+#define IPQ5210_XO_24MHZ_CLK		1
+#define IPQ5210_SLEEP_32KHZ_CLK		2
+
+/* Configurable divider clocks */
+#define IPQ5210_NSS_CLK			3
+#define IPQ5210_PPE_CLK			4
+#define IPQ5210_PON_REFCLK		5
+#define IPQ5210_EPHY_RAW_CLK		6
+
+/* Gate clocks */
+#define IPQ5210_PCS_31P25MHZ_CLK	7
+#define IPQ5210_ETH0_50MHZ_CLK		8
+#define IPQ5210_ETH1_50MHZ_CLK		9
+#define IPQ5210_ETH2_50MHZ_CLK		10
+#define IPQ5210_EPHY_50MHZ_CLK		11
+#define IPQ5210_ETH_25MHZ_CLK		12
+
+#endif

-- 
2.43.0

