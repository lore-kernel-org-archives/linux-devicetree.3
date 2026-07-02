Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17553A9632
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 20:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783024133; cv=none; b=tZUUSGLIh+Qdq6oKZ1WWc5c0T0dSEUyKM+F1igpsf36cIDggFPxqLwXZ/06AL2PK6n4FQ/ydK2UqjvoecxU8TgUBsz5OrTAiqTlDN/7gaQg3elBV2h/qin/6aKPaeuMc1ZFHQQX5W5yr75MfrBo64G3+aavmtJPqmldkRd87W78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783024133; c=relaxed/simple;
	bh=2jrY2goJwHqx0QF64e77XWB3kl4hSelit10NU180RzI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=spF+ILt+qIQwvJ1okdEEybFdIOPtrU39PvK8CiwvUOKuxdOLiibiMxccMt9FWxgoJnyEh9en5D1YE7iZmHufQiV/riUnkB7nzm2pISVtnMMbgNfvvjIEj0BNfqa4PYQRzZb6cpdPrSqILFOFMmogVoMYxSciS3jnSYiQ6BMkkcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rFwuthJw; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rFwuthJw"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493b786d6c0so11613225e9.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 13:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783024130; x=1783628930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ZivD2QNfEmbneZZ6cONahTTfy2owWO3FbZ42lF8SzY=;
        b=rFwuthJwh4M/0nEj+tSFyf6i1MkGpujwJMqVnNSYDLf3qlkb3rZ986ANcVu3Kuo+xo
         OGD5lC54FWNpAMQS2metQRD+OJM1B5A9tiPQWEkzXWRiLOMrivG9uf5OGfTLW3UOxmKo
         3RJJSeJzW64e2SkGiFfJx03D486Rx+jSWW3/UR+kGRi1d0GVDs9sBNzMchm3r+RC0GiN
         SQZ2A3TyL3VhJZzZ5JhI93BCQL8Ot1yWiFCek1fNeKKN8LO2LqOWH9VQn93VuPUSThCB
         2BfRW//EqAh3BFbLeXZXQJ7JJxDwPDq/Qo/98EghrRCWplSj9N73YK9rj2C1Cr8uKtis
         SSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783024130; x=1783628930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ZivD2QNfEmbneZZ6cONahTTfy2owWO3FbZ42lF8SzY=;
        b=lcw4Ndbg4ueeCGe6j0eJJi09L4pJZu1+BDADVWHbFTGXsTh/NmUjESDHZ4hrWFNBoL
         mUCql/z0N1GXvCAC7AxgirOQ1dkYbr1s6kz9puo15GshmZZMAcBdCSGFKodUZEdfDsZX
         QqEq52g1n7ypNcoRmJMl88jGjNGBm5ANa536Ye6K1/QHCzzYJtllKluJYGA0OgnR2Brw
         08WIYXGtoa6ZWoxjfVVI2EZ4dW3x6mF9cf8MHKwOGUP4lf9vbLFZzue3ipWMcv1XG1co
         AlLpDllB2weeSiXBzhGZtCBTxbrScILLGVWkfP8WnbAML+sf2X6uoUCkXCJ04qsUuv0n
         Ajeg==
X-Forwarded-Encrypted: i=1; AFNElJ+fPPWRrmURxmLIk7eHamrZEolbDfBS2d5rsShpiu7eplSj5qamfCQaSaiTQdV8Yfve7DE7+p1geNfZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yys5w0tpYh3v+8ZJiAJxUQAQ8LYjXA5KLR8droS2cuSsjaXN4qK
	N32wq1RhU85S5/DQ1DFKTKvtPW+QH9SB8BcdlN/C1coX/yRtTnkNiyjt
