Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66C33DD51C
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933485; cv=none; b=CMOITGqH3DR9GjyE695S+JGFq6b8NAoKh6GKY9rzbVOoSbFSMedAp+z3wrjSjauV+IQCb117clAU6PcBNuB1gSQ0Q4gRFkOVgpGanfvf9xYL7Yu8y79m2QAYTe6PNI8QKpgD8iACViXdC9DQUymUfgZvUf977gDrgU/3ZqiFxGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933485; c=relaxed/simple;
	bh=tOMt+0oVyv9bs+xUZBusbmG29ke+MjI13j04RgbJPyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QIQJwelPCkLM1kZrpkg7OTLDBCHTt6jgeNvTDY+Di7Fa/F2HWNHUjkF2SbrMcFlnBFtK7TUJq2qlwMRj2t7rMXTvRZTf8KhtfUt7ocJ+AM1uueqo8WrGgzZlTMt+b/W8QlUVr6dNyrUCPQ86Uozhjjgwz6Qz7zbwT5s6vwry6uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EWbEFtFr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S+wThqjV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EWbEFtFr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S+wThqjV"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NuYT568050
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:04:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vaJLAK8ySLgl5uDb74oYJMwOsz6J/SwwB/itF5wWI64=; b=EWbEFtFrBoxdxe7M
	Mlir9hU3UWDgYIEV66MKhb3tVpIK8+aKPPbv/e9bAgY4E/f1yjeRa3eJ/b6pzr6w
	pXG5u/U1di1hjilaDLf50o5wzfVCHOM+KrvNOLpZ7ofeIdcRRRXXBtUP6rA4khW8
	CY9Co/AsYWuT5sFJACw/goc2xJKOw/HH+KjU6KVveB3UEif6abSoQwi79Kbod86R
	EFevH7XQ4lJZ9yMW42jQJPFhAdxzf2dCknGnyYkgzGkTUPehaSWUxBVlD5zaBJhG
	9B+BwF1crnDfrglpVPksgom7BylS3Lo91miq4NmZn6SXFYa6G2yvF2Qd53DcxNzH
	cCywtQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe915aux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 09:04:42 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so7654217a12.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 02:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783933482; x=1784538282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vaJLAK8ySLgl5uDb74oYJMwOsz6J/SwwB/itF5wWI64=;
        b=S+wThqjVcIfE0PH9iH9vz0xNwm5UYcH+mexZaLZi7k00r/AD0v2P5fHyRF/C2i1TYI
         A4A9aJVPX8mpYqjs/x1d9Sfp5tTceU+gyG9pKWR+dz8vWnsES4j6TKZlmLzoy7Hu26tD
         KlQZQddLzINEBVzdga29BzhfvKGn4NWg9bat1H3q4cZxVxA5RG6u450jMcW7opSHcTJO
         cTRB6qU7lKuZ2g2bkFoWIihngv2Ojn1+M2+djeEuoNNV866Omsf5UusOp5WEnE8gk8w6
         StIVaMpEc9LTsfgNg2AhWyT0zWqFdlHdcJUjVPLmlGkJP54VIO1lFF/zDtgCZh40izbA
         MbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783933482; x=1784538282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vaJLAK8ySLgl5uDb74oYJMwOsz6J/SwwB/itF5wWI64=;
        b=hDfGsGnoemQu7KITlnbekI3QBq8Zc3TG3urWY8SRBkynfnb1ZUUuJv9uUTFAXQ5/J1
         ky2zSg3KUfMdJqcnp8iwpEBG0Otunoc5/HCHOlNGWkG8YT5od5kmmUF1H7kSFHndAxK3
         1JbSbvyqcMjmFnTjEZmZLtOBISXwFaiIFoE03Vcn5EjW7HyldYojTmuGAO24FcbXvkeR
         KFMdgUcEcM2NuL+ZV8P0W6ukqCyXDnWvZMutoHqPp2DUMgck+/O9k2GheqXqgQUbD8DW
         C2w1lafZJ+acXxFmb7NDk0+0ypz+e3m+8dqDeRWWIjfA3JAxtydRo7hDHqjZk/owObju
         g5ow==
