Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09F83E173D
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786711705; cv=none; b=QoEnhjCYXPCxIqd+88OhgzEcfDBDjAMCx+e62/HEAVTG7jhQOWupPE4lRtvobqTMpeqVoTIbv4KrTleSQI0ASxQB9GU9dvyVDQHuxQwSGqN5UXaa8z7PmWMWrhf2xtfFM7ADwlpiPMqzd+yok4Mh5qW4Q7T48HYLWK9l7wbSVQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786711705; c=relaxed/simple;
	bh=h9dNcrncu0/NjEPhCrtIOiIL0rUfOuMr6vWCW96P5f0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RwfkkFTIImqh+Y0KqUUJuBY4/8A1Q+L/bQItrj2K9HivirYj5R1rEKsUH/Qyx5GqmWjgQQ7ywCd/MEEv6WlbGxynHOF0JYmagFVgjgp9/y8c5s8kn313EG1K2H2QlTFGvluz6A8AqeU9HqHMf5Vb/zu1jQJUIlFGaVZB+T/W5rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WqukrSoy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HRpQvvGu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WqukrSoy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HRpQvvGu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EAbIvI1804048
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Pm2cJeuzScuUPaxVsb8U6gJJILNuDl9yi3L4vEyOCY=; b=WqukrSoyEDr7dPrm
	5zdXn4nYuhLuxfMN0yilXH68k/S5FaPaPfTV2ixOsdEXJ0ECWaPcc0a6wN6oKl5l
	+v2gViMw7i4DqxnmRvclD6+nsKUnMjymKjLMasjqKEbwhleqBjI1Y1CQ2aQbWq7w
	NHqDKL4IGX/GOsvFH+xPUqyN2GyIGVaeC7/ldHUn0dIA6iWlpDlZwcOgESiuml+X
	C4wwKuknsARgEu60+LFS82+mmY0c5kG5f+MAR/CdE718BdPUeD8N196y9sTPk+Pt
	Zid/50MbarBULNW2smVzpW77JjU7JJ1JwfUNppntqR9sExglL8QURqdT1tdHZiOL
	EdLN4A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1pea30rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:48:18 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e3d575d6eso1368714b3a.3
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 05:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786711698; x=1787316498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Pm2cJeuzScuUPaxVsb8U6gJJILNuDl9yi3L4vEyOCY=;
        b=HRpQvvGuRsHQIJvsWt9xlqnSJJVZR94wt2ozIFJSGipndAJ5+puPy+oNf5gD6MxUVj
         lS/+TNvmW6zXygUmKRPKDriAJYizW63Pm0bAvuQAy4RJgrp+yuwMUBdicAxReDuVY5RB
         EdTkShD3p+RymrmTFYBVXAw1E3mC4Przq+wF+3IDfwtpB0HQKcb4hKmLiSIu1PQJyXO2
         qsk7neliK5SLioCwFrhDZ9tGMi723jihYMqdTMn+0Jb6zX8KAXZJPIRSSr7MAB1NiEcV
         v0AOrPnKASLxiI2mu6A7PjVZLT9T6KIQG4b79ImjZID3me8EGI1pdPcEMeAvC01Dhtd+
         FzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711698; x=1787316498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Pm2cJeuzScuUPaxVsb8U6gJJILNuDl9yi3L4vEyOCY=;
        b=mJQ4DjxSNnIOgDL3SCn0kihKlRXGaLF8QA3pQA6LPtEfbUjZX3ku2X2UjX4n2CmHE4
         3/4nX+tHXgm0HE9En70krdfwLH0MQ6mphMC788ES3qxytaZXMUg2DXvP6pqGQ6+Iyaog
         3W5AF7pm35FLMNlLNvWTLky1koWzGU/BAZ3MnpmQOgJx9kFUwwECYNvYFsK3rNhKy87w
         PrONSSiWf1mtQBtuACm49iWShddyNlfeTnuBF3NlIrqnkOgIAo6DgDFrRihlN3+4vDN1
         TBXo+l8mfzIoLy51zgBjnGPN8FR3pjfn42o/lyyb/hhsye7T5cEigFhGoGNNMRZn/aRf
         6q1Q==
