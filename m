Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C864637E5E8
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 07:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786519668; cv=none; b=I8EDwv9N0QS3yvQiVBjCKtSkt14OxK3WKjKSyIq6tayBihMcoAkhysJt6PNGS/PI5D+6HZsL+2lEo33MqKyVGRdq7YreQfZ4AFPJhxxt9B9X+CtK1p3YG5gtDxcGqzmTsJPjgcDVvvJmScMsWQkmS0YoQBjBUM4q1tg6vZ+tb4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786519668; c=relaxed/simple;
	bh=ihdFPILNani3Ibkuu+huHpL8xJf5HkOPsUpioh5t6jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IgolgZDaeAkOD+Pva+u0CNzPuZuYLljTqIaSXJg52KQy98itWGy2nWkvIFp10L0ZXk5WNNhlcskxMI1BmaO9TE+L7h+NpBYgRoBHJCR/kJEhJLY79alTpHlqwoyXnpvy5VzLBcRBFXk2EYStCAGjGJuV/r6fAycn96z/y1iqHDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LpIndoJ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cPPnrBB5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LpIndoJ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cPPnrBB5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C62HtM2962145
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 07:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eq9O/ZH/lB+RqlHtKACGCAmmelni54lJd8E5ukY2rx8=; b=LpIndoJ1xmrAI6WX
	VYU2rGGD4jwz+/+F5xB5dcKZ8eApPG2Qu8L1/Mrp2CSUNi9if5fUiCQie54afwjH
	SuzQrwQnA6EWGmjw43wn/dyZl92+gadFk+sk0+9TH0B6G5WkdjFtO2jCIQONrOOy
	vczYFkaxZNIq87lJrMJGyTdKpWWrrsBmPLLzsj+gA5zaiqncGCAPAXW0ziERwha+
	LRwXEraBPvwJZZvOSfoEx0KzCW5RGtszlQLyetHWqhpqLVP9iIlgVHsdWWy1T75d
	K2Ct5+o7wOYJuqGEcUHgHNVdAofvvC2dujPZnmSzc8Qwu3Tk+h7H/sLcI2iJBCoa
	L8ivwA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0jgrgg0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 07:27:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so1227839a91.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 00:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786519664; x=1787124464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eq9O/ZH/lB+RqlHtKACGCAmmelni54lJd8E5ukY2rx8=;
        b=cPPnrBB5HRVFG6RrqG22/GCV099duBChGLxQsefjrKEodOu1dMQQoxf06jSQ0osoxV
         N4DQ0k+CW1T1VQ2LZkqqSsoIO2PY2wvonZkZiENszCDGS56Hw11w1IbEalagEhkz90Wz
         MmZPPezDN2EJR8k6YzfGcJHj69XMrNP55eLauZmwqFEYbpXd0qA8bf790nAfGAa2W9ls
         FfpzYIvOlRd0tBu0bd3C+EwXqmdsY54do3H8pXIDQB2nBaizVkfBFKn0OO+AFIdfs7Tb
         GG7tL2x6KbSBdOgm1ZY7mcUxbGSUpnMx4Z9hmm82DTWAawFPGRAvXFXXN1nIcLP2871m
         Wx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786519664; x=1787124464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eq9O/ZH/lB+RqlHtKACGCAmmelni54lJd8E5ukY2rx8=;
        b=gfkvsIs/17BJNAfZ+XElrNq3X1xAtsRZUCcZhhHHrdfM/4TOkpFnmSw7ugSdZUxF6/
         qaDjKUDaUwEI5Ecqpzzc8stbKyrlcMwN21EU9OWJZidh4D9/M3JX8nMyET+Hq4iFmZWP
         s9FiVHXMg8HvxsS3nFikRgKr8aOokESWVh6gqtCjQ77yFG2HriYOd9kS2oawXrzpTIUn
         f/wYVPBSwwgqacSDE27up3+L/7Q1fD4RXdbOT5IrhEw37fEZ+YkHBHDbGljBMKc41oWt
         PkTGQBAEPuGtsp+mOfoFnCZrXuvn/lYxMb+tqEPBK5yAbdi+n/3Fe1oy3D7DgFvTgaru
         JWSg==
