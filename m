Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6684229C0
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 08:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979860; cv=none; b=EYMO5Z3x+TmyNltgDMA+3nfLohwTLv3OfIXuniBBQf+ua2qsySsfEKWPD2ho4cyarcfzC8gHuq/XxCew77TxTezGY7NYsq9mRI1nwdElfm5a+rBA3iREkQXsUhe4JYi9k1it19+SRF51Qdx0uGCXbtYn/NQX2KsPcPwZwK2BGJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979860; c=relaxed/simple;
	bh=2L2d0QfPA9w8m9zLHFuDIP+92mtPVG6eY7jP2BAgsNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yap+5qylRNDoRQZyplZLYjWNzRSC3xa1yIzbAv+bSKZ6O84WNkBh5Sa98F2Lw0yYVRQD34FnqH9+ByWNKwPSDmg8BO4yrSss4T0NUUXlMEd8EX9GwlMWLzLT+YceKm21l6MsW4Z/YQh1U2Fo+ZdUXGRSgRGkkmfcNr9vMxM5vkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PwgUO5xd; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PwgUO5xd"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c733f15aso1824245e9.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 01:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979857; x=1783584657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zMIl1Eh3yVsZrdBP1XorCdcYvGVBjprl7wt0TiPGGoE=;
        b=PwgUO5xdHMmPqvPJJI1ou8HGofwWQneMOy6cRlrHAecRqSdYX43uq5Qgs+vflaPH7M
         bx8nBgyEs4H6flPCACCWcSPdoyk6UtGTrmA1KdTd1p8eGvzzQJIMPfrDeEvGAjOcqIjI
         ydkvWWlFmGytx4KL3HNDG04klKK+LcJjwfB3KDiOyMwSsabtiMX75WG7GaRIU+8k6FvI
         k5Mt7N7IRpckgJtaMo5TxqKoEuKWQX1D/wfx2CUBqdffC77ydULOUVml0vhNUMAv/5tK
         uLQh1vzBXTaIP7wB3N43bEB8RiC54jpPjgnf4XKoluKlhpquowNy2KQnf20UlhnRIkLK
         2Jmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979857; x=1783584657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zMIl1Eh3yVsZrdBP1XorCdcYvGVBjprl7wt0TiPGGoE=;
        b=VZsNpvnMLvGKqOBdsiwQgmlxwPCfaeZguQWPVnm+6I6uoipw0+272mFlMuHoLXeURT
         3miRmw1YaWymU7/XpkL2ALa+7baAXKqo3qkCsQy4XALPeFkborz8GlHrZALLFBvSJWit
         QOib4VP2EUooXdZANJqBZFrJYu7/GXuR4wEg+Z5aEx/aFPGGut8OlZE0l4GrdDaD3Tuv
         8MjHSeAdRzcxITlTWdgYWTJrgevgjcK2chcfugtXUnD0A+AvCS4Xh3pSEYDe7Iwjj2ZY
         eAQ0Cucuhr8xTQ78TA0oFJ09JMwVal626TWnADYuEA9ti9MeO4QD2QmxQKLramiRwgko
         4tgA==
X-Forwarded-Encrypted: i=1; AFNElJ+9qFbJN6iJiyU5NBLR8CQN87pbvTdb57EwLVyphaJdV7BuxzahI2osgre56oT4ZWMIj8wJMxfckEYn@vger.kernel.org
X-Gm-Message-State: AOJu0YxrC8+TG/5MAdOo2PgxTMooVdiZK8egtlb3xrSCgvc/5Z+HHm1Q
	X5ewsFphiXQ+IN8EZL7lRgRIlezoHzqzOXbihUvINH4ZSixp7fS42SL97Bmfr/CexnA=
X-Gm-Gg: AfdE7ckrK62tWWL047X5qf18EzZfXmrjN1RdqypobeP2htn8oeevd9F11fpjWexVJfN
	1qcRzz+/EJbExK42Gq6rTwRqMI7O1vofck39EOPhNhAnSHbgydvx/+Z6PpvvCFLVdOt5Z0q5Y8X
	1aDhZSAjl0zkNRG3LT7QFnYqro5WHzzySISfv24B9NlI8WdEcaYZ1Kmuamap+uiVhGgUtMzNNaZ
	WHdlh0aT9XhGgRq6YguNzrgMvRH/j7jPqbgijGbEheVTvqzz/1gPQs12H0AbBaUb00CDfBNa5vt
	IXPKrf/ER2YcAE4X6klPnIWMAt6tCAV4HING5YshtLNliGrEhpSBgujN8wznbb22DFNzBjJj07G
	jf4VxoNdIKanQp5sS0ys/EwyNoRYfNTJEMr1gHRXW6thL5FaBqsNcvNu0qeqamBD7lWbOzCTxZq
	MyG4aAL2bgO0s=
X-Received: by 2002:a05:600c:3e15:b0:493:a8ff:d7af with SMTP id 5b1f17b1804b1-493c2b15c9bmr72077075e9.4.1782979857187;
        Thu, 02 Jul 2026 01:10:57 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c6354771sm29596785e9.3.2026.07.02.01.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:56 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 02 Jul 2026 10:10:05 +0200
