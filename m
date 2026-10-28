Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191888;
	b=N0I089lDQBt2M9+XBVrn1og9zcElClsvuzZh7KISV1A93qWKRlRN4jVwHt5dlb+KK7ev
	 y6uqMm/PpkfiwGZwsFqdHg6KOJDIrh6BgXPelYE1bDYtiDcNUZ4ttKTJXk31zPK51jDTi
	 fpduZNC85X14kfJQiClib5MHFyMF3DFcmJyXvDX/7xI3Jg7WT9/uRf4j97KjScKrnE94V
	 tDs+kZqK0Mzr9Rcm19bD/dpu/LZdcJ2S3JRUuNwl874cBmpCaVysu9Q7mS+vqFFQRiyKf
	 tdLgJoPksqiwnGsQfvhIE1GDuhxWy9F6xaDrsUGbVBpim2zI2Bn7UyTk6Egr0O3OUhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=A0WhCVlHTBDHeoZFEclyBLhFVHM0pG4iCtYLCGqW934=;
	b=29YPlOAkIeJ3q/3nLMMsBsjDgNAebHAII710UqkEwMM/icY17ZCinA4HMA3/TctYhiZm
	 BE5HvqOzY6tK0SwzPugH8N1UPik4E+lSx3Ef5uNkDO7KdsjnbN+G1r/Ly+WUF/eTilIvq
	 l5N/aLVqzDFd5uJgVLkamMFNV7bTqx4v7z8D1vhM3ZFmW1MLw0eDjUJmxRw7OUuR3ca3y
	 STqXhf+a7/Vh+0o5Gcq4jvz9pQl6VWHL9K9FdqL8xj9MgpZ36u5ycWWgvTad9mT/42p2x
	 tMsqjUdweliE+gReUZbpqrml4cPRvPMjz4NF8E26UzJVfQyqNLAWgKPTmy5j2y5QF7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qddV/XTd";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7000260A2637
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7000260A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qddV/XTd
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so6107805e9.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 05:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793191886; x=1793796686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0WhCVlHTBDHeoZFEclyBLhFVHM0pG4iCtYLCGqW934=;
        b=qddV/XTdK2qf4I+nsRzvr3wxU4ipN3wSfOaPvLvujN0VGY6TuhUeop7kAQFRpwzkl9
         Yf5aKY2keNoA6WCgbAbm4FI/1bBHyXMjoaItN/pa/eKHvojIMsSOyLDw2g+kmWxvPIxH
         AUQtAHQP9GwKwi9dkQIFakQC2aXhlheQMlCVql/A7XTM0oOzmEnBuBOvofYiH+5LAgYf
         SWYsURU2tUsgKXBX5ZMyd2hjdPuMQ0caJ0JVjjLC9W/qlybIZJzv+v7PwxXmzmwrC3OR
         yj3z/HeAMNoygZG7Pb7Wo/eWefnNvUFhLtiHhdzE2DcnqyVDG89lsWMyC0OHoXSw6+Hj
         BTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191886; x=1793796686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0WhCVlHTBDHeoZFEclyBLhFVHM0pG4iCtYLCGqW934=;
        b=q4Ng7uUTYPQnPG/srkizLm3sMv+0/3RW0sK6s+fc93rX9jGQO5wOdTRt7dsT7qX+LX
         R3PdI5eTT/D7W0fEHBY8xjuyAIEpE0YFmtit6WAulF0KZh8Iv2DCOOn3WJ/5Pj8lke13
         iS5ooSvWAf1KBfX2Ro9YzXnYQ5lYMZwiYW8Wn9n2T5WMHU9IyRiqZhNQXm9TEsbkCVPQ
         Iq+YyVKZZW7fgD7LYljCBVIFLtq9aUQZSOFmaG9jgpN0tto0k6WvP1Jwm7gg9eUovfNY
         6lwv3BbHz93r6Y0m+hRUg20Jd7t5gPCBKgpDL54xfcat5TfUL/4f1uwJZow7V5GKCWfG
         Ehfg==
X-Forwarded-Encrypted: i=1; AKwUvBxMFk63/jXtEs0YGvB+39dFQNLbcteUAuTsrYp10xYjPmobgwpVI2qIQU7Ta3rRuOiElFWc3NfvjfR0@vger.kernel.org
X-Gm-Message-State: AFq9FYL1x5MCzPCV6mfBAp5uwRWMmz+T3mAj+Jy+C6B60sdosqtzrM3z
	8RgDOBO4VTVpjsq2cjrsfDE6iSaXKZgjCy6QkyytDBJbWfNsHHEk01qr
