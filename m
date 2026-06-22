Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556BC359A68
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782105100; cv=none; b=tmc+iSfWx5qCj/e0CsMapwmqnhMmlW58axZ7DtRDmjybRm1ZCWUfzL0cgab1wEtFLIdaPAk1fDaxpUNPtcIlkny/I4/+g8vSjEIysFpLtTKsL2V8AfcfqkO87Hv8BC/P8IHewHr3vMKcIwzpG/xKaXnpo3+fnprDujcdonmott0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782105100; c=relaxed/simple;
	bh=XBJO4SMFbyVoEawcCWAJ9scn+Tbn6DXfij/0IxHeKpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=icAU+uM0nORapvxAXJq/Az8YklR8GB8oZjd8mLd3r3R5UWTQFGcptNs/rRtydNm/MW6D1Qm/znSVrUNTu8V1zC7fpxxLdNMDk6ReJ9bACuOcg0N0fvoU5Y2xGJsNzhGU2HUyaHyfOLY7bCQ71qObdW6gQJboWBQtntKQdLszGLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cKUx37Lo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/Kdfygn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cKUx37Lo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/Kdfygn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59DUV1275444
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vbs55cAiMzDwNIRWRa7hqHBap80NmRRXIMEN+aZENGA=; b=cKUx37Lo6RzIIPII
	F4goLUcVkieUUiRoHZ9sAAFSSwLsdAOKOe72YgVjqxAzhUnL9QSagQ/k4rwdloCI
	MHro5VG7c3yCDaHzRUfRwK1lnqRhzcVyyG7OagOxAV6e2/G1CfoIexPnbw8FlBRJ
	7kXIWiPItGQ1+JL1qPwVnxb5+2laH+6PtODhWggH1womL2xSH3ItY1LuBtCv2GSf
	ZCWfcgQNZL+cft8miJKytr5FjyJRQdCKhAh7IQCq3divR1y+zfejcHMGxcmOZObY
	+MNznWOyj+OskLHsZw0QCpTT5V3qnK187DWDUDeckxObePaaf+Pj+8Fu7Ywy98GY
	dVS0jg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewk32vsfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 05:11:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bef75a41eso2810772eec.0
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 22:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782105097; x=1782709897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbs55cAiMzDwNIRWRa7hqHBap80NmRRXIMEN+aZENGA=;
        b=L/KdfygnaeGun5dHrEaTBVeuXsyVHGGfdV4bMArbI9rQgIRDhVhXOyojmQOQmRh+Qv
         pKZki7OKCj8bKMwmRd+MiiAA68twLn5eN26aRpskyYX4oM3i9uhVF5eDS3x30KeCZmsX
         /BceWHXgu2WGlY2grTMcvXTZcBP2BIoD4sK/WiJ1bGSziMhpYHONt45Je38/W+Tx3V8r
         Xg7xHiBGI80mZWtd+1k3rZXkT8s+puOs2NQU7aZwhvFsCnFqo1oAIT9ZII2OJbLEzJJc
         DttPdoMHdWyJ/GDC+jVni7V7wlaFL0+i8tFzhBaWg+TGAS+oLpAB+Cv5Q0eNcjhV1Wod
         F5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782105097; x=1782709897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vbs55cAiMzDwNIRWRa7hqHBap80NmRRXIMEN+aZENGA=;
        b=dOs3cq3nCrEIvvvvy4I4nR2a1JAlmnGq8Gh9Y038zIJgCIZiwwBLy8oBWXPAYFGF94
         Mb9SJtQOTOFWrAYJJiwf2eg9GvMRUUMtBcuLJXJvjbyL0QG5qVbo8J+NQEeBGgFliwFw
         6ktvyHbOEJgRbi0Dgip+U3ISrlhdIqiWP6rMncQGfM7ZnuSn0YZcmwalcL6AMMrqZe7J
         JrST3weTz/J+7KWLRy56pzniyjHyBdRx1/AUUyTSx2l5dft38yf9A8BAiCp5UyldwDfh
         vHaQj3ZP4FLRyzfqCZoy61rKudG1vpj5t3DgcKlAiEdoO/BWE3sDTv3pY6agE9dgYUWs
         /PfQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp118H6guUZAjEU3aXmUkY/S/W9YM+7mzOwT5CT/yjwzZk/+Jjgmki67iAbaE/IZmn3AM82+6pp3BH7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1yo+HxtvHqUNOfsOhj7Ceu/Mp8B+VgkyH3+LVDO393ju5D4BZ
	cv9DROn0mzT/HzGxKIapC7jGXLAwjboT9FFFx1hK5wOtq8BqLMEyfuAOKpoyo9H7IDM3cL1h+nC
	kI70amGn6rEHDf28DA26buq7xf/UY+G4Y/odsmCzsVl3XWU/FIC58dS3ZETZMLmvGiP0zBi8u
