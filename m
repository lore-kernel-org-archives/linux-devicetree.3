Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9DA3B2D10
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 19:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782676787; cv=none; b=IA7rZRUSA1K5iXyssMYF2xwDcWH/StHrNVZCYwhaDC1RyuqIqUmC7CEnJW+IdX4vvTMOsp27jyTZi6XMHP5+OWO/CYlHVCb6+qArYcwGyROSIMRanqwr0HUt0eMYWJVC6Uooku90KMvtMji7vmbG4ral9CyVbbOqWcp0U0a7kLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782676787; c=relaxed/simple;
	bh=2+l50JZBgJ31H5GA9uKbgWmub3sUmClTHJHKKamh70A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rf4FzDa95+YvMdvolrZ0VuFMOz4KQXF6BlPI/LVWNSID4EeJTWls5UVxuNZix/nRqny5OtssN12y/1xe93HbB/rqQpa25tkbiVhbEdvYcT2O52YHKHgvh/1WvtnjopV+o6BuAX+lctkI3lKNFaDsdPuahedEj/5XzDmfw6g4hQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXOcqBPQ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXOcqBPQ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4924593f45dso34274785e9.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782676784; x=1783281584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89MKnJVKCaLM+MA+nffQYSpI+ZY05JKrjUTkPxKBdMs=;
        b=QXOcqBPQ6s3rCHCFLlhwLEo48tv3y/iXLg+DvxPBeE83yfARyjk/vQCwZRSEvIsPZ9
         KvV7ANoIeH5vEK+e2G3C4PxA9hM8u4Zt+2kFEwq736EwILitIXcauPeeRufucNFVYKh6
         FWuYCU9SOMd3dUqmoJTlB8SOwOhQGBxoUaXbChoYOmyvcs5sBPxKERh+CrmA2on52Sgh
         M/2qeWcyZ+FODp292NoC41FoRXWvFBadMhgL27vJoWhpU1dwS1kErJozKQUbn2iC63o4
         gmdFE2AJ+E3QpE5+L+c/ZytNbiYzb3VDOvargc+lRnuf3B3Q1PzJHuyxOiM6kGNqyRrv
         cVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782676784; x=1783281584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=89MKnJVKCaLM+MA+nffQYSpI+ZY05JKrjUTkPxKBdMs=;
        b=o8DYan9KcQQ7ctWDHtTwDIxLek1jyDMeJ1ywKi1zzcSIiyCj4yc7WwT4iMdG7Fsz3z
         W3wqiAcbR+QBsKBnNT+P6A7yOjzUGnuHnHnTydjbq7f9YwGuDbP8aW9t9mi7cZP4RhHD
         YGDefH74g6lJglt4rMMMfFL6c9uiV4h0bI10qjfrOpDK2eX3s0n2P0K4k73TxMxkbpFC
         nGRWfnYFbvErSdrQxPtQZfFQTkbIBGKYsJa6MR9gBIc5P5IFAE08ytxYhdik7my1xc93
         jikyylwT6DDozE0KjToc9z2ATHv4jDFA2Wi9w+9RKt07xZu0+dN5x5g4PVn1NCA38Pqc
         MsmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/nq4p5dlhZ8++cXcY2iPKsqAzesPg1pb9lOBmnsFalu6UDiz+wOxEfjS1/89okCFcOabweCzJe0i4s@vger.kernel.org
X-Gm-Message-State: AOJu0YzWa+vl26CawEJWR5WeHDqCaigUkiB0wQabyAICtj4Erpzk9Fa7
	e1A3dZUVpX3u12V7EeurHOCUMlp0lYXwzCpJEoGiOtazdkKuoI8sEYym
X-Gm-Gg: AfdE7cng4CdlEE9Ro7Q5JbeYp35BZLtgO4Pz6n7mgVzDmxkJEf0HszzIkhxIP0Tgsoe
	ewdSfWM/rliBUGjlAQbd6yZsbJcRaHKM9Y+unEsxoNFs3gubN3OtpY3/rm5qq85N0F30ecHFPbW
	wV1aZjbdzm5nvVsZav3a8dS/jBneCxLsg/4S/91ZpufOaJDN3ns6kOqqzerTkT2ShBQgmGHOGda
	BPQEGLPK84S1fEEVUNFLpB+L2GGU8c/RaU7rrdz8xAGaFrwiL/JSchtFyNq3JuiSl5Z7S9oyq7M
	GhBtBPyUcAdlptfY+YUO09ox83LjKnWFXeErno9qUnd3DoWIaCVRFI672L3zCMiWxcotTH99go1
	GGm9VVHX/UxnyonYVcwYkqpdcJ6MTSpQe09GGxlVMmelezE0xm8VGj2bbx3poE+PoVbiOk1HW0w
	S1G7o+7bpyPDbTzRYZy6x8E5w=
