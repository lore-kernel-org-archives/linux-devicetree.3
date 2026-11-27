Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795748417;
	b=1Hdbw9Ukiea/Jh1ut3PpsSQktB5n+cmRQWvb0aWGBXl65sf0q6qb3wZJ/yBPI3gxEs85
	 m7dzaKfLFX/k8BvpnOFmVPI16M+v+KI9jbALvfOXEXBhvHAlLvF+nixlrrxXZIr3LyfTb
	 u8VZnhWWgImKkQeAAiOMI5aTBL2Wwu1ePVejwfpMV4APoECgJQONtrW9iMJbWxovLhLVr
	 9Mt8G7OekgqTrhec/Ovn8G28tFZFbt1ZC4kTQ0ollgxFwG7T0Wrqe1HoMOpU9Pe4VnDn7
	 fWxUr4G28pLmVSXzHBlj2NGrBj/O/iuuSjMuZiJf6jYYtGTHcpgWYqIo9PrtAU7j5qA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748417;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To;
	bh=k+jbIvtsoA5ttuBvQq7PJd9IGCgNHtDBZAmmWPn6zSw=;
	b=j+wIx+YudQ+WK9mYaqCRPpiSqmklB7s3+wYzKJv11gHRfCGzsE8KZIgH73qV3aWG9u3X
	 W79rQwQI3Weg0BQAKgq4j9dSS7biEPdpYmnbaQgG9wfJs19tCNL1EGhR/L8bqaYwS3i+x
	 Rfzspaix40eV2Us4RMj5OnQk10nxHp7v3OL1yGnS4uHiqcV5/BEy4ysiCU7ePxb+UyYQE
	 o5dTjIzAbYjGGYUhMQtvIEShmh7k1uJt8W2qryKDbdcGgzqgHC5n8ac4mEcK1mt0EWxOJ
	 RjXd3MdlttkIK0eQJnWmBT1k368skAcolf4aDhojBO0qi5IeuWLK9bqHD8G2CZIHvDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V3JedMTx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C2F606A324;
	Fri, 27 Nov 2026 03:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V3JedMTx
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795748416;
	b=wwCpmow9d0PBuYYVdZpM8+4wPm0bSrkfkfZHaPHdFmVi8iT5c8XfeqApQpRk24y7rAHO
	 h0uboscmHqVAIy8JNrYR7WYt9dj5KwJAeI8z8SYhY1qQgkUuh46AQOJmEaQyjRzEuuaUL
	 duwrqcFTXTjR/aMXYE1cHAqbZcoOR5GiMKA2nSIBWHgwgk2tjGzvSsOXAGIL4uEliS1iZ
	 o2cela7Ew/IZ10EDuDH+3N0lKYh2JAtA3Gz4iRpGrwc0AlhJoXnbyueyUD/XzDfFxapfv
	 g80X1X6qqhhbw7mGEtntjitl4OAiv4XBWSKPhXDSTZAq5j5FtEjxxe/yN2WyVCnzQVA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795748416;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To;
	bh=k+jbIvtsoA5ttuBvQq7PJd9IGCgNHtDBZAmmWPn6zSw=;
	b=TS76d20v8kH8017SaileXGTcZGkqU8Xm1w+oaBW+ScHc5QLD6H8BXMRwI0A9vtRRebTG
	 6x3GfTitVwuEcHHkxSCC7FQn2auavRNAKf29URNW05QlP3nh2H2tIBrFV22+53gB+YTjz
	 ajdm+lZd52/5uGMK1K00bKi/7PKbv5X3hC4n/3oLd+X978Rjh0JojpafWO7roe4K+hd8v
	 9c8/IOj1jMXWURuUTCd3bEUP1vYSeG2mpwHphxMzzi0+gf1OEYlul8abgUYiAaHYG52LI
	 BGCHDfl8XOTDwE22bf8ho5Touxa9jra5hvatxxY2PRmnGKkzp0wKHAdI7ptQmW6+qdA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1045E1F0089C;
	Fri, 27 Nov 2026 03:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795748416;
	bh=k+jbIvtsoA5ttuBvQq7PJd9IGCgNHtDBZAmmWPn6zSw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=V3JedMTxAsvglOV43PIzfUPsq6MGEyNy/WH3NqHSxoRKQyo6lBNTZpADUVDZ8Qk6+
	 GYhOSoPdyCELR57KRTAG61/Htj2ytmfDgrPs66uzXFKD5WQnk0Nq8hpQPf3KK/0vwK
	 rsVp695T4oIpO5v2dU2wVcgIjm9oqh0f6n7n76buvmb1zr2OrmM773aJHT+cBrw0YU
	 iJMXyBNFbfy8s1+67fFwMZ0EgDsUk9L3GidvT/XShO5dXmLiutje8HY4yNaVJj5+M9
	 lVul92F9ElzD5znmRj/RJf+zpSfZcu7WEZLhd2HlviUYBEJm+aDmBtgf7pXo0Dy9+f
	 4SZMyP+vEyxSw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 94E4F4B51D;
	Fri, 27 Nov 2026 03:00:10 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: amergnat@baylibre.com, me@adomerle.pw, 
 Roman Vivchar <rva333@protonmail.com>, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] soc: mediatek: mtk-pmic-pwrap: Add MT6789 support