X-Gm-Gg: AfdE7ckYTdEkwLi/OVvgjsK5hVA5bUlaBTUenNcYFqN7+Leivycy3jJAljSHrL/YFZ2
	8wKDREBwWGeYitjLqNhOB2z8UmyDojuzY5jaYylmhx/rgXOsofD8tKT2ea/bJrjT/csRsKFH3fL
	VMnAcb/+8q4Iw2J8Y5KSDTGZ6EsHi9GNtHD24kalc23NIzXiqHLyuYKbIK/3EtrjwPA3vgPOzTK
	1F7VL+KLg+YFntcIobqwLeDrr+UCMYkhaXQu0qDApfQffZyA28GtAf9TMBVO/iaHlFFkrTDXGca
	O5k0YQI9/x3n4ReZoATQvKEkGS1jscg8qlyWrxG8DYnW5j3Ku8X8HkaniaT0I/gIrWvjz7fsxxO
	TwfXJtWs8Wzuv2VhamAD5B58043/hkhO2hl/9xijNj1ru9vRWFY1R5x0HMw==
X-Received: by 2002:a05:7300:7313:b0:307:26a3:75d8 with SMTP id 5a478bee46e88-30c1d96fc0dmr6630803eec.1.1782105096924;
        Sun, 21 Jun 2026 22:11:36 -0700 (PDT)
X-Received: by 2002:a05:7300:7313:b0:307:26a3:75d8 with SMTP id 5a478bee46e88-30c1d96fc0dmr6630781eec.1.1782105096408;
        Sun, 21 Jun 2026 22:11:36 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d779sm8947716eec.17.2026.06.21.22.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:11:35 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 22:11:26 -0700
Subject: [PATCH v6 3/8] clk: qcom: Add generic clkref_en support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-tcsr_qref_0622-v6-3-c939c22ded0c@oss.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
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
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782105091; l=9061;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=XBJO4SMFbyVoEawcCWAJ9scn+Tbn6DXfij/0IxHeKpo=;
 b=ZCEQKbhWHsmepw/vRQSkseIQ6KRvcBTM/fiJyPl+VHv8elnrIyOSQaVRgNiDTTUrwa9OVMOf4
 dM3laThDK4LDnJc+inwMXG4Vft6zvjZn8txDmbKTYZKoQN/5trRT7Jv
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: lnmQiIwFfHMtG-TcDKynFlkMh64hOct5
X-Proofpoint-ORIG-GUID: lnmQiIwFfHMtG-TcDKynFlkMh64hOct5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfXybXuSrUs9fAd
 OR26AKSG7dHk3EcgEGYo0byazL/SToA+tjn9TSPhH5dl2R5eIYvnMuv9qX+fNu0EgK69prNOf5i
 VR1n5QCJaP/DQlSrXBBEj3VwGnBCE84=
X-Authority-Analysis: v=2.4 cv=NovhtcdJ c=1 sm=1 tr=0 ts=6a38c409 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=r4lB9QUgC6LPr1KdvdsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX4BBUt4t3GTSk
 wu+u6T/tvbaQH2FWCPeN2Q1Q1VI4gaA5o9n4hkh4qnoR6Pn8J/fEZxkPzWnCY/ObuRcmhtrO3PZ
 20M6J9Qp4bxEpTSuNfXSrSabXcsQzFYUJw9JEYWBDioTq6gQaU1SSJYQAMFdjJ+fSqFZ69BkZxk
 x/7vpEgS1elraSCBcnDdBlkT5aOoXatdj5VMs75lUpc/rvVXoL6X1qELcmfcwM5a5fFtXFYS+9E
 8yMWwXd04Cz+RWQ8E1X/7dZ1AfKGr4jVFyPsNbKScSKrSW9Nu6PUZc1oKVoXsyp+751TA+pvw0v
 4YdeqgbmAQlY9AbvlC52pnR42nE1lCzDFnUz/0PYM9/HfijMocZlqJCTEJSvP55PJqbA4f07mFy
 26IgLitGWRpOFgXW07aFpgm/Q2ssqjLkgUmpMYMzn62JFbYcb5eJpuCbD4dFwnlFAVh/T3wQ8S3
 2FC3BSuwYCcbuksgLyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220047

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
 drivers/clk/qcom/clk-ref.c | 205 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk/qcom.h   |  67 +++++++++++++++
 3 files changed, 273 insertions(+)

diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 58f9a5eb6fd7..4e7abe8d49e6 100644
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
index 000000000000..8132e510f43c
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
+				 const struct qcom_clk_ref_desc *descs,
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
+		desc = &descs[clk_idx];
+
+		if (!desc->name)
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
index 000000000000..a89122a8f87b
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

