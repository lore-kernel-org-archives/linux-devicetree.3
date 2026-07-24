Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F6041D23A
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887846; cv=none; b=hbpK1DJRoRrPrjXVbHNjtelPCCnE9rrjzf39RtPyeR/kt9Tn3hNm6afUmdl1ZrGZ3/JJMa+SdYfUqfS6rAuBzsT/zL5HYbuqhPKjIvAQvNv320TuveZd9YM6iPfeqevfKN9v/GTKgnCAyhh0Q+gaspYBf79cRIwE4lBEcfSWFN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887846; c=relaxed/simple;
	bh=qKIN8ivbky/mzYlU3o9O7eKtUmLWGmC8xFf7bDGFmgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I9v7WX8ShpHVcewhqf++xjxvkwC8L8/xdCgq/w5Hxag18EIjaG53vHEbB23DAl3pF7EH+YCkQxWbXqkbRxePyr+Rv+aETguA/BoewmuTz+kUyXDfy48V951Fbi65yhQhC9siNEZEe5H/pgySJyslh15WT/BUfTfI1OxLKiC4VJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OcUTxVTP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xl0fKgpf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OcUTxVTP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xl0fKgpf"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lL3f1992296
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N03XR/kMCYWjs+Sw5rqcqQg13PGoD95Dg1Hfycasniw=; b=OcUTxVTP4jp/kUwL
	MUq+md44Kq/IAj/VjVAhizUleydIjFG3Vbl2li/kSMHebskXwIeE84XqoRQ64FOs
	DcfhumzEgVbs44hW+lwliR9EYpPFH/pU08hpvrhEaXS5bk1T3uPOcS2YmCN4Y5FZ
	KiZu1XSFcu80sk/cD+N2FBEQXrLjT3Fx+PyUY6EyaNEH1w23L/b+PTZO+BWN//ei
	dncZE7SBfO1hzVALswZfD3NeS3fhL7ndCFEQVxC3zAAj7VYzhduP0EagoTxF5eth
	q9s+QACdHtDLb7yup05WrPmDqrlNRr/hqHgTMgrgNmm7500eZqn/pxyhrJy5L3zZ
	vlrpHQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p51953-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 10:10:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce8a76df2dso5092315ad.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 03:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887840; x=1785492640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N03XR/kMCYWjs+Sw5rqcqQg13PGoD95Dg1Hfycasniw=;
        b=Xl0fKgpfrwZFZHwhyKS9aWzCY2ws+8jUv+OPNqtvBAnxJx30Fe2l7zC5yCT5BfEI8d
         vxEsB00/C5BqGbW2wGwQ8KPYQ4gPHEnvJW/+2wcISYmnujrdaxNixDh1KEP0Zua/owK8
         r0dfBrEf5N129zBefLkkDorxTpExZ/WwF6a3tzGKJpT0wkrsO7OdkhAJWWJ/v3hvkYqZ
         BMtMUnEE3IFRJJAvuTx9e6WFGkSVBs9mD3DTukc6JhQNkCHsYGN4Xfxy/EAZD69BwA+F
         CIh/F0XK76tkdJgZ0hxke8sPA2fpSPBouEvcJMN9dOo0yKT3Mcrsws+eMOY9sAF6hN/s
         r9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887840; x=1785492640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N03XR/kMCYWjs+Sw5rqcqQg13PGoD95Dg1Hfycasniw=;
        b=TUteuoLXV48OXktoBBEjH3jSSO2xfBSkPo5yMB3ThL1tJhmmTWfLhNMkrDgKMX3yRl
         ApRF6TRaa5o9gZCcis4HUhufvPi65twttGBaWrgEq87EiwNC9AGsMak1MO7i276B/B3l
         E0+jz2nN94mIbNp/YWHPTnw0uX3u3vqiE8c9sKVrEwL4I2d11K0UPXfNupt3hQC+QbYT
         yrJGBj74UZrXeKztooSllwz2c5aVlQsHgNncfzHbA+PQ+5ei1sKTP51oQvkjU5zQJYYb
         ke/Yl1fXHVcADaUkkz1aOdD/PSB1lg5jdoWnbZBehxWr+0o6fZwFqZuH6i6+ak5+qXqa
         S4LQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpr3CVZAWWMjDEvzFlp2Y11sJdVXL0hwt3VF4G9Pq8pwW4BeqIHB2ix/8a3Hz/tI/JFXxKlhXnf7Um5@vger.kernel.org
