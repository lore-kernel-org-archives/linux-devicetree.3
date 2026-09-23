Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B99553C3D7
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 18:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188194; cv=none; b=dbjfEuhayZjND6oYA+YNzoe9Exl5FJTLdRCyXiNuy6fY2JlwB8P7UPGVziXpxLCBZJmeWbj0ErmF97EqBBIZLRPJS2q83KBIWtfU7UuWtFUo9oHEFwpOaV7bhnhEK8dgU0dnrEtarNGPjfkEbzqBXI78fy0RJeRQ0XojZrHV2IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188194; c=relaxed/simple;
	bh=xrGH6M3bJ8igFRHyhrXgCckCWaOGHyA4X0Rt+3qQ9UA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RUJhfwc+X/WLg3JgpUtk9z0Q1IGMYMzSXy5YxS2Ri+XTS+er5kfTNmvhvo0yzKsBVhbAGZpb5U1GPosf4DvvenMbsZ++E6u+eq4d1jsfKO1OMFX2k/rtXAvqRY9GYA78XDQWVSSMib95xAZGOCVXlAme6fnkoNHkoAKK3jc1ThY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IyXFjosV; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyXFjosV"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so4651765e9.0
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790188189; x=1790792989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mp6wBBpQsQq5uAJhpRvAfRITa5kH/kGE8kQJrdjyLoY=;
        b=IyXFjosVF9dDrH1t5gtcRVfDBi8ws8iP0kNCozmZ0KwbbxoGKY+2N3YwtPAr0p88z6
         hMBnRR/nYxItNSF6RgDtMyirS7r2I5duQqeKq+z+eMX7dsHC5pSvvNF9EF7BZm8KKKFD
         Q/YKTl6ST7vMQAIz3tR9EGE6DxWCno/F0KDRAwuXBeqS/fwQUkAczCa06PbO3DgKpKSc
         k9BBI8Vhn6KSfXG6xvcUFbZeF7TM/2sGqjZlEFIuA/UVfxm2d1wopyP39yTGRtJZOOOq
         k9gY7JbAPeg9IHSdMext5T3gjueJC5ge1FgxUTUObB+yBqFORrNep6Mun4Q+Dsmp/gOJ
         og3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790188189; x=1790792989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mp6wBBpQsQq5uAJhpRvAfRITa5kH/kGE8kQJrdjyLoY=;
        b=h38Po2frCIejUpzEgw/mg/nBpzAMFXg1/DXXy9OeC8ozgE/BwB51wi4qQ6SRVx+2t2
         9mYZWNM5yliZHsEEB87xue5fOemyizfj+n1irsOpEghpLzytUpGT+HZwtGNKO8fSKOp5
         LbsRtuy3T6mDclH57++x4m3YzxI5Lezo/IuyYyerN2ZaLUS+AhcFWdC8FR9JRr4c0wyC
         Af3UoWUJ8PUfHSwsbUm5AMR31jg93llwVJb4R2BWiitlLPKV3oLyVkU6100WpozyMBmD
         mA7xYbEINfxXPFggX1IrJ5PpZ2Hq/L754qqMtjpRsTwQjcR/5LeGyfktopzbrLDp8kQU
         46ag==
X-Forwarded-Encrypted: i=1; AKwUvBydPt/frdYTFk93o5teIlvcV7Wo9wa/qRxLBLIioEEHGjRDtamNg64f814TeaCw0rBjtRbXlkZBzoz+@vger.kernel.org
X-Gm-Message-State: AFuF++kr14BxYjAdyRpdPK2d77oFiNlXrd/Oonm0QHjHqbgP0eOkvix+
	ZWeixisystzIzemvOWSU7MyxuOeToqNbQNNZb/Ay94CAp78aRAQ2BA1z
