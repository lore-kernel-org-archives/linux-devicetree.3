Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB06E397AE4
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 07:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977786; cv=none; b=lW6jJCyY7PCUGWvLLfcnvoGrgQHxvBI3QorE601D8TTFY210masO/OyTemQrakwCoGkFvw/3CuFpqSziPrZjMn2ClOXTcIxWTAwJuCwu05JWvFdXzbPM7toZU7y/OKBg5aCUvrdyt590ZSxgoIiYLE+SqmvHSgvAC3cIqPe43AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977786; c=relaxed/simple;
	bh=yub4U/CvkYD3oPV9zeWiAJQ3ygQBCU6NA1BnYdl9Bd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Klm4dp6IHoC+zgPLzt0ZfqmQVThPElK33my4XaLQMs07JTHIcJADFIkcGzlKpRcmaEo/9Bb2dEGkam2azRgRBnbm7JjSR0oA6f3H+ULAl0VRwb6XogA5YR4sq5nmCXgC1fyXfGuNp4WiQUjGYD9yJST4BbKidP8NwUuzi5C2pN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mYRP6RTe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HHOh+NZJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mYRP6RTe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HHOh+NZJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6627TsUL3964234
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 07:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	osvNU6j8SnYzpLvYvhys/dQ4JJErXHbw9AsPU0m2wBQ=; b=mYRP6RTedEwalLQt
	kkldyY95VJt3b7EhNFIPfKn5e1vTejZK/6IK0GjKIOfQi+LfuXw2ZJRdLGwqouk2
	SSCYsfUpVfMp10TrevZhAEoq4JN/d+holAWya0oHWTbsXKe1LKn6BD684nAWPfKK
	zLxSVTNHWKcTKUcJ/Jsb/qSs7E6v6v7ij7otDzUxANse6Ri12wtuKQcpDhZs7Iug
	HbXhA/OLEByNmn3EvuRInk7PCvUv3f+EQEhDwIziZQICOQhLYhBSMecCo8/IDG5d
	NauiqYxPSYR+5H0UWmmaobo0Bhf7x3BT38/etstgDRwUkZclBQNTs1vvDDoGBHtX
	lnWBSQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5knc00tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 07:36:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c6a20348ceso22220285ad.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 00:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782977781; x=1783582581; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=osvNU6j8SnYzpLvYvhys/dQ4JJErXHbw9AsPU0m2wBQ=;
        b=HHOh+NZJcwl9LbD4cr7caIZ9xmG3pUrDyQYABTlFWPBZrRwG/Hszqc6JkZDcl2Avnt
         rxp9EUw9bBx8W7eMtW0gwbVCvg/3TIKgiqMgXTuFtDb5BN7T4etmW98TsuEeozaCmpq/
         +ZV6zeEHiZ26jKT+QhLyZUhWBtEyfOORvxGbpuRXCOheXl45lqPfJoZB+lb+mPSv4iz6
         yhZMwh/TPi1OA8JQXPnBNhlWTunUw3JGg/FH8Tnvn7gffPosMR/dZhn0oIGprAU4dcyE
         9hF9892A1azmRPbNmbZyTUCXe1lAVIqLSjoXgG+mvyFc9axQLVMP3W9R5vOx0KRBWbYb
         ySGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782977781; x=1783582581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=osvNU6j8SnYzpLvYvhys/dQ4JJErXHbw9AsPU0m2wBQ=;
        b=Yw2e5ORuSpN95uCNwqPrkSxKMixK3BKXv0620T6Nw0eEzL0Kcq8fDMFsVwZiGlZJBS
         jZ7BrEVBzK9Bh8vbBx0WRApHTkMvBPxeg6StBPt17ostCl86RYtKPmDzJ0qlFTLVlqfJ
         eJD1Jthg83ExOCMIPDfvH1Kp2KAyEZoU86Zno0DTBfmRvfUVNTvtLOzgHtftdiFOWPZk
         SAl1FRRdXELzuGbG9bGG9LjXPJzR2hchCGuB4KIfu2eoxdZhEJwdF/pvgLeGMH5ObFhX
         9LscROo1yob5PvgXYqkxoQnttHScYJbonQzfspNKDXeZQJ6hIgRm0MY1WWTp6daVJLCw
         160Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp4r1EDPDlgl8lwfUQkSwLqmSkl0dd5gNV3xBxOarAECjR3MvAJzHXj4mFVcwmFvl0mW8grFUfUrbEZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs2Ra79AeNzHgoeearL2kzE5rGZW8+eWXst8rXyCS3ZKrfkusr
	ba8CgDNeWiS9NNbxfzsbsRsALxE+2//kAYMTM84cQMbJ2iIbvJlvCE7b42RBEA2nA8fLjkcnE8c
	J+urR3d0yAt9vL0SweY0xyhSOB9dsjrO4UBL9W6aTWzVE46ULDgYad9QBHH64xFy7
