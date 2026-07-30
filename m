Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFC84483A6
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785434110; cv=none; b=gVRSFkleqhEizaFPDEbttKfV6KjJc7JWwQcZQg9W3zWNHDvK1ijLozhYRXDVYTGaT46JQrRJBJTOG1+wlSFNVYkwLBzugAlr4Os9f8XQFMTyFprpcVWBC9iGiXZnENsFesmpimfcNr/3ikPjZLQQ/HzUo8snFxJxohQ1dwQIMdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785434110; c=relaxed/simple;
	bh=zBWSry3MCgyCG3hMn0lkPGsLUbsPt+wsvwdFS0LXNx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ohn66M2GBeF/nW5RC9Xx9Z385oVS9IIRs4vaxwzrShKLko6ihLrgo5RosWpncMdZBBS7wUhu1Y2vEqNb8O3aPXcRBxcMsiR8SMH8OW1VPg3JMHkf0vBqACjG22g2kzxI+oYykiyFrSp/UtE03e5mt9p/eRRj6CTxYr8lLfkN9tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1m7ywx5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DCoUCGKE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1m7ywx5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DCoUCGKE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGX8111629334
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jy7t8DOefuoEEsSbJK5qawrz5g0ZW9MYdCPDwcUCWFQ=; b=d1m7ywx52HtkYqmD
	3iKI0MfOVcVmAgwnkBIUqL24TbiQ0Jz0lIahA0E8d3ct5g3tkKv6524Z+Tnp1PQ5
	JDyts+EQVuLC9EECzMoL/hhMz4Ddrc+bXlTIWANF3LRZgMY5/ecBLjXpz/1SUqUL
	8oKoJfYqVsxawJob6IlzOn+dHsdAzoOM7Ubo7YKJ/uN9WCG4GwVtLwioiezkQkzq
	5QF73LcBvkH8Yubn8PZCZp2WOwhw6D2IIYmdM/IbgE27TNevX00I+PnqALCB3Diq
	LcNsEU626qLFWplxDEpJseTxu9AU2inIj/+495T9sHymkuj+j3F9qNvmmlgYUgx3
	a8Qo5Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr7q3hars-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 17:55:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso115195a91.2
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785434106; x=1786038906; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jy7t8DOefuoEEsSbJK5qawrz5g0ZW9MYdCPDwcUCWFQ=;
        b=DCoUCGKECYKNYnhDiy5kEmQk57v8sPAuI7MNblbJ3rm3Uls+65zz062lmPDGnZ0SZd
         9oTlgFn6A2G5fQwX+j762PRvgQ8nPTDFL66k5q8wPfWToQeFDGcSFPZahBizUqKIR1JQ
         PbIslwYM8DUDHocG4Cz1L/kASCVaPtv3/s+BB8g+txmViK/rfyRoCvwsKJ5nyjNvK4zT
         xb3FDnJDlyxzUXWODqevNkvPN9qnS5oiOflnigqg7dGhwe8pQKfo4hG/i4Dd+BlMII4z
         TnZzXiiJ/UziI6ftJsFjmmmxe6n8DTwWd3zWQOxfaDUDJLhxuM52mbChYMd6YKPmeG4B
         b6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785434106; x=1786038906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jy7t8DOefuoEEsSbJK5qawrz5g0ZW9MYdCPDwcUCWFQ=;
        b=IMit4Q8vg9xDqPfZlo56y5jGdpL6hwkjDVyRqH2FUItHnP/5yg3npC8WSbU4W/7MAt
         z2Cd1CvwYcFdpdPo5ItqH4S0SVFp/AOvvfuc0iucAETBTLAEL7Joc1xITAHjzKB6f5CI
         MxrV3/a2vmNa4qVRQ4yIUv1W8smhD86IHk2I/CkhUpdwXHaNvvKHiCVtIDrEMn/MsNFA
         lSXWVBZCVkMDGMzguoG6jwmueC9eN52unQIJziM3TcWF6Arwc2CXtEQTbL/inZGLsXcA
         L1X4+XL0N0rsXoW0GzqiHqqQoICZcdqvx7yc+WIQ+g17WwWYQ41sVUg2l6LQZ/5HYRxo
         6kHA==
X-Forwarded-Encrypted: i=1; AHgh+RrHIdG411Qp43HHULgT8UdIBJwDx/CFO3rtr8dCFEDimtn297A+ge3cLChJYsdejyT+2GjxORFbMGBJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6MsY1z5U54f8BYnLBomxZh5ZpxrH/PLg2mfV70FAWEPBQWHoA
	zLc2okGQBZDYri+A1f63QMyDlhmWvA//shRe9XEepvtyQ4qNBhEQ5I2pDVFVqGOW4icu4PG3fei
	BIfGzFns8YwarkzIynGnTR7kk4GPqJUHF3YMHBMKkQzEfB+IXjQkSLucw47NNs2F4