X-Forwarded-Encrypted: i=1; AHgh+RokpTLwyuyp2QTp2IhbVTAJxsrS+ps9b+A3fp1rQT47NMySQ/UkzNbE4+UFCl6EZv6dPs5OGWs1qlNN@vger.kernel.org
X-Gm-Message-State: AOJu0YzglqPptUX4iMX6aFS1r35dJ1zvRucDevF9wUBPGPSjLZsTcZ00
	MTDW63jbbXl4khNzHx/4y61OmltRpAGTISj1Sj5JXDbJMA+Fg/W0t38Q7DJH/Nu5ERuFxqVaebe
	YlHYCU+oXAXuIdVhImTEGECLqUJAHVePbYqvCf+Kbg2VzQS0Hm4qm2Sx62RMZussN
X-Gm-Gg: AR+sD11twjdiSgqOHqfXTCY5DFYMPBENykxf9xs69mMHeaVbAQZPSvTPaIreZhNlSyz
	yn0XM3b8fspGA0TOGmsgSwxoICTw8SlsAs3P7XwNk1k61kQrmYoOhPA1mXyauK9zQOcyS8UzrDu
	4tO/FWP2+WKokDf/og6YN92UEjngiatH477/ylag/XMr0aaKHz78hAxEnaW3hB+HME9W8py8JhL
	VKMOWnK1z1g2yNuFFLsyzuELsaYCOr8xYcWCHB7siDZoN9EDJXNwcgZ0ZTznS9bjYYDj7E1VA1T
	fjBhOYEYUqKzgQq+msqjMAXCVy1J1ZP0dMsj6AN3n/uG4oCYAVnruAVTOo0P+wgN37Pky62jE2a
	jF3V2kPZHRWkt2sIN0ddZe7/MR94Q168KXM21xJNPvZ7bhh0=
X-Received: by 2002:a17:90b:1a8b:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39301253b3bmr3093598a91.4.1786519663627;
        Wed, 12 Aug 2026 00:27:43 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8b:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39301253b3bmr3093529a91.4.1786519663150;
        Wed, 12 Aug 2026 00:27:43 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f908a82bsm2506965a91.0.2026.08.12.00.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 00:27:42 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 00:27:32 -0700
Subject: [PATCH v3 2/3] clk: qcom: tcsrcc-x1e80100: Migrate to clk_ref
 helper
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-hamoa_tcsr_qref_0812-v3-2-dc7627169c6d@oss.qualcomm.com>
References: <20260812-hamoa_tcsr_qref_0812-v3-0-dc7627169c6d@oss.qualcomm.com>
In-Reply-To: <20260812-hamoa_tcsr_qref_0812-v3-0-dc7627169c6d@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786519659; l=12460;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=ihdFPILNani3Ibkuu+huHpL8xJf5HkOPsUpioh5t6jk=;
 b=y7GULrO/ylXjGPntLe/tfx+eCRvt9tMgtKQ46KV/Y0jBtGZFKcYxLY2XlO3rTaoa7ct99JHRI
 TeFpxbX8EZiA2NxJVFiWE8NSlXwiUiiYWTEMqJxEFblLcaM7aD2fTXh
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA1OCBTYWx0ZWRfX6Zz5pUAE9TIN
 /wIZOcyEH3EJ0Exy0IgJ1uDwtD0S4xao1smsnfQORHZCv37KTR5jzM5CR/lxtkM3s2s7cmRilnz
 5VO/L2niK/TtGxEi48iEzW0yT0u8WgrNnaSqi7tsQaaJ4Y4yxce44FpEGqqNoL0ZLSlihjqZ5zU
 J7YMezs8DlTLkZlZ4/3P7rQJa5Z7k7X+kj3rvNp701k2AbhEf76zjl4v2mx/08F8vXN3EmwF8FX
 ZyKIVoXgaV7dZlJY4heWeivlNPBKRQyf7NIkkHyYy3BMPMfJjt7LV0SoklTNuKVCKIa3zP2j9mN
 5t+OemMx0c3VhhAVLLh9ijS/Bw4uNcYVczewHxKChYR53yAv5aSNORKehWAelEEfdzQXhVq89g+
 wAtOJcDjORmlzXFYpkZgYIROCRxrxlE11NchCYL5IAIMTa25WP2Xc8e49+fPucncqzMSixDo0qh
 iFSBTFDbxh6v3H2PgJQ==
