Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEE53D9540
	for <devicetree@vger.kernel.org>; Sun,  6 Sep 2026 14:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704296; cv=none; b=DAtf1BzYfP9PhtCl5Rlyhyj10FwJdST76KX76hQRR6nfaHRMlN9eenLAJIKOCrW4XjXe4K9eNnZNDyFZsvKMcdslxZ0S1PhjTjEYRzpMEkzSFkZ2yV2RH+6WHdor6Zd+awEtDG4fZ1Rr3Yfh6ymAWxhRXhfyqgqRO/2Ku994o0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704296; c=relaxed/simple;
	bh=h9dNcrncu0/NjEPhCrtIOiIL0rUfOuMr6vWCW96P5f0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uPiK1x4rl8UnQ7GQqE+zgJTwlZ1wJ4FrMY7EYzmYv2rmSVbCQktt6P+oPrIrQ3DFAndCck46lgYMmhjpZpJHl29SEdIZvpQ4jtHP8ejvPrTZBAI+Y0Liesq8rfnkBfxeb7l7f5bYYPpT4CNZeeV/cf8ua/8kfIjRf9NsvkMKvHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p8Tc2ZwM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SlrLco2U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p8Tc2ZwM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SlrLco2U"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68600AGP3937909
	for <devicetree@vger.kernel.org>; Sun, 6 Sep 2026 14:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Pm2cJeuzScuUPaxVsb8U6gJJILNuDl9yi3L4vEyOCY=; b=p8Tc2ZwMKY3K9CPA
	ytswY4/fR15ypy5JIpwIemd+adDLBuo1xo/D1duNKm51syK3W43mioWOSgockrQo
	OA1kPVICBhti0yVxpnZDKpTlADzpF8SwCd3sK3VedyPm2oifWTIyJyY4bEoQF2TV
	pPQoMj9zNyAwWoR4hchK+cZemaeYBoQhCPXO++5VxgBYh5JAGtmafJgja+ulvxSs
	tsma8u5ezGojyALnBhEevxfdE/MCf9M5mWt9Cg6G+LpCipHGkYRqG+qrdHC29xSQ
	ypxgaYOVhq95XPwX2Tz7WSIiVVsU8dfGmqg3F6aZ7tAz8Fnd1KpvUdOhRzO8zkVr
	F1f8fA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggb5vbea5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 14:18:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db4e331406so5248255ad.0
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 07:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788704293; x=1789309093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Pm2cJeuzScuUPaxVsb8U6gJJILNuDl9yi3L4vEyOCY=;
        b=SlrLco2UUOobt3ombyTOWg3cjHU57Nkzftgs+ggWtrzOXGOmd4HUylIVOdaQYYB6pO
         ZzPmFclGVCUqOHKGHdESa8eivXNZwUfxeK5H7tFcjbAq7MaYTbNrC4q+UDOV6FN95xNm
         i1c7B6I4xV4IIBEjS3GIWSUsBVSaCSHzaagkRPupMTTdAeXB/d5M9ZzlSNhHXkbubD8x
         CfuHCqr89cL+8OOwxwxLLnqzlzSnWji1rz3M+CRQjj9lBuOGPmuTJxQFcTFgp/jcZe2x
         hqhbQll8A7BSbVLOVIiop/v37MiPWDg16G4ndFgXTlURVR1xKusattxAVqVwYjjG539V
         tx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704293; x=1789309093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Pm2cJeuzScuUPaxVsb8U6gJJILNuDl9yi3L4vEyOCY=;
        b=c8YTI7HLan6iKMDO2H8qYBhrqLs6wnp2fUAuL4yRSwid9gnOkpcJvUH9XphIwxMQHb
         m37hYMCNMGdTgckXIQv8SWfAARUgk6PwlkvmnZTtXkjOp7t6VcqceFRWY1dRWuTFd7E8
         SUmvc/FUv5THoMnXsom5gpjWYSSyt6jVAI2IhTUxU/qeqiQF3e90ig4aMLLUcotKB7Vi
         8myWWXAxeTODUNlFAUgLH1g5Vg4xAxaLy/3UhU5xEUjoFuUlMGCsxgWBpYzCjC6EPxDQ
         qbRpSxLGAmbouzt0BKH11TdQAUe5E1tQGv+D9MoVC55upWfDf8+3/LhoOpgPFzSGCUU5
         b+nA==
X-Forwarded-Encrypted: i=1; AKwUvBxlBY0DexvmvV2+2uXyZZ8xTIh3EdKQb1oh3q33G0yVnxRllNYB88itqZ/L1UxXMcmtVcuXh9zcSCo8@vger.kernel.org
X-Gm-Message-State: AFuF++n13uR7+9rFcNkYztvlCs0aSCKYU8ydfxEqxuNnXMHC4/alt1Op
	xGrUBvPsp+6GmWhhatXGnuWxpjs1XyBs+JZbWFFLiC5IqlZBuJaNZ5NvZ4LCJDaqTVXhzpESEV7
	9GNvz1rtTDRCHh/FStFXESJ7NPq2qniR/wP4I8GnDyQ8pBiY+tu9/mlC2sWlc0JEMz7nBr3WY5Z
	FQ+Q==
