Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2335439F6E
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905242; cv=none; b=gzMgl3dTiHCBsz+WdjW/PLDNZis499mYTO911NbEiV2REGnjWA+5g4vZakdIyY3LzImkLNDvshqiMabfRBtYqxDOXablCG2/BuuLKdWPD/y/Ua5dXpah3ArBVUtHptsd209LE3XW1LnF75WFEAMY0KRDMAfVRYkTYASgUa9NuNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905242; c=relaxed/simple;
	bh=zD85P6LNvs+Wzn31QuiidOpUYjqw0x5J1/H7IesxRLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V8PVLnSFH9UuG3J+RZDyUGZxOBf4y/SlGzcPSQcPU12j7EIFuu/5AuZQE8I0aCFwowo2xodgMp3jWqI5sfgSNsMfKE/QpAjctngYncHUEbWet2BvEQV4mDHCcKbEzkQou8eEnK6V40qlQdHZgkKSLIwDQnYZz0HezWDQ/zhvL8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLRYnIAG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=estT4CK2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SLRYnIAG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="estT4CK2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbOmF2710433
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LfjDXCV/KCJXVxee0B3ZVSl5TGQyuSHkDMx4R4IdQMI=; b=SLRYnIAGZpKoC3FN
	NvsbooIzGQkIeyuaMGDXwaoS88cWC3TYCDs5iHGUoOa1vvAKdqaNv51d1iFuvypH
	OmTzZyd0wthWFxFo4XikJUAyhjh+ROrUsZIiMv63raOWs8Grls4A1p1IYJAOUjKU
	vO+n++6JPhMoPvTul02z6/hNOXuJF6GTmff2JUSKec71eiWO7WvLDmqrVgXeBI3w
	suI0w+/davDPxTC6wyfJHrjO/5SwTyvGrtUP90QF8lBNqJ7MvI7jdaPQwIp1J+Vl
	LGk92v94SSQKy4sj0JcrW/DqJ7uMbhJGwa1o+qnnb/7ZIswvuAjJAbUP/FSrQ4VQ
	yvTBpA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cgggax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89704da8c7so804297a12.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905237; x=1785510037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LfjDXCV/KCJXVxee0B3ZVSl5TGQyuSHkDMx4R4IdQMI=;
        b=estT4CK2FQTNwedwZoYFHviBo+J2nfSvu0X0yJHhWZtLNX4XjnKZHFl/4nnosr21iB
         k9JgNLDtRcJjCQlbib42hs5OV8H/O7/AYOyTJ/E5TsWgjiq1DCCjnmIpM8K3B16BVr1o
         HCTsdLoFQDEdlQQf6HxEc6OMadhL60SPX14Y3LVtCeynjzT0+7xEC/IE3p0BmgOcO9ah
         WZtvFkAcl/gKBmSQ09VPxddcYxDYY6Fpx0qBcmAyEV9Qaovg8zlR9McwY58UfbBo4+Ck
         iP1bPiwiRYA/G27+r/x3zhgULlFZNQi8NtP2rAu9JSmxaPECsOUXr+epvnOjvZqaM2uI
         r8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905237; x=1785510037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfjDXCV/KCJXVxee0B3ZVSl5TGQyuSHkDMx4R4IdQMI=;
        b=XmKqK52d5xaXv/pL1EjRARWQ+Ym+w9+pHaT0fyGHGfqepM7IOzZhhFtiLGY8SVG9eU
         de6QyqpNsRIQqwl2cl10Jzjlp7++WQjqiy0EaFArXtygkmhLVVfkbo5dZj/OY4A9HJTb
         6hj7PhLSKlQ+IWnUxmhehLVHTgS6FlkfIzMxRVyOox3We6Gs9+YzifYw1NBJvj/sPuf4
         iB3GHbKuiyj/31P3JV3VC3ICjNFOj8SjHmRx8YS0GipG7CK0vmqIojYdB3k+QzJPBhh/
         Hd97nWIxTcxuAAbFNUiE8hNFRdjwp6sDEKBPXR+oJAFnzeee8YD9amaf3ZzJG4m/CmCz
         kd/g==
