Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2565E345ECB
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905233; cv=none; b=NjQJmKZtizW/LWITXANO1OHe88Pt8O4NKY2V8oxOAMp+nKJNThobBAZNy3mQ0mNLu+MbMFe3CYUulkGn+pgyiCt4nUGcZ+558RSOEuXM8jcjScdsnDljQuXA06d0yK6gJ+vOpkVIq/dOryzOIGdo4OdyLE0FetulxxqGM93Y5kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905233; c=relaxed/simple;
	bh=OmaK7bW37P3eyItSwg18nRl9g7bQTw6jSi8315C8gbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KNZddvnCDw7TllE8faao+wOJ/adNdc8rlycplkiCw5qMIvCcM+E+YjJoyQWi1vN3cS8eWuUZC2e5DkfdfrvtPzpCEMkVxEJeQ5k83mvvgba2nwOmLFxURe3Y03MbaACxwupLJH1V9ZdPVA05bi4Yq3SontICaACUKADNP4XgC24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJuM5VtO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VH/nHYxB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HJuM5VtO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VH/nHYxB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbBK33344419
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYw5UkdMRwpjTZEowMSfHMuoGLq532YdN1bxt1k3YXQ=; b=HJuM5VtOwNieIN1Q
	mg5m35zE7TYxBJ2QKSu/wF949ndlNMVwFGjEqDqr35hm63VS/sczCeE5WXSVngdB
	Vf/jd7qkyXgOvn8JQDPynRVu8cAY5geTRkcpqhHw2SNN42QJVEL4ONZUCZ2dPRVv
	5g7lzcuehLNH7gxL+LbWgeGE89ae3cBLrH6bSK365uqR0vcP5kco23l5ez8ROCYy
	QxJGaxDtSNil1lPzsAej8fKNk0N8QcH6+K33Y3yPCtchERQk9wQ7/wZbeUDHH6aV
	0xAC+Fycp4mMXwtIdltsawLvtZ7L6ZW90rvjR50uLEIBm9h5leUB6RChIWJwVQwB
	Sv8CWQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cf0gy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:29 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso717161a12.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905229; x=1785510029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HYw5UkdMRwpjTZEowMSfHMuoGLq532YdN1bxt1k3YXQ=;
        b=VH/nHYxBNy1IpQU45nX15E5n1zGxF3mVNn37a0eVAwtDZq8zlEcGdnPm7tncjnNfnH
         3g/d6wqkD4+sCBtJ61/981ECwTzmSAjl83vLOOJNe1fNggP4FegHw8cvqMd+VOiAuvdQ
         FhZ5ecjlYRhIVM/IikLEZyWq7ZpZtPCczz83s7YdJaciJkXqIrEFwY21o59W3/Z6T0bQ
         gN/Sp73W1Iris95fWZQTw60wcXTryfKlIrGqbqkqO+ma2feDJsKiyAYJG619bD3mk4KA
         zc3NQe7JUTBUEbOmrAjMI1006xSWiRaj+rv787JQhV8hmJGAMLGiCunD1j/v70ls9LRK
         qYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905229; x=1785510029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HYw5UkdMRwpjTZEowMSfHMuoGLq532YdN1bxt1k3YXQ=;
        b=f/QZBzr1HoKnPRDuymyeZhC4s7I/s3qc7AYp10EECMbv0//hdrb30OgIyo4Qowzi4b
         hQBzFZ+9ptbSkafE4RHkGwDUDdPO1Zaa6Zws6z6YVAC51zoBVLDVBOtu73Z0UimlxhSE
         ZeEhCslJzfkDAsAS2lW2nR111Ct1Qla3lmc0/ymtrl0y9xcA+qZUC8ZIMgshCU9w6C9k
         E1xpBmqex3R5Bus7fzeOwUxCeIRxtdhSLjVdBozbHdhNBxNgSrAOOK+EIuSM2CcasqEJ
         CZe07W/5N+Qt/Wgw/EseoWvSOYui869g4SojSwVnv9xpqzI7r72zujLMvGdbmfmMCU63
         NU8w==
X-Forwarded-Encrypted: i=1; AHgh+RrCA0TQ1qZOcPbOkit59xu3HxddRM0wr/+yuMP9MunJtPAPNNjnzlz/cUenP6+IKlPrEbyOWJGd9S+p@vger.kernel.org
X-Gm-Message-State: AOJu0YxsNsc9nviumoA97E66GmrPYfa56B+2Pi0DhWiKxEh2DrJbhzYk
	WnJgT8GihMGTDoqPRmYbgfTl64YLtC4nD0dL30ojhLUcRqzVPxsYjaQ34Vt4BgH9HAUzS6kv6FS
	LB3pWDRO8mk1pVzFhyw8dceGBAXVa26o0UBkDEQ+/QzJNN/c53/DgHMJ/SKEAvfoKaUV1vJ7nPo
	2jTA==
