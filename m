Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191889;
	b=al0ZptEu4vZId07z/Jw/UOehRLkAHKleYb5Ms3LM09W2aOCZkZJ7VYgNjPe7Oi+tS8AW
	 MgwqJv2hxOqSxfB7XLGsQo4lSoDFWc6SZ/1oWn2k3EwQOeQ+U6bB8VMOdlj+NM4cEZ9+q
	 YVboAQq5v4HmE+J2I3kr4ciVQqeq7iQOT8HJmN0rCY2pb7nnhz++inAdmSw4ybkwANEMg
	 Ln+IiDGxjMvmC9DKvTjiHkptKtDGZM/tE/T2Lr6Q2mQaenHeRUYsyIc60HdcjgjpwNqnq
	 h1GPsuLDlwkAEpfYj10o2b0zXgwddl+jaGxH0edWmDjYp184nVEXA41o+e3UBCAALEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ddP2tvF99I/T141/A+gWhvbN3hboCdFeGuQB06Tv2b0=;
	b=i2lV2ux1DGZOfGjain+BpViSX1T5V5bzlaAmHtTL4TCunuAPVBmoJH4a7xsmALcyDJTj
	 gQu9EfUCnAdVp8qMBLgZp9JDdk+55YJm+BXtgQKpQLvPONb6gtuXWex2Syvt9Qh5tIU14
	 lhUWZ4rlMBpNRVdi0dQjF8wOwnzF76cuNA2d0ILz/0F1DgEVF6iG5Ah6NoZAnN7g7uFdH
	 3VfFCoynu9cQTlhYOUFHsDE8jVQpd6CerZ7bmjnJh/9hosu2Yxc0o5bHopn5p9535XOMh
	 kCXdmEdvPkH3n2kc/MPx590DNo6+c6KDpv571PtY0yk/cN6++2RnvzmhY054bWcWR8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IL5UIErK;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7207660A3818
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7207660A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IL5UIErK
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48afbd2c386so549825f8f.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793191887; x=1793796687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddP2tvF99I/T141/A+gWhvbN3hboCdFeGuQB06Tv2b0=;
        b=IL5UIErKM/lQd2sgYQ2SdH52+xW3kobCm/N5cfmX8+XFWTpGyNGeyInMxwRTROHizD
         +LmDPGH+yYW3cbybhD5OXjHLQ5654K7wq4UnlxiGGguPcQzwLfzJ9XZmEy/SgXFqGzB6
         V/Tn+YyMszstLGt+CgxuFIYkARQ8jTOp7AoiaA/VJ0d8aRkv/CewP1QWQaiocjc0uPXw
         9/FuR2rwQZrJeP5VLVWbL1K1ss6AhGFIdk4MwnMclfFt6z7X5+uu51UbrTdOYxP3VMWl
         6Ck1wPeLEoE9tAOIFZXsFNfEL3CCZP2dzPvMLTZ+4KFSG648YonOB1S7lM07aaZtsb9M
         MQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191887; x=1793796687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddP2tvF99I/T141/A+gWhvbN3hboCdFeGuQB06Tv2b0=;
        b=11bcvUHBG2PJnH7pNFqL0P8Rft92TeOX3QMV6J+5me/gmIBqDrDf9wDJ6BO7EhN8B5
         frWjzIJLvmltSG3qctIWj3lxdhb98KFcAeH3WyoT/OKrYlQNha5q2RgQsabhotF9pUv2
         cz/0Pg7o8ZDPMN35Krp479UFDbiuNht9wuo+npm2LlBZPVTvwIjymjpEVDgfDkkiSzrN
         lGh7BG5n5Rp89IWcjQQCnmEpcSn8vjKelUZ8IrOAUCgwAjiy5hvxReJVSssNeTzFxXrl
         8gknAkdeBdYYbzVDYjub1chFpnwHBd2ExqhK09EcGYgoisVMvuBOFAGHzrCgZAtCk+uk
         cQsg==
X-Forwarded-Encrypted: i=1; AKwUvBzUa784LlVkrNVrHxQ3atVcO+1O05W4rjZPqO4VO+mfP2Fz7tNaCEwH18qOrKLMEbAAlAPEZcw52+Yp@vger.kernel.org
X-Gm-Message-State: AFq9FYIpbJ9wphkRxjKk7Z2dgg9obqhtgK/1Nz/uasfPrDJ+ArOsgAgd
	47m4sXNLfxVjNQ76KAafxQsg3m5f0V9RHvVW99b7SO6uijkriBvRPXpu