X-Gm-Gg: AYBFou3OAfcMUtn8xt7asTP+QQprvccSjZCCrMthXlt5wjqu12Duk4QlYLnzFKifrhR
	V8pwaou63k8/XzXTPSP6FPHraQbDIzc32D01CZSIKaQJxbRttzaW9ctFx/htKzQIr3AWEZ24PIw
	wO1QVJe/1ZY5EoAVw8CDH46EFjRgEhnw183H3m/PTxdZiYlGVqd92uz0uimuzhUjm0doT28HQfc
	z+krLzbnfqdz0ZbwFT2tYyLayb52NUjv/b7q/NEqf1v2WtyO4ISap29TIsXAO6s4DPZ3oDSAbQf
	TbqX0ApTzq5vgSh85O3yo/uIbzaGrrj9WDkUrjqbEVTZaOkQaeyuw8Rsv2aUqir1f2EdBCEWXen
	qjuCmh+6GTDHRVggPv5epHpl7QvbktBHGvR3iorMsxqo=
X-Received: by 2002:a17:90b:2e0c:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-39b26169b1fmr27094820a91.11.1788704293204;
        Sun, 06 Sep 2026 07:18:13 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0c:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-39b26169b1fmr27094753a91.11.1788704292675;
        Sun, 06 Sep 2026 07:18:12 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm17904550c88.3.2026.09.06.07.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:18:12 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 06 Sep 2026 07:18:08 -0700
Subject: [PATCH v4 02/12] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5210 SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-qcom_ipq5210_cmnpll-v4-2-aec5ed642f4f@oss.qualcomm.com>
References: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
In-Reply-To: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788704288; l=2363;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=h9dNcrncu0/NjEPhCrtIOiIL0rUfOuMr6vWCW96P5f0=;
 b=ciRFfTEAht2dzjibKDQf3BKd+zbTktbQOERpH+JzzvCspUsJao1b3oTqyPEZum8/pLG1JcauK
 AJDymo2vvNJA9KxTdWNyOJhHXLTM6k1HxvnSIAS7Jhmi0shYNBQMN9b
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: ttcVeeNzPrSlYrwAd4OfNo1Sz5TNxkMQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX1bWpvh3BVjQ7
 jS6ulcijfI90pOGX/EoT2vQfBEPBKGGigPoa3VSKze1TSEUkUmS179qXwGvEdHf2QLq9XVTGfCT
 reil5kBhuZh2QNDG7CQC2qbxStekDy8IKdOcLqtdwg4ht0rbJ21MeGwIl6nIsA5/4J9vwfRIG9Z
 Aav1J22VK9B5KJIKzEnKvCSqULpJp69MmCfdvts2SN5JuEIWxaNt7oEKnenErUXOzazhFZWFSHA
 mNue3YSwZhtTIAWRFjxLUOEl60WbZ3JNuQPK3iT+U7KDJb0Py+VSV4jRp2NALOjllRHbi6xiTfm
 MZg7W7u+xzCtdTQ3FeLPiJYSke6mDyqxxf/cYpQwinv/fPkcbgf2Kqz3f+QotqGM/Fq+h4g2hhK
 BVl9o1jsSMflHqyzNSfc9lowarAgqS47j/3WiOlYq+5RWqvpUL52HR6/OzPG7cr6qAjYVVUU/eB
 siIf0q67cEySr1y73GQ==
X-Authority-Analysis: v=2.4 cv=UO3t2ify c=1 sm=1 tr=0 ts=6a9d7626 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JRX5g_4sfBZTL3UlNIAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ttcVeeNzPrSlYrwAd4OfNo1Sz5TNxkMQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX8XEfnBh6LjbY
 E/sCBDGGgXRTQM9ZDd6HEfIKgFSYaRtDr5ILe12GV5khCba0ISC2nqRIY/hHhoARWhY4bgRnxbn
 3+Mfqv8NG+rrmgu1BoTSaIMWs2cvpEQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609060159

Add the compatible string for the IPQ5210 CMN PLL clock controller and
the dt-bindings clock ID header for IPQ5210.

The IPQ5210 CMN PLL supplies configurable clocks to the NSS (network
subsystem), PPE (packet process engine), and PON (passive optical
network) hardware blocks. It also supplies a raw EPHY output clock for
the integrated Ethernet PHY and several gated fixed-rate outputs to
Ethernet PHY and switch devices.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
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
index 000000000000..9201d1e1062c
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
+#define IPQ5210_PON_CLK			5
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