X-Forwarded-Encrypted: i=1; AHgh+Rq5yihUV4drxI2MrwyL9Msgs8yMrR8w7lrQ9VgEM4yD9NqxGKWJJAqPqvLb85caDYgiEsw+zWvynEHe@vger.kernel.org
X-Gm-Message-State: AOJu0YzBldQJCmvWyhYHgKwDtxoE9tC6U/IeaHcKTM74AE4FVb/uCgzZ
	9D/QwQnSiGoCP0lHQVF/aMlO6Eh0s4BczU+RcEGTkB+22CRMO2vSFr3AVMMfU+ud4rVuNpW2suA
	1j9JvZxMWsqzlhEhCh0CGTb9xqCPJ2dw8QFPo9WpNwjgTV5luRFmhBiqEURVPM3m8
X-Gm-Gg: AfdE7ckuoxpOrNlcp+VXezO6mL5agmoH0RTK8B3WQ6xOdABRn0s7ZRyTtJCaWxWUJ4d
	9vAgny31Og+wK6u2F75kqOYEDLd7XfKzJ7jfzTsNlWKlQRs3A8T1eE18n9QE9u/Jw8QLhX3Ol3o
	BJF5s39nFeRd5NNK38kyqoyczDOPgOPsDARtQ1wH4cvRGhhThab0ysEEMu4l5VJP/ESrHQLw1pL
	/JvwlOsWZl/bZ6ztdsTxDU+x4CwemDmypJeWfbzEM4/p7rIlDekx8rjbB1Ci2aArKzYMYdczlDv
	FULEz857J6ipLfH6GTjmvbw2B7+xhMdGdwMC0JwmFw1JlgA3FHj2ExDUI6zIV2+XAiQQcyqEeE7
	y3kLX05+4xcOXDRn2Zlfo7SEJfn6jzc7O/L4=
X-Received: by 2002:a17:90b:54c4:b0:381:dc88:7c09 with SMTP id 98e67ed59e1d1-38dc777c501mr8021451a91.33.1783933481530;
        Mon, 13 Jul 2026 02:04:41 -0700 (PDT)
X-Received: by 2002:a17:90b:54c4:b0:381:dc88:7c09 with SMTP id 98e67ed59e1d1-38dc777c501mr8021425a91.33.1783933481082;
        Mon, 13 Jul 2026 02:04:41 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119c2a7bb5sm43504435eec.25.2026.07.13.02.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:04:40 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 14:34:10 +0530
Subject: [PATCH v2 4/5] clk: qcom: gcc-hawi: Add support for global clock
 controller on Maili
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-maili_initial_clock-v2-4-79548f0bb58f@oss.qualcomm.com>
References: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
In-Reply-To: <20260713-maili_initial_clock-v2-0-79548f0bb58f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=TbymcxQh c=1 sm=1 tr=0 ts=6a54aa2a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=EEPwnKkhLRp6EazAhvcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfX/SiYx3jOzuOd
 ruIFnUS7C/rWjysoNQELyRwmZvdCDCP3ixzwgmut21C2yI+z7FFg4H9z8mFFdaObBFAyXqBQzaI
 VpJd/P7CxFWiNbNgiT/VMFjWr1waJ20=
X-Proofpoint-GUID: EEsmPADWb8AEe1ipVDfACxAshdGoihwM
X-Proofpoint-ORIG-GUID: EEsmPADWb8AEe1ipVDfACxAshdGoihwM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA5NCBTYWx0ZWRfX2UH98tGJIh37
 MVNqNi7weg3H5UdLJb7plVJ7TiY5//O2LKmz11WXY8dO7bAcBhbwSJCWjFdUaKHtKtsl3+pva3V
 p5kQH+07O9/wGjo/73ymVZUPV+lUGHg2t4MpHlrnpBaN6M0+FMvrcb7XRfQVXmwll1TGX7R2HJq
 ZUDhEJRy9P3WN4rui/orbF/9hEuq7tiR5xr9dCjgarxkRs9O+/GHLZiQfLy1N1HLIUrRaRvT39Y
 dfxIopGj/JHDyMij4q+tfXKSZWJjwgGHvOcuQ4+C7wlGEF7UPomM42TSlbm5xN5solTOuYnU7H9
 zUivmJmviyBzC6MelhdQgmasPZiMp8p75caS2rP41Wgr/MBkSbHOphDln5wlFd/Y0fq+DIsNwie
 IroFKcCiURPkQxLE4izypnpyQi0yLyenPA+kSbNgjYiDZ6mAWG4VUTo08m9Kttofx+swR0cop1G
 ep4T4RlBD/XRYw0HdDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130094

Add support for the global clock controller (GCC) on the Qualcomm Maili
SoC by extending the Hawi global clock controller since Maili is identical
to Hawi and has few additional clocks.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-hawi.c | 201 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 201 insertions(+)

