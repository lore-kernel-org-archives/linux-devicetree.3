Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7332FD681
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 06:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775025340; cv=none; b=drMZ7Ehp85X8jUbl74GMVbZcOUgMwUiHmQBiep68Sk3RJRbQR5TVxfHRc+Q5sd54oTQyXjhPELKehDgpPIEQib/9IPXu8u9bVJEpNljDueqsJcMUPH8EmauzD0cPibTcZsMzxCSkaZ6NfsxpX2qifgerpkG79aWsHCIjIoB9wPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775025340; c=relaxed/simple;
	bh=O/xzz3OyQHlZaY8PTjkJNEJgipL9OgU4S64AIcv/hgs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KcxjIGuwnTHjnGSSLYnO6fAEJzSvwST1q7YkkCwnbapMjmQ17LM8oGi5RbFLfjExhmC7v7gqrD7xd++mWKdRqSn+kLnznO9QlxIcElXwFYo1hwEAANfsoLsv96MDPz0EeYjuuiXJp0MVuh5Yjtey+jGSbTVJyQ3Do5d+I6GHvHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=anrDKIsM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/5uemv+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="anrDKIsM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/5uemv+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6310TOgv3103955
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 06:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3OkA6pQW3yk0X7dRpa6C7L1ZcGiFUnl8OuBCkto5yVU=; b=anrDKIsMUn3lc8gT
	hbkls5enrHxqpXutqJ9ShGi5CTl7UGm9/1nodg6PabVSfZAbr/tJyvS2iX0pCJvH
	T/0VK71u2jvvqrOqT1EQfmZsrSd0yal0Yw1V1a4ais3yCJ4Ali9SGYSEn0LFcCwS
	cNlxrTYOMcYmO6RV2HhXnF5qBAffpuLq6+GObHFEHEVysTdoMoMMwbBko69T84r8
	b2w+GpA8h6QsJ5G/JeWBaUPYfITpOve61t61sz0HsAJYdbHxpwIOkl+ZBI8hVzcV
	nOlI9fiIOEvDbg48PGTJOCdkFGG8pinjYnOJ0nsNFvnEJNiR79KF2qSDUsasbx7W
	aa0TeQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js22vn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 06:35:38 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-128edc72e5bso3479625c88.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 23:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775025337; x=1775630137; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3OkA6pQW3yk0X7dRpa6C7L1ZcGiFUnl8OuBCkto5yVU=;
        b=V/5uemv+yHsl9pmyvPmhW3MER95W6oxEEMcFvaFhocHXuYrfWSwgCGnjRkqkM8Se3W
         GoGrUnEpX+aCei3xdaxv8F+AayQ5JY3u/L8n7QJtubzEkcnpGLZJMT7cQpzk0I480tzh
         Besy8Weh0NDW2Z8vkoZMe60voS0LPJFIR072ydwR9BGRaus3h8+Zve9Fi7470XxMgKcq
         zuhRckfITvogN38hYgaGmYn+nd9MwqtcYZci+IgxvSzEeBWKAyUfQSC81tcTzyfjUTv1
         sawhuxAegStKlH3Z0QvRYyA7OQFjDNyBVqBwYeftgdSyUEW7QfrbgX5FjTcJP7W2TuWV
         riCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775025337; x=1775630137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3OkA6pQW3yk0X7dRpa6C7L1ZcGiFUnl8OuBCkto5yVU=;
        b=c0kMSgR1iojmcp+iPty1QFmZSJYrEXbB/2E6m0dieuDfCmFfmW7IJLiwjZKdj3yXkX
         9bu+4pYgMAMlRUFm7CYVo1XLLW8kVQ2XcKoNwjB/KeilGgVev/fiExdRE4FRWCV4F4SU
         HOAaiAAHeKbnTljPfVdl6ZhCHJbujrrlN/ke7QqLXA/viCJdKDnZ4WuxEiU/xcjadHT4
         ZvDHz4aRMiV/i99D3km59vRBc9txGZz6x4CUlc320vsatv9rlE8BvWI24nfO5Te3MN5a
         9vHtMjQmPJpYvkY25b2iv6jMa7gPfG3LyxWqq7qwzBqx4lviAbOp0rvmnSBE1wd96h3k
         hGOg==
X-Forwarded-Encrypted: i=1; AJvYcCXuArf+Vb7IH8mhuGKobwI53u27iNAxlxH7rvaR5fBSW3DlZrN3YI/9RL9k+wqRW2AoL2G2SmU8eUIz@vger.kernel.org
X-Gm-Message-State: AOJu0YyRUPlHakUi4tMVJ2v6XhKHP/dg8LoxTio/D0JLqUh78/0brmcq
	+8ec2nR9JAAkVOEaXWvsaq3xh0gdK4W37B4GbVMc2r9nlqCnRLHDgCw2bkpkT17TU4Dd7X4yKJ7
	5e522WZENzUrNBH/rBNsJD0vFfJVt4UBoT4MMP515hbpTHnc0f0irP0rR9XgI0kB0