X-Gm-Gg: AYBFou0FNXsTXEh/sT/7EdacuEJHriu2vhPa34/BvBkfKH7yvxKZxS4n/cMybAbkJ1i
	5a/vtBbsFIMhO4z+oeywrjs34aoy+o2N5WX8EoLOrGzI0wmHmdIJJ4QFwLjeia1om2SyBw/vQV5
	eFR9lXvWR1Sc1UBVD4mq66VMXRFCmKrkg5FnksSLdXOu1oIvSY/7lErD5BIg6LslprDQC1oEtXE
	O9jd0AMVeXYDpar2s0aHZunHJkwCyZHf/jtrOpjeOR3PvpkPwwZ9afEol8peLhxNgz/e7Y6N03d
	1ZEXaCMbN9zjmmX89P6A37oMOKT0reeF80DwS3yLCaGFV0Y3wpSSJNr5R2cfiWFRWemqY8+YzoF
	U+cJyQjeifiJRXcT1OCkRtc3anKxc9Y8tmJPQiyX6PrSWQcORoCf9U2l0/1fAAbiLEKvGCsEjt3
	p3KJa85hM4jpMqNgAbNv73RjgIBW7ATSb3ATs/kEzc1DGNi+91vyMWxbgwB4slvItHKjCiDTUrO
	mvX
X-Received: by 2002:a05:600c:6986:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-49fe66d05d7mr1547555e9.8.1790188189034;
        Wed, 23 Sep 2026 11:29:49 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd3d5csm4711835e9.14.2026.09.23.11.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:29:48 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 23 Sep 2026 21:28:52 +0300
Subject: [PATCH v12 06/12] clk: zte: Add regmap-based clocks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260923-zx29clk-v12-6-9c243796b6d2@gmail.com>
References: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
In-Reply-To: <20260923-zx29clk-v12-0-9c243796b6d2@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7927;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=xrGH6M3bJ8igFRHyhrXgCckCWaOGHyA4X0Rt+3qQ9UA=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqtBpuQdGI3c2kAwgmD9hpZRBBsxjbvLmJKy6Wu
 p5HruEfARGJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCarQabhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJx2Q/+OevB3ZmmFGlT6NVlxRxr4ntuHLQNJS7
 RH32sCWbWgZz2WSsIXW75LTsmV4ZfW2PUwKUPgrf8RSPgU8470MrRn06OAFvX8ngR2N7/dU5qZA
 dfqUxDC/CarcbwreIiQrllx+un3ZrrPLeuX7ZBQoScdfipYsoBntuaBpbJVNQNk4oLjgHyLFMO+
 YzAoKqk1vvxudjcH9AXR7eo4/RPgP6Z19CUy3ktVeIiIkdJEAaHgbOrAsrKC8qWPkwtyXjNm6Co
 oV52wpNqBZUSHKDXpQDG1fVRvK/+RxslHlD2lwfv9JbeCyOz23nDkv8aFu5da7cKRtPtrKHelFn
 V5k+meSKEEXSk0h1NHA5KZg574Ti7Sq/mHtjzQwjOvQNwhNd04g0f2vCpmbcEkofGcFXYjpNdci
 XRHCbnB3rPawe03Uwi9OmhqwdL+u/OMGRZhCJXwSC49hSrTG2sQ/4cb8FEDAkIcWXKyKC9Lq6a7
 r36w/8pZYXMfapW4zo6d0GEjgS0vJHG9+VzQ5pQRVi/Krzdf9f+lTH39rQANcj4T2vUdE9h8ezh
 2xm6r9Ahn/AoFxYwN0ciatadXSMMaFeGqkfyvzEfKXwLWEig9bjKb9rQvvq+pLzBovNOYaiKeoz
 41ajqIrhSNc5bSwmkGxItVObZGACI4TD2AM83sGB0nZF0kL816DE=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This is based on meson/clk-regmap.c, although slightly simplified. I
have kept the copyright lines at the top of the file to indicate its
origin.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

I see that numerous clock drivers have their own incarnation of regmap-
based mux/div/gate clocks. If there is any version of it that is likely
to be elevated to shared code like clk-gate.c I'll copy that and try to
use it as unmodified as possible.