diff --git a/drivers/clk/qcom/gcc-hawi.c b/drivers/clk/qcom/gcc-hawi.c
index 6dd07c772c29bfeab37f620a3c97ace4aebb9acb..e632b90e5a68bfcf066bd6bb72e7021106f26503 100644
--- a/drivers/clk/qcom/gcc-hawi.c
+++ b/drivers/clk/qcom/gcc-hawi.c
@@ -11,6 +11,7 @@
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,hawi-gcc.h>
+#include <dt-bindings/clock/qcom,maili-gcc.h>
 
 #include "clk-alpha-pll.h"
 #include "clk-branch.h"
@@ -1115,6 +1116,31 @@ static struct clk_rcg2 gcc_qupv3_wrap4_s4_clk_src = {
 	.clkr.hw.init = &gcc_qupv3_wrap4_s4_clk_src_init,
 };
 
+static const struct freq_tbl ftbl_gcc_qupv3_wrap5_qspi_ref_clk_src[] = {
+	F(150000000, P_GCC_GPLL0_OUT_EVEN, 2, 0, 0),
+	F(196078431, P_GCC_GPLL0_OUT_EVEN, 1, 100, 153),
+	F(300000000, P_GCC_GPLL0_OUT_EVEN, 1, 0, 0),
+	{ }
+};
+
+static struct clk_init_data gcc_qupv3_wrap5_qspi_ref_clk_src_init = {
+	.name = "gcc_qupv3_wrap5_qspi_ref_clk_src",
+	.parent_data = gcc_parent_data_1,
+	.num_parents = ARRAY_SIZE(gcc_parent_data_1),
+	.flags = CLK_SET_RATE_PARENT,
+	.ops = &clk_rcg2_shared_no_init_park_ops,
+};
+
+static struct clk_rcg2 gcc_qupv3_wrap5_qspi_ref_clk_src = {
+	.cmd_rcgr = 0xad024,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = gcc_parent_map_1,
+	.freq_tbl = ftbl_gcc_qupv3_wrap5_qspi_ref_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &gcc_qupv3_wrap5_qspi_ref_clk_src_init,
+};
+
 static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
 	F(400000, P_BI_TCXO, 12, 1, 4),
 	F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
@@ -1282,6 +1308,21 @@ static struct clk_rcg2 gcc_usb30_prim_master_clk_src = {
 	},
 };
 