X-Forwarded-Encrypted: i=1; AHgh+RpggguP52yvEw6S4slgTrxCGmQ/i+xFpQPhx6Xtd6f1fAejuWIBMDtoB8hASLTM3MCQrt3fK65E6Wjt@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+hALd9zomqsC8nI4GA5xnj/iCF//wH2EjeyRLNZiozrSWF533
	TKExeD3ayGLX8O1Jhh2l2Ouyzh/BCFoQKqpE+YVFMzVX/niN38EnNlc0MyIRw8DeoHgLpmBedNd
	9Q02wPNkufzTdSfeay/Zod9QufKxraeCHcEUzARDPuDVzHynHCUXZSOxkpk2xpCrg
X-Gm-Gg: AR+sD139sQAD9LF1KZUX3vRVzP7fPLZSFJ62uBjng3WMEtszdkdPzOi2PSYz6Rz1qII
	GNqhSS12NQ81vMKk/uchZ+FRQu0Yva+izGNJdyvqORrx7UZsmCyV+tpYA0WdP6z+mRg7bDevT9J
	HsYbRj35VbPb1YIRyrphz+0ih4nzAaTB/nQaggkJO1yrwsldpoCFjCBoxYxQb5r0G7u9oAADjKa
	aXnEB6HUF3RSe3zFHtLyPphYlH7tepblYCd1QdJzfIiSvvAj6Ev8DTnl4fn2aos7G5TRA5O/vgq
	INcIVSRRcUJbeWSpOSdJtmqNJBKNIPnPihZ1ax0OvIkfTiEHAp07difWvAlkRGz5WAyQX4CH4u/
	VYEEmjcaNnimbfS/8rhNGsAbeBwERdcVJTb5kRCKALuQ=
X-Received: by 2002:a05:6a00:3016:b0:848:5540:2377 with SMTP id d2e1a72fcca58-84fde13600amr5660526b3a.17.1786711697711;
        Fri, 14 Aug 2026 05:48:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:3016:b0:848:5540:2377 with SMTP id d2e1a72fcca58-84fde13600amr5660462b3a.17.1786711697232;
        Fri, 14 Aug 2026 05:48:17 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d26726bsm405934b3a.54.2026.08.14.05.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 05:48:16 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 05:48:12 -0700
Subject: [PATCH v3 02/12] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5210 SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-qcom_ipq5210_cmnpll-v3-2-21c3db378611@oss.qualcomm.com>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786711693; l=2363;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=h9dNcrncu0/NjEPhCrtIOiIL0rUfOuMr6vWCW96P5f0=;
 b=fxjtZt2A7PrCUKiM1zZqKDGBx6Miwm6t+I+vCvZ/HhIjga/8tgj/LS6kXGLBHYAer7UB3wfQU
 cXZiJrSfii1D1SxPWpoJFLaXymyzNWJmfXpMCdIJdzkFdVr9VXmRwrG
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=TbGmcxQh c=1 sm=1 tr=0 ts=6a7f0e92 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JRX5g_4sfBZTL3UlNIAA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: W2QvPCM0bKtO708Wk7Hb8leShOnuzKB1
X-Proofpoint-ORIG-GUID: W2QvPCM0bKtO708Wk7Hb8leShOnuzKB1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX7kqDEd35covf
 UKtL5XZxTmUauEjCuIaE64KRbdIZvl3LqK2BRdEMWPvGHKCwZiloGjiosuaBuSps08CBqwArVP4
 K88jcIu223CC4jdKhkhg27CGlZUYR0DtDP62kzWPNYN7VPgMHiPcb2FEqv1IlUR3pbXCrKfY0Pr
 OqQz4koCtDTi820Msh4fk9no+29zNrNKs1QFo5AIT8OdEsEr9THRa+ntkFd2Ev8O+Q0NOviiPz3
 Zp6L1xjJNMMubB/MqZuUY+999q4sdzYhk9FmJXIk9HUKz7ZQq8Fb/qIwgyt8TkQTqj3Wm/9mARz
 EGCiTdZKcSw7krAuO87Gqy7GeAgyHI0ZZRIA1x4Pc2QnUbUyHDMenqKAerjsCP9Prk737UX54jF
 /dNcak7E+g+drTAKMcK44ZpIU7wpQ5+WngQ8TZHqGZmCgdqKebsGkbQ3+5Fw7NlB7HgRumrjniS
 brpj+i9E3e1iYb5UaOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX5CfHMCPY8IFj
 A+TDBA9uZrkTa0r4QOY1u7uIRPT2I9zEVuwu6HxCrofX/Hinp6JzfEEVMaEaRw3tNNdAioPqtuC
 1wpS7B6Rtegkmf9DiLjqnTMr8qKxC24=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140097

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