X-Gm-Gg: AR+sD13Ypk5y9y3frPjaWoHImcCtwKNPjfRTVdbniQZ5GyBvx1EBElOEtpaQ1LKMZlA
	MSBA2gEr1+aYIE4DGodblH885D6tkcWk2dVOO4JfV79q6f/vd/ejlcxWQFrPwzx78TjYaT+TQ9V
	9izDUfyrzZPBfLni6D8Gi0SipZBwOp5uTD+dh8+6NWXz7VEnxL3VgnW42epXqWZ2yrUdq5fZMUC
	8I74FbIPusBmxzADQlcRg0GnYgeIePljCE4mFlBYVUvJqRaGqOpzUcwJb6x30UpQh8eoOTvh1Kw
	NlItr9dR0T/XTqow2lU6FkNCSShOBMVT1JrdmGlt299drdBxvPFr3V30QzsVWb9DYsR8DTlBWpi
	MEJV+Sc9hz29CPDw+Pt3BSkRxKDVL02TfHW3cl5agsbY=
X-Received: by 2002:a05:6a21:391:b0:3c1:85d:fa2f with SMTP id adf61e73a8af0-3c44b1b525cmr8250331637.36.1784905227708;
        Fri, 24 Jul 2026 08:00:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:391:b0:3c1:85d:fa2f with SMTP id adf61e73a8af0-3c44b1b525cmr8250285637.36.1784905227201;
        Fri, 24 Jul 2026 08:00:27 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm621809eec.25.2026.07.24.08.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:26 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:00:24 -0700
Subject: [PATCH 02/12] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5210 SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-qcom_ipq5210_cmnpll-v1-2-a8b8679d215f@oss.qualcomm.com>
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784905224; l=2318;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=OmaK7bW37P3eyItSwg18nRl9g7bQTw6jSi8315C8gbI=;
 b=bzQYwQhEvEZbupdmcH/TYEA48nhJq47oGzxIKwEndpNo163MkMgnQ4AU8pCYukjEefFUuDhAY
 OuCV2B3G0JFA8vYvoVEt2V33aTsTIJf6rC1/JUToWw7PBEUvvsByOPv
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfXybfaeKZElFoo
 m5ebhCy/9pmiJfcb3Uzl4Xx79L55HDs2ciDB31/va68K+QmvVRom+RXCiIHiRJ9sytf5Nzk9VTZ
 NlR3Ywdc7fZfAaRT0xoCYBGkGssyncc=
X-Proofpoint-GUID: WnWpv0UGDmzO6QqFy_tsx7CAC4ojQB7s
X-Proofpoint-ORIG-GUID: WnWpv0UGDmzO6QqFy_tsx7CAC4ojQB7s
X-Authority-Analysis: v=2.4 cv=er/vCIpX c=1 sm=1 tr=0 ts=6a637e0d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JRX5g_4sfBZTL3UlNIAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX+KYjtH0I8/Tu
 UFwpqD0+Lwn4EUPcVR2t1Cm+Jk74Y6IzHiBfw5QEw3CXGN7sYDcFZUlaWo/rqfuvtI4iL2VuuTQ
 R1SEctBQA3GOb81u2SnuS0f07Qsy2ergFz4LB/xGUAnPrIsNgJB+b4N8jwBefIFV8Oo+sp/xlMt
 TdnkbDeLdQ/vqJCBXwsizUpcOjHXvJh55rGyPTo0do+3nn9MfaxsMs1WZ9F1meGxFWSl2R4bDeV
 AdMBMrGSNjQpK09XnEbSvseNh2WV0POhdQWNtzJURthwXxUmuM3Wt8ffff77kRrzh8CndT/y5Af
 gtvlO+TXrTJcU3pMiXxkM/XCwnwk4O1MyqjJTTRsMbklHg84NfczYxJxiVBs3uNaJWlTZ80OqOL
 rLK1eJHSJlWjCU5ob8bCmmaM9lLbBzXGzl47SULZ0Bn931vuzz761yZ1vF/7GoUyiv3irhmvfGP
 v4rdZ2X6kndHsCWvVvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240135

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

