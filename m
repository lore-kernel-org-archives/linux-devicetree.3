Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191885;
	b=xlQg6DmTZE2wG5X3ZpdCyHZWP7I3+T/IvrMqf0PIgom9uKOthWsPv1LMpYYagRhrNpum
	 yBjm1MpBQ7rbkAPK2aCU60/c1CgcmY2o51Tkwb15RHMGYlsUcgby0tZn7nb1aaSofi6xr
	 8M3RbvOu/7egECxwKsSf2GZGL5MH/k+GGm07CPa0wOCkOvp6m2/UzAXVj8lLyzU5G4pCI
	 byxeEcQQmsJ3qbepxzUl1KKKEuJ7V269GtjbwpsGAW85fiE4xCxY0gUjdN2QmoBXegNBx
	 sF4Oi7m1yUnHYZB5rj0PUtfsP/kNSlK8JcfFiwkHLDs7O/eJqYvxgHsg4/R0Z5ymkzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=KjP+v3fLNik67eid7wsMpUNCaJhT5tW0dlUNBufYdok=;
	b=mrJSFHWq42vNdBP8AFO2POqt0ZB7lONvNseFx4eD3MBxZ7/zSWBwDOjSMcPMtknjuNi8
	 015QawW2co0k4IauYFtMo74Or/psw1l+24TW9w+lKFIrVknb/VsLNi1UmuoQFskXoavMt
	 fIR9QV43rqzrVKXCfZXxXij/fxHGU2JBBh2egU49HV27Qqqi5UcI9bWis9AWVHvbvuES6
	 sDWXn5fAy/HIx8s36pVe0WMRRPT0iiK94punVwAn4bljSSQx4m/ZApsA2B6gg4b3Xv+k3
	 p31whET3gcKJCQ6xT1elvDPJwmNgShqBqSslMukdP+nvoahYDno+mQVr1LzIYwAAZrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dvR4TmX6;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8197860A261D
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8197860A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dvR4TmX6
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48afbd2c386so549783f8f.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793191884; x=1793796684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KjP+v3fLNik67eid7wsMpUNCaJhT5tW0dlUNBufYdok=;
        b=dvR4TmX6PJ8T866B1M9ZMM+YBK0WYbDdi8Cqutit9Ggq5Y6udOKcbg6ZDOSqiNM3sh
         WgXCJDsspCDVHesKZM+BntN3XyjiCGC1TiElD7gEkqu00EyX1DIV+eY8APlGTFldmdha
         wYoT3DDZ9APCSMpnSwvLqenKX74WVnllKKHk73IwF7310kw/e+P04zyYHBsnAtLxqyn6
         jSg/DrhTqID8aOIqk7OAz9ZajrU/V0rvRRQHZu+9BUV4yTBP5DYaBC5tnKq3fi82gWS3
         rGjP+gBoXismiAeb/2Kha2zdkz25bmkc5lyS2e0PfWXZwk5ivSQ63eB849BTdsZMOJAV
         HEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191884; x=1793796684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KjP+v3fLNik67eid7wsMpUNCaJhT5tW0dlUNBufYdok=;
        b=iWcL7WbJdrY0JpcdCWraThJWTZOzR9bPiydFxrlRKqM9eDmE8Y/M6AboLTbLMkxOHW
         HaWw3FoI5jHE6H4Dq2Hcbs3D7tyH/+g7zAipbU8ioSJvrsF/4xkg6R+s4ZO46TkcLe1v
         UKSQB7jmwfzQI2RtXhZXuz8+WEeLLjiE26PuQTy6gO23+VvxzQ0vCQlhBY4nrLCpFTOD
         yiARyOwl7cV/wl1IxS9ADZ7+SsEE9AWL5lB8WmHv2/VcpoNaqG8Tz+EDoS4KRNwQ1R21
         HuD/3LO6YLtqRTvH162OB0rWKn3CxZvPIy3ZpzISNJHUjQXFyfE0jd29NQWkBeyQ4hWT
         v7EQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4wT8q0qfYpmuCMMV+ZRAKrLR5Y2EGdcHxWMEVuR8mJQOtzDPfJO1P6P/DGpuk2QdINHoeu14+WoBA@vger.kernel.org
