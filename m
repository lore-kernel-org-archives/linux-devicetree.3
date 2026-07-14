Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C3D2E739C
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784005197; cv=none; b=VoLoyqdKFK4W0+OEURNtDscID6S91Dl2XsEJ0RkZuSfDWLQJtV5SjOgOY4gKZ4omhbDnZpxGuyKiMpvWISiobuzmXlY1Qgh4FjBjjotULINdThgqdZ5DVvHIE6ez++Frq107tDszjspSfdL40ZS7p1aqlY6lrEr2s+3WMDxhfrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784005197; c=relaxed/simple;
	bh=acO2MCTs6Urgg6mKi8zA1uUMSJs9SW0vwIJyCHIgems=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gYIa3gACECcXaS+0tCGfUGbmS+EEQJbaVFk1iS1xHRl2vtp62QjQlfMF2WILvpWSA6BE0fJk/tSSFBl465Y+Nsl2UosQSreYXXj/Z4fZswPVRc8ZtV5ad3WRN3RfdActffJaLrWmrXswtCT5DEQ7BcGRBWwMKOWzvM7ye2Du+WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hp4uyXLD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Asngz48c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hp4uyXLD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Asngz48c"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E385Tf3556609
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JXNVWei5TYAO0rqhnJeNF03LYKzM0BsJo4TzzO8e5Kg=; b=Hp4uyXLDyF72d5NJ
	chcXOcvjxonVr+oXKCGoz6vvYJGQfSSZLbQq8jaAHjcZz8lX7C6y8gT2NK1hJuCr
	2Dc1WoxIG4EYHEd7WHx9qYbKURbcj+gGHgYBPo0bl1ifYWWkl9HIZHUhaX30+K31
	utY7U/5m9zGHlPC4lFq5QdPvyvQQGcAQXyDT6OMJe3k+9ZhtpunHc7Jmdhu3ZoJj
	Wz4AB/L5oB3YgXaX/RRf4Y3aVFOjl/NHZPwif+llyPSNrfv8GeVLX8NS27q/da7W
	xCiT7fps6B7FpMKCnHOuN0KGaD/XEY/p/u0HSO/XkauFiUNf8HMHgoPi0chN8Csc
	BK/X8Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44ct175-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 04:59:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c890bac374eso10094960a12.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 21:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784005194; x=1784609994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JXNVWei5TYAO0rqhnJeNF03LYKzM0BsJo4TzzO8e5Kg=;
        b=Asngz48cwnTOdvtvo5WrWSXA/c4HMggqiMcAzYTsFMRNdmsfHCn/4E/3Bn49VmDB8/
         zseG6OoiSvzqisIQhzXmXgwhIfvjz2ZwzBAN7PsNWI/aBX3ywM+KPwrb93Nng8HKtquG
         LRQ8IaWl2dR2wc7NoiLrIr8j2uzqpb02V15qS1lEP3RShuMyrOs97AEcd6L2Wrky50+a
         S0IpZsHj7B5oVrbEcaoWKCwmDqgDqNkAPESE3WMuxozYOfezGDTytWnARCGO8pItK3Ba
         avfCBx1Cu3Mz2OMUDQXK0gaThHQnQgxc/4bwtiSFEfYMs40aFcMJvpnNSZADXOuIeDIc
         wEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784005194; x=1784609994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JXNVWei5TYAO0rqhnJeNF03LYKzM0BsJo4TzzO8e5Kg=;
        b=bvzjFLpmjDeMx2Kcr8NaXKEo6LUVXoAGgF+mBIJhywBeVbB/GRteWqF5K/quYN1IOk
         zsZtO9nnj3OyUL3bZH+Ba1mfmgCBuxOkqxaG2cMb6wTwjVJ9j0WFcROsaRb/fkxwH1Ch
         0fKtziWFP8gBt8WuI4eFvDzpPy2DZl5Wu9oqRGPLAkg23wLoixHnX8dzWK1p+p0d7rRv
         szhig2ywUuT4cfOGGpPiBjbdzu4bbGJ3lh6CehYIqgkSfquBxtJNAoPL/NmE/I7rS28u
         D/LmU9mIFKVnF/Wudds9xXaJAaKwNwq6dkxNo9hOQwLut44vSIANu7wb+4Km22XHCWQ/
         TvKg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8glViu0dBy+fn9esKIpCbHY/XDcyIMosV8JKZWjqUyrQUXSjC8nQSeGukD4TCeTQ3Sq9YoeF7Bq0B@vger.kernel.org