X-Gm-Message-State: AOJu0YwIPfKZ0FPJG80Cs2HVJQLX+6vJYCBQoToX0/Mrd1Mp7ofLZqf7
	Y8BtDLyOAMD6T25jkWSmvRgCHfUenaQa54cjABN3HiB1U4dhgUtX3UrYWJxcoZo5F7cXsW+VMkF
	42A6epyBpzAP8N43u7PKQe1ldUdrHtgggKR0H3ruw/KPNXunmBUXNOd7938lbzaOk
X-Gm-Gg: AR+sD10UH3msU3fllRJ+6MrY50lD5fLxaXt4JwkToyQGx1pV+0QwjTdrj6uzrmwaDf2
	Q2g0r0g8TyzIxd5XifuKgrUaCJXL4hOPi4zhiBnnPFXyN8ErUi40FbWi1IcIiWBp11Zm/vmO4Wj
	fH71XsiXCZrnhafyGfN3BSAk1fmrSZUjZ9p4gRmeLg5oiKm9OFRPFIVnkYC9l+tGDjTZ3cgmMRH
	H6VDGkvAH9KSOOXFqLPMzJBMlRGTm+okrgSJHWLYt6sk/E7o51yTceWa7315efZwQkhQTjl0Aw3
	fsT5KtOXiNFOUeNl97Ym3nq0sxpcjdL/8LaTgIaV8DoQeHIEhKs1xWPGcZE4gMYwceZR3e9eoTm
	GOBCDHaHToI8Ac9iZvIPKC0m/
X-Received: by 2002:a17:903:2383:b0:2ce:88d7:a233 with SMTP id d9443c01a7336-2cfa71aa8ddmr82827545ad.33.1784887840161;
        Fri, 24 Jul 2026 03:10:40 -0700 (PDT)
X-Received: by 2002:a17:903:2383:b0:2ce:88d7:a233 with SMTP id d9443c01a7336-2cfa71aa8ddmr82827255ad.33.1784887839748;
        Fri, 24 Jul 2026 03:10:39 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f390dd2sm47863705ad.79.2026.07.24.03.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:10:38 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:40:12 +0530
Subject: [PATCH v3 4/5] clk: qcom: gcc-hawi: Add support for global clock
 controller on Maili
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-maili_initial_clock-v3-4-45b577241c91@oss.qualcomm.com>
References: <20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com>
In-Reply-To: <20260724-maili_initial_clock-v3-0-45b577241c91@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a633a21 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=EEPwnKkhLRp6EazAhvcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: S5ubJYR-WLUfwTRZ6-WA01h0LsktVjNr
X-Proofpoint-ORIG-GUID: S5ubJYR-WLUfwTRZ6-WA01h0LsktVjNr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX0TsroDXdbNrK
 gAEGiJkISSDrg/nxdrPNhn+e/DfFu39gQcif9SekX4KOX0J1M80ZjMgBJfHFZ3uMf2g4Wa+KPTb
 ALx6mmimpfELSPNKpxuGnxpO1OUrwZo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MiBTYWx0ZWRfX6/SEKojSx+w9
 YRb5V+4jeFDwdPJRf2ip7U4aelWhWTFy1gbEIN4UHOiup1XPrnszQguxcvgYc1BgYzrfIfd0x7b
 DpMJHum1YdgRIpIs1d9IFD1kXd85QddcO7qboGLNIJsHKWXvPgbbg3Dtzj7BirI6kpR8/fbFXV9
 vFgdkZ+HVIu85UtIVSc0yEDVmtabWrm2iS0PkKK7aB0ol1o9TFQ+h3L/jaSd0xwMXhmWIHAJzYz
 YlWhy2LBUPZO6er6gqSxZJooPiTPA2HMWGoxdo/efNe/SCTF7tnQbWXpLTK8RPUNEYNTjvD3jUY
 xNUBk1bmzGtfqCy41xuSuXtFHxl2jg+3Yn2ZBgT2o+23zOe5dqufr2iuUO8egsdafhN/dyJzBSv
 aysdz8JUParHJp6i4WL2YqN+/Hde56uXr+P5C72lysbKEcGleDuOESP9CS16imGHP3qGE5Jflv6
 PMRxNKVWHzgAgq7SrBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240092

Add support for the global clock controller (GCC) on the Qualcomm Maili
SoC by extending the Hawi global clock controller since Maili is identical
to Hawi and has few additional clocks.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-hawi.c | 201 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 201 insertions(+)

diff --git a/drivers/clk/qcom/gcc-hawi.c b/drivers/clk/qcom/gcc-hawi.c
index 6dd07c772c29bfeab37f620a3c97ace4aebb9acb..ff1873c7e5477fd1d44ec2ba9b3c74cdfd9db5cc 100644
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
+	 * Maili has more clocks than Hawi. Ensure the array is appropriately
+	 * sized and assign the additional clocks in .probe()
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

