Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184172;
	b=GJmHHejoWlQCDDYQJVdiVaCA1yVMG9kZO5IJncRhIsqZWDIo5u5oKL+iKfqYluH6WUrT
	 RyIlcrHWV8wQrBUxKfj6iHIVOPkCPS9Yw4tdki+bjO6fgVp2LFd6ZY1pGRylNNULO575V
	 S1cixe47AseiOzzRVN/xe9ZBfP2WJKq9ZZ+1GS2nDBRkb40ofB12/g0gCnmQ8hVu4PWCz
	 BxL9UeXoYlZ6IInN57Zv7fDdnujO1SEt64xzce5hsUODjMViwFYphHsP9sGXLabOK0sW7
	 j+KvNeG4qE+t9BKzpUAeY92rwthBP9sNoYuw9jPzVcNItqcveX1+lu30q9fMCDoVfJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zVbrT2VOsIr/p+KniEiboX2utHknTy8pB4mL4lKTmXo=;
	b=I38wx7Ee3pNv2oF1g0EayB1NmfobJEs9Inx39QwL9FXbt2xc+/YZV2IatnlwbpU9V8/v
	 3B+m1qu3jxjxDBjhzPR16lgcZGE3sBq3LGh0CyApawaA/oL4PaHs0iEwDpnusMz6hNRjg
	 79kvCOnoOAW8YRF4k2pwmghq3Iovu6qmwq5UVOAakWgxxw2gaQqUBoD4fush3YfwgfneO
	 R3RVEarR7YWurK/WMl7ud9Lq2Oa8K3SCjGFEypROaWm9ScBKtcluRTIa4yaYkPz86SUBw
	 esejXxS1e7aKu49Qk1fk2wbj7oMbal9AdzqK/GNPui4YVX1hPRTEVKG684GzeDCh7iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ifkkn4M+;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E225606D81C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 00:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E225606D81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ifkkn4M+
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so3160095e9.3
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 16:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184171; x=1794788971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zVbrT2VOsIr/p+KniEiboX2utHknTy8pB4mL4lKTmXo=;
        b=Ifkkn4M+awrav8xhi1ueWb3RWavBcu70KGOz37S2wxrSAmQ0yGfdmZVvTQHqyxZqvN
         WDfWW8rfkbjAuV4DdswHh4ne9VBL+ZcepSt4v35REhMHaIy++JDAnMN94cjz5J9xQ6KZ
         mn6WIYUZy3SLLyMZ9w+iFXoHiJIKqXwlXAC419zDtu0qacuRREDEMym/7mA6nHVH3dUQ
         317VoPGKo1nieboNtC/caO+fj5FezAjFgTcZjhHP0D3bNkcizlzZDjeO78JrcNy28DR3
         ee2Mvy9x+iFTNXOc3T021lveLj0RyKe4vnZ0wClxvzp5HOwTatDy+1Kr/CoVrDcsjKFV
         XoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184171; x=1794788971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zVbrT2VOsIr/p+KniEiboX2utHknTy8pB4mL4lKTmXo=;
        b=giQrDlZoav7dxxXxXabpBiTzFYiAtNgFs3qG0k35RYepZ+axyZNAWhrXSIdWmWbTZf
         qEj3ucbmfCJnpMZf5j32obxswNY1FDmeIeAmDr5cEfLuFmOoGf8Pfb4+608KILlYUgy6
         TmrkGCTyBsxWxa47GDjpOhOTr3tTWYnLkHylauFvyQORE8GpCZfOTE3Py1yEbNErsRIQ
         p2ijHJC2iuh93tztFL2VuYBrDv0fYy3gRYIOYNnwFspVsSOiAAt4eJ2+1CEYHjCm2fsC
         B6/FQJ6PF7rGFY6vZLzl5tuzwqMbR96KVHTIE+JmSVxqbnmaV2MIDT+THZLmDMAIcVqD
         4Wtw==
X-Forwarded-Encrypted: i=1; AL+hErEd5xe4eXPY4xwPaTVb/iooYCTmYK8V3Lpn9BpDbbJHCimFX/ag2dT1qBziFgtjf3mcsu0rEXsCl/Uw@vger.kernel.org
X-Gm-Message-State: APuU4Z+KncwzttQj5/8Fjfo83xo7m1hhJ3Wwcj5Zjxf0ag+Vhi2YUa4T
	XAzpDtUfUuQOgst5BNU7q76+Mto0V1mrlVap3UT1SerIJtQM1HvRSjN5mn5rZJtIePw=