X-Gm-Message-State: AOJu0YzKyDGShIb/vOVBV6u79LFTlll62oYSa7gV5Vc3Fk63xnAJQ9fZ
	oTdKSetpcSHnom6BI9biQkjvd5lNDjZDiLLEJLSVsPCsF0HAJEXYi3rzs/AALadwoIgbnXc9/KT
	V4hcaZOEq5YtdtuyBQM30NbSMTX8cke+VHkx8rtjFsUxiiBCgWISdw5NZ8CoPXFRf
X-Gm-Gg: AfdE7cniN24a/dCaz1uPful13Wiz10vwvHd+LnHFFMhwW0t3VvguApPwbDK3P2qqBom
	6jaHbsGlCuLA/L01OXbY+xm8bT1y3RB0Xf0Rvef6I7DDgupFzdoFS0z1YJxiEIJTzy2ZksAhSgi
	pNCngbJEaPCXjLfx8gKpbVUbp1a7hLuOD6/qG+9dUktz2BMB3gqne8bzlXR8Hmbxls08JoRcknp
	H2qadJjSyc6wbZC7JuIxHRP3XuU1rRV9EeRWIWswJYLMTmQONA2hwlN39eFO7ROVdhaQnzTB2vB
	p9DcLFcFP9lLreAJeX/DJgMEJw2WTsr8bTJmR/EinwAC8d9aAC0QNKmhE0OgX1q9Kl70gPpCUzN
	icu6v84SDr7zRCYAl227d/SoQKx9HBMXaKch3e73FKd+Zwj02qr3lWx1P+Q==
X-Received: by 2002:a05:6a21:310c:b0:3bf:5539:f93 with SMTP id adf61e73a8af0-3c1108cd3femr13840679637.38.1784005194119;
        Mon, 13 Jul 2026 21:59:54 -0700 (PDT)
X-Received: by 2002:a05:6a21:310c:b0:3bf:5539:f93 with SMTP id adf61e73a8af0-3c1108cd3femr13840646637.38.1784005193688;
        Mon, 13 Jul 2026 21:59:53 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3120c8e41fcsm41874021eec.15.2026.07.13.21.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:59:53 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 21:59:38 -0700
Subject: [PATCH v9 3/7] clk: qcom: Add generic clkref_en support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-tcsr_qref_0714-v9-3-373670ab15f9@oss.qualcomm.com>
References: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
In-Reply-To: <20260713-tcsr_qref_0714-v9-0-373670ab15f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784005189; l=9170;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=acO2MCTs6Urgg6mKi8zA1uUMSJs9SW0vwIJyCHIgems=;
 b=EMm11caV7rvsrwZ4+VoPF4GwtbAYf/oXqS0UEKRvPBeHzsx+Zz6BuWkVNW8uRHy95LzDPU/pt
 w/ZZRqdaFnIDMGSign+16tORu5XGLshTk6691Tgl7jMh09XTmXnueTg
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: uCiAOJfIE9JIvZhWrjHxICzvBQP5HOe2
X-Proofpoint-ORIG-GUID: uCiAOJfIE9JIvZhWrjHxICzvBQP5HOe2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX9b51m92h1ez+
 xrABtMf6NMon/CmifBFTYJzt1z7TCZdspxkipMVHpeSlmygop54ewua7AxOs6k9CgL075bDvunH
 DkeBs6DyxC9h+BS01WVgLofjFMuZ6rc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NyBTYWx0ZWRfX8aqcGpgQJ1fK
 4A69s5U4lEgmGT0gX3hQqIMBPQTimfKcc1Qnr03EJJQzbM5Wa+G0/ED35KnQOCAv/gQUGgTv6LW
 7Dh+e14pvkjtKQWalrCbS1fvNMCLl8LVvQA5gZ0VaT9NG5s8SgLnwuFUA6aYQ8Evh2SfiIDvQ/a
 0Y+JPZDPMDqc+QekErlgpfpuBbLTbdQ918wIV0TQyf4IcTxWDrfeCuXxMWziPAbrtYnEKqMp2Sm
 jjsadH+Gq7Jupq7+mfDevk/7L5mnU48zzEVTtXvNm2+SPeVkVHMVSp5HlC5GXC+U08rzxhK7/gW
 5Ezt5tXF8q16X8vnP3JZp21dE6y/oD+ygBONvKOraSNCHnh8Q17UsMXx72mC83ADTWc5WgWkJaN
 H8q5PiKUCzI08fgUWEFnmJXQpbhFSb6tYcd7KA7WUPEPKQ8q3Zm1p8RUVdYXLChOK4PcCOQRqGU
 bPGDyzVJHxHto6wQKOA==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a55c24a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=r4lB9QUgC6LPr1KdvdsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140047

Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
register controls whether refclk is gated through to the PHY side.

