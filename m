Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837DB3C8C48
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 21:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784237783; cv=none; b=gcb4T0oInE5BaxGbxa3Ru2iduE9zyRgiRjmS1MZ+ooMVnF3D2ek7OGgupz3+KLDoZlxt0HkDBUeWd1JirxEWCbDWFC1rtz/kLECLymrZpdF/YNueW9SyFN552dj9jmGnCFvwhwQIJwRDw1/NtbXP1hadZYSOtusAToOEZT3IW9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784237783; c=relaxed/simple;
	bh=KXSuXQNJk3ORRNd5NfnirVY5+QwyE07yYWtBz4DnKHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fvgS+e5uU+9Uh7S1KR23CZ8IIt9MnQu5shccRmVbfgRpVCeKqoX56Gl5Z6sSb/XZAmnJ4EovJE+4xbhp9lggjyTfVgAbPBAAJPeSyGTmgMaJPA4JabXO0NVlztNnzniaJM3CBEHSxUS7u0wTOPbqV2mKHBmv1RYkPzAbEmRwOQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FyjxuL6t; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FyjxuL6t"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4798bea72f9so3756924f8f.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 14:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784237780; x=1784842580; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xg8JnQQa18VgOsg3xqJv8hZDkmulAWkx5pzvnSbFcLc=;
        b=FyjxuL6tGikRk+xhk58HDVtXD5oOVNqQ7AEqza8O8yVYFuJhzR34P7lF2YvjnAufoj
         f7fmOYJ9WJsWXilBWP/vA7G5qiKqTv4jowPgii4CH6s8Nv9sVsBAQ+DWzHk4HNHm5R42
         OqBD/+Mmij6W12QlYtzTpJXUnf/Z9GPR70M75Xene6Tys4Jd6u1MVTmi0q71TOJ/5tqZ
         f1NBUVTitPo0IaFNr4qIqy3tABsEDdmlzIou30vwUYczX0vJrIAeL50KREwY21vXH/Cw
         rBRqx0E4xlLZ53HEtKkHXn8F0gBbNu4Z3QVUJ/LcmEcNwsqH4YKSMbsrBf3qBdA4dLHU
         scVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784237780; x=1784842580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xg8JnQQa18VgOsg3xqJv8hZDkmulAWkx5pzvnSbFcLc=;
        b=ohmVnWiiTMcdNSs1Padz57sse01Q2bYd2p0NKsJ9ZKLb4c/AhmnTdeqF3Z8oAZJPZW
         lwYKMtuup24vt/Jt9fafT3PU/5jouVUFr1PUyiTOn83tN4nHHjGNaRQkN7c6NvpIdjj8
         twrGXPiS1RBSIA4wzTbRuP1XEYcPR6pKn9bO0f4W/CiOkVKhhFEz3AM4m8ult0zeG9mm
         I2C2NLAMHmj9yofj4Fr9GkjNT+BTaIWQC8PcPK+nVtLJMl9Wb702pAye3zamMMfHJPmT
         K8Qdw44KJAE6R94oJpJqhAnwL3hb6Yhigu2OT0XDnjHsbm5cIzSy3BH2r4M0vW51lI9i
         U+IA==
X-Forwarded-Encrypted: i=1; AHgh+RpcAGkq1xYPRTBK9HsaFBq2LA7ptkOdRCONuvfpLRXysxx/QNyf2j8ZoGOCUsYAPqvoDmA/q6Oc7CCK@vger.kernel.org
X-Gm-Message-State: AOJu0YwoiyUN6hWWuku8D+5f/0L9di4RdpKocYaDYIIOG631PSDSLIPr
	4geT2+A6xqAsLPfkQJtCSIYqiyyRpPSKaHX19gYEMgJECcaroRt4j2kHsGx2iGcM2xA=
