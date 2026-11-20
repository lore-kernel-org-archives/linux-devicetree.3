Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795217760;
	b=k1oYo9FSCMp6HBFkX7sqPMY+MRjB+XbTUxSLe5KZN0L1rYpcRC+DKpV5I4cfgL5xHvgk
	 bflZ/a137NeYw6c0YqFyGOJAKLSGDbK1AGukXBiW482/qt2wau17Naidq5xl2ZyUroEFA
	 XLVPNYDt/tBm+67ndYNo83DLkoopEZREigTJ9tIom44BGsN/evilVEADWvhDLVO7eStMj
	 87AZwpsVtozSKlIqylSoJNjOSCFU6MqBCQPf5LA84mRKKEufgkLwG+lscXJEXZUoku4Y6
	 TqA3ZReqsSBIR3tUbUpRRvYtylqLAv63j+xZONVgtm17YPEncF+tLsVY82l/HN4A3Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795217760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nGdOTRTWIKU5py+dFr3WWwlKf2vxuD9kUskG5e6bK1I=;
	b=g5RiTpwlS7dY/uc6d+jRRxErjA8Smn5YG3AjRJm3mFQTGB7FgyDhgXZxs7EmfwZnG/rc
	 PHvXvPtMnuAyM8H+xTZ2IGCv+p10cdtEfzrIcqcWrCrD0nkbJLOtMsL4phU2My3JQmoZS
	 NcUVSY+Qd/lBO8BPjdTbeIu3UJTNgikpgYn4YN7G7kx5OdRsI3wpq9ceOXHQnRsVb3HMo
	 iE48BgIqRWSLD4BkqgAT/Jnn3z4HyxmWqP2fGGdVSEpI3q/8RDZOtIouZnF7RwjC2OpoE
	 /8sCALTTcKEiHnNVyNiQGw7Zqh2qhLUCwWNcg1lRgAvaCk/3V0mqg3fR91aPERuwYwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRF+4gQq;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2312606A6A6
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 23:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2312606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRF+4gQq
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so14244695e9.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 15:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795217755; x=1795822555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nGdOTRTWIKU5py+dFr3WWwlKf2vxuD9kUskG5e6bK1I=;
        b=VRF+4gQq/DsUfw6+IRpgZ4aSpvTB9u6m+rhUmV0VTSRgpAthsI4uITtP3SJgvEwa9N
         YFdjn5C7MOR+Ma7vvWPTbPwCoTbAawVEhStzZ1+XtDir9LJAxXiYJP9kGF0Bb2lTo6fv
         Di2cyTe5GqRtGYylu5W9rzm05QgbWjT9+CO/Icn22BVWpV2wc/ZZI5QzE39XpfcrXAWK
         81Fx/oARUanrR9L22Vl5KZKAcjN0rKKmS5hEdT+U3mm856RWd/ejwU35WeP1AaQ88QVP
         G6ob1IUFwT/oyOkWe05FfAsm9+ipN3dL2x8p0Y75ag1x3rcSDsvJpsHhh4ar1Dtuz1me
         +ciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795217755; x=1795822555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nGdOTRTWIKU5py+dFr3WWwlKf2vxuD9kUskG5e6bK1I=;
        b=fGoAGR4tfodhcKxhTkTMkD61gJW1JoVIl/NbUJPfItKZ8J+ZGW3qkQ+jRpmBNuT1hl
         HFrCXuZuQkGlz+hBYtqFKUMCIcSakFO4rGFpEfUp5IOCAYINaUdKn4n1jEPZf+JZD2Pb
         OKDfz2OYSDjNJGYiPyswg+DMhlGWGGCuC9xzfmjLz5TeLAsp40KkOixcXzW9n6BM6+M+
         dZzXnQpzyjIp/YukMowYW5vTLqN8OmQsUjSneiDDdZLlvz0la+vhZ6K0cDKNql2+p3iC
         Cbk+sCNcD0kINXUhYqbQO3ip5z3Tp9Z0bniAqMebBoHqDoqFJOhfkesEhUO3Uf8ikgK2
         whgA==
X-Forwarded-Encrypted: i=1; AL+hErHQUbWKtGqHBEODu1dHU1R5rWcUntFgHO/3jZtBWC/k58mCVjaT4r/aOQbj7TWUJIxvqM+BK1DCA604@vger.kernel.org
X-Gm-Message-State: APuU4Z/cZgztR60pxsj+9O/o8npO38S+3zgznm809TsCDyMZPSf2sOvB
	EGOXCr+MhnQDvAb4Z76bu5vSxxyoPiDKlwRV6sdavhWJKWZ7F0Ecp2RG
