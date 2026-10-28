Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191884;
	b=4o9SJ9sYyoCw6Yfr0eefwHDxAyZfeJY8gZQKa0zOtC247KuNWl7bKUmCZevZCDMtBKpC
	 QUqwbXaL7P0MH9oqKc9gPO5wCnOxgdPG9Hv/+TSpj5q2zoTvRCD/T0dPRwpVOJQfHSJMj
	 4A2PtODSrX27EiWQN3qL/REj/cT0YGdNLf9U3KNJA5SW92KwayKQssvAt93hQKXT4jld+
	 7h3XDYe442NFizdbGqFVWfbwUTqfnMhfvAEIvp+5eZu63eEwygvNN/hMCQ+pJQO5h2QVT
	 PasvzZz8J665SMt6eb6IIY8FMCHJXu3MB/+A8WXV9JyE5ENlclkRdSEXzQasilxcz4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=s0XP6uW8MmixUr9jsf8Tb2B/Wg2M26cG7tQ+NNPFLuU=;
	b=lZgnylcrWUV9VU/LOj4IhwMasPv4s+XWDyPo5t/Bc+LmskaDW+CUHeZEHYPxcCSwtof5
	 bPEjf0yfeCC/j871IMhFLDkI4QSh+rQ9Zu86V39T4z4EhQgsidFZ1lG5H4gGPprlChd5n
	 j7toInA0/vFbwlXLowLKVVihYiGrOcgUPwk/If1YHFgWaYqGWQ0vT2soCkI/WCL1hCHq/
	 Xfkx7U5LOgmjk3qaFWnm/gV7/nKbXZ+UkQW6N3GSnuvb+3R+TMK7lBy7BzzULzIWQu1F/
	 2Ok3xegsOlz5YEpnigDbdcFLsD9QgkUZ0puY3I/x069i4DBaJY87qtpNVmf6dpIC4bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f+L8aNdd;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D2F606A337
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52D2F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f+L8aNdd
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e10a70540so582621f8f.1
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793191883; x=1793796683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0XP6uW8MmixUr9jsf8Tb2B/Wg2M26cG7tQ+NNPFLuU=;
        b=f+L8aNddZQEeJdv6b8IJt8lhhCSsElJW3lzvNZM3weSOuWfVzaLUh+YJr4FPGa7oDY
         xyRx5+77beG1ihlm2bCnIgQBIb9HPMkWIExtTPHIpZy55VujxhK+pMTwiGFhesm2xfrM
         EDKJU9r9ojSZrWK9Ym14lMtDl9jnbge0dtYDg4oH2JPbxsV6pdD9CEtnDF9cqZ/P4yjK
         Z1ad3t6wk7cwGblzie1AOWPZHXojyvzLqzw1kywzia/oYXNQE+AmcIz6xstK1m+JziWO
         pK4LzJP+QvfnvzpnOFXZ+MXDHRfZ6vRW8MhnPx++8551Pkvhht8lPgfqnlVz7tCjLcFN
         W8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191883; x=1793796683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s0XP6uW8MmixUr9jsf8Tb2B/Wg2M26cG7tQ+NNPFLuU=;
        b=0U9zpxzoElw8lQeJzAcwwKLTwN+IAprgcXDr0ubp/q7OPNYiK6w53dbyFCK3zDMXZg
         NsbyVu21q/qzJPBMXC2d3cDJu4F+f8G3rLYS1zg6W/AeA9Py5GX+xdvhMXEM1fYcqABu
         2tvjG9HzZBQCxKh/O2q2C0EU9NmbYH+3MNucSFFzZD7ocSNeCLAGyBrh5LV5hAwhtTH4
         tWquB6TlFESjMzkbqjOQTC2EkPbjskATp+6FF4fsYqxfWM/Ho5PluQYrJXYTgKls/L0z
         uujDUwzgmUiVBJxL1YWdMBGPLDI1MjQoWLkGmImsbOMSob34btc92IpQDPgTyAmp8/lo
         at1g==
X-Forwarded-Encrypted: i=1; AKwUvBxo7YafBpgb/x9QqzbZL9NOi6cGL66shk4VQ2YFZ41E5aiSQ53gzaiTBezs69yyodwUWzjR6VtIc07H@vger.kernel.org
X-Gm-Message-State: AFq9FYLpucHNR2AMYsb+24h8EJ9zk8ltoPIwUSulHYV+akcY2jgKKIiG
	akQFZae6gI6Uzf6heK/a5NvKRfZ/B1kZr5AcLY6HFXdXUjssMZB4JcLapLQNPA==
