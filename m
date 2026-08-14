Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A385446F498
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786711723; cv=none; b=R0awCoQBv4lsnSLuR1IVuezqgaFmszAsCfPPwqmneH6JFHimqorVacaXDViWGbyMRxp2ExY3U6xsbrMS1xZKv/a92pnmH97Egq8sbZGMwTOo/6hglpobNG8B7S5Jr8Zfzm8I+/+8tcVUER3rtvS26CRvnWcKPIp+ASYr/UUAhcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786711723; c=relaxed/simple;
	bh=xb7jRYlB1XJZ2ikl81tfQItsu2u2gXXfn0VCM3meJ4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SoMqyUM6UpaoD6uZW++1664VL/ra0JHiPyv0NbhWjPA8sc7maX5p6kGSI3msdeR89841flzTPqH3zqIHn/b+78K5a30sYalT9avHMul3s8OaNA4DIoByaQg3Caq0BphYnxlPCfamk92vc7E2+el22yYvDZ5YbCAtZ+7A8g0H3s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qy807JTj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePb4D1Hj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qy807JTj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ePb4D1Hj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EAbI4K1804081
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ZkRewFnc/202mmz0z02y9mO2uNrj17ROB+iEIkeogo=; b=Qy807JTj0jirTGJv
	7VZ5lXgIyfMKWvVJ+yw75DlCaNM4I0luQCydjI3Nf7M/IVGR6bbWe9lXu2WdvPrA
	I9y8KtX/IxVVh63wUodbtHOzi+q4Yvk1kQiRji++nNeFrGEpeYepVQv378Jf6kmu
	hxgMTSo+0B2mGvJPhWOV7ZSc71E/P4hnfpq6hrUVCuQlE7f/DyYJnQUfXCchJOOW
	Z3Bsxdc5wPdCbf2hjXzEpDnWIO2Dn8cE2t6OkBMr/WJmz/5WhAWkYcHA45637IeP
	DtNl8k2tiubfSZ+TGXg4n4B1Eg//322W5ez5WYAcsAUM0UlGUA4r2tDuJH1vCInV
	NMGJcA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1pea30sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:48:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e4ef486c7so776495b3a.1
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 05:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786711709; x=1787316509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ZkRewFnc/202mmz0z02y9mO2uNrj17ROB+iEIkeogo=;
        b=ePb4D1HjC+rFshYb2RKzSnX93dCZZIqgB+Zi7HuMRi4cl8NmZqjUi57Um/15XKNAfK
         +nn+f3gDeA/fOtXtzvdrEPtGLthwl1DAyiQWzU9NeoP5G69i+uDQfHukdedc/4RfKRvB
         aMwc2c9FW0hIroBEG2lvcuS1t0hTFjWM7Ktt+cwnqA1yuJtw0r1tXbVJdBYClmjQFu1q
         ZmACVWPKl7TGr3ELDgHhTj6MEGqX+6oRqDRjeZfPPD9wLeXKcZgHl9P3Tqy3lKL1j7+g
         2ufyG+kMWNw6pnVchO53whpcpgyRgD9ja6gSHEhVdKmbjI+PGiZpAIQfrdrRyU86Bira
         4/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711709; x=1787316509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZkRewFnc/202mmz0z02y9mO2uNrj17ROB+iEIkeogo=;
        b=XMW0Xn/p5TksdHkocA+w9FZnZX0uvsp6GbapvWcc4jRN16Q+OsiSWHDpvS84DJIfvx
         Z3OxQR7m3mMq8+WATERcHiIo1K5Uxb+gjkwgqrUc/ECydgF8ciqtNiZSogXmmTp8Bvxv
         TeVbIGlJvqK9lXacq61G100uqIVsfCm1zMF3prugywWHEstuqnRdBIeS2yzDqR2NT6E0
         B/zB39Z6Jr8IdKlGT9CO5pQBJ7EaMmnR29Mugt800vWvqF4l8n/GeEwZ5PUi9IM0JZm+
         cT0hgkzKrsKXLT/kuorA+CEL3lwOisv/eU14kFxr38sHy/7mDAlBqn7IG5Xc1esZGMmz
         KOHw==