X-Gm-Gg: AYBFou3HtvevG2j4T9b82x8WuGOURrrFyNAK1AXl489IB0v+TU00pU+2YASp4HmzEHf
	Wqp4q3T4qQDXHu2Nc70EmrhLmSiQ97Dnq6HqwnbNSmJ9YqXomCMzU2vy/e7h/Il+Jsdxpos+RlL
	25IzjQsznD1t68d0lm1KJYBnGVzFluf4t4KZA7A6FwXCAhl3+MiZbEuxoi0V1wUE8Qb7t6HEHkj
	5swndkkz9yxk+vga57pUJ3g92GuzCPFvyYC7CuK19A+r7uiNA/Yw1tIe3RX+Kx3c1LA/elGJo94
	LKbWpzk7XLzrnVvwRwC9IHMtrjl+sszGXTcf0q5d4y8oeCsPsCOuOx99l9ptrb174q4rBd7ALnx
	1/JeKtMYJiIpAiIW9q88T/+VWJSB/lrEV57fpnQfU01o5LQ7PqV3ShnTQJvadZR07BbIwDhccJU
	gI5xOQRoOSm0iPjgv9voem5LTz3bJ9r7ToFWeD/zQb9706+agZBOxdf/P9QB1pPvwjoTF1FP2/T
	cASo4p7yGh4RKqE1D3GWmz7m3VQhNuWUFx3HIcHqsFyCjZFjC7R6UIsfcUwAbreZISnP/NmQ73j
	JIiqQiBy59iMp5H58Uwo75v2318ui5GMO2SFYb4d4g==
X-Received: by 2002:a05:600c:190f:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4b94d76c162mr49981715e9.4.1794184170632;
        Sun, 08 Nov 2026 16:29:30 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee1de2esm91295785e9.5.2026.11.08.16.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:29:30 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:29:13 +0000
Subject: [PATCH 4/5] clk: qcom: common: Register clk_ref clocks from
 qcom_cc_desc
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
Message-Id: <20261109-halliday-clk-v1-4-20c3ba8be0bd@gmail.com>
References: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
In-Reply-To: <20261109-halliday-clk-v1-0-20c3ba8be0bd@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184152; l=9291;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=IHJayG8/Hs+A92B+sOMJvBV+GKx5N2sT3c+tBl4Njps=;
 b=Z5iv8p8lY14gMyUg+6EQ5mSgNlGIDm4UsgTXrBZC5Mg3W2c3sscFdt6pmNPTAv7MWf3CF2Ndg
 yj4fItpfp2DDIc2DrpFY75jd+58ru0zvwj9wldLJd0RiZRDhzbLtxbh
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

The clk_ref clocks model a clkref_en gate together with the supplies of
the QREF block that feeds it. So far they can only be registered as a
standalone clock provider with qcom_clk_ref_probe(), as on the TCSR of
X1E80100 and Glymur.

On Halliday the clkref_en registers are part of GCC, and the QREF
supplies are shared with the UFS PHY: when UFS runtime suspend turns
them off, the USB HS PHY loses its reference clock. The GCC driver
needs to provide its clkrefs as clk_ref clocks next to its other
clocks, so that their users keep the supplies on.

Let a qcom_cc_desc carry clk_ref descriptions, indexed by clock ID like
its other clocks. qcom_clk_ref_register() now registers a single clock,
so qcom_cc_really_probe() allocates and registers only the populated
entries, and qcom_cc_clk_hw_get() returns them for their indices. As
with the other clocks, entries listed in protected-clocks are skipped.
A clock ID used by both a clk_ref and a regmap clock fails the probe.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/clk/qcom/clk-ref.c | 91 +++++++++++++++++++++-------------------------
 drivers/clk/qcom/common.c  | 60 ++++++++++++++++++++++++++++++
 drivers/clk/qcom/common.h  |  9 +++++
 3 files changed, 110 insertions(+), 50 deletions(-)