X-Gm-Gg: AYBFou3v9OcB+gg9MPImMXhl92L/q/+v9GRhI9glRVjgMw3m9mmrrNmFobsNLaQDf1L
	sLEtmqtXV8PXAPpowrXZON4GEPcED6fHtbUg/5cEBqBIVkFSm65lCm+7H07sVihGL/aPV603BFg
	I0E0DLE/z6rbcm7ZCBb1gZG5uEDhhL94M1Jr4HffM4aW2EycHeB+Zk1ThOwAcHo/9psI4E83Azs
	aYTzHewyY14WsX20L7NvLpvqLnIvjkb3aRC4+Jo+s7wZMQhMV3ZVLHzEn2YM2cwg78wQIBj+o1+
	XfTtYFJ7A5C9GyZvNsHLSrIjJ3U6365xRN5edmLbIHypvaZ8MxP/I5lrNm1Jdl5d+6Wi13Qr/UL
	zpGy4+Fmf9KMtmPytjCm9aX7L6Tv2WSPLJ0UG1TnJpWz/qXvs/Hcl59dWGzw84F35IG5MUL4Rmm
	CJZvuNFB1DY5ISfYtS5Dsxkgi0m12F1BwXLz54Vyg2Wuu1WsGBrRkoQ2BP/CO3vpeHR3TjSR+/g
	HQ7U/bckTz/vwaSQLW3oh+3X1O+b44linr7XxNACKXPX7YYG298kHcArKdBJ79D1YL11oAscOdN
	A3nNcdIiRKRzqpYtw7PbWS0jsL6+blgJovbG82ZLMCiCkDSpmFsyscwYG2b8sMgESw4=
X-Received: by 2002:a5d:6108:0:b0:48c:54c0:4cf3 with SMTP id ffacd0b85a97d-48e5d5c8a50mr4188115f8f.28.1793191886781;
        Wed, 28 Oct 2026 05:51:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6bf5:6c0a:cf99:c9f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm29275016f8f.10.2026.10.28.05.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:51:26 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 28 Oct 2026 12:51:23 +0000
Subject: [PATCH v25 06/11] mmc: renesas_sdhi: Make clock divider mask
 configurable
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
Message-Id: <20261028-rzg3l_sdhi-v25-6-57f16691c2ed@bp.renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793191879; l=3021;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=NV58WXFwlSqcA9STMr65g+9y2UmbhN8wHlp/bQXqlI8=;
 b=FR2J1qyfFrzrgjVYnS/CxYTKleL8E1J0oQGmZDc04CvBxDWktJydaSolk8scnDIcqQxcb3Yal
 KO7o8AgRAAuBRXyD4RqEUz6n9Y/9DR4oqlfJLHXheOLgl3uIBuLrDVS
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Add a clk_div_mask field to renesas_sdhi_of_data and tmio_mmc_data
so each SoC can specify its own divider mask instead of the
hardcoded CLK_CTL_DIV_MASK used in renesas_sdhi_set_clock().

Default to CLK_CTL_DIV_MASK at probe time when unset.
This lets RZ/G3L, which has a wider divider field, reuse the same
clock-setting code.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v24->v25:
 * Updated commit description
 * Dropped initializing clk_div_mask as it use default value.
v23->v24:
 * Updated commit description.
 * Replaced  GENMASK(7, 0) with CLK_CTL_DIV_MASK.
v22->v23:
 * Assigned of_data->clk_div_mask in renesas_sdhi_probe().
v21->v22:
 * Updated commit description.
 * Added clk_div_mask to of_default_cfg and of_rcar_gen2_compatible.
v21:
 * New patch.
---
 drivers/mmc/host/renesas_sdhi.h      | 1 +
 drivers/mmc/host/renesas_sdhi_core.c | 6 +++++-
 include/linux/platform_data/tmio.h   | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index b759376103d7..3c991f6b988b 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -42,6 +42,7 @@ struct renesas_sdhi_of_data {
 	unsigned long sdhi_flags;
 	u64 clk_mask;
 	unsigned int max_divider;
+	u16 clk_div_mask;
 };
 
 #define SDHI_CALIB_TABLE_MAX 32
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 500ecc357095..86778d83eb7d 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -232,7 +232,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 			clk &= ~SDHI_SD_CLK_CTL_DIV1;
 	}
 
-	clock = clk & CLK_CTL_DIV_MASK;
+	clock = clk & host->pdata->clk_div_mask;
 	if (clock != SDHI_SD_CLK_CTL_DIV1)
 		host->mmc->actual_clock /= (1 << (ffs(clock) + 1));
 
@@ -1146,6 +1146,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		mmc_data->max_segs = of_data->max_segs;
 		mmc_data->clk_mask = of_data->clk_mask;
 		mmc_data->max_divider = of_data->max_divider;
+		mmc_data->clk_div_mask = of_data->clk_div_mask;
 		dma_priv->dma_buswidth = of_data->dma_buswidth;
 		host->bus_shift = of_data->bus_shift;
 		/* Fallback for old DTs */
@@ -1194,6 +1195,9 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (!mmc_data->max_divider)
 		mmc_data->max_divider = SDHI_MAX_DIVIDER_DEFAULT;
 
+	if (!mmc_data->clk_div_mask)
+		mmc_data->clk_div_mask = CLK_CTL_DIV_MASK;
+
 	dma_priv->filter = shdma_chan_filter;
 	dma_priv->enable = renesas_sdhi_enable_dma;
 
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index 27ea21c00419..f684f4087a8f 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -63,5 +63,6 @@ struct tmio_mmc_data {
 	unsigned short			max_segs;
 	u64				clk_mask;
 	unsigned int			max_divider;
+	u16				clk_div_mask;
 };
 #endif

-- 
2.43.0

