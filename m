Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C5E3403EA
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 19:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779994849; cv=none; b=Hd3iPUEkMdheDdI5GA67r3YbbRgcI3Lp/5jYecB3uS+TFN0ed+h77Yj9n4uNq3b5kqXBee6ZeiDaTyyWBnUox009I1r6S8oPyL7tIZ9dxXJV0fRoFaMAVHHpcKBXd8bxuhDjpc7RBL6CwKsM7GnfZlIeSy+0PDyhY76/7qID/ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779994849; c=relaxed/simple;
	bh=G3QQpR8rFP9MtjIXSfetY6TLu8NVajep3IQklei1i4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d5VoojOOR6BCSwUdl5PK2Vr6g9/AJ1DAbci5LvvlifTEuymPPnSvYo/5ktvV/6vgOgUUSqHei5QSh25JKHfuIHN85o5Zh1iCDLteG+3YdcxE0RZdta35/RBTmLdI2AWep0heyAlGkfALZzcGfV0+tAm7aEtYgIBIzF3AXe8Zmc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OstW3Qcr; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OstW3Qcr"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43fe608cb92so8089924f8f.2
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 12:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779994820; x=1780599620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMXXtYGcE9eK212AumCdNI+6/leOGhk7hdPMWy8VAbo=;
        b=OstW3QcrQtCVFZc2uaEns05VF3FuZ8UMYncjTgWVKxrgQbIawGITqdihbhBySIVBG8
         GmP3uVljiEoaaDBXKcrnAiBUS+ePi/ec9gBVASI/NlcTUCN6wBcQlDgssNKCgqBoQq5Z
         L82ErrR1960QihtI8GvTkKzML5joVBtTsJ+SVciOfCNB5ZF84DF07LeQJBYLuZMFpSuW
         Orow+l5fJbNeS46EPL0t+pgIUZFpXiyTWHpG+pOZmGQ3drzST02V5iV4N850MQLKEqPP
         D9eK+RWsWovSMjbIFGby5U12MFXGgTdTkPQ44a9ZkCgVHq3oNh6pTGoolbGCYq1Iq+b6
         z9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779994820; x=1780599620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HMXXtYGcE9eK212AumCdNI+6/leOGhk7hdPMWy8VAbo=;
        b=A7HMGIYZAPsya4mT6IKkJWFPUtUjYH5KA0Q29TxCF//ttfilAnWKwkMjdj63USZ0JO
         4OqUniJQrvra2GcDHgWr/72RgPNwEsW6qGrhYSfUDtr7KvPuNXClj2+0i+beszIYynqq
         eH6bkPwuO66WucMMu2WMM6loc/mluAVuGGzQID0+MGX/8v6ejOpc+qHdRZzO4NcZpoUk
         DNyc11efK4xq84jnDclCV9opYntU6NmK53PbKfwIBAmuvX8ophUs1ib6lFFMokaIe1zt
         3pId9WO8m59ffyZXhbyMwCEBlAg1okGAFp+dMpphKBOIL52DYLG9tEN9eOLgkE4IfENT
         A+xw==
X-Forwarded-Encrypted: i=1; AFNElJ9ClH47W9AuRUAIu4XErGm5Oc81K4K/8uYdiSjsWWgU4DAC9QRrHdV7koSLmW5bASfdkTT0vk5RLz57@vger.kernel.org
X-Gm-Message-State: AOJu0YyPO+wQSfOtQuDysl3pbYLt5XEgug03danSb24+LodfsFP0FQag
	sD541yaqGAf0R2Lp/WdBqdboBX17Zd/zYntM/egjvkxbV5RgmblUThkn
X-Gm-Gg: Acq92OFL/eBwjBUe4AokSeptlxfm5pGdzmD59KOWDsPLRo73fxlu4r1/f7RRFBFfm2K
	gOOGRr9dY76EhFCPKm25QMkarzpFCC3uCKreXbKWbzDTT1nSFnNq1rgfFXUf87VyhNsMb+U23vK
	dq2a711Ut0iYt5EwpWgol14pTKkSha8t7EWtgZI1DBQqTvh3f0xgTz+SI9nQmm1TrRYz3dKpqwK
	ne/XZg0Y9JCuDfYOYmHF0hA0RyT7uKD5fGg4HxCxWy+Riv+EG0B/hyKlzPJDY94jcLOEwc0d4Us
	cj85HRO4IPfEf3dVs13su8ItQVCZSrHVHu81jzlxih9RO2lBKXhraJp8wV+qyBO95VmCsigb7AK
	WT+uZwCjNxum92sNDBOxzI1e4pLFeIg960Kn+IXp5YJXfkzKaZBQpU4Jj2f4Sw9mO4eVwHcdzvq
	DAY4Ae9FiiOTVUlV2nVlPVnuWm0OTkR/lT4quWSdU5efIsihJ3pW/MV/9F0xh+iSP/c6eWihbuC
	D5ZO1A=
X-Received: by 2002:a05:6000:1006:b0:45d:817c:b8b2 with SMTP id ffacd0b85a97d-45ef05f84f1mr517631f8f.30.1779994820053;
        Thu, 28 May 2026 12:00:20 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-42-252-49.retail.telecomitalia.it. [79.42.252.49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45ee2a12a69sm8625408f8f.16.2026.05.28.12.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 12:00:18 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v5 2/3] clk: en7523: generalize register clocks function
Date: Thu, 28 May 2026 20:59:55 +0200
Message-ID: <20260528190000.9164-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528190000.9164-1-ansuelsmth@gmail.com>
References: <20260528190000.9164-1-ansuelsmth@gmail.com>
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
index 1ab0e2eca5d3..087ff4568124 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -115,6 +115,7 @@ struct en_rst_data {
 
 struct en_clk_soc_data {
 	u32 num_clocks;
+	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
@@ -711,12 +712,15 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
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
 
@@ -991,6 +995,7 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	.base_clks = en7581_base_clks,
 	/* We increment num_clocks by 1 to account for additional PCIe clock */
 	.num_clocks = ARRAY_SIZE(en7581_base_clks) + 1,
 	.pcie_ops = {
-- 
2.53.0