X-Proofpoint-ORIG-GUID: dgfXMZi0WA0JWHyWv0ryjRfk6uPG9jA0
X-Authority-Analysis: v=2.4 cv=TNJ1jVla c=1 sm=1 tr=0 ts=6a7c2070 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=48_MYvKuBCZC4ZtyZX0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: dgfXMZi0WA0JWHyWv0ryjRfk6uPG9jA0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA1OCBTYWx0ZWRfX1tUO07DU69W0
 YwVqXYtAKbmxNr8ceyxKbDfhhV4MbjhdgcZpagOPBjmeweBHkPg/u0Obbl83J7XcUhe2DJxxfzs
 4iaAEFoN5925IE+AMri04YreBkm67Uo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120058

Replace local clk_branch-based clkref definitions with descriptor-based
registration via qcom_clk_ref_probe().

This keeps the x1e80100 driver focused on clock metadata and reuses
common runtime logic for regulator handling, enable/disable sequencing,
and OF provider wiring.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/clk/qcom/tcsrcc-x1e80100.c | 335 +++++++++++++------------------------
 1 file changed, 113 insertions(+), 222 deletions(-)

diff --git a/drivers/clk/qcom/tcsrcc-x1e80100.c b/drivers/clk/qcom/tcsrcc-x1e80100.c
index 0b05c27b619b..ad1f6be83a53 100644
--- a/drivers/clk/qcom/tcsrcc-x1e80100.c
+++ b/drivers/clk/qcom/tcsrcc-x1e80100.c
@@ -5,252 +5,141 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/clk/qcom.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,x1e80100-tcsr.h>
 
