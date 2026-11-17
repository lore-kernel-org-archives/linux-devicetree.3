Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905226;
	b=c67yz/mIaIxmqaKwobzHarpPX4KpLenUtq86LjPp1OtGLJf3GsfdhZ2Kxl7U2R14n1kX
	 msxUVI6bzu5yKHg4kFshigx62lHl1K1EcONLqBB7s7Y8YZoL7TjphF1s1Bg+vgqQ1906T
	 tGa+DyAMTerIv+5YlencGIyFm20/iz6Fa+zw/YyESwhN+kRRUNrkHgArivAVHGvoLcD0X
	 WD7hqF0fzTaM43J1FnEmMXIzIqkzEo5JMSkU+z58bjHS9pwc/KpQr2rLd0WY+sUY1TCt5
	 vwFjswv5Axji/EfiVKHqGM3rV5G4DExHa59K21UPlNskyM/n9bKF42/xY6Bp+/zPsVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905226;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bUxU8PH1I9mJtRraWd2nqFJmyWXS1n0HHMiuvPeEeZ8=;
	b=rhya6m8ApcYWYF/Y9w5Bff/x2+ojlfml3uHLSAb+zByTyhR2I3IXURHmJIMfOiQQIbU4
	 gIw9aEKySgMngdztmQ4PAUu0RBEeUThoXU3D1H0sCLOVT5DLb67zUDygZG3ewieRfZOoK
	 nE6isxXRe1tgvcY+9xsb69YFJh90N5i5WInMY60Faeq+tbVtpaDDBah54IOCA+HMe2QLM
	 evorFDLSeYbpMi5qAt12KRPjESnVEVupnabNVvPSBnL8ro2WFCcpF45UgPahE7ixWiG1O
	 rX6GKGY1LYLAcCYmaDf+YcPS54myq/+62G3Bm0zV19qrk5xW0u8RM0hwhW8oYxd7IfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dSUV6kj+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CT4qNDOh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D17B606A896
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D17B606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dSUV6kj+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CT4qNDOh
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8T30l2934210
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bUxU8PH1I9mJtRraWd2nqFJmyWXS1n0HHMiuvPeEeZ8=; b=dSUV6kj+gygW2NVZ
	AL+MOFizMxnkrzsXpa1s/Mg2ksd9/DLQn6cATmbzC0KlIKjPtjuMlZQQdSqPC6VF
	EcNBKkWWgqRs8nctPmQQ6+aaurHjs8pvLd9UI+HxrmPVA7T9TfKxBk/8vEPT5Mzh
	GIOCh28DBk/tmyjJxZg2G/ovI8JmHUIFM7XADEWYqXtCmtnwsYKHAtMRbwmBwquO
	rhZ3zxN+Ox8ynWnmAMlzAqk+gOrVjHuaZmRL35RLrI1VA8rGbHMw7UqjAWSuewfz
	iVclF50QzZf/3HmtneF6pNvuRrvG+34ipFJiwR1TeaGSTubB3om9dU+qFZWxGxrf
	mDAhDQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m0a73y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 08:47:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3a74ee77fso690285a91.0
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 00:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905223; x=1795510023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bUxU8PH1I9mJtRraWd2nqFJmyWXS1n0HHMiuvPeEeZ8=;
        b=CT4qNDOhn998Kp6Fp9j8Bmg8ebSEYIfttxRyeGWmQdVvP1HYQmw9FePn1/WY0IH1gi
         wZfoQDoobbx1FnZkQC4mg6YIJyblg1Lw4GSHfCbBvrLsbA71YPAAY/jtRGYiPBKKsrfF
         C8MxmmP5UmI7S7Veq/3J37Abw+O6jow0SV5GJC/lBrX39w02GhMBF5ZBfP7NWYX7pVPO
         ENd14424sRqLasrZ20fNwQPGRb1qexxf6VmAGkLIAkYj7VBMsR3HwQXrXSOvAyVEuIlb
         WZGe8/b3A/QGu6S/Mvm/wR12BBnp2JtPuBsfVtBC2/PfigaK8KqOXVEM3TrXyqib6wgq
         R7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905223; x=1795510023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bUxU8PH1I9mJtRraWd2nqFJmyWXS1n0HHMiuvPeEeZ8=;
        b=tsoYegQSkjSPcCUlb9UuocehqDEdH/wAwoQofIzOoWkkAwEK3Yd1thbaUpWBui5EYo
         rjHVRaifXEfJKdNZQ05sTzG9D/TrRYy8mPdY0WQbWM3nevDOBtWhVr7QFzYDtuMo6187
         ssa5uKm6kJHCVSOYpIqCVxg41fSN9gdlftxvhKCtXK9JSWcXnpPYVviF92YcU8oRW6Ow
         VGBuiMd/pKbM6kYEvuYOlWh1Q0T9ohGCOfFCBFRSU1CU0LzOFju/jdEZ/lPPuKo3UwOJ
         2CSm+rPRXVMfpZBvh0RejZvGwzrehoK2I4AoytXrlDliVFWzolMyf2rld4qhZWjt7IN2
         hUEg==