diff --git a/drivers/clk/qcom/clk-ref.c b/drivers/clk/qcom/clk-ref.c
index 3efdf6749770..266acdfa5488 100644
--- a/drivers/clk/qcom/clk-ref.c
+++ b/drivers/clk/qcom/clk-ref.c
@@ -13,6 +13,8 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
+#include "common.h"
+
 #define QCOM_CLK_REF_EN_MASK BIT(0)
 
 struct qcom_clk_ref_provider {
@@ -96,63 +98,46 @@ static const struct clk_ops qcom_clk_ref_ops = {
 	.is_enabled = qcom_clk_ref_is_enabled,
 };
 
-static int qcom_clk_ref_register(struct device *dev, struct regmap *regmap,
-				 struct qcom_clk_ref *clk_refs,
-				 const struct qcom_clk_ref_desc * const *descs,
-				 size_t num_clk_refs)
+int qcom_clk_ref_register(struct device *dev, struct regmap *regmap,
+			  struct qcom_clk_ref *clk_ref,
+			  const struct qcom_clk_ref_desc *desc)
 {
-	const struct qcom_clk_ref_desc *desc;
 	struct clk_init_data init_data = {};
-	struct qcom_clk_ref *clk_ref;
-	size_t clk_idx;
 	unsigned int i;
 	int ret;
 
-	for (clk_idx = 0; clk_idx < num_clk_refs; clk_idx++) {
-		clk_ref = &clk_refs[clk_idx];
-		desc = descs[clk_idx];
+	if (WARN_ON(!desc->name))
+		return -EINVAL;
 
-		/* Skip unpopulated indices; the array is indexed by clock ID. */
-		if (!desc)
-			continue;
+	clk_ref->regmap = regmap;
+	clk_ref->desc = *desc;
 
-		if (WARN_ON(!desc->name))
-			continue;
+	if (clk_ref->desc.num_regulators) {
+		clk_ref->regulators = devm_kcalloc(dev, clk_ref->desc.num_regulators,
+						   sizeof(*clk_ref->regulators),
+						   GFP_KERNEL);
+		if (!clk_ref->regulators)
+			return -ENOMEM;
 
-		clk_ref->regmap = regmap;
-		clk_ref->desc = *desc;
-
-		if (clk_ref->desc.num_regulators) {
-			clk_ref->regulators = devm_kcalloc(dev, clk_ref->desc.num_regulators,
-							   sizeof(*clk_ref->regulators),
-							   GFP_KERNEL);
-			if (!clk_ref->regulators)
-				return -ENOMEM;
-
-			for (i = 0; i < clk_ref->desc.num_regulators; i++)
-				clk_ref->regulators[i].supply =
-					clk_ref->desc.regulator_names[i];
-
-			ret = devm_regulator_bulk_get(dev, clk_ref->desc.num_regulators,
-						      clk_ref->regulators);
-			if (ret)
-				return dev_err_probe(dev, ret,
-						     "Failed to get regulators for %s\n",
-						     clk_ref->desc.name);
-		}
-
-		init_data.name = clk_ref->desc.name;
-		init_data.parent_data = &qcom_clk_ref_parent_data;
-		init_data.num_parents = 1;
-		init_data.ops = &qcom_clk_ref_ops;
-		clk_ref->hw.init = &init_data;
-
-		ret = devm_clk_hw_register(dev, &clk_ref->hw);
+		for (i = 0; i < clk_ref->desc.num_regulators; i++)
+			clk_ref->regulators[i].supply =
+				clk_ref->desc.regulator_names[i];
+
+		ret = devm_regulator_bulk_get(dev, clk_ref->desc.num_regulators,
+					      clk_ref->regulators);
 		if (ret)
-			return ret;
+			return dev_err_probe(dev, ret,
+					     "Failed to get regulators for %s\n",
+					     clk_ref->desc.name);
 	}
 
-	return 0;
+	init_data.name = clk_ref->desc.name;
+	init_data.parent_data = &qcom_clk_ref_parent_data;
+	init_data.num_parents = 1;
+	init_data.ops = &qcom_clk_ref_ops;
+	clk_ref->hw.init = &init_data;
+
+	return devm_clk_hw_register(dev, &clk_ref->hw);
 }
 
 static struct clk_hw *qcom_clk_ref_provider_get(struct of_phandle_args *clkspec, void *data)
@@ -178,6 +163,7 @@ int qcom_clk_ref_probe(struct platform_device *pdev,
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
 	void __iomem *base;
+	size_t i;
 	int ret;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -195,10 +181,15 @@ int qcom_clk_ref_probe(struct platform_device *pdev,
 
 	provider->num_refs = num_clk_refs;
 
-	ret = qcom_clk_ref_register(dev, regmap, provider->refs, descs,
-				    provider->num_refs);
-	if (ret)
-		return ret;
+	for (i = 0; i < num_clk_refs; i++) {
+		/* Skip unpopulated indices; the array is indexed by clock ID. */
+		if (!descs[i])
+			continue;
+
+		ret = qcom_clk_ref_register(dev, regmap, &provider->refs[i], descs[i]);
+		if (ret)
+			return ret;
+	}
 
 	return devm_of_clk_add_hw_provider(dev, qcom_clk_ref_provider_get, provider);
 }
diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 08fd62ac780d..c767fa3d0207 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -8,6 +8,7 @@
 #include <linux/regmap.h>
 #include <linux/platform_device.h>
 #include <linux/clk-provider.h>
+#include <linux/clk/qcom.h>
 #include <linux/interconnect-clk.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset-controller.h>
@@ -25,6 +26,8 @@ struct qcom_cc {
 	struct qcom_reset_controller reset;
 	struct clk_regmap **rclks;
 	size_t num_rclks;
+	struct qcom_clk_ref **clk_refs;
+	size_t num_clk_refs;
 	struct dev_pm_domain_list *pd_list;
 };
 
@@ -247,6 +250,9 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
 	struct qcom_cc *cc = data;
 	unsigned int idx = clkspec->args[0];
 
+	if (idx < cc->num_clk_refs && cc->clk_refs[idx])
+		return &cc->clk_refs[idx]->hw;
+
 	if (idx >= cc->num_rclks) {
 		pr_err("%s: invalid index %u\n", __func__, idx);
 		return ERR_PTR(-EINVAL);
@@ -255,6 +261,54 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
 	return cc->rclks[idx] ? &cc->rclks[idx]->hw : NULL;
 }
 
+static bool qcom_cc_is_protected(struct device *dev, unsigned int idx)
+{
+	u32 i;
+
+	of_property_for_each_u32(dev->of_node, "protected-clocks", i) {
+		if (i == idx)
+			return true;
+	}
+
+	return false;
+}
+
+static int qcom_cc_register_clk_refs(struct device *dev, struct qcom_cc *cc,
+				     const struct qcom_cc_desc *desc,
+				     struct regmap *regmap)
+{
+	struct qcom_clk_ref *clk_ref;
+	size_t i;
+	int ret;
+
+	cc->clk_refs = devm_kcalloc(dev, desc->num_clk_refs, sizeof(*cc->clk_refs),
+				    GFP_KERNEL);
+	if (!cc->clk_refs)
+		return -ENOMEM;
+
+	cc->num_clk_refs = desc->num_clk_refs;
+
+	for (i = 0; i < desc->num_clk_refs; i++) {
+		if (!desc->clk_refs[i] || qcom_cc_is_protected(dev, i))
+			continue;
+
+		if (WARN_ON(i < desc->num_clks && desc->clks[i]))
+			return -EINVAL;
+
+		clk_ref = devm_kzalloc(dev, sizeof(*clk_ref), GFP_KERNEL);
+		if (!clk_ref)
+			return -ENOMEM;
+
+		ret = qcom_clk_ref_register(dev, regmap, clk_ref, desc->clk_refs[i]);
+		if (ret)
+			return ret;
+
+		cc->clk_refs[i] = clk_ref;
+	}
+
+	return 0;
+}
+
 static int qcom_cc_icc_register(struct device *dev,
 				const struct qcom_cc_desc *desc)
 {
@@ -359,6 +413,12 @@ int qcom_cc_really_probe(struct device *dev,
 		qcom_cc_clk_regs_configure(dev, desc->driver_data, regmap);
 	}
 
+	if (desc->num_clk_refs) {
+		ret = qcom_cc_register_clk_refs(dev, cc, desc, regmap);
+		if (ret)
+			goto put_rpm;
+	}
+
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;
 	reset->rcdev.ops = &qcom_reset_ops;
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 6f2406f8839e..438fe5be56e1 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -19,6 +19,9 @@ struct clk_hw;
 #define PLL_VOTE_FSM_ENA	BIT(20)
 #define PLL_VOTE_FSM_RESET	BIT(21)
 
+struct qcom_clk_ref;
+struct qcom_clk_ref_desc;
+
 struct qcom_icc_hws_data {
 	int master_id;
 	int slave_id;
@@ -45,6 +48,8 @@ struct qcom_cc_desc {
 	size_t num_gdscs;
 	struct clk_hw **clk_hws;
 	size_t num_clk_hws;
+	const struct qcom_clk_ref_desc * const *clk_refs;
+	size_t num_clk_refs;
 	const struct qcom_icc_hws_data *icc_hws;
 	size_t num_icc_hws;
 	unsigned int icc_first_node_id;
@@ -89,4 +94,8 @@ extern int qcom_cc_probe(struct platform_device *pdev,
 extern int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
 				  const struct qcom_cc_desc *desc);
 
+int qcom_clk_ref_register(struct device *dev, struct regmap *regmap,
+			  struct qcom_clk_ref *clk_ref,
+			  const struct qcom_clk_ref_desc *desc);
+
 #endif

-- 
2.55.0