-#include "clk-branch.h"
-#include "clk-regmap.h"
-#include "common.h"
-#include "reset.h"
-
-enum {
-	DT_BI_TCXO_PAD,
+static const char * const x1e80100_tcsr_tx1_rpt0_rx0_regulators[] = {
+	"vdda-refgen0-0p9",
+	"vdda-refgen0-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qreftx1-1p2",
+	"vdda-qrefrpt0-0p9",
+	"vdda-qrefrx0-0p9",
 };
 
-static struct clk_branch tcsr_edp_clkref_en = {
-	.halt_reg = 0x15130,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15130,
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
+static const char * const x1e80100_tcsr_tx1_rpt1_rx1_regulators[] = {
+	"vdda-refgen0-0p9",
+	"vdda-refgen0-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qreftx1-1p2",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrx1-0p9",
 };
 
-static struct clk_branch tcsr_pcie_2l_4_clkref_en = {
-	.halt_reg = 0x15100,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15100,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_pcie_2l_4_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
+static const char * const x1e80100_tcsr_tx1_rpt12_rx2_regulators[] = {
+	"vdda-refgen0-0p9",
+	"vdda-refgen0-1p2",
+	"vdda-qreftx1-0p9",
+	"vdda-qreftx1-1p2",
+	"vdda-qrefrpt1-0p9",
+	"vdda-qrefrpt2-0p9",
+	"vdda-qrefrx2-0p9",
 };
 
-static struct clk_branch tcsr_pcie_2l_5_clkref_en = {
-	.halt_reg = 0x15104,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15104,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_pcie_2l_5_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
+static const char * const x1e80100_tcsr_tx0_rpt3_rx3_regulators[] = {
+	"vdda-refgen2-0p9",
+	"vdda-refgen2-1p2",
+	"vdda-qreftx0-0p9",
+	"vdda-qreftx0-1p2",
+	"vdda-qrefrpt3-0p9",
+	"vdda-qrefrx3-0p9",
 };
 
-static struct clk_branch tcsr_pcie_8l_clkref_en = {
-	.halt_reg = 0x15108,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15108,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_pcie_8l_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
+static const char * const x1e80100_tcsr_tx0_rpt4_rx4_regulators[] = {
+	"vdda-refgen2-0p9",
+	"vdda-refgen2-1p2",
+	"vdda-qreftx0-0p9",
+	"vdda-qreftx0-1p2",
+	"vdda-qrefrpt4-0p9",
+	"vdda-qrefrx4-0p9",
 };
 
-static struct clk_branch tcsr_usb3_mp0_clkref_en = {
-	.halt_reg = 0x1510c,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x1510c,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_usb3_mp0_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
-	},
+static const struct regmap_config tcsr_cc_x1e80100_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x2f000,
+	.fast_io = true,
 };
 
-static struct clk_branch tcsr_usb3_mp1_clkref_en = {
-	.halt_reg = 0x15110,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15110,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_usb3_mp1_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+static const struct qcom_clk_ref_desc * const tcsr_cc_x1e80100_clk_descs[] = {
+	[TCSR_EDP_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_edp_clkref_en",
+		.offset = 0x15130,
+		.regulator_names = x1e80100_tcsr_tx0_rpt3_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx0_rpt3_rx3_regulators),
 	},
-};
-
-static struct clk_branch tcsr_usb2_1_clkref_en = {
-	.halt_reg = 0x15114,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15114,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_usb2_1_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_PCIE_2L_4_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_2l_4_clkref_en",
+		.offset = 0x15100,
+		.regulator_names = x1e80100_tcsr_tx1_rpt1_rx1_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx1_rpt1_rx1_regulators),
 	},
-};
-
-static struct clk_branch tcsr_ufs_phy_clkref_en = {
-	.halt_reg = 0x15118,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15118,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_ufs_phy_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_PCIE_2L_5_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_2l_5_clkref_en",
+		.offset = 0x15104,
+		.regulator_names = x1e80100_tcsr_tx1_rpt12_rx2_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx1_rpt12_rx2_regulators),
 	},
-};
-
-static struct clk_branch tcsr_usb4_1_clkref_en = {
-	.halt_reg = 0x15120,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15120,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_usb4_1_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_PCIE_8L_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_8l_clkref_en",
+		.offset = 0x15108,
+		.regulator_names = x1e80100_tcsr_tx1_rpt0_rx0_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx1_rpt0_rx0_regulators),
 	},
-};
-
-static struct clk_branch tcsr_usb4_2_clkref_en = {
-	.halt_reg = 0x15124,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15124,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_usb4_2_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB3_MP0_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb3_mp0_clkref_en",
+		.offset = 0x1510c,
+		.regulator_names = x1e80100_tcsr_tx1_rpt0_rx0_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx1_rpt0_rx0_regulators),
 	},
-};
-
-static struct clk_branch tcsr_usb2_2_clkref_en = {
-	.halt_reg = 0x15128,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x15128,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_usb2_2_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB3_MP1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb3_mp1_clkref_en",
+		.offset = 0x15110,
+		.regulator_names = x1e80100_tcsr_tx1_rpt0_rx0_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx1_rpt0_rx0_regulators),
 	},