X-Forwarded-Encrypted: i=1; AHgh+RqOEx+lyCiK7clvlTUpqI+Y74hv5Ql7Idv+jZKrKc1MReggclgiKWn8+Wr4DFrcuywxVMzeDqG780hi@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx7uvPcFAdyoxcwhog9n338nPDqf2hZJWtvQ0h1j/kSchFzYSb
	4dhZhnwSvdVJ37I5f+88YRfvmKj5S11xNGtHAfD7YAYMEDumx57qEmf+fEZJwqkzLALF3A7A/XQ
	G1GA3GMF7+jnuyLtusabidXwRKYh3k5l+JRcGYaUmuqEy4ryqN9t72eRHZYBI3n7WWhhFpNcCuG
	3W3A==
X-Gm-Gg: AR+sD13LXnRhROc0XNa4dpOAq0hoGyaqPtMS0zbEFQ1itSgAHoYt0P3NkxnhYb59Wdu
	g/vqa4y6GYS6067vS8ETBiMGinC0cV9qC+Z/328pkddbjkyzq2KpGkFIGKjffWxxAHIJUfNWFoN
	fTpJrNeVxeSYAd/LfNA+SvnmiCyeuVb2Z4AHDFOK3U8iHxyyYmGeZ6d1NY6vZ81XnJbnFECCcfV
	iXr55f4vB7i7jiHUpecXLHT7XOdof06fJo0e9VIIQHoLMyYOQVUC015IdQXAznT9J2u+UC9WEOo
	DfGgXGcQA2kpxnouOwljMs31S/o2UTSna1wZukHABc6B67xChqMrWJCoTpnheVBXX3lwRLdutsi
	0DY8wcrwgdUw7/sOl8LsPGEvyShoVv2qGjbPVjIg/wms=
X-Received: by 2002:a05:6a20:9189:b0:3b4:b276:a789 with SMTP id adf61e73a8af0-3c44b190a96mr8581058637.36.1784905236633;
        Fri, 24 Jul 2026 08:00:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:9189:b0:3b4:b276:a789 with SMTP id adf61e73a8af0-3c44b190a96mr8580977637.36.1784905235859;
        Fri, 24 Jul 2026 08:00:35 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm621809eec.25.2026.07.24.08.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:35 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:00:32 -0700
Subject: [PATCH 10/12] clk: qcom: ipq-cmn-pll: Add all output clocks for
 IPQ5210
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-qcom_ipq5210_cmnpll-v1-10-a8b8679d215f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784905224; l=2989;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=zD85P6LNvs+Wzn31QuiidOpUYjqw0x5J1/H7IesxRLc=;
 b=Q2q2ptGYFI+xtBfmNOhlqW3mJWAQCUQiuOtAQZIRbmS4WW4fQKPik+Fd4ApKXTikHou/S4VdU
 X+vnBENuFivDxqmGWBclAmQwafjAtdmi/cb6UpSfeHRc1q4ba6KphS8
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=JOMLdcKb c=1 sm=1 tr=0 ts=6a637e15 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=EC4oSUd80wHeU967I9AA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: D15ApjOoJ4Xj9qlVsbTi3vgIFNZF0geO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX8zPsz5+jgKG2
 ugoE93zU1d/T11MYx4I4bN2E4jgorn/qet1Qpxn4devD/B9g75YBSAVuDm0as9rgRDAHj7LyBYl
 8ugj0LrvfipVMBJwCJi27xC0LI+jtiw=
X-Proofpoint-GUID: D15ApjOoJ4Xj9qlVsbTi3vgIFNZF0geO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX6Ed3j4ewHU9n
 FhuEcAEHMOU4kSuKT4g9w3J8pZjhGg6HzOwf9CKIZFdIQMeTRVslFuQsNii1iKQUAt6aQYzAH+r
 1Q+JN/uu2jOlz8EdmzBI7jkEaJYczrONopvMYlfitsG4/fSH6fxeDv75XyyAJzCEa/uHBOoHuUm
 F4p+jHbhMUytZG419hgpbz6Xc5uB6ND3/1ucYUOqIz7KeS0P5ireC/+WnTYVvmq5VTfPOHTsX4b
 W2jn5KWcfOQcillv/Fx1DQnkW19y7J1UWY/j6SPpnPmOjNXbxyJCWghZOi2Pj4XaVuawK3Ucd3k
 Xq+6DNRniOeggXvQ9Ak/1gRcurLkoDEHbhCf3g33xLFn2Tm7st3ILbLye5dBSOUG0s5l+VaM5ob
 6BhUUCsevryBrnPTxdGZtAZiUOV6Wy6jgTJXFm89md3WprZuCqTHezfzMimLxBOijfer6rvyske
 MpIYRrQM2LcIyBTBC0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240135