X-Forwarded-Encrypted: i=1; AL+hErEEyWPJGqfSCvX/31iI0ui2bU+NsbRvsjcB1AFuakO0ooMDZU3Z4mFnN2+I8V9mupKrPttn0Wr3mhYg@vger.kernel.org
X-Gm-Message-State: APuU4Z/GjiFSow6XSWQJQMMmRGpQpIUUxldETFkW9tRfe637DJ3GBIF6
	VWvWTQTIKJWrS2u+/gfp151enIXRtIGrZQb09Wpibp/EkC11yhY13v6b2iNpivN/Ky7naZplmaE
	qF8E3vZ1YsS5gf4iXgzSLkcVsnSv8zuUflbYSi2wuE0svqx6Z66Ai2CiEKxg4vDEs
X-Gm-Gg: AZFdTZcDCEya6L39WTLnDEBzRTCBY494Xup74KTnNyb7v84NOlTkTqOdKW5XcPTtmcx
	9cbF+JDWQgMLbwWBbfPyehTSgSDy88vZL7349Yyk4zKFfauK5XJwd1JK8qXRglZG4klpWCyMzPY
	bboekf1H0qfpE18z+Zs3hj5tzwXREhmhtKPYAOF2CZd2jV3wypl6cB3N4QAVWlmPCw0VUJ+cUDn
	wqP4tI2WQeb156A/dQ9jMkU7PL1Q2RGkWx0zw28vYgq1lQ8hrOLpTeCDGOfpndunXbcZiORf6EH
	amEhLYMn0GagshQpAm3jJrpP0U6WKEMwGJdOhhGHCUez4YatEmGEy33ob7KDcZUZF52ViJnfVTc
	FBZr1RT92SVraa+uM4NqvGwDdPwgk+TULRNIHM/3tMA3OSeysztqumSHg2vk2tqG4wpi0kTWo3K
	LEyg==
X-Received: by 2002:a17:90b:5585:b0:3b0:ae41:2711 with SMTP id 98e67ed59e1d1-3b1b0a12f15mr11754436a91.24.1794905222461;
        Tue, 17 Nov 2026 00:47:02 -0800 (PST)
X-Received: by 2002:a17:90b:5585:b0:3b0:ae41:2711 with SMTP id 98e67ed59e1d1-3b1b0a12f15mr11754401a91.24.1794905221742;
        Tue, 17 Nov 2026 00:47:01 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:47:01 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:28 +0530