X-Gm-Gg: AfdE7ckwY3l/StQqI6mEyasGHmm5CaxHhV451/OSRdD0xSiZnfLFd47/gQQXbpHB7kB
	BmrVc7bj5VDJNByMDAV/QjQmNbDUSfujC4Fh7m0cTG9w9lfMO6jxN7fE3SSgpvErgr2Hi8hXR6k
	jx6HAZAQAiv/6kcI2lnzDzRrB+hgYpqQF0xeTCfxmP1TldI1rS5nwR/mtSlxbTBOol76YS1lcNi
	EcyAnfa83p5xhRShJiP4BytL34ScT9duZtOUGk7L6InoS356mVac+aTrtjOxokgpCScWYYoh8cG
	PHD1fznVLn30N6I0qoRot5y2V5V23U0H7n+23xBPc2ZbPK7rSe9MXICWv0wzWUMqyRDDstIe58x
	ppcOvdd31xSDXoNzr9Unv8MoGn8P6AVmZczidy/fhBaO9rihoY8n6gHyvtoKjrve1imbry0ood1
	sUylrDUDl2J2UKV+jliJTJil8=
X-Received: by 2002:a05:6000:46ce:b0:47f:4980:4908 with SMTP id ffacd0b85a97d-47f49804bfamr10491531f8f.47.1784237779628;
        Thu, 16 Jul 2026 14:36:19 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7f09sm27517548f8f.26.2026.07.16.14.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:36:19 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 17 Jul 2026 00:35:43 +0300
Subject: [PATCH v7 07/13] clk: zte: Add regmap based clocks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260717-zx29clk-v7-7-408411cfcf36@gmail.com>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
In-Reply-To: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7477;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=KXSuXQNJk3ORRNd5NfnirVY5+QwyE07yYWtBz4DnKHs=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqWU6xTpEj+PxUq+psRhpDpZ/4YNqvMpdsmDv2W
 8iqLIm8VUeJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCallOsRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJWZhAAsXnirXDLIGyyGdIEHfrA8NyVaAwHdV4
 OZujxpH+1J+WDFbjewCh0Iy8Y3gBXSEcPDGYEfvlDYMfKlVBMFCS83saHLiPQez/TaQiYHaWlVo
 wpHLgP2v1buZOLyYLDVawk1cH/CQ+Pmwh0HvPmwF5Ea3DQxnc8G10IpoYHA62rIBeNcgMp8RzK3
 PkVlTMpK44sWlm/zZVpclBnT3KZZlpruFqfrSUGBjhkY9k9aPDlUU2/W6qDKVIARcty5gA4imwV
 1xGfUGeYeAQ6c9GRQhyyG4SAqiWjwbf5eP7Yw5EAi8gD7hxqUgk89IES3W1BKc7c/CuZhQwuhfp
 NeK1g/bCw9QyrIHHa0kbzGkjQV4gI0GhagvJuFkYjMEO86YzNGbdWiZ1dgTI0ft4Bjn7fUGd2Jz
 N9KnvuDjBQmi2PXPMFKV/tUBe4Jk8mL2jiubP5oOJZT6pKTXO/hV1ZesaFrGF2Qyqsm0olwL2DC
 h6cCsLeZQkbbD0paZtkp7xXLT2WsvEi0/fIZ+f4wl+FtiqMMujLZWRg1IGcHKjn8BCxJK/QgYUY
 90Xb+F0FDkJJoUenBB4ofWJLSXBoxx9whb/HNwxzHXJ5L+nkgCQv1jMDweJaiHvUm+IBT/eR/84
 eiPxQKNz0u87EUmgwvsiNkuym6CrZ1IlEJBrF9sbmGOXQov6s3lE=
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
 drivers/clk/zte/clk-regmap.c | 218 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 215 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
index 984abeb45ab2..198628f73b92 100644
--- a/drivers/clk/zte/clk-regmap.c
+++ b/drivers/clk/zte/clk-regmap.c
@@ -7,28 +7,240 @@
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
 }
 
+static const struct clk_ops zte_clk_regmap_divider_ops = {
+	.recalc_rate = zte_clk_regmap_div_recalc_rate,
+	.determine_rate = zte_clk_regmap_div_determine_rate,
+	.set_rate = zte_clk_regmap_div_set_rate,
+};
+
 int zx_clk_register_dividers(struct device *dev, struct regmap *regmap,
 			     const struct zx_div_desc *desc, unsigned int num)
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

