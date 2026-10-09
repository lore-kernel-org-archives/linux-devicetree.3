Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C732D471D16
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 07:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529670; cv=none; b=PnJfPge96cb6ivsl8rnHlndooszYiHjPD7InHGGu89AoAI1IkL3By3SvqQtyRkoTsiFKuhu42IL38FxoJQh5TTMWGfCjxQ0+m/Q8RTVV7r1M9PwDaSms29u2gomkTUV1ND/oljzQdJRLbVRKthmlkjkmLCs2SYr7FX4QYvgiXBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529670; c=relaxed/simple;
	bh=bfo/wMXS8Sq9s+eS6QMWg+YQ7MUmVwvDGopoTJGqgOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d1Y9uKbWs26pLFeVlx2vZlkIG/fQm8iJk/BAoFv7/sIc8Oten+ZACoe5x1DU+kqMrc6/9t2bW8QwM+t2cF5QPhdXGUNntzGFMZPz+pX4lje8acLkLmAl82gIhfItsq2rw/sGvYXOYOfaXQdoEciHi2GTr7elLqN0rdwvEH5jGUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qkVEnC/i; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qkVEnC/i"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso26739615e9.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 00:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791529666; x=1792134466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHR1jDnXcixHLFQi9FmQqLQBMNLNa+/soRRZWs2b6JE=;
        b=qkVEnC/iKQkO9oyK7vDlM/eSBUvp35+IMa8FAdLBgsARaquTA4PiiA9H3Pq+6dbkwW
         XARfxlMNWolHMvDlA68VktVPUCogFMF9/xmaVkrRLH3+IRUZGFpPBfhI5gWDEbzOiH/h
         mj+FYyyrSv36K2a1jTastCqrC1zkwoEQvD9gs7AfXLAnhesIxeoYebSs3zJTHehic+lF
         qKPEs6lUowtJ45gIelYOzqj2cOhF9strUDaF27dUzhBm+7Ph2DJq+PqppoeYCCdQ+Ept
         T9l3SiSTO1o9sXAr/eN7UkI7Uv773Zdf+lvxj2BVVvPm+uCQIJc0ni6tfnkvLpn8qF21
         0yAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529666; x=1792134466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NHR1jDnXcixHLFQi9FmQqLQBMNLNa+/soRRZWs2b6JE=;
        b=ONu5NetIwSuVDA95gQGroPVxYBm/cxyDKwUmpGwJ8jGy8LLx2gcuTTGx/OEyfvTeya
         PeMAT+Iug4zF9CtmIhysD4ueea2G7zxmvrzs/m2+q7Nj75dfHcOGmiKrgxSudGu06tv/
         joBqtojRDyYKrAfLDTG89F8wZ7CRMUuwnED2gKiOcxPRS9IgWF/e9dJj61JvfZStZ0FY
         ITlQhot4VDm3sS5BYFXaJRYitTq/ykuFBJVVchEQvTjDTExg4W/riHYbQVgUG3jVatrE
         lFzwDy8OJPIOwsd5Km9/QMGxZCkYMiwC8DUaZJsr6qC1VYf7SF6G8tijV/Ae6bg44Hvs
         xZfA==
X-Forwarded-Encrypted: i=1; AKwUvBxVPHJUwvrXXfZzmecPmsxMtKDEQwglI+mha9tI01IRs8yD/enHS7T3vdPJE7vUmu5FhkdacgVj9dx7@vger.kernel.org
X-Gm-Message-State: AFuF++mjTBjL5A0Yu7ijVeAHMSzrRNIKmJNrOp3UMP1oYSxPVYAGY44m
	4emGZDmZeDZstGUVj0zQvMGLcyQxSj7b/qY0lDbSRhJQl/ZbDQfNVWUw
X-Gm-Gg: AYBFou1zlfqDldwTpseXtBUhVoZNiD4dDx/VKA1zM1GWb3QSLwsDp3AiV28kChdKNT1
	o2eu1tCFhFFv8IuxWOygRLaX2tJe2qyQOp7Moti4xfbXh2dA3FJ6dd6eol74JmCNXIILxazBADX
	+JaFy9XiB8Kw6b72lT+dv+z0ueI6klsq0mHhpnDjnUjEYeE+39m5Zopgbnc8HNiWevj0NnL31bh
	FlhOkbtIGHO6B9BMb5V6h67/GPdmFcePl3ltWq0tDISGm6VMy+nplYntQ9EhWaTLRi9wTiBrbgY
	ukuliLQeNPtDjJJFNIKpgBV+GANu4IHmcXfK8rllr9D3LizTvq4niDOwefuBGTYHbHBqV9AhhPh
	lk52Q70Z6roTtkbxBH2hZqPq83QbH2o0ixD9yum8GUbHtRz4HULqJGwVP4XS/iwlI4RrWST/+IA
	wqH0Hj+nbj+uFiRyVIIG0AxkDCMWBwn8g2UWN8AhRG9UUSiAT/rAz+XEriE0LD/yBy8EUhx8uDN
	EjLu6EEG9NUMnKHWtyEfSftHXwNZJ+Md6Sz7MWUw7oXlxzxFP8+UkdBVjVsEmJSzaCIZphLqX9P
	+a+L+sHGzjIC4g==
X-Received: by 2002:a05:600c:4e45:b0:49f:c199:e1e2 with SMTP id 5b1f17b1804b1-4a18e4d8c30mr16589385e9.28.1791529665690;
        Fri, 09 Oct 2026 00:07:45 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-233-52-5.retail.telecomitalia.it. [95.233.52.5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a18ca4621fsm26176815e9.3.2026.10.09.00.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:07:43 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v7 2/3] clk: en7523: generalize register clocks function
Date: Fri,  9 Oct 2026 09:07:22 +0200
Message-ID: <20261009070725.13196-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009070725.13196-1-ansuelsmth@gmail.com>
References: <20261009070725.13196-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Airoha AN7583 SoC will use the same logic used by Airoha EN7581 SoC to
register clocks. Generalize it to register clocks defined in soc_data.

Add the clocks definition in EN7581 SoC to support this new implementation.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 24fdec2e6198..ec66a504d4c5 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -147,6 +147,7 @@ struct en_clk_priv {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -745,12 +746,15 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
 				   struct regmap *map, void __iomem *base)
 {
+	const struct en_clk_soc_data *soc_data;
 	struct clk_hw *hw;
 	u32 rate;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
-		const struct en_clk_desc *desc = &en7581_base_clks[i];
+	soc_data = device_get_match_data(dev);
+
+	for (i = 0; i < soc_data->num_clocks - 1; i++) {
+		const struct en_clk_desc *desc = &soc_data->base_clks[i];
 		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
 		int err;
 
@@ -1226,6 +1230,7 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	.base_clks = en7581_base_clks,
 	/* We increment num_clocks by 1 to account for additional PCIe clock */
 	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
-- 
2.55.0