Add the IPQ5210 output clock array and the device match table entry,
wiring together all the infrastructure added in the previous patches.

The IPQ5210 CMN PLL supplies 12 output clocks:

Fixed-rate:           XO 24 MHz, sleep 32 kHz
Gated fixed-rate:     PCS 31.25 MHz, ETH0/1/2 50 MHz, EPHY 50 MHz,
	       	      ETH 25 MHz
Configurable divider: NSS, PPE
PON reference:        PON (enable/disable + 8-bit divider)
EPHY-RAW:             125/312.5 MHz select

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 00e243282b31..902a222e4533 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -55,6 +55,7 @@
 
 #include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5018-cmn-pll.h>
+#include <dt-bindings/clock/qcom,ipq5210-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5332-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5424-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq6018-cmn-pll.h>
@@ -164,6 +165,22 @@ static const struct cmn_pll_fixed_output_clk ipq5018_output_clks[] = {
 	{ /* Sentinel */ }
 };
 
+static const struct cmn_pll_fixed_output_clk ipq5210_output_clks[] = {
+	CLK_PLL_OUTPUT(IPQ5210_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
+	CLK_PLL_OUTPUT(IPQ5210_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
+	CLK_PLL_GATE(IPQ5210_PCS_31P25MHZ_CLK, "pcs-31p25mhz", 31250000UL, CLK31P25M_EN_BIT),
+	CLK_PLL_GATE(IPQ5210_ETH0_50MHZ_CLK, "eth0-50mhz", 50000000UL, CLK50M_EN_BIT),
+	CLK_PLL_GATE(IPQ5210_ETH1_50MHZ_CLK, "eth1-50mhz", 50000000UL, CLK50M_EN_BIT2_BIT),
+	CLK_PLL_GATE(IPQ5210_ETH2_50MHZ_CLK, "eth2-50mhz", 50000000UL, CLK50M_EN_BIT3_BIT),
+	CLK_PLL_GATE(IPQ5210_EPHY_50MHZ_CLK, "ephy-50mhz", 50000000UL, CLK250M_EN_BIT),
+	CLK_PLL_GATE(IPQ5210_ETH_25MHZ_CLK, "eth-25mhz", 25000000UL, CLK25M_EN_BIT),
+	CLK_PLL_OUTPUT(IPQ5210_NSS_CLK, "nss", 0),
+	CLK_PLL_OUTPUT(IPQ5210_PPE_CLK, "ppe", 0),
+	CLK_PLL_OUTPUT(IPQ5210_PON_REFCLK, "pon", 0),
+	CLK_PLL_OUTPUT(IPQ5210_EPHY_RAW_CLK, "ephy-raw", 0),
+	{ /* Sentinel */ }
+};
+
 static const struct cmn_pll_fixed_output_clk ipq6018_output_clks[] = {
 	CLK_PLL_OUTPUT(IPQ6018_BIAS_PLL_CC_CLK, "bias_pll_cc_clk", 300000000UL),
 	CLK_PLL_OUTPUT(IPQ6018_BIAS_PLL_NSS_NOC_CLK, "bias_pll_nss_noc_clk", 416500000UL),
@@ -986,6 +1003,7 @@ static const struct dev_pm_ops ipq_cmn_pll_pm_ops = {
 
 static const struct of_device_id ipq_cmn_pll_clk_ids[] = {
 	{ .compatible = "qcom,ipq5018-cmn-pll", .data = &ipq5018_output_clks },
+	{ .compatible = "qcom,ipq5210-cmn-pll", .data = &ipq5210_output_clks },
 	{ .compatible = "qcom,ipq5332-cmn-pll", .data = &ipq5332_output_clks },
 	{ .compatible = "qcom,ipq5424-cmn-pll", .data = &ipq5424_output_clks },
 	{ .compatible = "qcom,ipq6018-cmn-pll", .data = &ipq6018_output_clks },

-- 
2.43.0