Subject: [PATCH net-next v4 08/10] net: stmmac: qcom-ethqos: add
 per-platform NOC clock voting
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-shikra_ethernet-v4-8-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
In-Reply-To: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=6563;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=ydVlH1qQv29heCiLhOkMA2wLLBxXjI79R7JegvlpMfw=;
 b=S/5GLz8zAvWfZjdeL4Y7hB6T3Un+F6NsDm++mtLCc4Thra+HtC1v7ZXu6nD5gB++5SjJzuUT5
 COIwI8lD57CAITdb8xnFUigaVPzEgyr7gFO6r44/6kDKLzqV1ZoDwFF
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX+G/qQthPa8Z7
 tjFWfnOlvyltL1b+wLlZ927rl+f/LSq/aySxZFgAE1mlam+WDP1pu/6rhEJZpo1IF3pvTqlW+Ot
 ueT2E6oU8GruuAFIJkvV+/gE9xQP4Uc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfXyqn6AgJsKtKY
 vCigPznKTfhJEuDOm0F4ZP30kHUhcnWeBq6dmavMCYWSuWU9wTojQXFNTrdqCvCF3Dk+pvEVcOU
 h/KJcCbKbzP+g83L44uBSJ25bwMh0wMo5e0NVLbS5UAyQmAl0r1SUrVa8LwZnAdHkzfg+vBKtYE
 rrye8OIHmgbLv+cka5IEIkbKv4+7o0fJ9Q4d3Fm3jcxGm747SmtfkIu/dsG269swkwGYftYyIzj
 1Cs0trfiAWGyQXslrvPwRNEOZmTpTxn4YZj0l4pE8pItUgSYJ601hMwwGiZkggQlF1vc5qJu2B1
 7KMVxeIlreD9RRcK8zd8vX3Zg9+TFrRVOrDFGXy8sdLjFLY3Try6xmO9HODf4pDciv7+LioE3n5
 jyBCiu+ffsVsC6936th0AhiLhwyek948YNlzO/xao1w9BHWQagyRevw42JIlTGtFGdxeVBlODwu
 5fwdT7U77Otb5owj5HA==
X-Proofpoint-GUID: atvRSaiQhl7KSolPyT__CLTjuC_0U3OJ
X-Proofpoint-ORIG-GUID: atvRSaiQhl7KSolPyT__CLTjuC_0U3OJ
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afc1487 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=6_iyOJkiw1WCeSr2jkoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170034

Some SoCs gate the EMAC DMA path behind dedicated AXI clocks. Add
per-platform clock-name lists and configure them as a single
multi-clock OPP. The OPP core programs every clock rate and propagates
the required power state.

Select PM_OPP because DWMAC_QCOM_ETHQOS calls PM OPP APIs for
compatibles that describe AXI OPP clocks.

No functional change for existing compatibles. This will help us when
we add support for Shikra.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   1 +
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 103 +++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index c6559e749c0c..15639666e837 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -146,6 +146,7 @@ config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
 	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	select PM_OPP
 	help
 	  Support for the Qualcomm ETHQOS core.
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index bc443793539b..15385750b3e6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -6,6 +6,7 @@
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
 