X-Gm-Gg: AfdE7cl3PGAZw4cAhgokbSZ77mnvp1qncBJMnwAqqIDU5hl+C3nODPu8tQgrIH8LH7m
	BPHebGu495G60wkoQ2qKzB5y20r+D4/uhF5cSF+bFbDMK+yaLHaZQQSCaCl3dUq6IswaLpxxHoH
	BNQkEaaT1XNrFsKIo6UmvrUCUhB1LTb2/xtJdgZRwIrArmZ5I42HUxIxZBPV+YCO33+vYzj5hMn
	m/9IDDOb5Iyb/PrNRbEMzNCm9tl+D/iaN9Yh68H6HIPS+tH+kSbLTOjF75dh4C3jrfLLEOMduCQ
	xBRnqc9bFdEY2E50zQY4WiBqIUtvYMfgrhKrDUiBW08mOfJpHwO4hYLobLkItcmTidfu3sNiYD7
	q70byh2EZye1Z7VBH1Xim2p3LTHHFIa4Zyy5tyYC4KYHDuVSGKFCbSCu/EQ==
X-Received: by 2002:a17:903:2cb:b0:2c9:c5bf:2872 with SMTP id d9443c01a7336-2ca9112ca8cmr41603535ad.1.1782977780438;
        Thu, 02 Jul 2026 00:36:20 -0700 (PDT)
X-Received: by 2002:a17:903:2cb:b0:2c9:c5bf:2872 with SMTP id d9443c01a7336-2ca9112ca8cmr41602965ad.1.1782977779805;
        Thu, 02 Jul 2026 00:36:19 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a905d0dsm9342275ad.24.2026.07.02.00.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:36:19 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 00:36:14 -0700
Subject: [PATCH v7 4/7] clk: qcom: tcsrcc-glymur: Add regulator supplies
 and migrate to clk_ref helper
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-tcsr_qref_0702-v7-4-776f2811b7af@oss.qualcomm.com>
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
In-Reply-To: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782977773; l=13220;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=yub4U/CvkYD3oPV9zeWiAJQ3ygQBCU6NA1BnYdl9Bd0=;
 b=O4w+SecIaisFavbbb5f3Mpi1dEwGepSGclQTcJVFeTtXYyFHW/WqBTaE+LS/Xz3qQ919CrgwU
 c5HTFKAT1ZfDMr9s+UFGtEt8cjsOl0j1vABqwkBeZDjTHlO0QvnyfDT
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: JIDl-oSgZxYV2igyjHC7C2Oio3xn8Tro
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a4614f5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=QwI6o0JXcUMaZQCC76IA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA3NSBTYWx0ZWRfX72TGPXfNNI0L
 UAizpBCSRyIhVo7dCdNhBqJGzL5AqPW7ZCaWbhpk0oii9/A4pokQ7ZCpsIa+H1ybe3SK4sL6wiw
 ZDH7BTR/BmQfRC6D1YoZwbn7CWFmsU63XUjAl0S2JKvYaxz9mWk2mkbv0T6qRtkwDEGk0zRu+YD
 qj2A/GcqJrDiKpcECla1MRVmlULT+nJgmAUsKB7EEk1iVwSPeCLE+5POCaYiUTuY7FNOiph1Ooo
 gX6/Zvh0rCkKxq/b8RH0qcYWDA2W3iexPHKep/zAoUTYMgp1SfzFw0KjlMGo/ppB6h9Enxc2fRw
 LBIZyG9KHbxiDqqcuyZMk5aH6c45NzesO1pofYeD1SGADCzGHigGNRZ+7cSCzFbgcHdKJhFOCuM
 /Z0Vz86ViLPVXTpuQH9rPg+Yv+trzlUrCmVJYduJoesKt9/3nLoWQQnmiDQnlUMH5Y+/kE8ynRN
 sf1imtHP6aJEvWMIarQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA3NSBTYWx0ZWRfX0anFPWBg/DjR
 8FLYtv+5iRHMRF93A5XOTi8FG+Q0SN2nEEBoV/e1hxp1yD06BSDWtHsS3LhCgogKdXUYXdcxp1A
 xbnBs1rTgcTSd+k+iUFzaPk792ktYa8=
X-Proofpoint-GUID: JIDl-oSgZxYV2igyjHC7C2Oio3xn8Tro
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020075

Replace local clk_branch-based clkref definitions with descriptor-based
registration via qcom_clk_ref_probe().