X-Gm-Gg: ATEYQzxJ082krWfOrSmXtd+rzkXfZsFS4BqN9sAxJmhJ8399Ye3u0oe3QZ5T8xPQQiw
	M21un/ofAgWOtywYAtmw1XQON52BZXKfxVj15wRcPFNqhl6yN8lccWvCysIRJbvHVLz6blLWLMt
	GRm2wFQ0zi2MEbLQBGDI4UAD6Qvv92+dacx9eygiNRslOtMoRhIvNg/K58oo2+6JuDJTP2bLeEx
	BSWXtgFNJiQ1wsY3qcsLMhWEle12bSQhQe+sM2P9ceNug69BC6gDmw4MwgI+f/EpW44078dQybD
	8yU4DINiqJr+pMEp5pskhnPDwk6Q/02WpCJ1jr4z/ujJErrRSguswu1i6UwAshsSBKTFA41dvKR
	ijplnaZbO7o7sQCYH4S2Q/zpUs3+8wbr1rgdVrjo7OVOZ9sIQCm2X9LBbkMciJoSMLDLy
X-Received: by 2002:a05:7022:322:b0:11b:ec5f:1c37 with SMTP id a92af1059eb24-12be64db00dmr1457451c88.18.1775025337294;
        Tue, 31 Mar 2026 23:35:37 -0700 (PDT)
X-Received: by 2002:a05:7022:322:b0:11b:ec5f:1c37 with SMTP id a92af1059eb24-12be64db00dmr1457416c88.18.1775025336690;
        Tue, 31 Mar 2026 23:35:36 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97f6994sm12027550c88.8.2026.03.31.23.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 23:35:36 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 23:35:28 -0700
Subject: [PATCH RFC 3/4] clk: qcom: tcsrcc-glymur: Migrate
 tcsr_pcie_N_clkref_en to clk_ref common helper
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-qref_vote-v1-3-3fd7fbf87864@oss.qualcomm.com>
References: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
In-Reply-To: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, johan@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775025332; l=11277;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=O/xzz3OyQHlZaY8PTjkJNEJgipL9OgU4S64AIcv/hgs=;
 b=qKO8FGxIRHZ/FW3wLzJyCUevJz5XtDyvZRBba7eoPWacGyFUxVLZQZfDvGf3+KRRT9ccY3OKS
 6g4Vw2jjMDGAhHXEwGlzRW58FLQA8dgH5OE8GBJ8iNWdDvxNALN9d7R
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: 1gK46vnsgv1Ys3TzQO-0vZelKNkFr6pN
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69ccbcba cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=t2MV0Cpg_TU8-8Jkrg8A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA1NiBTYWx0ZWRfXxPgpPnCWtpQS
 kn3JhFO4VnsbLGHsthxAvLMEzlFTlVDVUbWa4IVg7aZG1FcoY4+t8L2MEv4aB2VB5fyfVmoQisH
 2Ll/qWn5J0RHB+zCTBzrRZeH4fwbc3/O2CZo8sTiBlsO99GASL5R9O4zkSf8fm47GcB2Ietd/ZK
 pRxGN1zxBf/FuV5/Irjx+TaIBfke5VPCpc19ZmJ8CwH5GTTd4gNnFBha+WT+KzSJJdvT0neyzNm
 l58n1F71rUMyRIWth4fkr2QCvO6pVnoECvFzkXNj9Aq64AHxygQY8HfGUwtfttFW1lGldPfLZh2
 KdTuhmiC3iFJOGoxa9jf0dzsh9n8lMEWFE426pseW4RhXu/F8p7WVdT7/azBM9zpzh2AdqPabyp
 WYKk0THfHpU6TSpOqD8pF56SOGBvVwbn/8syGGDXoGyB10mS7A0g2ZGAFrQontcl4bAx49bCyz/
 RbrkE/9NQWSMyAcnmaQ==
X-Proofpoint-GUID: 1gK46vnsgv1Ys3TzQO-0vZelKNkFr6pN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010056

Replace local clk_branch-based clkref definitions with descriptor-based
registration via qcom_clk_ref_probe().

This keeps the glymur driver focused on clock metadata and reuses common
runtime logic for regulator handling, enable/disable sequencing, and OF
provider wiring.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/clk/qcom/tcsrcc-glymur.c | 340 +++++++++++----------------------------
 1 file changed, 93 insertions(+), 247 deletions(-)

diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index 9c0edebcdbb12816d1be5249e4f04bcaf02048aa..585f87b23af2d92daef1787b2f38911681c0d8ee 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -4,265 +4,115 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/clk/qcom.h>
 #include <linux/mod_devicetable.h>
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
-};
-
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
+static const char * const tcsr_pcie_1_regulators[] = {
+	"vdda-refgen-0p9",
+	"vdda-refgen-1p2",
+	"vdda-qrefrx5-0p9",
+	"vdda-qreftx0-0p9",
+	"vdda-qreftx0-1p2",
+};
+
+static const char * const tcsr_pcie_2_regulators[] = {
+	"vdda-refgen-0p9",
+	"vdda-refgen-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrpt2-0p9",
+	"vdda-qrefrx2-0p9",
+};
+
+static const char * const tcsr_pcie_3_regulators[] = {
+	"vdda-refgen-0p9",
+	"vdda-refgen-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrx1-0p9",
+};
+
+static const char * const tcsr_pcie_4_regulators[] = {
+	"vdda-refgen-0p9",
+	"vdda-refgen-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrpt2-0p9",
+	"vdda-qrefrx2-0p9",
+};
+
+static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
+	[TCSR_EDP_CLKREF_EN] = {
+		.name = "tcsr_edp_clkref_en",
+		.offset = 0x60,
 	},
-};
-
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
+	[TCSR_PCIE_1_CLKREF_EN] = {
+		.name = "tcsr_pcie_1_clkref_en",
+		.offset = 0x48,
+		.regulator_names = tcsr_pcie_1_regulators,
+		.num_regulators = ARRAY_SIZE(tcsr_pcie_1_regulators),
 	},
-};
-
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
+	[TCSR_PCIE_2_CLKREF_EN] = {
+		.name = "tcsr_pcie_2_clkref_en",
+		.offset = 0x4c,
+		.regulator_names = tcsr_pcie_2_regulators,
+		.num_regulators = ARRAY_SIZE(tcsr_pcie_2_regulators),
 	},
-};
-
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
+	[TCSR_PCIE_3_CLKREF_EN] = {
+		.name = "tcsr_pcie_3_clkref_en",
+		.offset = 0x54,
+		.regulator_names = tcsr_pcie_3_regulators,
+		.num_regulators = ARRAY_SIZE(tcsr_pcie_3_regulators),
 	},
-};
-
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
+	[TCSR_PCIE_4_CLKREF_EN] = {
+		.name = "tcsr_pcie_4_clkref_en",
+		.offset = 0x58,
+		.regulator_names = tcsr_pcie_4_regulators,
+		.num_regulators = ARRAY_SIZE(tcsr_pcie_4_regulators),
 	},
-};
-
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
+	[TCSR_USB2_1_CLKREF_EN] = {
+		.name = "tcsr_usb2_1_clkref_en",
+		.offset = 0x6c,
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
+	[TCSR_USB2_2_CLKREF_EN] = {
+		.name = "tcsr_usb2_2_clkref_en",
+		.offset = 0x70,
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
+	[TCSR_USB2_3_CLKREF_EN] = {
+		.name = "tcsr_usb2_3_clkref_en",
+		.offset = 0x74,
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
+	[TCSR_USB2_4_CLKREF_EN] = {
+		.name = "tcsr_usb2_4_clkref_en",
+		.offset = 0x88,
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
+	[TCSR_USB3_0_CLKREF_EN] = {
+		.name = "tcsr_usb3_0_clkref_en",
+		.offset = 0x64,
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
+	[TCSR_USB3_1_CLKREF_EN] = {
+		.name = "tcsr_usb3_1_clkref_en",
+		.offset = 0x68,
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
+	[TCSR_USB4_1_CLKREF_EN] = {
+		.name = "tcsr_usb4_1_clkref_en",
+		.offset = 0x44,
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
+	[TCSR_USB4_2_CLKREF_EN] = {
+		.name = "tcsr_usb4_2_clkref_en",
+		.offset = 0x5c,
 	},
 };
 
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
 static const struct regmap_config tcsr_cc_glymur_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -271,11 +121,12 @@ static const struct regmap_config tcsr_cc_glymur_regmap_config = {
 	.fast_io = true,
 };
 
-static const struct qcom_cc_desc tcsr_cc_glymur_desc = {
-	.config = &tcsr_cc_glymur_regmap_config,
-	.clks = tcsr_cc_glymur_clocks,
-	.num_clks = ARRAY_SIZE(tcsr_cc_glymur_clocks),
-};
+static int tcsr_cc_glymur_probe(struct platform_device *pdev)
+{
+	return qcom_clk_ref_probe(pdev, &tcsr_cc_glymur_regmap_config,
+				  tcsr_cc_glymur_clk_descs,
+				  ARRAY_SIZE(tcsr_cc_glymur_clk_descs));
+}
 
 static const struct of_device_id tcsr_cc_glymur_match_table[] = {
 	{ .compatible = "qcom,glymur-tcsr" },
@@ -283,11 +134,6 @@ static const struct of_device_id tcsr_cc_glymur_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, tcsr_cc_glymur_match_table);
 
-static int tcsr_cc_glymur_probe(struct platform_device *pdev)
-{
-	return qcom_cc_probe(pdev, &tcsr_cc_glymur_desc);
-}
-
 static struct platform_driver tcsr_cc_glymur_driver = {
 	.probe = tcsr_cc_glymur_probe,
 	.driver = {

-- 
2.34.1