@@ -102,6 +103,8 @@ struct ethqos_emac_driver_data {
 	const char *link_clk_name;
 	const struct dwmac4_addrs *dwmac4_addrs;
 	bool needs_sgmii_loopback;
+	const char * const *noc_clk_names;
+	unsigned int num_noc_clks;
 	/* Fixed PTP reference clock rate, used on SCMI platforms where
 	 * firmware does not implement the clock protocol allowing linux to
 	 * query it.
@@ -119,6 +122,8 @@ struct qcom_ethqos {
 	phy_interface_t phy_mode;
 	struct dev_pm_domain_list *pds;
 	const struct ethqos_emac_driver_data *data;
+	struct clk_bulk_data *noc_clks;
+	unsigned int num_noc_clks;
 };
 
 static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -725,18 +730,61 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 	return ret;
 }
 
+static int qcom_ethqos_set_opp(struct qcom_ethqos *ethqos)
+{
+	struct device *dev = &ethqos->pdev->dev;
+	unsigned long freq = ULONG_MAX;
+	struct dev_pm_opp *opp;
+	int ret;
+
+	opp = dev_pm_opp_find_freq_floor_indexed(dev, &freq, 0);
+	if (IS_ERR(opp)) {
+		ret = PTR_ERR(opp);
+		dev_err(dev, "Failed to find AXI NOC OPP: %d\n", ret);
+		return ret;
+	}
+
+	ret = dev_pm_opp_set_opp(dev, opp);
+	dev_pm_opp_put(opp);
+
+	return ret;
+}
+
 static int ethqos_clks_config(void *priv, bool enabled)
 {
 	struct qcom_ethqos *ethqos = priv;
 	int ret = 0;
 
 	if (enabled) {
+		if (ethqos->num_noc_clks) {
+			ret = qcom_ethqos_set_opp(ethqos);
+			if (ret) {
+				dev_err(&ethqos->pdev->dev,
+					"NOC OPP set failed: %d\n", ret);
+				return ret;
+			}
+		}
+
 		ret = clk_prepare_enable(ethqos->link_clk);
 		if (ret) {
 			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
+			if (ethqos->num_noc_clks)
+				dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
 			return ret;
 		}
 
+		if (ethqos->num_noc_clks) {
+			ret = clk_bulk_prepare_enable(ethqos->num_noc_clks,
+						      ethqos->noc_clks);
+			if (ret) {
+				dev_err(&ethqos->pdev->dev,
+					"NOC clocks enable failed: %d\n", ret);
+				clk_disable_unprepare(ethqos->link_clk);
+				dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
+				return ret;
+			}
+		}
+
 		/* Enable functional clock to prevent DMA reset to timeout due
 		 * to lacking PHY clock after the hardware block has been power
 		 * cycled. The actual configuration will be adjusted once
@@ -745,7 +793,12 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		qcom_ethqos_set_sgmii_loopback(ethqos, true);
 		ethqos_set_func_clk_en(ethqos);
 	} else {
+		if (ethqos->num_noc_clks)
+			clk_bulk_disable_unprepare(ethqos->num_noc_clks,
+						   ethqos->noc_clks);
 		clk_disable_unprepare(ethqos->link_clk);
+		if (ethqos->num_noc_clks)
+			dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
 	}
 
 	return ret;
@@ -773,6 +826,52 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
 }
 
+static void qcom_ethqos_noc_opp_cleanup(void *dev)
+{
+	dev_pm_opp_set_rate(dev, 0);
+}
+
+/* Some SoCs gate NOC access behind dedicated clocks. Acquire them here
+ * and set up an OPP table to vote for the required rate and power.
+ */
+static int qcom_ethqos_init_noc_clks(struct qcom_ethqos *ethqos,
+				     const struct ethqos_emac_driver_data *data)
+{
+	struct dev_pm_opp_config config = {
+		.clk_names = data->noc_clk_names,
+		.config_clks = dev_pm_opp_config_clks_simple,
+	};
+	struct device *dev = &ethqos->pdev->dev;
+	unsigned int i;
+	int ret;
+
+	if (!data->num_noc_clks)
+		return 0;
+
+	ethqos->noc_clks = devm_kcalloc(dev, data->num_noc_clks,
+					sizeof(*ethqos->noc_clks), GFP_KERNEL);
+	if (!ethqos->noc_clks)
+		return -ENOMEM;
+
+	for (i = 0; i < data->num_noc_clks; i++)
+		ethqos->noc_clks[i].id = data->noc_clk_names[i];
+	ethqos->num_noc_clks = data->num_noc_clks;
+
+	ret = devm_clk_bulk_get(dev, ethqos->num_noc_clks, ethqos->noc_clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get NOC clocks\n");
+
+	ret = devm_pm_opp_set_config(dev, &config);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to configure OPP clocks\n");
+
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add OPP table\n");
+
+	return devm_add_action_or_reset(dev, qcom_ethqos_noc_opp_cleanup, dev);
+}
+
 static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 			     struct plat_stmmacenet_data *plat_dat)
 {
@@ -780,6 +879,10 @@ static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 	struct device *dev = &pdev->dev;
 	int ret;
 
+	ret = qcom_ethqos_init_noc_clks(ethqos, ethqos->data);
+	if (ret)
+		return ret;
+
 	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
 	if (IS_ERR(ethqos->rgmii_base))
 		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),

-- 
2.34.1

