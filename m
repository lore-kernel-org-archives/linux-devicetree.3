Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795748422;
	b=Fze5QZVxs1jNS/zGL1wR+VjcH1KP7b0VO2+QlwJ1nLutoBfdSyyyeL+ZC/cqQZxGjq2p
	 D+mgtKEqFINEDo+hBnJEr0gG+B4C3k4xU9mz8xSstaDDYoRuNX8JQHrTHL8ItugtgpUUH
	 z7mMatkoHfQIxmpObzgId7ykKMqbxLRG1i/1AiHhY3kxyO6w/upOH4oQ533YLW3VgCjDL
	 DfJmDzYcb3t/m4geB+vfdm3M6DS34kzCiQcPTziG0UZiAymjSAjFW1gNeroLBBW+rDYRh
	 NnxbD0iCvsAU2FZRwyavY/l7XWkHkODDowGRyAT7kBSGJCL1aKWZd4wE6H19RgCuztQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748422;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0V5ent2gRGVFE5jdkh23KF1cd/GkDsAuW+2Jeh4TUms=;
	b=krKKRtA7KcIHFTs04C5r19zw9n+nUjoJz+qWS4ZB26lp6MCraVDvfyE7DomRhTMLkwAk
	 zNR9zRZ6LRmf5a+9ur1r54yn9Ki2n75qe3QzSib10AnrdwCp0mhdkcJz/xuN5UXtlu/mm
	 MBkrwoPMFRwoztXoHMw/IMl9JueeHrO5vcXnHGx44iLIojafKT16q0+9NtE4j5GBmN92D
	 d+4sn7ZtaA1lrHPBo6V0FwMtBf2pf6C5SKzwvgidlcG6ud+JyypFkIYRJ8yNg0x5l2U2D
	 eVOjZ9KT5B8XN57yah1+VubNuX1h/eyPkttxFLoZgfHDQD3Dd6R/LiaB5lLuJCWgqTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c+uTmfm8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B43606A324;
	Fri, 27 Nov 2026 03:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c+uTmfm8
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795748422;
	b=ae+rFGG8oiOkHpiFpBTHr/1F816vMLtnQQFd9Ir/Y5/lYNpPa55p+U+Z9FQ0YVaj6z4w
	 6EpSOqruQ/DlRXUkGwLPIPSjbdrLcQ94Pj3r7NP9N4f4o6zeDkzl6mRIH/ytPDl9O38ow
	 4gPrX1m65ZYO/B00eQlWQvUvoiWAPaP4cYqmj8kKtEmmbDJEECBAWkqmzyAtjZQ82CrfL
	 YyHnRXuuJY0tOlJzBqlqwIWsjw2KqgYZTpMoMqofug5+877TRBHiawc5fBqJ/TJAUa84g
	 A7kDmRq98zDL2YwlTAKVJooi3DhfgOEfgbV+navrC7AQXDenM6yDi60+jrTytIcUeFQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795748422;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0V5ent2gRGVFE5jdkh23KF1cd/GkDsAuW+2Jeh4TUms=;
	b=WU7Fc1jhPokUDKd5+6JRzYlgbuf/E/vqmWShnCjmI9tmj/svGXPmOeVVoc3ICIjm16lQ
	 NP96ABz7G3OUXH0tfib2L4RGQDX2GnfAbxcJlUG1LMCOAc0Ws7LC4+OU++0iVSpmD8/wk
	 FjlG5B0863ibSPt68v0hqVjgLjSXYJSwN01fgdb/OPmA7vVNXRtpCoxUCExhf8SwMB3dI
	 HmL/p2zfmXT32XXHPou8W6Ej5PIOMeN6iYxjEg4RbbLvhE9tH5uMSwPtbRxqcyiJL8CPf
	 vVdjl/Ob0SmpOBd+p1EplVcLdFCCjUnbAeeDhWJjree2iTUAM27Y4pdNWfEdv1OaxBg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E45761F0089B;
	Fri, 27 Nov 2026 03:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795748422;
	bh=0V5ent2gRGVFE5jdkh23KF1cd/GkDsAuW+2Jeh4TUms=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=c+uTmfm884Cf2/bAz2yJjc28n/ymXll1t1bpWCmvfUwHWrirntZIVLoiXLtYiP3pP
	 ouZSEdHjgit6h325hPN7qhp2VP0cQtmNz16/CeNvP5ipQxaWn88JPG6zQ7soLMNS58
	 KX8MFDhuoj/wR8dU5zA5dF+AKidGyy791cQMX2IdYB8IfS2fQMthaTWtD8+EPWVYB4
	 AuDb9rLPtnSvjlXE93/gdu5VtAWwimRe8kBkDkP6aHcjZbdQFoGc67955dIkLUHen5
	 +hz3GcwB8zozsYLVU7neW3nnu7srqXCLd9SsLK1Dg40W6NbCEOnq7cSfNbvC1zlHRx
	 dxYyE0BIWlkdg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7508C4B519;
	Fri, 27 Nov 2026 03:00:10 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: amergnat@baylibre.com, me@adomerle.pw, 
 Roman Vivchar <rva333@protonmail.com>, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] soc: mediatek: mtk-pmic-pwrap: Skip WDT source and
 init on arbiter SoCs