Subject: [PATCH v3 6/8] clk: sunxi-ng: div: add read-only operation support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-a733-rtc-v3-6-eb2580374de6@baylibre.com>
References: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
In-Reply-To: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4152; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=2L2d0QfPA9w8m9zLHFuDIP+92mtPVG6eY7jP2BAgsNc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhz7i1ZELfjYtb5C5oSl5YLVh5u5d5JSDVFlW
 oxSy/mKcsyJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc+wAKCRDm/A8cN/La
 hXkTD/9UqEGQ7lP5+o137L4ZK0dj6r9uITACcbnFagNW8dgCdbRUU1Gkc0pqcmmiv7+UB8ntF87
 o3jhmGckjY10GSP4z5O8LRX/RFDQxleFMjfojpwO36ioEKJgnSlA+lu6OQhi+g46wQnN6DtJxEr
 7JlXSuU8D4pI9ZQn31jIAnknDdGuyFwCU4AyWVBFecyW+hb4MBoA2tFxwxGlNEVY/TUTXx2QY4x
 tYvNkf1qU8DkddNz3GUjYzAil3ORQTbsYfo2jaVBXakn+CO9BWdNsGeBhkUn4ztynpV6xy/rtuU
 lT79/EIarFGTxDfnY+bVcEwjofdNIiVhoX+pH7wegGNzkxeYD5ZQaBA/BkWGCtjunu01dEGyu1D
 qfKldcvBjqwRW6evTZxpsz4AelUn8ryl95Z5blQogwYlL0us3lXlUBIA7yXmxL5H6T/aWPctE8y
 6vgieBFPI3dWAgVTtuQiLGVMCGH9oUWKi+yHa9vSDnK6YOz1MT7iOcNqkzYDdwVv4TT+9uvUGB3
 DCbtmqU4H6691jYrfWWqQ1Pqet1p5g4i+mv30yFGfOlGL370t9V+6n+XWEq7wiSIbX53129CGo/
 xFa0KgrvLpUNUzhv2A9ND2uuvgGDvNbpeN+kjVgK1rB2PNnhZ8gwqPB7CuvqchwTz7tb4Z1BAh6
 7IchPeO7hREhSqA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add support for sunxi-ng read-only dividers. This will be
useful to the a733 oscillator detection logic.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu_div.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_div.h |  1 +
 drivers/clk/sunxi-ng/ccu_mux.c |  3 ++-
 drivers/clk/sunxi-ng/ccu_mux.h |  4 ++++
 4 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index 62d680ccb524..d1c8c7baa12d 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -84,6 +84,36 @@ static int ccu_div_determine_rate(struct clk_hw *hw,
 					     req, ccu_div_determine_rate_helper, cd);
 }
 
+static int ccu_rodiv_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
+{
+	struct ccu_div *cd = hw_to_ccu_div(hw);
+	unsigned long val;
+	u32 reg;
+	int ret;
+
+	reg = readl(cd->common.base + cd->common.reg);
+	val = reg >> cd->div.shift;
+	val &= (1 << cd->div.width) - 1;
+
+	req->rate = ccu_mux_helper_unapply_prediv(&cd->common, &cd->mux, -1,
+						  req->rate);
+
+	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		req->rate *= cd->fixed_post_div;
+
+	ret = divider_ro_determine_rate(hw, req, cd->div.table,
+					cd->div.width, cd->div.flags, val);
+
+	if (cd->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		req->rate /= cd->fixed_post_div;
+
+	req->rate = ccu_mux_helper_apply_prediv(&cd->common, &cd->mux, -1,
+						req->rate);
+
+	return ret;
+}
+
 static int ccu_div_set_rate(struct clk_hw *hw, unsigned long rate,
 			   unsigned long parent_rate)
 {
@@ -143,3 +173,15 @@ const struct clk_ops ccu_div_ops = {
 	.set_rate	= ccu_div_set_rate,
 };
 EXPORT_SYMBOL_NS_GPL(ccu_div_ops, "SUNXI_CCU");
+
+const struct clk_ops ccu_rodiv_ops = {
+	.disable	= ccu_div_disable,
+	.enable		= ccu_div_enable,
+	.is_enabled	= ccu_div_is_enabled,
+
+	.get_parent	= ccu_div_get_parent,
+
+	.determine_rate	= ccu_rodiv_determine_rate,
+	.recalc_rate	= ccu_div_recalc_rate,
+};
+EXPORT_SYMBOL_NS_GPL(ccu_rodiv_ops, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_div.h
index be00b3277e97..a30a92780a05 100644
--- a/drivers/clk/sunxi-ng/ccu_div.h
+++ b/drivers/clk/sunxi-ng/ccu_div.h
@@ -300,5 +300,6 @@ static inline struct ccu_div *hw_to_ccu_div(struct clk_hw *hw)
 }
 
 extern const struct clk_ops ccu_div_ops;
+extern const struct clk_ops ccu_rodiv_ops;
 
 #endif /* _CCU_DIV_H_ */
diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 766f27cff748..e2d6833a6d33 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -68,13 +68,14 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 }
 EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_apply_prediv, "SUNXI_CCU");
 
-static unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
+unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
 					    struct ccu_mux_internal *cm,
 					    int parent_index,
 					    unsigned long parent_rate)
 {
 	return parent_rate * ccu_mux_get_prediv(common, cm, parent_index);
 }
+EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_unapply_prediv, "SUNXI_CCU");
 
 int ccu_mux_helper_determine_rate(struct ccu_common *common,
 				  struct ccu_mux_internal *cm,
diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mux.h
index c94a4bde5d01..272a2c36a8f2 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.h
+++ b/drivers/clk/sunxi-ng/ccu_mux.h
@@ -134,6 +134,10 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 					  struct ccu_mux_internal *cm,
 					  int parent_index,
 					  unsigned long parent_rate);
+unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
+					    struct ccu_mux_internal *cm,
+					    int parent_index,
+					    unsigned long parent_rate);
 int ccu_mux_helper_determine_rate(struct ccu_common *common,
 				  struct ccu_mux_internal *cm,
 				  struct clk_rate_request *req,

-- 
2.47.3