Version 9:
Register single clocks per function invocation, remove
ZX297520V3_CLK_NO_EXPORT again

Version 8: Use ZX297520V3_CLK_NO_EXPORT instead of 0 for unexported clocks.

Version 6: Remove stray regmap (Sashiko)

Version 5: Use regmap_test_bits in zte_clk_regmap_gate_is_enabled
---
 drivers/clk/zte/clk-regmap.c | 219 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 212 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
index 80332dba97f6..022b2be7bb3d 100644
--- a/drivers/clk/zte/clk-regmap.c
+++ b/drivers/clk/zte/clk-regmap.c
@@ -1,32 +1,237 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
+ * Copyright (c) 2018 BayLibre, SAS.
  * Copyright (c) 2026 Stefan Dösinger
  */
 
+#include <linux/bits.h>
 #include <linux/clk-provider.h>
+#include <linux/container_of.h>
 #include <linux/device.h>
+#include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/regmap.h>
+#include <linux/types.h>
 
 #include "clk-zx.h"
 
+struct zte_clk_regmap {
+	struct clk_hw	hw;
+	struct regmap	*map;
+	u16		reg;
+	u8		shift;
+	u8		size;
+};
+
+static inline struct zte_clk_regmap *to_zte_clk_regmap(struct clk_hw *hw)
+{
+	return container_of(hw, struct zte_clk_regmap, hw);
+}
+
+static int zte_clk_regmap_gate_enable(struct clk_hw *hw)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	return regmap_set_bits(clk->map, clk->reg, BIT(clk->shift));
+}
+
+static void zte_clk_regmap_gate_disable(struct clk_hw *hw)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	regmap_clear_bits(clk->map, clk->reg, BIT(clk->shift));
+}
+
+static int zte_clk_regmap_gate_is_enabled(struct clk_hw *hw)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	return regmap_test_bits(clk->map, clk->reg, BIT(clk->shift));
+}
+
+static const struct clk_ops zte_clk_regmap_gate_ops = {
+	.enable		= zte_clk_regmap_gate_enable,
+	.disable	= zte_clk_regmap_gate_disable,
+	.is_enabled	= zte_clk_regmap_gate_is_enabled,
+};
+
 struct clk_hw *zx_clk_register_gate(struct device *dev, struct regmap *regmap,
-				    const struct zx_gate_desc *desc,
-				    struct clk_hw * const *clocks)
+				    const struct zx_gate_desc *desc, struct clk_hw * const *clocks)
+{
+	struct clk_parent_data parent = zx_get_parent(&desc->parent, clocks);
+	struct clk_init_data init = {};
+	struct zte_clk_regmap *clk;
+	int res;
+
+	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = desc->name;
+	init.ops = &zte_clk_regmap_gate_ops;
+	init.parent_data = &parent;
+	init.num_parents = 1;
+	init.flags = CLK_SET_RATE_PARENT | desc->flags;
+	clk->hw.init = &init;
+	clk->map = regmap;
+	clk->reg = desc->reg;
+	clk->shift = desc->shift;
+	clk->size = 1;
+
+	res = devm_clk_hw_register(dev, &clk->hw);
+	if (res)
+		return ERR_PTR(res);
+
+	return &clk->hw;
+}
+
+static unsigned long zte_clk_regmap_div_recalc_rate(struct clk_hw *hw,
+						    unsigned long prate)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(clk->map, clk->reg, &val);
+	if (ret)
+		return 0; /* Gives a hint that something is wrong */
+
+	val >>= clk->shift;
+	val &= clk_div_mask(clk->size);
+
+	return divider_recalc_rate(hw, prate, val, NULL, 0, clk->size);
+}
+
+static int zte_clk_regmap_div_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	return divider_determine_rate(hw, req, NULL, clk->size, 0);
+}
+
+static int zte_clk_regmap_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				       unsigned long parent_rate)
 {
-	return ERR_PTR(-ENODEV);
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val;
+	int ret;
+
+	ret = divider_get_val(rate, parent_rate, NULL, clk->size, 0);
+	if (ret < 0)
+		return ret;
+
+	val = (unsigned int)ret << clk->shift;
+
+	return regmap_update_bits(clk->map, clk->reg, clk_div_mask(clk->size) << clk->shift, val);
 }
 