This keeps the glymur driver focused on clock metadata and reuses common
runtime logic for regulator handling, enable/disable sequencing, and OF
provider wiring.

Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/tcsrcc-glymur.c | 361 +++++++++++++--------------------------
 1 file changed, 116 insertions(+), 245 deletions(-)

diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index b44fccb795c6..e0b545258ba4 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -4,276 +4,145 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/clk/qcom.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
 
-#include "clk-alpha-pll.h"
-#include "clk-branch.h"
-#include "clk-pll.h"
-#include "clk-rcg.h"
-#include "clk-regmap.h"
-#include "clk-regmap-divider.h"
-#include "clk-regmap-mux.h"
-#include "common.h"
-#include "gdsc.h"
-#include "reset.h"
-
-enum {
-	DT_BI_TCXO_PAD,
+static const char * const glymur_tcsr_tx0_rx5_regulators[] = {
+	"vdda-refgen3-0p9",
+	"vdda-refgen3-1p2",
+	"vdda-qrefrx5-0p9",
+	"vdda-qreftx0-0p9",
+	"vdda-qreftx0-1p2",
 };
 
-static struct clk_branch tcsr_edp_clkref_en = {
-	.halt_reg = 0x60,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x60,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_edp_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
+static const char * const glymur_tcsr_tx1_rpt0_rx0_regulators[] = {
+	"vdda-refgen4-0p9",
+	"vdda-refgen4-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrx0-0p9",
 };
 
-static struct clk_branch tcsr_pcie_1_clkref_en = {
-	.halt_reg = 0x48,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x48,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_pcie_1_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
+static const char * const glymur_tcsr_tx1_rpt01_rx1_regulators[] = {
+	"vdda-refgen4-0p9",
+	"vdda-refgen4-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrx1-0p9",
 };
 
-static struct clk_branch tcsr_pcie_2_clkref_en = {
-	.halt_reg = 0x4c,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x4c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_pcie_2_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
+static const char * const glymur_tcsr_tx1_rpt012_rx2_regulators[] = {
+	"vdda-refgen4-0p9",
+	"vdda-refgen4-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrpt2-0p9",
+	"vdda-qrefrx2-0p9",
 };
 
-static struct clk_branch tcsr_pcie_3_clkref_en = {
-	.halt_reg = 0x54,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x54,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_pcie_3_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
+static const char * const glymur_tcsr_tx1_rpt34_rx4_regulators[] = {
+	"vdda-refgen4-0p9",
+	"vdda-refgen4-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt3-0p9",
+	"vdda-qrefrpt4-0p9",
+	"vdda-qrefrx4-0p9",
 };
 
-static struct clk_branch tcsr_pcie_4_clkref_en = {
-	.halt_reg = 0x58,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x58,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_pcie_4_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
+static const struct regmap_config tcsr_cc_glymur_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x94,
+	.fast_io = true,
 };
 
-static struct clk_branch tcsr_usb2_1_clkref_en = {
-	.halt_reg = 0x6c,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x6c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb2_1_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+static const struct qcom_clk_ref_desc * const tcsr_cc_glymur_clk_descs[] = {
+	[TCSR_EDP_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_edp_clkref_en",
+		.offset = 0x60,
+		.regulator_names = glymur_tcsr_tx1_rpt0_rx0_regulators,
+		.num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt0_rx0_regulators),
 	},
-};
-
-static struct clk_branch tcsr_usb2_2_clkref_en = {
-	.halt_reg = 0x70,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x70,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb2_2_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_PCIE_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_1_clkref_en",
+		.offset = 0x48,
+		.regulator_names = glymur_tcsr_tx0_rx5_regulators,
+		.num_regulators = ARRAY_SIZE(glymur_tcsr_tx0_rx5_regulators),
 	},
-};
-
-static struct clk_branch tcsr_usb2_3_clkref_en = {
-	.halt_reg = 0x74,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x74,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb2_3_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_PCIE_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_2_clkref_en",
+		.offset = 0x4c,
+		.regulator_names = glymur_tcsr_tx1_rpt012_rx2_regulators,
+		.num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt012_rx2_regulators),
 	},
-};
-
-static struct clk_branch tcsr_usb2_4_clkref_en = {
-	.halt_reg = 0x88,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x88,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb2_4_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_PCIE_3_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_3_clkref_en",
+		.offset = 0x54,
+		.regulator_names = glymur_tcsr_tx1_rpt01_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt01_rx1_regulators),
 	},
-};
-
-static struct clk_branch tcsr_usb3_0_clkref_en = {
-	.halt_reg = 0x64,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x64,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb3_0_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_PCIE_4_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_4_clkref_en",
+		.offset = 0x58,
+		.regulator_names = glymur_tcsr_tx1_rpt012_rx2_regulators,
+		.num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt012_rx2_regulators),
 	},