X-Gm-Gg: AYBFou05tg+wgLOWnHtKFcgVRDre+YZnQ/8Evg7SBfZYl+i9i+avPS63Ins4qiybSl6
	oWrVXECVWRNBCybB9l8s5fVXJObasnU2D8NVNyI81sglkh84lemDuit07C5Z2+Mo/EgZp8EmSfn
	MhSgcPZU4JZCc4ikMZPZapQM9gjniqb9qlZM2IjH2RJMfaEOAAAtpYj7tDvnZcBAhfA0oW8e3WJ
	3KBiv3dqn4p+6OCC+w02pJBBq5ievu9Kghp0JTI6NhpnXIMk7YTTtzJ7S5YJEhixSQ4Ov8++pNE
	EGmUUJGKjwpJl2RX9SVazoUVFVDRPNpMPgrH/uUPJxvK17DAF0HR4l3j4j3oQB9NEMIceJRNYlO
	9hjvlw3OBvLAYhqPhlWhlJ0SLmWDYIO6ZcXgXk3RgMsuPOhzxErD6IBdn6bYAeiqOBTtpQ/r8GW
	sYvrawhfFHHgaXXQrpCTIAckhWG/11BV8OON9M989XAUER+ZlpS7T7NIadaTIYk6d1LTcdKqYXT
	Chz53SqLsbtIwQd5ok0yZtGIxguXfVWfJ/Fn/bbEka2g20KrXjhLeWdbwPREhKvV7HAIckyh0se
	w9VCWP9ft/7s4LbIFelDc58d932mBeLbzQ7IHMstxb0UHUkvGtDjuB/rAoCYzamjmp0=
X-Received: by 2002:a05:600c:4754:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4a966c41e6cmr44785315e9.22.1793191885760;
        Wed, 28 Oct 2026 05:51:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6bf5:6c0a:cf99:c9f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm29275016f8f.10.2026.10.28.05.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:51:25 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 28 Oct 2026 12:51:22 +0000
Subject: [PATCH v25 05/11] mmc: renesas_sdhi: Add SDHI_SD_CLK_CTL_DIV1
 macro for 1/1 option
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
Message-Id: <20261028-rzg3l_sdhi-v25-5-57f16691c2ed@bp.renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793191879; l=1939;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=9RhLI0TxhP/BG9bZ8qAvVR+kroaEpg4uYm47POogTgc=;
 b=bAXkYzWXua8bUQGEteyij3DZYjtKacYh1Q67iPuZtWKoG75gYgMUt/1qBjXCnhK09UvBtY2Ru
 YRn+W+rsQbBB3dANNs6hNkWY56Xkbm3+Y8xpH8Xnmvw83OSSUbHDyQJ
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace the magic number 0xff, used for selecting the SD clock 1/1
divider option, with a new SDHI_SD_CLK_CTL_DIV1 macro. This improves
readability and self-documents the purpose of the value at each use
site (setting/clearing the divider bits and comparing against
CLK_CTL_DIV_MASK).

No functional change.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v24->v25:
 * No change
v24:
 * New patch
---
 drivers/mmc/host/renesas_sdhi.h      | 1 +
 drivers/mmc/host/renesas_sdhi_core.c | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index b54802c0807c..b759376103d7 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -24,6 +24,7 @@ struct renesas_sdhi_scc {
 #define SDHI_FLAG_NEED_CLKH_FALLBACK	BIT(0)
 #define SDHI_CLK_MASK_DEFAULT		0x80000080ULL
 #define SDHI_MAX_DIVIDER_DEFAULT	512
+#define SDHI_SD_CLK_CTL_DIV1		0xff
 
 struct renesas_sdhi_of_data {
 	unsigned long tmio_flags;
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 74834e72f038..500ecc357095 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -227,13 +227,13 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 	/* 1/1 clock is option */
 	if ((host->pdata->flags & TMIO_MMC_CLK_ACTUAL) && ((clk >> 22) & 0x1)) {
 		if (!(host->mmc->ios.timing == MMC_TIMING_MMC_HS400))
-			clk |= 0xff;
+			clk |= SDHI_SD_CLK_CTL_DIV1;
 		else
-			clk &= ~0xff;
+			clk &= ~SDHI_SD_CLK_CTL_DIV1;
 	}
 
 	clock = clk & CLK_CTL_DIV_MASK;
-	if (clock != CLK_CTL_DIV_MASK)
+	if (clock != SDHI_SD_CLK_CTL_DIV1)
 		host->mmc->actual_clock /= (1 << (ffs(clock) + 1));
 
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clock);

-- 
2.43.0