X-Received: by 2002:a05:600c:8a0a:20b0:492:4c2e:9610 with SMTP id 5b1f17b1804b1-4926684a979mr157542315e9.11.1782676783903;
        Sun, 28 Jun 2026 12:59:43 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ae96c85fsm15133505e9.5.2026.06.28.12.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 12:59:43 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 28 Jun 2026 22:59:02 +0300
Subject: [PATCH RFC v5 07/12] clk: zte: Add regmap based clocks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260628-zx29clk-v5-7-79ff044e4192@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
In-Reply-To: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7463;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=2+l50JZBgJ31H5GA9uKbgWmub3sUmClTHJHKKamh70A=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqQX0UjKX2E86DwxPCXUsAMMepo2ureHZFl871M
 WedtZEeUFaJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakF9FBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJxiA/6A+OCQnWkENsb9XxqVtGn91amBUFZlKm
 vyASzY1vsaK95twy92Q+qvPnnKPO+9iICpy4vFtbdUXLMwDp6abwowAe6IqSSDZgNVe7Od7OnOz
 dyIDBO5qPsCObOtfERKTTOK5BJxcHZVU8MyTsS6GJ6aH6ocWqOGwbXPGxp3/ooGpp38xSVFY9cZ
 NmkPkqFYng+d0dIh/7/G1LO+Rrb7aTQT4E87/n47NHOqzxAi+dcjhUIGELNjnI0zADhOs7oQt0Q
 zmzRNHNpBCHHaKUaIFR6jitOtZ3vx+ALvTzRUxqDllXIiuLKSGH1OiVu6d0JSntWlDC9CkV3zLm
 5hyy3HbeKNN9yfuiSmppn6Hl17jzXJfzYD2L+pcRkKJ7yjjRADVTCKQX7cxKeVCR2SXZL9fQc48
 09sKNHiX886KNwAp4Ubj35HZ2OxktyU8x7fNGXNw0xTGRIR9dO84nnOBK6wHCrcdabD/Lp+AcGq
 O3uGb/zJ5j5tQF90iUb84QvtR9nScie6mim8hOzrNUJmxIZH0494Aw08hTMstsGaSxNb/It+HCw
 tjmnKvYJtOw2hakmy0n8yRBQnfmw+a4nvhmuR6VTenAuCrnlG3P54T22Cs0FHvZu5A0oZlN5AHw
 QgKe/pg3e0dTA3ZjY57d0Y5W5GdPLPBlCTIK4eFEZ3NWHK4CjqJE=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This is based on meson/clk-regmap.c, although slightly simplified. I
have kept the copyright lines at the top of the file to indicate its
origin.

I see that numerous clock drivers have their own incarnation of regmap
based mux/div/gate clocks. If there is any version of it that is likely
to be elevated to shared code liks clk-gate.c I'll copy that and try to
use it as unmodified as possible.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Version 5: Use regmap_test_bits in zte_clk_regmap_gate_is_enabled
---
 drivers/clk/zte/clk-regmap.c | 221 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 218 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
index 7908f1562f63..903998ca9508 100644
--- a/drivers/clk/zte/clk-regmap.c
+++ b/drivers/clk/zte/clk-regmap.c
@@ -6,25 +6,240 @@
  * Author: Stefan Dösinger <stefandoesinger@gmail.com>
  */
 