X-Gm-Gg: AYBFou3tj4LRRSsoB929xkCZVB5qPnjB9l8nceoz8gV7sYInJs/E5XLp+oo861qg+Fu
	AywYdYdE9Zvg6Pxcx0jX0x3YdqlRl6qPtjZ/VcESPvj7rzV2My7+uxSAuDylwfLJUJzahdkLnjy
	ESXIdsOlTDQBDlENFAS7gdQ8s+7rbe2pyG7EFLfIfantZkVXE36/nMdvl5cxfEwoZa01UpFc8mJ
	iK1zRsCX/aiPWy8L4skhsKtQOYU0/2ZRjRmoMw63a9SELFZkrU25ZTw+zm4QVeF13oIYfmGCtNO
	C2RLTj75p0500hu4aHGqAKOs21rH6prffTFcXP2nMi+cAbMOr38dtmc6cG+1PR5Y6z7MJcz4+mj
	cx0A4vT7qmtr36vf8KLasrkuGRa23N1EYSlK8541m3CIeMmARNg9X0h+7ZfabIxW2OL0Ev2gff4
	fMTEyQ1yuos5bfkD3o1PTA1K/0i8b+XfjwaqRCspqqm1GX6kZZXQdyaHPcJlkqLwCkrkQ6CFUK4
	k//1vobQMuHiOzJns8BK/9rM0MD/mjH5Zner4cl3A29nPbT1p6duKfSkDRdRbqd02MEmq8ZwgM6
	xGfvwKTNYUZF6lfaYW/7XHSHP9+Bgq1GQm9FEQ84w6wOL0otOTE5LIKupnss08WBaa61kTESqyh
	zY8vd/AebocdCvC0r2y+lX2q2llwGl10tH9M6EDciHi6QzvMgFuvK
X-Received: by 2002:a05:600c:6219:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4bb8880badfmr103587615e9.18.1795217755114;
        Fri, 20 Nov 2026 15:35:55 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-95-234-253-103.retail.telecomitalia.it. [95.234.253.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm8672390f8f.53.2026.11.20.15.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:35:54 -0800 (PST)
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
Subject: [PATCH v14 4/5] clk: en7523: generalize register clocks function
Date: Sat, 21 Nov 2026 00:35:32 +0100
Message-ID: <20261120233535.164885-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261120233535.164885-1-ansuelsmth@gmail.com>
References: <20261120233535.164885-1-ansuelsmth@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Airoha AN7583 SoC will use the same logic used by Airoha EN7581 SoC to
register clocks. Generalize it to register clocks defined in soc_data.

Add the clocks definition in EN7581 SoC to support this new implementation.

Rework the .num_clocks value to declare the number of base clocks and
increase internally if PCIe OPs is_enabled is defined.

EN751221 is updated to address the new num_clocks meaning.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 12a43562929b..a4a75b8063a5 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -147,6 +147,7 @@ struct en_clk_priv {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -799,12 +800,15 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
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
+	for (i = 0; i < soc_data->num_clocks; i++) {
+		const struct en_clk_desc *desc = &soc_data->base_clks[i];
 		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
 		int err;
 
@@ -1245,7 +1249,7 @@ static int en7523_clk_probe(struct platform_device *pdev)
 	const struct en_clk_soc_data *soc_data;
 	struct clk_hw_onecell_data *clk_data;
 	struct en_clk_priv *priv;
-	int r;
+	int num_clocks, r;
 
 	soc_data = device_get_match_data(&pdev->dev);
 
@@ -1255,14 +1259,18 @@ static int en7523_clk_probe(struct platform_device *pdev)
 
 	spin_lock_init(&priv->lock);
 
-	clk_data = devm_kzalloc_flex(&pdev->dev, *clk_data, hws,
-				     soc_data->num_clocks);
+	num_clocks = soc_data->num_clocks;
+	/* Num clocks are incremented by 1 if PCIe clock is supported */
+	if (soc_data->pcie_ops.is_enabled)
+		num_clocks++;
+
+	clk_data = devm_kzalloc_flex(&pdev->dev, *clk_data, hws, num_clocks);
 	if (!clk_data)
 		return -ENOMEM;
 
 	platform_set_drvdata(pdev, priv);
 
-	clk_data->num = soc_data->num_clocks;
+	clk_data->num = num_clocks;
 	r = soc_data->hw_init(pdev, clk_data);
 	if (r)
 		return r;
@@ -1271,7 +1279,7 @@ static int en7523_clk_probe(struct platform_device *pdev)
 }
 
 static const struct en_clk_soc_data en7523_data = {
-	.num_clocks = ARRAY_SIZE(en7523_base_clks) + 1,
+	.num_clocks = ARRAY_SIZE(en7523_base_clks),
 	.pcie_ops = {
 		.is_enabled = en7523_pci_is_enabled,
 		.prepare = en7523_pci_prepare,
@@ -1282,8 +1290,8 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
-	/* We increment num_clocks by 1 to account for additional PCIe clock */
-	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
+	.base_clks = en7581_base_clks,
+	.num_clocks = ARRAY_SIZE(en7581_base_clks),
 	.pcie_ops = {
 		.is_enabled = en7581_pci_is_enabled,
 		.enable = en7581_pci_enable,
@@ -1293,7 +1301,8 @@ static const struct en_clk_soc_data en7581_data = {
 };
 
 static const struct en_clk_soc_data en751221_data = {
-	.num_clocks = EN751221_MAX_CLKS,
+	/* Decrease of one as PCIe is incremented internally with PCIe OPs */
+	.num_clocks = EN751221_MAX_CLKS - 1,
 	.pcie_ops = {
 		.is_enabled = en7523_pci_is_enabled,
 		.prepare = en7523_pci_prepare,
-- 
2.55.0

