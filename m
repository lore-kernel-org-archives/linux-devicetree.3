Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88863859D5
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670980; cv=none; b=nW5W93sdbsvuBuXA+SFwse5VGoFzIqAUrN5f5VQVLsKNGfvDgIaoEGks6Cl0+kaPMdMuX8yuqx5pDFQKGQrawgV+nmFaUpkbGbF8eGfs8twNG2h/Mi06KNoz+d1eFXsM3c3qnY3KVlDf2zqJDJ7qC0V7vJg9ZHre9BQXr8z0zDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670980; c=relaxed/simple;
	bh=8TZSAgGn0ST4uwQenr8bMUEmLD2tllnMMegjYZ08myg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UAXceVdEXHrDscV7Qm7g9HByBrdZHbXQeHcdjoV2O1r899a/AUAbNvsEMrant2FwmKUU7c53PvjXEigg3ktCzWvE2v2i4e9PRhH3ICYkuRQCqgtLiTRTsYtrkQ0oqfxcw/apkrASeIUO/AMyp5HRQE1xkDZlhd80iz0aPhLIsnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cY7ZsgQg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BBGu+OHr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cY7ZsgQg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BBGu+OHr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K5UWdG4005463
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kHb1dUo9TygTE3Q2B7zk071fFb8iK4/RDkiODdvYkgY=; b=cY7ZsgQg7N9iGn79
	DzCZZt0ozwl5dlfSxa4b5nniPlVcfexDCLmVkS3XcAzwd2B7/U8FiaUS04jkYulr
	HohZqpqfsX50yinkOwn9umUuJUuAXfeEvhxtoCJRTtEGecpCYfsOpTDpQUl/i64v
	vMHOEJeF9N20c9ZzAYzo8jzsqxePGvvtBcaRx0GKdCU3tXmONrrpdn+t0tRTMxIP
	G0TugmtzlM61Jg0g8kCJW1DSPScIWtw8ubBgdk2o8QaWqocNGACwviJ0D/1rOqpP
	+5mBtYE8mVmMaMabZtRrij17POhCYMSLtPEingIhCMXm8sG2vctqlsej+HJXg8PF
	jLTF5A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm34hcn62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 07:42:57 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1270dcd11c1so3727197c88.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 00:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776670977; x=1777275777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHb1dUo9TygTE3Q2B7zk071fFb8iK4/RDkiODdvYkgY=;
        b=BBGu+OHrG5TYM0Q7X1vP9Dx4FMqh4a6J1upObFfbu1SAro1XAE4GPkHfBqTFkX1br4
         MCu4jrVARJFnuW14EKE0N+czzi5UkscVLNrsYFwNsF8eMcmkqp8wvch4mk5e2lnXejkW
         4QrkK4zfV/aCr1SLoujGPgsjutp7vVmIlAGbVo8/7UUHhNWj5M+JWt/15cLoGFnMteBD
         r4UL9lEekWGerFFr+bkFgdLoJpA+uKZfGzUDS/kiG5CtHZ1iL/T1kXmoPpjQsPJM/AS+
         xtZXqq0dQaCll3QZ5MWEBCn/2v8K6/U5slerqOlCKFPW6NnEPjudZjNsKKxrzgu6A2Yk
         DaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776670977; x=1777275777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kHb1dUo9TygTE3Q2B7zk071fFb8iK4/RDkiODdvYkgY=;
        b=GW7KiZ/jCMSmOt2k8U3sMsPaHi7+5ue0a0krTyvhSYoGZE4KxMrwpI9nWqs2MB16S+
         Kj6cEZKp7DnbZOoALsA63DgiMLkhpaBg9KK8dBnCy8xqFut6eKu8Zhp94CRIJda4OjaK
         M+7982X0stNowpoX9xoSZjzny6desPHreHWW4RWAe0By0hD6m9rydW9QfDvrcXlHb9+d
         7fGemvmxDsIpn2/v/lR7V4DYdfd4H6y+zyWHTAumh54L+oMXmEfpFa9ozu/gWSr+sRLV
         0DW8fhbzNBdiTfcb2oj4FDyFS+XQ38x8v3sNht6MSFCjp6vabRD9os+YdDzz0wqO6nyg
         xRQQ==