Date: Fri, 27 Nov 2026 03:00:12 +0000
Message-Id: <20261127030009.10572-4-iasnezhkov@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795748409; l=3175;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=NkY1FVDX7FjjqkBkHmoH1ehvqe1/nLA6VmrfCr/ta2c=;
 b=5J42c+jAlqFobqnw9AtxUXhtNt5XynWPXY/H9xofwzlCrAqb6ERd4/yB7oOFjvGnQc9lBV6co
 IPomQk+Oi8+DjsVjWPXb1Q5BGowO3XWBInC41KYIYGQE3GcUWWRVUrx
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Reply-To: iasnezhkov@gmail.com

From: Arseniy Velikanov <me@adomerle.pw>

Add PMIC-Wrapper support for the MediaTek MT6789 (Helio G99) SoC.

MT6789 uses the PMIF-SPI arbiter interface with bank 3 interrupt
registers (INT_EN at 0x450, INT_FLG at 0x458, INT_CLR at 0x45C, mask
0x180000) and WACS2 software interface at 0x880..0x8A8. Register offsets
and wrapper parameters are verified on live MT6789 hardware (iKKO
MindOne, MT6366 PMIC).

Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
Changes since v2:
- Added PWRAP_INT_FLG (0x458) and PWRAP_INT_CLR (0x45C) matching bank 3
  PWRAP_INT_EN (0x450).
- Depends on patch 2/3 so probing does not write wdt_src to offset 0x0.
- Updated with an AI coding assistant.

 drivers/soc/mediatek/mtk-pmic-wrap.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 6b0d462..f3b97fb 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -640,6 +640,19 @@ static const int mt6779_regs[] = {
 	[PWRAP_WACS2_VLDCLR] =		0xC28,
 };
 
+static const int mt6789_regs[] = {
+	[PWRAP_INIT_DONE2] =		0x0,
+	[PWRAP_TIMER_EN] =		0x3E4,
+	[PWRAP_INT_EN] =		0x450,
+	[PWRAP_INT_FLG] =		0x458,
+	[PWRAP_INT_CLR] =		0x45C,
+	[PWRAP_WACS2_CMD] =		0x880,
+	[PWRAP_SWINF_2_WDATA_31_0] =	0x884,
+	[PWRAP_SWINF_2_RDATA_31_0] =	0x894,
+	[PWRAP_WACS2_VLDCLR] =		0x8A4,
+	[PWRAP_WACS2_RDATA] =		0x8A8,
+};
+
 static const int mt6795_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
@@ -1316,6 +1329,7 @@ enum pwrap_type {
 	PWRAP_MT2701,
 	PWRAP_MT6765,
 	PWRAP_MT6779,
+	PWRAP_MT6789,
 	PWRAP_MT6795,
 	PWRAP_MT6797,
 	PWRAP_MT6873,
@@ -1852,6 +1866,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 	case PWRAP_MT7622:
 		pwrap_writel(wrp, 0, PWRAP_CIPHER_EN);
 		break;
+	case PWRAP_MT6789:
 	case PWRAP_MT6873:
 	case PWRAP_MT8183:
 	case PWRAP_MT8195:
@@ -2302,6 +2317,19 @@ static const struct pmic_wrapper_type pwrap_mt6779 = {
 	.init_soc_specific = NULL,
 };
 
+static const struct pmic_wrapper_type pwrap_mt6789 = {
+	.regs = mt6789_regs,
+	.type = PWRAP_MT6789,
+	.arb_en_all = 0x777f,
+	.int_en_all = 0x180000,
+	.int1_en_all = 0,
+	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
+	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
+	.caps = PWRAP_CAP_ARB,
+	.init_reg_clock = pwrap_common_init_reg_clock,
+	.init_soc_specific = NULL,
+};
+
 static const struct pmic_wrapper_type pwrap_mt6795 = {
 	.regs = mt6795_regs,
 	.type = PWRAP_MT6795,
@@ -2448,6 +2476,7 @@ static const struct of_device_id of_pwrap_match_tbl[] = {
 	{ .compatible = "mediatek,mt2701-pwrap", .data = &pwrap_mt2701 },
 	{ .compatible = "mediatek,mt6765-pwrap", .data = &pwrap_mt6765 },
 	{ .compatible = "mediatek,mt6779-pwrap", .data = &pwrap_mt6779 },
+	{ .compatible = "mediatek,mt6789-pwrap", .data = &pwrap_mt6789 },
 	{ .compatible = "mediatek,mt6795-pwrap", .data = &pwrap_mt6795 },
 	{ .compatible = "mediatek,mt6797-pwrap", .data = &pwrap_mt6797 },
 	{ .compatible = "mediatek,mt6873-pwrap", .data = &pwrap_mt6873 },
-- 
2.54.0 (Apple Git-157)