X-Gm-Gg: AR+sD11cQkifIDuzWVUewK997pVdH3lbNkT81WP+9y3X0mPzLth44SvdH+uDZY3zELK
	jLs64MoMnLj//4MyEp/7VdJibRZ8owHh1u1kp/QGOpzHi1t77GKitPpQYA0C22ROfuYf2ShVZeW
	XvEKoAyVFMLWubS9wbNDSoc9kG/jkAaP7KeRQE4AAmuxuf0R0rbNN3fJ1OfH04n5K3rTtDF7+Pw
	DqENYWgGzArmaSYXJjFy53dkUIgFbgVmS8ovaZkdDo34xvCVcEQ78n07tMO1JX5KYKJLcMienza
	D+BPblmzwwLjhIRZ+1nmmUypt4VnTcm8foJwajQnHnhQwrEXTfe2jNA9ellz7k6z8sGFUMd/7oE
	4reXtLbzH9u5Zr2h31//1QmpW
X-Received: by 2002:a05:6a21:9983:b0:3bf:6c04:a819 with SMTP id adf61e73a8af0-3c900945d23mr3468950637.58.1785434106469;
        Thu, 30 Jul 2026 10:55:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:9983:b0:3bf:6c04:a819 with SMTP id adf61e73a8af0-3c900945d23mr3468924637.58.1785434105940;
        Thu, 30 Jul 2026 10:55:05 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm36444098c88.5.2026.07.30.10.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:55:05 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 23:24:37 +0530
Subject: [PATCH v4 4/5] clk: qcom: gcc-hawi: Add support for global clock
 controller on Maili
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-maili_initial_clock-v4-4-ed52ade264f0@oss.qualcomm.com>
References: <20260730-maili_initial_clock-v4-0-ed52ade264f0@oss.qualcomm.com>
In-Reply-To: <20260730-maili_initial_clock-v4-0-ed52ade264f0@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEzMyBTYWx0ZWRfX9g1DXkOxlqDb
 pDtgKiXW4yMw7zO/O6NKqjYEzEIK87f6En6++y7ZzYKqHduXNPNrnBhSRurOAVDk9PpD/Ao7CE+
 IxNb41QqmdewhzQ0SI8oQAn/hpC8SxpvFPKLJjjnui74+I76b7w7CQFyui0O7bJoBAeE1U2nG7Q
 1AA5tYT+EF2en7zxhF4q680aBGPsd6OjFx1J77z1Q8MBqMx16wz/p5KSSCXFaENVmQyHgY+je1R
 6aM458hPQCHYUrpDpUKCqWdvSS8vwIThW1gn3FJ5IK2WjCv4q8UmD7etrh8nJ7uxBcRq+aaNKqX
 0q77eApB+4Ok797qUtCxvmoFruldJT70qKP1Kb6M+1AnmoZMYvq0XEmKjmLzq/0VkGBWBno2SoQ
 1FKp5P3Mk+d2QfA3kjJ/k71hyulwV08PCn1TUXfeZSf+DOf8JZjHoumvMx9wUvZ3vxNeGIOq22N
 1dGq0hIcZsE3UtLV2KA==
X-Proofpoint-GUID: qRj7CobTthnQRFaw3quRzlQyRlVFDTxU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEzMyBTYWx0ZWRfX6BYOgGzVrSVj
 d1VA3a+dIa1OeX5dzDX9xqk9LmAZbqbJVCsgr1HedLfCvu5f42fIEMvlmm7z0EmEKhlRFm/ScY3
 w3vWXQP1LAXgekKJKGN8hHRqOIs7iIw=
X-Proofpoint-ORIG-GUID: qRj7CobTthnQRFaw3quRzlQyRlVFDTxU
X-Authority-Analysis: v=2.4 cv=WuQb99fv c=1 sm=1 tr=0 ts=6a6b8ffb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Jka0VJxv6weEfD1e8roA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300133

Add support for the global clock controller (GCC) on the Qualcomm Maili
SoC by extending the Hawi global clock controller since Maili is identical
to Hawi and has few additional clocks.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-hawi.c | 201 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 201 insertions(+)

diff --git a/drivers/clk/qcom/gcc-hawi.c b/drivers/clk/qcom/gcc-hawi.c
index 018411e4f4020657028f5636f746a4659d7315e4..6fb5a3db9586403f381a72f0066512095fb514d6 100644
--- a/drivers/clk/qcom/gcc-hawi.c
+++ b/drivers/clk/qcom/gcc-hawi.c
@@ -10,6 +10,7 @@
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,hawi-gcc.h>
+#include <dt-bindings/clock/qcom,maili-gcc.h>
 
 #include "clk-alpha-pll.h"
 #include "clk-branch.h"
@@ -1114,6 +1115,31 @@ static struct clk_rcg2 gcc_qupv3_wrap4_s4_clk_src = {
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
@@ -1281,6 +1307,21 @@ static struct clk_rcg2 gcc_usb30_prim_master_clk_src = {
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
@@ -2739,6 +2780,68 @@ static struct clk_branch gcc_qupv3_wrap4_s4_clk = {
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
@@ -2859,6 +2962,36 @@ static struct clk_branch gcc_qupv3_wrap_4_s_ahb_clk = {
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
@@ -3484,6 +3617,11 @@ static struct clk_regmap *gcc_hawi_clocks[] = {
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
@@ -3587,6 +3725,34 @@ static const struct clk_rcg_dfs_data gcc_hawi_dfs_clocks[] = {
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
@@ -3621,14 +3787,49 @@ static const struct qcom_cc_desc gcc_hawi_desc = {
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