X-Gm-Message-State: AFq9FYJskICJWkWOlbOmfEk1cglHJRtGR55I3cJQz54ETA2+Ve2SsWTG
	PtbjkqILHrhnphTSMaRb2plHg76vMKJvvxtu5jqpKIkOH7QM72/y+CiL
X-Gm-Gg: AYBFou2PY/2O5eHdUw6aY61M855Dn+poM+5zb4qJ1XFw4oL9uLdkkElufzneMO2EHmL
	N9vYiIz0h8Kp5zB/vEXDMzmd4vWikx2Xle4i4VezHaGfORuU2LNGMApyoTDvLF2J5D9rXw75rmM
	mUCNrxLrZhnJDCzT5c1wgEdeB7UiBjydG/56uwrEs/tWSAMj14/wJTztKgJSCo0yJ46sjNhGoTL
	QKYdgcTH7YTEtlEj2s/leMu1pbfwX1IJ615iJH1G6NE1+Unk/9glxua9mlY17YMIrD3ryWlUry8
	ofDcyIkuYXk9LNE/DsuZBGgtsDKLFbABy3K8h6PuaeGcBdpYx9mLMsmlyKgsenz4ExarYsKJggn
	KAzBs49qSYKUetKl8hgsYmiBuDS1pFgrgkR01Vyq99LQJV2t8zSsMFYU1VYbISimKEFvNkHQ4UO
	MblapKaJ8j7GM+kXcyKAX2sZv6CehPrWO69yIQxOEIRj5hwV+wOWlcmMga+YpUoSv9genuK1cfa
	7kHP9iL8OIKpXSc24EZF9p/x0tHqiuD+nyT6AZb1A3loNLj5msQsRTFEg/KQj+L3G0mpbx+yC/h
	a2SQbMv/qoHtfptqD7UT8iFV5pN7UKTp7t3u/iVUe5Bu0jqP6wAfL+Xd5MMqT54LXgud
X-Received: by 2002:adf:f889:0:b0:48d:ff06:c634 with SMTP id ffacd0b85a97d-48e5d5e000emr4198676f8f.54.1793191883611;
        Wed, 28 Oct 2026 05:51:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6bf5:6c0a:cf99:c9f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm29275016f8f.10.2026.10.28.05.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:51:23 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 28 Oct 2026 12:51:20 +0000
Subject: [PATCH v25 03/11] mmc: renesas_sdhi: Add clk_mask to support wider
 clock dividers
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
Message-Id: <20261028-rzg3l_sdhi-v25-3-57f16691c2ed@bp.renesas.com>
References: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
In-Reply-To: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793191879; l=4810;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=6Q/eM2ygbxf6jRcqbxdAGes1UUbWlVneYC9xcDJwlhM=;
 b=aJfJqQQDgwsVfqhJFP39+rhIeihv9M/tkelU4gr2KgQIXvejCowHBHQpvcjhEpECFT18bobyH
 lHABeKtcJnUCHPxO/kShngFJtNB2d51wyLsL9uWC5kDITU6EgDpEALr
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

The clock divider on the RZ/G3L SoC is 11 bits wide, which needs a
clock mask of 0x200000200 in renesas_sdhi_set_clock() instead of the
hardcoded 0x80000080 used so far.

Add a u64 clk_mask field to struct renesas_sdhi_of_data and struct
tmio_mmc_data so SoC-specific match data can supply its own mask, and
widen the clk and clock variables in renesas_sdhi_set_clock() from
u32 to u64 to hold it.

While at it, clamp the initial clock value to a minimum of 1. If
actual_clock / 512 evaluates to 0, the loop condition
"new_clock + clk_margin >= (clock << 1)" is always true, and the
loop never terminates.