+static const struct clk_ops zte_clk_regmap_divider_ops = {
+	.recalc_rate = zte_clk_regmap_div_recalc_rate,
+	.determine_rate = zte_clk_regmap_div_determine_rate,
+	.set_rate = zte_clk_regmap_div_set_rate,
+};
+
 struct clk_hw *zx_clk_register_divider(struct device *dev, struct regmap *regmap,
 				       const struct zx_div_desc *desc,
 				       struct clk_hw * const *clocks)
 {
-	return ERR_PTR(-ENODEV);
+	struct clk_parent_data parent = zx_get_parent(&desc->parent, clocks);
+	struct clk_init_data init = {};
+	struct zte_clk_regmap *clk;
+	int res;
+
+	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = desc->name;
+	init.ops = &zte_clk_regmap_divider_ops;
+	init.parent_data = &parent;
+	init.num_parents = 1;
+	init.flags = CLK_SET_RATE_PARENT;
+	clk->hw.init = &init;
+	clk->map = regmap;
+	clk->reg = desc->reg;
+	clk->shift = desc->shift;
+	clk->size = desc->size;
+
+	res = devm_clk_hw_register(dev, &clk->hw);
+	if (res)
+		return ERR_PTR(res);
+
+	return &clk->hw;
 }
 
+static u8 zte_clk_regmap_mux_get_parent(struct clk_hw *hw)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(clk->map, clk->reg, &val);
+	if (ret)
+		return 0xff;
+
+	val >>= clk->shift;
+	val &= GENMASK(clk->size - 1, 0);
+
+	return clk_mux_val_to_index(hw, NULL, 0, val);
+}
+
+static int zte_clk_regmap_mux_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val = clk_mux_index_to_val(NULL, 0, index);
+
+	return regmap_update_bits(clk->map, clk->reg,
+				  GENMASK(clk->size - 1, 0) << clk->shift,
+				  val << clk->shift);
+}
+
+static int zte_clk_regmap_mux_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	return clk_mux_determine_rate_flags(hw, req, 0);
+}
+
+static const struct clk_ops zte_clk_regmap_mux_ops = {
+	.get_parent = zte_clk_regmap_mux_get_parent,
+	.set_parent = zte_clk_regmap_mux_set_parent,
+	.determine_rate = zte_clk_regmap_mux_determine_rate,
+};
+
 struct clk_hw *zx_clk_register_mux(struct device *dev, struct regmap *regmap,
-				   const struct zx_mux_desc *desc,
-				   struct clk_hw * const *clocks)
+			  const struct zx_mux_desc *desc, struct clk_hw * const *clocks)
 {
-	return ERR_PTR(-ENODEV);
+	struct clk_parent_data parents[CLK_ZX_MAX_PARENTS];
+	struct clk_init_data init = {};
+	struct zte_clk_regmap *clk;
+	unsigned int i;
+	int res;
+
+	if (WARN_ON(desc->num_parents > ARRAY_SIZE(parents)))
+		return ERR_PTR(-EINVAL);
+
+	for (i = 0; i < desc->num_parents; ++i)
+		parents[i] = zx_get_parent(&desc->parents[i], clocks);
+
+	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = desc->name;
+	init.ops = &zte_clk_regmap_mux_ops;
+	init.parent_data = parents;
+	init.num_parents = desc->num_parents;
+	clk->hw.init = &init;
+	clk->map = regmap;
+	clk->reg = desc->reg;
+	clk->shift = desc->shift;
+	clk->size = desc->size;
+
+	res = devm_clk_hw_register(dev, &clk->hw);
+	if (res)
+		return ERR_PTR(res);
+
+	return &clk->hw;
 }

-- 
2.55.0

