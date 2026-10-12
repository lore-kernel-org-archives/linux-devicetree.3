Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29524438466
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806407; cv=none; b=IgvmS1Kp9TtToJlqMsbT9fBu3zczfpum0Qm9db4wSjOtjO3vHlZngyhvU0b0s2WvQF7lx9T8wH97XcyNZLvsldfwcFlQweB+qqpi5f/viDxiaqoGLJr4OmN4ug/cXMU4iiitqRlbwuxEKNF8QD3lz5k+k0HrulLwKM1GdGi8TiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806407; c=relaxed/simple;
	bh=bfo/wMXS8Sq9s+eS6QMWg+YQ7MUmVwvDGopoTJGqgOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A7pyopVVLMFK7tf7zeWVfvQlcfKN3MFzP/mbihEf7CWX/AX40wuVqwg5eNCESgx6zKlDuUR16mLCh4TWnXFjm1K+i6RKdTZF70bZ2Oeu2ymJKL1GcYueIBYzu5/lRc9SWozoch4G2eVlRzZuZh5JTZ8yF4H0Q8rai7PFi462lfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnWYnHTL; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnWYnHTL"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b0584ad71so926176f8f.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 05:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791806404; x=1792411204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHR1jDnXcixHLFQi9FmQqLQBMNLNa+/soRRZWs2b6JE=;
        b=DnWYnHTL6YoT5MuVJVVqsvH1H59BXGPOkczHSPV0C/sSny3nQBW5x9oh+sx2mcGydo
         c/gQtqmBqyk3VEW22SruTCraadK0OKsZc6c+hSGl3gaShni2Nkwvx8kvpVLyFrAN7cvM
         +tAjYO5+3YVsTHUGMDy+6gVUlEGi3IVgAwynPWCaAgBpnk+kPr2G7XlfuaUmzrATokXn
         JRrE/UgW4X6+G2wpFr1BPQ1h3tmKkyOe1szZ8eF+6dh0BWLCv5QPZje7eHCC2Qv/N07L
         5A4wBVlXGhxdGafJO0PrS3C1sAFb7FGMy1hDQcN1Jpkpkgm4Wo8nACrYeqbTY9p3AotC
         DBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806404; x=1792411204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NHR1jDnXcixHLFQi9FmQqLQBMNLNa+/soRRZWs2b6JE=;
        b=IPtEON/HPMrGZP+415JOHi779ybXdh7VBaN3B0xGokSQ69Bx9GkWdGapiM1Q4iBJ1F
         fFic7uSAgJ2Nq64aKf1RvGbkErGJ06V1Dc+WwCxM56Zed0R8eeDiNnPXnbxudbFswEhM
         AeOWWuytdcVQ8wmqBBNwGJFxE03fTmhH60VfBSw5pPMqxjvfC52cuWYVLzujqTOqyyhz
         XFmIOcb+s+lMnaZ15J5ktwvavh8lPYoISvS3LyY8UoHUCKkm2AIsl7ohUTCQOSY0m8Xg
         D7zQQ+sDYhPyZZL75J9Lc+Ikq85crDqoUrwaExbm/KlYr0AbQ6j37iTj6sV6PrdEnmZt
         ISsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwod0NmhlwblMEqAOlpNahhAKiBvMSEwbnVFQkaK9ubuYO1MQqCM5//3kjUo27VXLX67InjN7cDvotY@vger.kernel.org
X-Gm-Message-State: AFq9FYI3ibONAQnz8CjB2YQDk5xffT4maRVsffhF4134rtducFKKihu9
	YEelr2EfIxSPlRBOHj2lQanRFQfZhKMswja3ybIiO5pv0f2Ub0gUNYzS
X-Gm-Gg: AYBFou3II8gKdugilKDckoV2XQMtNPFS7UyyBjXSRREymJklAVdpCDlsW32nhym51w4
	iODoTu+bw1cHKMl7oky6NvIsw7xq0NZwZAkcbAkU6P2fZQxXpAgLOOdSl0+qV3SXA+crzCe9N81
	Z1QmR6iPc+7LfdsQDzv7HWvTkzDgl9k0A5P7HwappV1wqz+CFqh+C7ephBtL9DvTv9RSw/GL4Kb
	FvfKfD0+PXUPjN0CbhhpwrZtK4Us4DejcQEv+c/sFitPlXlf+ymUao8Az3fd6BGPW/5C5YMo/34
	7EAbo4uga7tVHijHozWpiQQ6fb5fJnk6dMQOXF1uAf1tllITeNpUFzyPOftmWMFGl1HAABbcf8c
	fqPALa+/SZUoaZ4xTXvAiWC6hFxyjuAF0jGK91SSkrt8QHAR2X1qOkdjz/WXSmQb6afORCYjkG6
	e68YvOYG1ZiZkjqnLkTYEYL56/d3QDs4WeZR32DkgAKPOox5Ky36L6HciT6zrHkGVYYfQzeM+9Q
	bDI6BTonYXmOnlpH1FXkl3xB4+S2Zxfnt2zBkSHnIiQ9FBtafO4LTKuE3Zh6Txja5DbBE1J7ldm
	A1lkaSEcZBRugfGw64aE9z0=
X-Received: by 2002:a05:6000:27c6:b0:48b:11a5:d42 with SMTP id ffacd0b85a97d-48dbacfc1demr10357286f8f.30.1791806404238;
        Mon, 12 Oct 2026 05:00:04 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db94e33d2sm20234313f8f.9.2026.10.12.05.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:00:03 -0700 (PDT)
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
Subject: [PATCH v9 2/3] clk: en7523: generalize register clocks function
Date: Mon, 12 Oct 2026 13:59:52 +0200
Message-ID: <20261012115954.92718-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012115954.92718-1-ansuelsmth@gmail.com>
References: <20261012115954.92718-1-ansuelsmth@gmail.com>
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