X-Forwarded-Encrypted: i=1; AHgh+RoeRw63+lLEnC4MYp6r2EYhyNenwGT8BV0XRKUXLymKQi/Wvj5figAacFgq09qe0LeTjuEJfANQQory@vger.kernel.org
X-Gm-Message-State: AOJu0YzvXo3uaw9qSdqca5uANn91e6CZ9bbv3zLqhXqRzaxgzK8h8unm
	Jxf1r86yKh2VjlbFKCN26QDe5iF6nc2g1wpB3aHoV37FvKj4Cqy97hZG4EaeneE/BK4w7guC20s
	nFo5mKCmiM6JtbvtRWHwbK49IyJ1HmU7bBA4FoWMz9kq7cRFRLc41JjBoy9qoobww
X-Gm-Gg: AR+sD11Nwps8XmMFKmfuE2CgsB4lw4XMYkrDXCaCp/ulp9d5w8+qKErN9B1vvsSHRms
	yngAM6sUQt7b6xbP+2lK4lDttBWgayG8L7EZ/03qA6zhrXj2PSXd8Iae1wFL8/xPCzmPAcEksSl
	w2XiC45MOwktUdzMqBn2N6JvHG0JQ+iF3KlqoyZ7KkejlFazj4vVEkBjA6DchQfhl8w7nHus72I
	vRm/THS0RVsxwpV/0pX9qbag0plGISrmqTEK9/s6INixSqVLiRKMtT9QCw6cBDsnTZTxt+zu0x0
	arvfLJuOnrPzRXbxhuDWzYxbqz3Wrl+qJjzn/TYg8ucvP1j1/2JwHAxTjKrQS25fu2V2wasUSLF
	Wng083Q3BVXaZiJ2mZ1Cl/JkhQvSAYNYaezlqV7yXMwE=
X-Received: by 2002:a05:6a00:808a:b0:848:2a69:97be with SMTP id d2e1a72fcca58-84fdc77ab7dmr4889101b3a.10.1786711708495;
        Fri, 14 Aug 2026 05:48:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:808a:b0:848:2a69:97be with SMTP id d2e1a72fcca58-84fdc77ab7dmr4889060b3a.10.1786711708056;
        Fri, 14 Aug 2026 05:48:28 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d26726bsm405934b3a.54.2026.08.14.05.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 05:48:27 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 05:48:20 -0700
Subject: [PATCH v3 10/12] clk: qcom: ipq-cmn-pll: Add all output clocks for
 IPQ5210
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-qcom_ipq5210_cmnpll-v3-10-21c3db378611@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786711693; l=3700;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=xb7jRYlB1XJZ2ikl81tfQItsu2u2gXXfn0VCM3meJ4Q=;
 b=n0DlPjFFGX3HvHXRcMoCS+2Ph0MK5Fa+6Fwd5GLyd5rFVCT+RxYwKoztPSpkg08XTSRs7N7WY
 6qHGzerujBuAAr9SenhtIhWnYXILJ5IzLAKMy0OuZDb0nLHUmG0Vf8Z
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=TbGmcxQh c=1 sm=1 tr=0 ts=6a7f0e9d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=P04cmAjberRrbCkX5BgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: prLDvvbOJEFdEogmjQvcfRiWAtDzRnt0
X-Proofpoint-ORIG-GUID: prLDvvbOJEFdEogmjQvcfRiWAtDzRnt0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfXy52l58e+hU53
 xK1nB0XCc5kqGZsNyva3QewV/wIjidNGQp19glJCPfTlOjnLqNAnrambppG6P9GKcGraEGRYRxr
 in0JdjRZ8BLrdmsEdc2ACcXcRezTgalz21bHnCeWn2GJ8rVZE2kjKvSg7dkX2q7Vrh4aUFnbP59
 3q+tJJRRnClUtIOQsYiPEQQyVRjFkxArWJa/MFiFcEEvY3Vj+AyyrXV9Im8O+LXAq8L3l/1CxaY
 MSGgS9O25MME4DLG09aB6AshI8FJciCPqapdVqEsO+xooDBxPok7XeXDM0+/SCDp+d6nxgrJkhM
 Jt4DVRUne07kTATr6ct7QrFrmsAJzMdgzaZQDgrphAsB/dnZ2cMPe4RF4bO2s/+dSCVm8EnlNND
 TB9DzSfH3fBerNjImNZFcSept+/1aLy4qfraMfHZLNjjsX9EOfix6LgNX007jEcIDXZmslOzNoN
 pXdHrPKw+AT7ErDaAcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX5BIF64mlRFCB
 mI5rLvhDHMrGTQF7f1QY35n8hYx795KC4SCRv4DSOGpPJyUIFzZ6BHZcixWxZQSS+GATjvnBZL+
 CoIFNIQ2oSLZJrZjLA1ntBh5OTSS2oU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140097

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
 drivers/clk/qcom/ipq-cmn-pll.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index d5eddedd01ed..6234e7cf3f01 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -55,6 +55,7 @@
 
 #include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5018-cmn-pll.h>