These clkref controls are different from typical GCC branch clocks:
- only a single enable bit is present, without branch-style config bits
- regulators must be voted before enable and unvoted after disable

Model this as a dedicated clk_ref clock type with custom clk_ops instead
of reusing struct clk_branch semantics.

Also provide a common registration/probe API so the same clkref model
can be reused regardless of where clkref_en registers are placed, e.g.
TCSR on glymur and TLMM on SM8750.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/clk/qcom/Makefile  |   1 +
 drivers/clk/qcom/clk-ref.c | 205 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk/qcom.h   |  67 +++++++++++++++
 3 files changed, 273 insertions(+)

diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index db7689ee5dc6..fff069da16de 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -8,6 +8,7 @@ clk-qcom-y += clk-pll.o
 clk-qcom-y += clk-rcg.o
 clk-qcom-y += clk-rcg2.o
 clk-qcom-y += clk-branch.o
+clk-qcom-y += clk-ref.o
 clk-qcom-y += clk-regmap-divider.o
 clk-qcom-y += clk-regmap-mux.o
 clk-qcom-y += clk-regmap-mux-div.o
diff --git a/drivers/clk/qcom/clk-ref.c b/drivers/clk/qcom/clk-ref.c
new file mode 100644
index 000000000000..3efdf6749770
--- /dev/null
+++ b/drivers/clk/qcom/clk-ref.c
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/clk/qcom.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/export.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+
+#define QCOM_CLK_REF_EN_MASK BIT(0)
+
+struct qcom_clk_ref_provider {
+	size_t num_refs;
+	struct qcom_clk_ref refs[] __counted_by(num_refs);
+};
+
+static inline struct qcom_clk_ref *to_qcom_clk_ref(struct clk_hw *hw)
+{
+	return container_of(hw, struct qcom_clk_ref, hw);
+}
+
+static const struct clk_parent_data qcom_clk_ref_parent_data = {
+	.index = 0,
+};
+
+static int qcom_clk_ref_prepare(struct clk_hw *hw)
+{
+	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
+	int ret;
+
+	if (!rclk->desc.num_regulators)
+		return 0;
+
+	ret = regulator_bulk_enable(rclk->desc.num_regulators, rclk->regulators);
+	if (ret)
+		pr_err("Failed to enable regulators for %s: %d\n",
+		       clk_hw_get_name(hw), ret);
+
+	return ret;
+}
+
+static void qcom_clk_ref_unprepare(struct clk_hw *hw)
+{
+	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
+
+	if (rclk->desc.num_regulators)
+		regulator_bulk_disable(rclk->desc.num_regulators, rclk->regulators);
+}
+
+static int qcom_clk_ref_enable(struct clk_hw *hw)
+{
+	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
+	int ret;
+
+	ret = regmap_set_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK);
+	if (ret)
+		return ret;
+
+	udelay(10);
+
+	return 0;
+}
+
+static void qcom_clk_ref_disable(struct clk_hw *hw)
+{
+	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
+
+	regmap_clear_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK);
+	udelay(10);
+}
+
+static int qcom_clk_ref_is_enabled(struct clk_hw *hw)
+{
+	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
+	u32 val;
+	int ret;
+
+	ret = regmap_read(rclk->regmap, rclk->desc.offset, &val);
+	if (ret)
+		return 0;
+
+	return !!(val & QCOM_CLK_REF_EN_MASK);
+}
+
+static const struct clk_ops qcom_clk_ref_ops = {
+	.prepare = qcom_clk_ref_prepare,
+	.unprepare = qcom_clk_ref_unprepare,
+	.enable = qcom_clk_ref_enable,
+	.disable = qcom_clk_ref_disable,
+	.is_enabled = qcom_clk_ref_is_enabled,
+};
+
+static int qcom_clk_ref_register(struct device *dev, struct regmap *regmap,
+				 struct qcom_clk_ref *clk_refs,
+				 const struct qcom_clk_ref_desc * const *descs,
+				 size_t num_clk_refs)
+{
+	const struct qcom_clk_ref_desc *desc;
+	struct clk_init_data init_data = {};
+	struct qcom_clk_ref *clk_ref;
+	size_t clk_idx;
+	unsigned int i;
+	int ret;
+
+	for (clk_idx = 0; clk_idx < num_clk_refs; clk_idx++) {
+		clk_ref = &clk_refs[clk_idx];
+		desc = descs[clk_idx];
+
+		/* Skip unpopulated indices; the array is indexed by clock ID. */
+		if (!desc)
+			continue;
+
+		if (WARN_ON(!desc->name))
+			continue;
+
+		clk_ref->regmap = regmap;
+		clk_ref->desc = *desc;
+
+		if (clk_ref->desc.num_regulators) {
+			clk_ref->regulators = devm_kcalloc(dev, clk_ref->desc.num_regulators,
+							   sizeof(*clk_ref->regulators),
+							   GFP_KERNEL);
+			if (!clk_ref->regulators)
+				return -ENOMEM;
+
+			for (i = 0; i < clk_ref->desc.num_regulators; i++)
+				clk_ref->regulators[i].supply =
+					clk_ref->desc.regulator_names[i];
+
+			ret = devm_regulator_bulk_get(dev, clk_ref->desc.num_regulators,
+						      clk_ref->regulators);
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "Failed to get regulators for %s\n",
+						     clk_ref->desc.name);
+		}
+
+		init_data.name = clk_ref->desc.name;
+		init_data.parent_data = &qcom_clk_ref_parent_data;
+		init_data.num_parents = 1;
+		init_data.ops = &qcom_clk_ref_ops;
+		clk_ref->hw.init = &init_data;
+
+		ret = devm_clk_hw_register(dev, &clk_ref->hw);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static struct clk_hw *qcom_clk_ref_provider_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct qcom_clk_ref_provider *provider = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx >= provider->num_refs)
+		return ERR_PTR(-EINVAL);
+
+	if (!provider->refs[idx].regmap)
+		return ERR_PTR(-ENOENT);
+
+	return &provider->refs[idx].hw;
+}
+
+int qcom_clk_ref_probe(struct platform_device *pdev,
+		       const struct regmap_config *config,
+		       const struct qcom_clk_ref_desc * const *descs,
+		       size_t num_clk_refs)
+{
+	struct qcom_clk_ref_provider *provider;
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+	void __iomem *base;
+	int ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	regmap = devm_regmap_init_mmio(dev, base, config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	provider = devm_kzalloc(dev, struct_size(provider, refs, num_clk_refs),
+				GFP_KERNEL);
+	if (!provider)
+		return -ENOMEM;
+
+	provider->num_refs = num_clk_refs;
+
+	ret = qcom_clk_ref_register(dev, regmap, provider->refs, descs,
+				    provider->num_refs);
+	if (ret)
+		return ret;
+
+	return devm_of_clk_add_hw_provider(dev, qcom_clk_ref_provider_get, provider);
+}
+EXPORT_SYMBOL_GPL(qcom_clk_ref_probe);
diff --git a/include/linux/clk/qcom.h b/include/linux/clk/qcom.h
new file mode 100644
index 000000000000..11ac2d42ff9e
--- /dev/null
+++ b/include/linux/clk/qcom.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026, Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __LINUX_CLK_QCOM_H
+#define __LINUX_CLK_QCOM_H
+
+#include <linux/clk-provider.h>
+#include <linux/errno.h>
+#include <linux/kconfig.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+struct device;
+struct platform_device;
+struct regulator_bulk_data;
+
+/**
+ * struct qcom_clk_ref_desc - descriptor for a clkref_en gate clock
+ * @name: clock name exposed to the common clock framework
+ * @offset: clkref_en register offset from the block base
+ * @regulator_names: optional supply names enabled while preparing the clock
+ * @num_regulators: number of entries in @regulator_names
+ */
+struct qcom_clk_ref_desc {
+	const char *name;
+	u32 offset;
+	const char * const *regulator_names;
+	unsigned int num_regulators;
+};
+
+/**
+ * struct qcom_clk_ref - per-clock data for a clkref_en gate clock
+ * @hw: common clock framework hardware clock handle
+ * @regmap: register map backing the clkref_en register
+ * @desc: clock descriptor copied at registration time
+ * @regulators: optional bulk regulator handles for @desc.regulator_names
+ */
+struct qcom_clk_ref {
+	struct clk_hw hw;
+	struct regmap *regmap;
+	struct qcom_clk_ref_desc desc;
+	struct regulator_bulk_data *regulators;
+};
+
+#if IS_ENABLED(CONFIG_COMMON_CLK_QCOM)
+
+int qcom_clk_ref_probe(struct platform_device *pdev,
+		       const struct regmap_config *config,
+		       const struct qcom_clk_ref_desc * const *descs,
+		       size_t num_clk_refs);
+
+#else
+
+static inline int
+qcom_clk_ref_probe(struct platform_device *pdev,
+		   const struct regmap_config *config,
+		   const struct qcom_clk_ref_desc * const *descs,
+		   size_t num_clk_refs)
+{
+	return -EOPNOTSUPP;
+}
+
+#endif
+
+#endif

-- 
2.34.1