+#include <linux/clk-provider.h>
+#include <linux/regmap.h>
+#include <linux/device.h>
+
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
 int zx_clk_register_gates(struct device *dev, struct regmap *regmap,
 			  const struct zx_gate_desc *desc, unsigned int num,
 			  struct clk_hw_onecell_data *clocks)
 {
-	return -ENODEV;
+	struct zte_clk_regmap *clk;
+	unsigned int i;
+	int res;
+
+	for (i = 0; i < num; ++i) {
+		struct clk_init_data init = {};
+
+		clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+		if (!clk)
+			return -ENOMEM;
+
+		init.name = desc[i].name;
+		init.ops = &zte_clk_regmap_gate_ops;
+		init.parent_names = &desc[i].parent;
+		init.num_parents = 1;
+		init.flags = CLK_SET_RATE_PARENT | desc[i].flags;
+		clk->hw.init = &init;
+		clk->map = regmap;
+		clk->reg = desc[i].reg;
+		clk->shift = desc[i].shift;
+		clk->size = 1;
+
+		res = devm_clk_hw_register(dev, &clk->hw);
+		if (res)
+			return dev_err_probe(dev, res, "Failed to register clk %s\n", desc[i].name);
+
+		if (desc[i].id)
+			clocks->hws[desc[i].id] = &clk->hw;
+	}
+
+	return 0;
+}
+
+static unsigned long zte_clk_regmap_div_recalc_rate(struct clk_hw *hw,
+						unsigned long prate)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(clk->map, clk->reg, &val);
+	if (ret)
+		/* Gives a hint that something is wrong */
+		return 0;
+
+	val >>= clk->shift;
+	val &= clk_div_mask(clk->size);
+	return divider_recalc_rate(hw, prate, val, NULL, 0, clk->size);
 }
 
+static int zte_clk_regmap_div_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	return divider_determine_rate(hw, req, NULL, clk->size, 0);
+}
+
+static int zte_clk_regmap_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				   unsigned long parent_rate)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+	unsigned int val;
+	int ret;
+
+	ret = divider_get_val(rate, parent_rate, NULL, clk->size, 0);
+	if (ret < 0)
+		return ret;
+
+	val = (unsigned int)ret << clk->shift;
+	return regmap_update_bits(clk->map, clk->reg, clk_div_mask(clk->size) << clk->shift, val);
+};
+
+static const struct clk_ops zte_clk_regmap_divider_ops = {
+	.recalc_rate = zte_clk_regmap_div_recalc_rate,
+	.determine_rate = zte_clk_regmap_div_determine_rate,
+	.set_rate = zte_clk_regmap_div_set_rate,
+};
+
 int zx_clk_register_dividers(struct device *dev, struct regmap *regmap,
 			     const struct zx_div_desc *desc, unsigned int num,
 			     struct clk_hw_onecell_data *clocks)
 {
-	return -ENODEV;
+	struct zte_clk_regmap *clk;
+	unsigned int i;
+	int res;
+
+	for (i = 0; i < num; ++i) {
+		struct clk_init_data init = {};
+
+		clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+		if (!clk)
+			return -ENOMEM;
+
+		init.name = desc[i].name;
+		init.ops = &zte_clk_regmap_divider_ops;
+		init.parent_names = &desc[i].parent;
+		init.num_parents = 1;
+		init.flags = CLK_SET_RATE_PARENT;
+		clk->hw.init = &init;
+		clk->map = regmap;
+		clk->reg = desc[i].reg;
+		clk->shift = desc[i].shift;
+		clk->size = desc[i].size;
+
+		res = devm_clk_hw_register(dev, &clk->hw);
+		if (res)
+			return dev_err_probe(dev, res, "Failed to register clk %s\n", desc[i].name);
+
+		if (desc[i].id)
+			clocks->hws[desc[i].id] = &clk->hw;
+	}
+
+	return 0;
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
 int zx_clk_register_muxes(struct device *dev, struct regmap *regmap,
 			  const struct zx_mux_desc *desc, unsigned int num,
 			  struct clk_hw_onecell_data *clocks)
 {
-	return -ENODEV;
+	struct zte_clk_regmap *clk;
+	unsigned int i;
+	int res;
+
+	for (i = 0; i < num; ++i) {
+		struct clk_init_data init = {};
+
+		clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+		if (!clk)
+			return -ENOMEM;
+
+		init.name = desc[i].name;
+		init.ops = &zte_clk_regmap_mux_ops;
+		init.parent_names = desc[i].parents;
+		init.num_parents = desc[i].num_parents;
+		clk->hw.init = &init;
+		clk->map = regmap;
+		clk->reg = desc[i].reg;
+		clk->shift = desc[i].shift;
+		clk->size = desc[i].size;
+
+		res = devm_clk_hw_register(dev, &clk->hw);
+		if (res)
+			return dev_err_probe(dev, res, "Failed to register clk %s\n", desc[i].name);
+
+		if (desc[i].id)
+			clocks->hws[desc[i].id] = &clk->hw;
+	}
+
+	return 0;
 }

-- 
2.53.0