+static struct clk_regmap_div gcc_qupv3_wrap5_s0_clk_src = {
+	.reg = 0xad018,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_qupv3_wrap5_s0_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&gcc_qupv3_wrap5_qspi_ref_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
 static struct clk_rcg2 gcc_usb30_prim_mock_utmi_clk_src = {
 	.cmd_rcgr = 0x3904c,
 	.mnd_width = 0,
@@ -2740,6 +2781,68 @@ static struct clk_branch gcc_qupv3_wrap4_s4_clk = {
 	},
 };
 
+static struct clk_branch gcc_qupv3_wrap5_core_2x_clk = {
+	.halt_reg = 0x236bc,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52020,
+		.enable_mask = BIT(16),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap5_core_2x_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap5_core_clk = {
+	.halt_reg = 0x236a8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52020,
+		.enable_mask = BIT(15),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap5_core_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap5_qspi_ref_clk = {
+	.halt_reg = 0xad01c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52020,
+		.enable_mask = BIT(18),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap5_qspi_ref_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap5_qspi_ref_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap5_s0_clk = {
+	.halt_reg = 0xad004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52020,
+		.enable_mask = BIT(17),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap5_s0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_qupv3_wrap5_s0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_qupv3_wrap_1_m_axi_clk = {
 	.halt_reg = 0x23140,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -2860,6 +2963,36 @@ static struct clk_branch gcc_qupv3_wrap_4_s_ahb_clk = {
 	},
 };
 
+static struct clk_branch gcc_qupv3_wrap_5_m_ahb_clk = {
+	.halt_reg = 0x236a0,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x236a0,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52020,
+		.enable_mask = BIT(13),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap_5_m_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_qupv3_wrap_5_s_ahb_clk = {
+	.halt_reg = 0x236a4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x236a4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52020,
+		.enable_mask = BIT(14),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_qupv3_wrap_5_s_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_sdcc2_ahb_clk = {
 	.halt_reg = 0x14014,
 	.halt_check = BRANCH_HALT,
@@ -3485,6 +3618,11 @@ static struct clk_regmap *gcc_hawi_clocks[] = {
 	[GCC_USB3_PRIM_PHY_PIPE_CLK_SRC] = &gcc_usb3_prim_phy_pipe_clk_src.clkr,
 	[GCC_VIDEO_AXI0_CLK] = &gcc_video_axi0_clk.clkr,
 	[GCC_VIDEO_AXI0C_CLK] = &gcc_video_axi0c_clk.clkr,
+	/*
+	 * Maili-only clocks: NULL here to size the array to the highest Maili
+	 * clock index.
+	 */
+	[GCC_QUPV3_WRAP_5_S_AHB_CLK] = NULL,
 };
 
 static struct gdsc *gcc_hawi_gdscs[] = {
@@ -3588,6 +3726,34 @@ static const struct clk_rcg_dfs_data gcc_hawi_dfs_clocks[] = {
 	DEFINE_RCG_DFS(gcc_qupv3_wrap4_s4_clk_src),
 };
 
+static const struct clk_rcg_dfs_data gcc_maili_dfs_clocks[] = {
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_qspi_ref_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s0_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s1_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s3_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s4_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s5_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s6_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap1_s7_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s0_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s1_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s2_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s3_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s4_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap3_qspi_ref_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap3_s0_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap3_s2_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap3_s3_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap3_s4_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap3_s5_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap4_s0_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap4_s1_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap4_s2_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap4_s3_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap4_s4_clk_src),
+	DEFINE_RCG_DFS(gcc_qupv3_wrap5_qspi_ref_clk_src),
+};
+
 static const struct regmap_config gcc_hawi_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -3622,14 +3788,49 @@ static const struct qcom_cc_desc gcc_hawi_desc = {
 	.driver_data = &gcc_hawi_driver_data,
 };
 
+static const struct qcom_cc_driver_data gcc_maili_driver_data = {
+	.clk_cbcrs = gcc_hawi_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_hawi_critical_cbcrs),
+	.dfs_rcgs = gcc_maili_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_maili_dfs_clocks),
+	.clk_regs_configure = clk_hawi_regs_configure,
+};
+
+static const struct qcom_cc_desc gcc_maili_desc = {
+	.config = &gcc_hawi_regmap_config,
+	.clks = gcc_hawi_clocks,
+	.num_clks = ARRAY_SIZE(gcc_hawi_clocks),
+	.resets = gcc_hawi_resets,
+	.num_resets = ARRAY_SIZE(gcc_hawi_resets),
+	.gdscs = gcc_hawi_gdscs,
+	.num_gdscs = ARRAY_SIZE(gcc_hawi_gdscs),
+	.use_rpm = true,
+	.driver_data = &gcc_maili_driver_data,
+};
+
 static const struct of_device_id gcc_hawi_match_table[] = {
 	{ .compatible = "qcom,hawi-gcc" },
+	{ .compatible = "qcom,maili-gcc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gcc_hawi_match_table);
 
 static int gcc_hawi_probe(struct platform_device *pdev)
 {
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,maili-gcc")) {
+		gcc_hawi_clocks[GCC_QUPV3_WRAP5_CORE_2X_CLK] = &gcc_qupv3_wrap5_core_2x_clk.clkr;
+		gcc_hawi_clocks[GCC_QUPV3_WRAP5_CORE_CLK] = &gcc_qupv3_wrap5_core_clk.clkr;
+		gcc_hawi_clocks[GCC_QUPV3_WRAP5_QSPI_REF_CLK] = &gcc_qupv3_wrap5_qspi_ref_clk.clkr;
+		gcc_hawi_clocks[GCC_QUPV3_WRAP5_QSPI_REF_CLK_SRC] =
+			&gcc_qupv3_wrap5_qspi_ref_clk_src.clkr;
+		gcc_hawi_clocks[GCC_QUPV3_WRAP5_S0_CLK] = &gcc_qupv3_wrap5_s0_clk.clkr;
+		gcc_hawi_clocks[GCC_QUPV3_WRAP5_S0_CLK_SRC] = &gcc_qupv3_wrap5_s0_clk_src.clkr;
+		gcc_hawi_clocks[GCC_QUPV3_WRAP_5_M_AHB_CLK] = &gcc_qupv3_wrap_5_m_ahb_clk.clkr;
+		gcc_hawi_clocks[GCC_QUPV3_WRAP_5_S_AHB_CLK] = &gcc_qupv3_wrap_5_s_ahb_clk.clkr;
+
+		return qcom_cc_probe(pdev, &gcc_maili_desc);
+	}
+
 	return qcom_cc_probe(pdev, &gcc_hawi_desc);
 }
 

-- 
2.34.1