In probe, copy clk_mask from the OF data and fall back to
SDHI_CLK_MASK_DEFAULT when none is provided, so existing
SoCs keep their current behaviour.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v24->v25:
 * Updated commit header and description.
 * Dropped initializing clk_mask as it uses the default value.
 * Added suffix ULL to macro SDHI_CLK_MASK_DEFAULT.
 * Fixed a very low or zero clock rate from the clock provider that causes
   an infinite loop in `renesas_sdhi_set_clock` by max operator.
v23->v24:
 * No change.
v22->v23:
 * No change.
v21->v22:
 * No change.
v20->v21:
 * No change.
v19->v20:
 * Replaced the check mmd->clk_mask with mmc_data->clk_mask and moved
   the code after assignment of variable mmd, this ensures assigning
   the default values for non-DT platforms and DT platforms with no
   device data.
v18->v19:
 * Fixed the clk_mask for non-DT platforms.
v18:
 * New patch dropping struct renesas_sdhi_hw_info instead using
   renesas_sdhi_of_data and tmio_mmc_data.
---
 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 10 +++++++---
 include/linux/platform_data/tmio.h   |  1 +
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 09bf9b24a8c3..bfa626ea6bee 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -22,6 +22,7 @@ struct renesas_sdhi_scc {
 };
 
 #define SDHI_FLAG_NEED_CLKH_FALLBACK	BIT(0)
+#define SDHI_CLK_MASK_DEFAULT		0x80000080ULL
 
 struct renesas_sdhi_of_data {
 	unsigned long tmio_flags;
@@ -37,6 +38,7 @@ struct renesas_sdhi_of_data {
 	unsigned int max_blk_count;
 	unsigned short max_segs;
 	unsigned long sdhi_flags;
+	u64 clk_mask;
 };
 
 #define SDHI_CALIB_TABLE_MAX 32
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index f9ec78d699f4..495e58fa7728 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -194,7 +194,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 				   unsigned int new_clock)
 {
 	unsigned int clk_margin;
-	u32 clk = 0, clock;
+	u64 clk = 0, clock;
 
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
 		sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
@@ -205,7 +205,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 	}
 
 	host->mmc->actual_clock = renesas_sdhi_clk_update(host, new_clock);
-	clock = host->mmc->actual_clock / 512;
+	clock = max(host->mmc->actual_clock / 512, 1);
 
 	/*
 	 * Add a margin of 1/1024 rate higher to the clock rate in order
@@ -213,7 +213,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 	 * provided for actual_clock in renesas_sdhi_clk_update().
 	 */
 	clk_margin = new_clock >> 10;
-	for (clk = 0x80000080; new_clock + clk_margin >= (clock << 1); clk >>= 1)
+	for (clk = host->pdata->clk_mask; new_clock + clk_margin >= (clock << 1); clk >>= 1)
 		clock <<= 1;
 
 	/* 1/1 clock is option */
@@ -1136,6 +1136,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		mmc_data->dma_rx_offset = of_data->dma_rx_offset;
 		mmc_data->max_blk_count = of_data->max_blk_count;
 		mmc_data->max_segs = of_data->max_segs;
+		mmc_data->clk_mask = of_data->clk_mask;
 		dma_priv->dma_buswidth = of_data->dma_buswidth;
 		host->bus_shift = of_data->bus_shift;
 		/* Fallback for old DTs */
@@ -1178,6 +1179,9 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (mmd)
 		*mmc_data = *mmd;
 
+	if (!mmc_data->clk_mask)
+		mmc_data->clk_mask = SDHI_CLK_MASK_DEFAULT;
+
 	dma_priv->filter = shdma_chan_filter;
 	dma_priv->enable = renesas_sdhi_enable_dma;
 
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index 426291713b83..76056d49f5e0 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -61,5 +61,6 @@ struct tmio_mmc_data {
 	dma_addr_t			dma_rx_offset;
 	unsigned int			max_blk_count;
 	unsigned short			max_segs;
+	u64				clk_mask;
 };
 #endif

-- 
2.43.0