Date: Fri, 27 Nov 2026 03:00:11 +0000
Message-Id: <20261127030009.10572-3-iasnezhkov@gmail.com>
In-Reply-To: <20261127030009.10572-1-iasnezhkov@gmail.com>
References: <20261127030009.10572-1-iasnezhkov@gmail.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795748409; l=3004;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=YYEmyq9HmeAz5eigYAssbolziK0P0Y/IzdI3DzPSFi8=;
 b=NlmbSwySmpgUDufs1xGZHTCMYGyYxMyi+193UoV+mf2t40/vFhJ8+2SYuYFPoUrgDXm8uO88W
 82KEOB49Bm9Cau5jMjg/aIqAkwYvSg328mWMEGggmJUlZquKL/1fSvP
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Reply-To: iasnezhkov@gmail.com
Content-Transfer-Encoding: 7bit

From: Ilia Snezhkov <iasnezhkov@gmail.com>

Commit 9d498d0b4043 ("soc: mediatek: pwrap: add arbiter capability")
added PWRAP_CAP_ARB for PMIF-SPI arbiter SoCs (MT6873, MT8195, and the
upcoming MT6789), where the bootloader already initializes the wrapper
and the watchdog registers (PWRAP_WDT_UNIT, PWRAP_WDT_SRC_EN, and
PWRAP_WDT_SRC_EN_1) are absent from the per-SoC register tables.

However, pwrap_probe() only guarded PWRAP_WDT_UNIT with
!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB), leaving the writes to
PWRAP_WDT_SRC_EN and PWRAP_WDT_SRC_EN_1 unconditional. Because omitted
entries in static const int regs[] default to 0, those writes land at
offset 0x0 (PWRAP_INIT_DONE2) and overwrite it with wdt_src
(0xffffffff) on every probe. Similarly, falling into pwrap_init() on
PWRAP_CAP_ARB SoCs would write legacy non-arbiter registers whose
offsets also default to 0x0.

Extend the !HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB) guard in
pwrap_probe() to cover PWRAP_WDT_SRC_EN, PWRAP_WDT_SRC_EN_1, and the
cold pwrap_init() fallback.

Fixes: 9d498d0b4043 ("soc: mediatek: pwrap: add arbiter capability")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
Added in v3. Drafted with an AI coding assistant.

 drivers/soc/mediatek/mtk-pmic-wrap.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 9067718..6b0d462 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2533,7 +2533,8 @@ static int pwrap_probe(struct platform_device *pdev)
 	 * The PMIC could already be initialized by the bootloader.
 	 * Skip initialization here in this case.
 	 */
-	if (!pwrap_readl(wrp, PWRAP_INIT_DONE2)) {
+	if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB) &&
+	    !pwrap_readl(wrp, PWRAP_INIT_DONE2)) {
 		ret = pwrap_init(wrp);
 		if (ret) {
 			dev_dbg(wrp->dev, "init failed with %d\n", ret);
@@ -2554,16 +2555,18 @@ static int pwrap_probe(struct platform_device *pdev)
 	}
 
 	/* Initialize watchdog, may not be done by the bootloader */
-	if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
+	if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB)) {
 		pwrap_writel(wrp, 0xf, PWRAP_WDT_UNIT);
 
-	/*
-	 * Since STAUPD was not used on mt8173 platform,
-	 * so STAUPD of WDT_SRC which should be turned off
-	 */
-	pwrap_writel(wrp, wrp->master->wdt_src, PWRAP_WDT_SRC_EN);
-	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_WDT_SRC1))
-		pwrap_writel(wrp, wrp->master->wdt_src, PWRAP_WDT_SRC_EN_1);
+		/*
+		 * Since STAUPD was not used on mt8173 platform,
+		 * so STAUPD of WDT_SRC which should be turned off
+		 */
+		pwrap_writel(wrp, wrp->master->wdt_src, PWRAP_WDT_SRC_EN);
+		if (HAS_CAP(wrp->master->caps, PWRAP_CAP_WDT_SRC1))
+			pwrap_writel(wrp, wrp->master->wdt_src,
+				     PWRAP_WDT_SRC_EN_1);
+	}
 
 	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
 		pwrap_writel(wrp, 0x3, PWRAP_TIMER_EN);
-- 
2.54.0 (Apple Git-157)