X-Gm-Gg: AfdE7cmOdHDGAgUCPUFlkJX+UAMyG/00iHpgBjXSWQj+2s/wCqhHvd8I+qQz/0eQGQq
	qdWwU+LfSpHMNHXWrG0WLJbR9k+l40NlYafl6MgfEyZu+LGIrbQgv/p8bXsSqVqutFnvq4npnB+
	a2P+DMxOYhqHZPLbXAeR29kEqFm5j0ipKlgJRwBHm45bsTAzGRpNcHLaKNIFEQZD1A+eQSmzLo1
	itxdHF2GoJUjVStJctneg7N8ZadtLrYVb12daodZjdTbtfEit9UirJn6d3fEZCLD3USwO/oNULj
	h5qtuvXhdU0b6xNDrFQWa+YmLcPX/ueXjz0/dJpGhOjpN0CrRo4SILX+ZHpMN0ZoRxDlDNljrJo
	u7ObmqhSQFk+QQDz+zLmJ0+rlDhY8IzU3mdcpGvPIwxsOu5Mjbav3Wb2V+LI8kUMazPt/TPsHTA
	uotXg/+TyGAxyGbTDtrDtYUBQ=
X-Received: by 2002:a05:600c:34d4:b0:493:a5d4:3798 with SMTP id 5b1f17b1804b1-493c2b3a6camr106126825e9.1.1783024130084;
        Thu, 02 Jul 2026 13:28:50 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6369488sm80321145e9.9.2026.07.02.13.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:28:49 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 02 Jul 2026 23:28:01 +0300
Subject: [PATCH v6 06/12] clk: zte: Add regmap based clocks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260702-zx29clk-v6-6-377b704f80c4@gmail.com>
References: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
In-Reply-To: <20260702-zx29clk-v6-0-377b704f80c4@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7587;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=2jrY2goJwHqx0QF64e77XWB3kl4hSelit10NU180RzI=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqRsnpzGKYz7rhnkLlcbV+yYeEafn5yjHtbdK7i
 Pe+JVNWdryJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakbJ6RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiI4nw/+IrddksVAYQrK61nzNX3tkrz76coJtSm
 DLC7t/PdfPSyvufFwHDd4WRYZvjkhHChmMMLYuYhDvVFzLqo9+FNmCiJLnr4eKlrc3Jzt4LIm8w
 ygr8afZ7RiDuZphPrIfVW9G9IXO3X9wGSZjzqxoK12cow3SYziRwBcZFr+9pNYVkPruCpqV2Fkz
 9Wsz7SusrXl1Xeye9Fk2IX/0++aUHEM5jXWCOfxcjanyKYFKlMvWkB+U16dA+obpC7JCTT4jG5h
 7zFKlCw5nBAbTno2Tq05s3i5/VZoxuPLfhjuS8cW85hFx8LXz+tgM2mOqrYexKOiJLoWf/bBoKb
 5nx8Z9m9edcHYSdaLgf5BBEw9JkH+Ar7fSr5bejoD4cDiVBDxMPBm9Aj2WS212CV2MnmgV6tk32
 AQ2lkpvPgAgBqcbtDdaGq2KU5NNWx8+u4AaEHiq8+HI/wq9xZlZtVR7aSwlhIqPj9cveqjPYtVh
 KHxSQSzxB1R50o6ti0Ob4tsFKHvDoQBgp1NeYN7AxwH1PCpsgCR64YQZc9kA55qGto34OFAqjSA
 Mhfn3LNkaSq1I35J/7jfoYTlEAmlKexK4UVoTjQjGZcmdUDQTFtpYJCMXVj9lwg8xxRYSgdnGgK
 hjceDOHpPkdY7s3A3axeT+SlkMy1TbhRkrAPWqHBfk5Ah40fIhgI=
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

Version 6: Remove stray regmap (Sashiko)

Version 5: Use regmap_test_bits in zte_clk_regmap_gate_is_enabled
---
 drivers/clk/zte/clk-regmap.c | 221 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 218 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
index 1180d7aa7d62..642db1aaac0a 100644
--- a/drivers/clk/zte/clk-regmap.c
+++ b/drivers/clk/zte/clk-regmap.c
@@ -7,29 +7,244 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/container_of.h>
 #include <linux/device.h>
 #include <linux/regmap.h>
+#include <linux/types.h>
 #include <linux/errno.h>
+#include <linux/bits.h>
+#include <linux/err.h>
 
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
+}
+
+static int zte_clk_regmap_div_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
+{
+	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
+
+	return divider_determine_rate(hw, req, NULL, clk->size, 0);
 }
 
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
+}
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
2.54.0