X-Gm-Gg: AYBFou2UbDtZ8l1WQrfVQc8OywCnHp+uCrRGFi0RTqn1ouMCfsqAj3jZhFQr41nZ6ey
	sA9QZ8g7Q2weicYyveKVuLaNkq/jat8dRtnWcPKacaHjHhhxtFAgJE1X0pbj+b8gYkgOm4HsXi5
	Qvts16+RGq5Fbwf5wxQb/tBucrqdRRxEHwidAvZdHXqGoT/vw2oGBf4SC7MYrFYjDtVMqTR82kn
	bp4B2yTFVIn1XfMkRNqWCbYB5s+9Kqi+54gj3Lv06o37uf5TrNi9OPA48540Di3BNl6fX0m5uMD
	DHDjR6TBLe0ifuX/xj6Vz5F6DVWlMaWa17DYjDsPZ3AH7OJ9y+w0/idHuyAlNl+FuZyf+9Cgx5d
	2SIQuGveDVRVNoLIutUwz+BTiHLLdbzJpuBJpYeaA1yqYVzp6Xi2dP93XpLUaTX038EzxKa1bol
	ajubEZX5GxmX8sW6+/XqM7Xe6VrncTB7cy9emyar86IlHBmdSG20MtKP0+14jDX1kNnBvgQmw7F
	5M+7+xRSgZXRIDgIj+pzEZwlVhf7P3SjEZCaIWhwQCT+CPD8yczvBD/YymQCd085NoDsnWQySpT
	No9+hDaPtmNDfjYaney7wFzVJVYKLfN1DEQCUWH7MxDbkuofkkaUIwhfBATKzIq2lcU=
X-Received: by 2002:a5d:5d86:0:b0:48d:dc6f:219a with SMTP id ffacd0b85a97d-48e5d5c8acdmr5836626f8f.27.1793191882643;
        Wed, 28 Oct 2026 05:51:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6bf5:6c0a:cf99:c9f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm29275016f8f.10.2026.10.28.05.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:51:21 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 28 Oct 2026 12:51:19 +0000
Subject: [PATCH v25 02/11] mmc: renesas_sdhi: Clean up whitespace and add
 OF table sentinels
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
Message-Id: <20261028-rzg3l_sdhi-v25-2-57f16691c2ed@bp.renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793191879; l=3511;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=ioJxuBexvCNAq5ne1/6uz2TU/X1kO9zeCLe3w5wnhKM=;
 b=gkmbnF3wah90mBQtXFW+AwM0YRLWlrsfuVSECYoDovWyMTVKZKO07fMpRW2npa4SU7kwP6IMH
 o4IcC5VRAZIBwa91q2mqaCv0PdC4gzEBMl4bnTlZhssOKrDaJR/DyiR
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Clean up coding style inconsistencies across the Renesas SDHI host driver
files. Remove redundant internal spacing in the struct definitions and
static initializers to enforce a single space separator or uniform tabs,
aligning the code with standard kernel formatting guidelines.

While at it, add a "Sentinel." comment block to the empty terminating
entries of the Open Firmware (OF) device matching tables to improve
code readability and explicitly mark the table boundaries.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v24->v25:
 * Restored struct of_default_cfg.
v23->v24:
 * No change.
v22->v23:
 * No change.
v21->v22:
 * No change.
v20->v21:
 * No change.
v19->v20:
 * No change.
v18->v19:
 * Updated commit description.
v17->v18:
 * Merged patch#4 and #5
 * Updated commit description
 * Annotate the empty sentinel entries in the OF match tables with a
   "Sentinel." comment for clarity.
 * Retained the tag as it is trivial cleanups.
v1->v17:
 * No change.
---
 drivers/mmc/host/renesas_sdhi.h               | 2 +-
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 6 +++---
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index afc36a407c2c..09bf9b24a8c3 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -25,7 +25,7 @@ struct renesas_sdhi_scc {
 
 struct renesas_sdhi_of_data {
 	unsigned long tmio_flags;
-	u32	      tmio_ocr_mask;
+	u32 tmio_ocr_mask;
 	unsigned long capabilities;
 	unsigned long capabilities2;
 	enum dma_slave_buswidth dma_buswidth;
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 033d8cd92726..45e0d8f5c64d 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -270,8 +270,8 @@ static const struct renesas_sdhi_of_data_with_quirks of_rcar_gen3_nohs400_compat
 };
 
 static const struct renesas_sdhi_of_data_with_quirks of_rza2_compatible = {
-	.of_data	= &of_data_rza2,
-	.quirks		= &sdhi_quirks_fixed_addr,
+	.of_data = &of_data_rza2,
+	.quirks = &sdhi_quirks_fixed_addr,
 };
 
 static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
@@ -292,7 +292,7 @@ static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
 	{ .compatible = "renesas,rzg2l-sdhi", .data = &of_rzg2l_compatible, },
 	{ .compatible = "renesas,rcar-gen3-sdhi", .data = &of_rcar_gen3_compatible, },
 	{ .compatible = "renesas,rcar-gen4-sdhi", .data = &of_rcar_gen3_compatible, },
-	{},
+	{ /* Sentinel. */ }
 };
 MODULE_DEVICE_TABLE(of, renesas_sdhi_internal_dmac_of_match);
 
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index c7df4da9e865..615bbc86930d 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -88,7 +88,7 @@ static const struct of_device_id renesas_sdhi_sys_dmac_of_match[] = {
 	{ .compatible = "renesas,rcar-gen1-sdhi", .data = &of_rcar_gen1_compatible, },
 	{ .compatible = "renesas,rcar-gen2-sdhi", .data = &of_rcar_gen2_compatible, },
 	{ .compatible = "renesas,sdhi-shmobile" },
-	{},
+	{ /* Sentinel. */ }
 };
 MODULE_DEVICE_TABLE(of, renesas_sdhi_sys_dmac_of_match);
 

-- 
2.43.0