X-Forwarded-Encrypted: i=1; AFNElJ9mDid5m1BQyTayH+2HUXmsG5hdI3ifLN6h4XUFbRxkIFr83ednigRV/lx2tqsaDEqt0vMFhDi0OJbd@vger.kernel.org
X-Gm-Message-State: AOJu0YyuLr3Hp1+GXqUZaijMCo0tlHeGBJXxAGImONM1hZznMqPNI0CC
	W1fzj6iW/oPt7sKx4PCYYQ/pIHq8TLyuRPp0JdyOAmD7WRXOxcR4Cf6q67DM5WyJmV5i8YYoc8Y
	twSNGne+mgJPnOM/lHctLBiDnaBzrbjTBIGCtXlj8S8O2WFNebq1w2KwapjU9UDw2
X-Gm-Gg: AeBDietgL+LxmHevtVqo2N0NmIjPRxLMqQFeZ/WPgTy5OdXG/frGqpScQLgF+GeFZhp
	ckUXfHBrUMA0UUXg94arm1qCCQqFhsCiZP369whJ9EDJqD8YWqYhB8n2Db6ZiKRnkYNXLC13o3/
	Ucl69VVjkOUKGemys+gqKnAeTQXOeg3sjeFZr4GSUEYlRwBxH8rkXoxAETotwVZcIrL4cndHQAU
	ASc32YmrIHcmpsK2Zq0NKE97i1z9hL02JMkbAF+q0oB+AbYr7lCbUz+b1cf33kytSCoTA1iUNhc
	23qWRPJVcGSJjY8M3aSFe0nfQcIk6SoTEDEh19XK0rCWrr0KuJml8rdurOU7B8SsZD6Vyic4tBH
	6Vntzu/+DNPMAwqj3PUGh7ve2z9DRig283Ltc/YHyiGMLrF3fD2vm65VdZ9GO+ehOTbZoYwDjiS
	iOZBQ=
X-Received: by 2002:a05:7022:6b96:b0:12c:3d3c:ac08 with SMTP id a92af1059eb24-12c73f6d728mr5893635c88.4.1776670977014;
        Mon, 20 Apr 2026 00:42:57 -0700 (PDT)
X-Received: by 2002:a05:7022:6b96:b0:12c:3d3c:ac08 with SMTP id a92af1059eb24-12c73f6d728mr5893609c88.4.1776670976427;
        Mon, 20 Apr 2026 00:42:56 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a18a2bsm19866217c88.10.2026.04.20.00.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:42:56 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 00:42:53 -0700
Subject: [PATCH v2 2/4] clk: qcom: Add generic clkref_en support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-vote_qref_in_tcsrcc-v2-2-589a23ae640a@oss.qualcomm.com>
References: <20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com>
In-Reply-To: <20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776670973; l=9136;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=8TZSAgGn0ST4uwQenr8bMUEmLD2tllnMMegjYZ08myg=;
 b=dizq03G9Lv+4mTKloW/2hhrzL9SUvdpeRG8vcbr6vxzQIRpYbVuW83qXUgUaFBbENArHdliy4
 LZQ56yxIwr0AKMj3b0HspPGsjk4aT2p8qOJ9U5gK6X6qblJ0SKZ8v/x
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=J46aKgnS c=1 sm=1 tr=0 ts=69e5d901 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=r4lB9QUgC6LPr1KdvdsA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: 6mgGwHyebPWOCMSOliBFVqu25HV8zUR-
X-Proofpoint-ORIG-GUID: 6mgGwHyebPWOCMSOliBFVqu25HV8zUR-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA3NCBTYWx0ZWRfX/56zlZltkWxl
 0M97/emUP8l2rRU5iS4tOSOSB2GkHeXDN/ownD0RzRAL3Ifjs7dQeI0mf/G0/+PIXApglZ4Q6Uf
 jirYm00TqiuwHY+A2zCOOACalGqKOYBplU0rMBPVI2Lo6TzFXmEi9BbYFlvgQ/VfUYuRYl8OQ50
 DPgGdU3QVUGkXd/gRO1twnQk/Q07uLYLWqvWbt78Waj2FFCzcrcbyOVHOC5CYi3TDvhnpusrE19
 8NVNr526gsQ9aOYwR/zH9Ye497DIKDlt4mQk482mXs4/bp2MnnjN/g1RgjzqaBzlZY0I0kUVRSx
 VuNW98UuO6IwRsb5bCGyl0AcddICVv0UHM8HtdOFth+DXRkehzdI2LE5He+Acc27kJPFlZtnQrB
 aPYdVp8jjV7eES2g4f9e6CJM96f7aCBG9/MrqmOnM0azw7dSs4Y8d2k+pSSQrPU+oHu/IokOSQr
 S7HFL4ocIY1YwT2aWTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200074

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

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/clk/qcom/Makefile  |   1 +
 drivers/clk/qcom/clk-ref.c | 202 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk/qcom.h   |  69 ++++++++++++++++
 3 files changed, 272 insertions(+)

diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 89d07c35e4d9..1659e9d9afa9 100644
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
index 000000000000..ea2ed03460f2
--- /dev/null
+++ b/drivers/clk/qcom/clk-ref.c
@@ -0,0 +1,202 @@
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
+	struct qcom_clk_ref *refs;
+	size_t num_refs;
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
+	ret = regmap_update_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK,
+				 QCOM_CLK_REF_EN_MASK);
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
+	regmap_update_bits(rclk->regmap, rclk->desc.offset, QCOM_CLK_REF_EN_MASK, 0);
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
+		return ret;
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
+				 const struct qcom_clk_ref_desc *descs,
+				 size_t num_clk_refs)
+{
+	const struct qcom_clk_ref_desc *desc;
+	struct qcom_clk_ref *clk_ref;
+	size_t clk_idx;
+	unsigned int i;
+	int ret;
+
+	for (clk_idx = 0; clk_idx < num_clk_refs; clk_idx++) {
+		clk_ref = &clk_refs[clk_idx];
+		desc = &descs[clk_idx];
+
+		if (!desc->name)
+			return -EINVAL;
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
+		clk_ref->init_data.name = clk_ref->desc.name;
+		clk_ref->init_data.parent_data = &qcom_clk_ref_parent_data;
+		clk_ref->init_data.num_parents = 1;
+		clk_ref->init_data.ops = &qcom_clk_ref_ops;
+		clk_ref->hw.init = &clk_ref->init_data;
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
+	return &provider->refs[idx].hw;
+}
+
+int qcom_clk_ref_probe(struct platform_device *pdev,
+		       const struct regmap_config *config,
+		       const struct qcom_clk_ref_desc *descs,
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
+	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
+	if (!provider)
+		return -ENOMEM;
+
+	provider->refs = devm_kcalloc(dev, num_clk_refs, sizeof(*provider->refs),
+				      GFP_KERNEL);
+	if (!provider->refs)
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
index 000000000000..09e2e3178cfb
--- /dev/null
+++ b/include/linux/clk/qcom.h
@@ -0,0 +1,69 @@
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
+ * @init_data: common clock framework registration data
+ * @regmap: register map backing the clkref_en register
+ * @desc: clock descriptor copied at registration time
+ * @regulators: optional bulk regulator handles for @desc.regulator_names
+ */
+struct qcom_clk_ref {
+	struct clk_hw hw;
+	struct clk_init_data init_data;
+	struct regmap *regmap;
+	struct qcom_clk_ref_desc desc;
+	struct regulator_bulk_data *regulators;
+};
+
+#if IS_ENABLED(CONFIG_COMMON_CLK_QCOM)
+
+int qcom_clk_ref_probe(struct platform_device *pdev,
+		       const struct regmap_config *config,
+		       const struct qcom_clk_ref_desc *descs,
+		       size_t num_clk_refs);
+
+#else
+
+static inline int
+qcom_clk_ref_probe(struct platform_device *pdev,
+		   const struct regmap_config *config,
+		   const struct qcom_clk_ref_desc *descs,
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