+#include <dt-bindings/clock/qcom,ipq5210-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5332-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5424-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq6018-cmn-pll.h>
@@ -189,6 +190,18 @@ struct clk_fixed_gate {
 #define CLK_PLL_GATE(_id, _name, _rate, _bit)	\
 	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_FIXED_GATE, _rate, _bit)
 
+#define CLK_PLL_NSS(_id, _name)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_NSS, 0, -1)
+
+#define CLK_PLL_PPE(_id, _name)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_PPE, 0, -1)
+
+#define CLK_PLL_PON(_id, _name)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_PON, 0, -1)
+
+#define CLK_PLL_EPHY_RAW(_id, _name)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_EPHY_RAW, 0, -1)
+
 #define to_clk_cmn_pll(_hw) container_of(_hw, struct clk_cmn_pll, hw)
 
 #define to_clk_fixed_gate(_hw) container_of(_hw, struct clk_fixed_gate, hw)
@@ -207,6 +220,22 @@ static const struct cmn_pll_fixed_output_clk ipq5018_output_clks[] = {
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
+	CLK_PLL_NSS(IPQ5210_NSS_CLK, "nss"),
+	CLK_PLL_PPE(IPQ5210_PPE_CLK, "ppe"),
+	CLK_PLL_PON(IPQ5210_PON_CLK, "pon"),
+	CLK_PLL_EPHY_RAW(IPQ5210_EPHY_RAW_CLK, "ephy-raw"),
+	{ /* Sentinel */ }
+};
+
 static const struct cmn_pll_fixed_output_clk ipq6018_output_clks[] = {
 	CLK_PLL_OUTPUT(IPQ6018_BIAS_PLL_CC_CLK, "bias_pll_cc_clk", 300000000UL),
 	CLK_PLL_OUTPUT(IPQ6018_BIAS_PLL_NSS_NOC_CLK, "bias_pll_nss_noc_clk", 416500000UL),
@@ -995,6 +1024,7 @@ static const struct dev_pm_ops ipq_cmn_pll_pm_ops = {
 
 static const struct of_device_id ipq_cmn_pll_clk_ids[] = {
 	{ .compatible = "qcom,ipq5018-cmn-pll", .data = &ipq5018_output_clks },
+	{ .compatible = "qcom,ipq5210-cmn-pll", .data = &ipq5210_output_clks },
 	{ .compatible = "qcom,ipq5332-cmn-pll", .data = &ipq5332_output_clks },
 	{ .compatible = "qcom,ipq5424-cmn-pll", .data = &ipq5424_output_clks },
 	{ .compatible = "qcom,ipq6018-cmn-pll", .data = &ipq6018_output_clks },

-- 
2.43.0