-};
-
-static struct clk_branch tcsr_pcie_4l_clkref_en = {
-	.halt_reg = 0x1512c,
-	.halt_check = BRANCH_HALT_DELAY,
-	.clkr = {
-		.enable_reg = 0x1512c,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "tcsr_pcie_4l_clkref_en",
-			.parent_data = &(const struct clk_parent_data){
-				.index = DT_BI_TCXO_PAD,
-			},
-			.num_parents = 1,
-			.ops = &clk_branch2_ops,
-		},
+	[TCSR_USB2_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_1_clkref_en",
+		.offset = 0x15114,
+		.regulator_names = x1e80100_tcsr_tx0_rpt3_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx0_rpt3_rx3_regulators),
+	},
+	[TCSR_UFS_PHY_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_ufs_phy_clkref_en",
+		.offset = 0x15118,
+		.regulator_names = x1e80100_tcsr_tx1_rpt12_rx2_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx1_rpt12_rx2_regulators),
+	},
+	[TCSR_USB4_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb4_1_clkref_en",
+		.offset = 0x15120,
+		.regulator_names = x1e80100_tcsr_tx0_rpt4_rx4_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx0_rpt4_rx4_regulators),
+	},
+	[TCSR_USB4_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb4_2_clkref_en",
+		.offset = 0x15124,
+		.regulator_names = x1e80100_tcsr_tx0_rpt3_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx0_rpt3_rx3_regulators),
+	},
+	[TCSR_USB2_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_usb2_2_clkref_en",
+		.offset = 0x15128,
+		.regulator_names = x1e80100_tcsr_tx0_rpt3_rx3_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx0_rpt3_rx3_regulators),
+	},
+	[TCSR_PCIE_4L_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {
+		.name = "tcsr_pcie_4l_clkref_en",
+		.offset = 0x1512c,
+		.regulator_names = x1e80100_tcsr_tx0_rpt4_rx4_regulators,
+		.num_regulators = ARRAY_SIZE(x1e80100_tcsr_tx0_rpt4_rx4_regulators),
 	},
-};
-
-static struct clk_regmap *tcsr_cc_x1e80100_clocks[] = {
-	[TCSR_EDP_CLKREF_EN] = &tcsr_edp_clkref_en.clkr,
-	[TCSR_PCIE_2L_4_CLKREF_EN] = &tcsr_pcie_2l_4_clkref_en.clkr,
-	[TCSR_PCIE_2L_5_CLKREF_EN] = &tcsr_pcie_2l_5_clkref_en.clkr,
-	[TCSR_PCIE_8L_CLKREF_EN] = &tcsr_pcie_8l_clkref_en.clkr,
-	[TCSR_USB3_MP0_CLKREF_EN] = &tcsr_usb3_mp0_clkref_en.clkr,
-	[TCSR_USB3_MP1_CLKREF_EN] = &tcsr_usb3_mp1_clkref_en.clkr,
-	[TCSR_USB2_1_CLKREF_EN] = &tcsr_usb2_1_clkref_en.clkr,
-	[TCSR_UFS_PHY_CLKREF_EN] = &tcsr_ufs_phy_clkref_en.clkr,
-	[TCSR_USB4_1_CLKREF_EN] = &tcsr_usb4_1_clkref_en.clkr,
-	[TCSR_USB4_2_CLKREF_EN] = &tcsr_usb4_2_clkref_en.clkr,
-	[TCSR_USB2_2_CLKREF_EN] = &tcsr_usb2_2_clkref_en.clkr,
-	[TCSR_PCIE_4L_CLKREF_EN] = &tcsr_pcie_4l_clkref_en.clkr,
-};
-
-static const struct regmap_config tcsr_cc_x1e80100_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = 0x2f000,
-	.fast_io = true,
-};
-
-static const struct qcom_cc_desc tcsr_cc_x1e80100_desc = {
-	.config = &tcsr_cc_x1e80100_regmap_config,
-	.clks = tcsr_cc_x1e80100_clocks,
-	.num_clks = ARRAY_SIZE(tcsr_cc_x1e80100_clocks),
 };
 
 static const struct of_device_id tcsr_cc_x1e80100_match_table[] = {
@@ -261,7 +150,9 @@ MODULE_DEVICE_TABLE(of, tcsr_cc_x1e80100_match_table);
 
 static int tcsr_cc_x1e80100_probe(struct platform_device *pdev)
 {
-	return qcom_cc_probe(pdev, &tcsr_cc_x1e80100_desc);
+	return qcom_clk_ref_probe(pdev, &tcsr_cc_x1e80100_regmap_config,
+				  tcsr_cc_x1e80100_clk_descs,
+				  ARRAY_SIZE(tcsr_cc_x1e80100_clk_descs));
 }
 
 static struct platform_driver tcsr_cc_x1e80100_driver = {

-- 
2.34.1