-};
-
-static struct clk_branch tcsr_usb3_1_clkref_en = {
-	.halt_reg = 0x68,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x68,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb3_1_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB2_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_1_clkref_en",
+		.offset = 0x6c,
+		.regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
+		.num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
 	},
-};
-
-static struct clk_branch tcsr_usb4_1_clkref_en = {
-	.halt_reg = 0x44,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x44,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb4_1_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB2_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_2_clkref_en",
+		.offset = 0x70,
+		.regulator_names = glymur_tcsr_tx1_rpt01_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt01_rx1_regulators),
 	},
-};
-
-static struct clk_branch tcsr_usb4_2_clkref_en = {
-	.halt_reg = 0x5c,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x5c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "tcsr_usb4_2_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB2_3_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_3_clkref_en",
+		.offset = 0x74,
+		.regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
+		.num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
+	},
+	[TCSR_USB2_4_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_4_clkref_en",
+		.offset = 0x88,
+		.regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
+		.num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
+	},
+	[TCSR_USB3_0_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb3_0_clkref_en",
+		.offset = 0x64,
+		.regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
+		.num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
+	},
+	[TCSR_USB3_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb3_1_clkref_en",
+		.offset = 0x68,
+		.regulator_names = glymur_tcsr_tx1_rpt34_rx4_regulators,
+		.num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt34_rx4_regulators),
+	},
+	[TCSR_USB4_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb4_1_clkref_en",
+		.offset = 0x44,
+		.regulator_names = glymur_tcsr_tx0_rx5_regulators,
+		.num_regulators = ARRAY_SIZE(glymur_tcsr_tx0_rx5_regulators),
+	},
+	[TCSR_USB4_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb4_2_clkref_en",
+		.offset = 0x5c,
+		.regulator_names = glymur_tcsr_tx1_rpt01_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(glymur_tcsr_tx1_rpt01_rx1_regulators),
 	},
-};
-
-static struct clk_regmap *tcsr_cc_glymur_clocks[] = {
-	[TCSR_EDP_CLKREF_EN] = &tcsr_edp_clkref_en.clkr,
-	[TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
-	[TCSR_PCIE_2_CLKREF_EN] = &tcsr_pcie_2_clkref_en.clkr,
-	[TCSR_PCIE_3_CLKREF_EN] = &tcsr_pcie_3_clkref_en.clkr,
-	[TCSR_PCIE_4_CLKREF_EN] = &tcsr_pcie_4_clkref_en.clkr,
-	[TCSR_USB2_1_CLKREF_EN] = &tcsr_usb2_1_clkref_en.clkr,
-	[TCSR_USB2_2_CLKREF_EN] = &tcsr_usb2_2_clkref_en.clkr,
-	[TCSR_USB2_3_CLKREF_EN] = &tcsr_usb2_3_clkref_en.clkr,
-	[TCSR_USB2_4_CLKREF_EN] = &tcsr_usb2_4_clkref_en.clkr,
-	[TCSR_USB3_0_CLKREF_EN] = &tcsr_usb3_0_clkref_en.clkr,
-	[TCSR_USB3_1_CLKREF_EN] = &tcsr_usb3_1_clkref_en.clkr,
-	[TCSR_USB4_1_CLKREF_EN] = &tcsr_usb4_1_clkref_en.clkr,
-	[TCSR_USB4_2_CLKREF_EN] = &tcsr_usb4_2_clkref_en.clkr,
-};
-
-static const struct regmap_config tcsr_cc_glymur_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x94,
-	.fast_io = true,
-};
-
-static const struct qcom_cc_desc tcsr_cc_glymur_desc = {
-	.config = &tcsr_cc_glymur_regmap_config,
-	.clks = tcsr_cc_glymur_clocks,
-	.num_clks = ARRAY_SIZE(tcsr_cc_glymur_clocks),
 };
 
 static const struct of_device_id tcsr_cc_glymur_match_table[] = {
@@ -284,7 +153,9 @@ MODULE_DEVICE_TABLE(of, tcsr_cc_glymur_match_table);
 
 static int tcsr_cc_glymur_probe(struct platform_device *pdev)
 {
-	return qcom_cc_probe(pdev, &tcsr_cc_glymur_desc);
+	return qcom_clk_ref_probe(pdev, &tcsr_cc_glymur_regmap_config,
+				  tcsr_cc_glymur_clk_descs,
+				  ARRAY_SIZE(tcsr_cc_glymur_clk_descs));
 }
 
 static struct platform_driver tcsr_cc_glymur_driver = {

-- 
2.34.1

