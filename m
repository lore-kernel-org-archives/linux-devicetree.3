Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335703BBFAE;
	Tue, 14 Jul 2026 12:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784033100; cv=none; b=QLvIzD4yC5pdtPeDe/Aevc4xB3TD39FP4vzDOHlrO5d/+P602UAykM3AkrqIH5abijSV+sN8Qclf2CfvuSNpv4Lbhe3fWRjr4SLYNdU8XZ/5mzkMN3VVGJpM9/t1YTjahnv0KbK7Zis+Iex2DzF1DmQCZKXY7M/LpUsUA3oM1VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784033100; c=relaxed/simple;
	bh=yrxMhmCYOUKee/WHlWAg1e5dG7auoKfuHFKPci2Li+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CqgA8tt+00FHUv3WBwt12ySeGgilmHW0W42o4zCcfSYiMiOifAvAEc5E0TYaprGj2vFlM0gInhTQIsm427FGQEnv5NCYMN9PqZItyYBs+9ibAglB85lQkRcHwAbN4iSb3QvluznkGtrI9THKJKpux4bdqhdyvNYKYZq59HcnLrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sNvPHRLx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sNvPHRLx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D45CAC2BCF5;
	Tue, 14 Jul 2026 12:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784033099;
	bh=yrxMhmCYOUKee/WHlWAg1e5dG7auoKfuHFKPci2Li+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sNvPHRLxhxDr/Tbzq2T1zG+NviZ4GJlCvmhPF9olSMCOiFkSGXCtyiFE3hFbWYI/w
	 +cGhStojrujikZaXxHraP+GrXrxPPbdqCoCg9EhK0PFv69SGsXDe4odEe12zjTkH8e
	 7Is3mGLGNT6SxwIeuxuJ8ao4mR+GxTj7bc3ImKnBggfh/0TckJxqRWU628T25UdmoP
	 ruMtqgBQCszpWGcBS00HhkIS6zmr4j7jMBhWlT0zzWRdJr8x35/tnCBvkocQGEJmt7
	 O5ps6ep3QTJp71UCSnsLXcG12vnkYGEkOqLOZcONK9JTk6UJdVq0nlwGkHluvqfaKz
	 /d3jcVY0kFYoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B565FC4450B;
	Tue, 14 Jul 2026 12:44:59 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 14 Jul 2026 15:42:05 +0300
Subject: [PATCH 3/3] soc: mediatek: pwrap: add mt6572 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-6572-pwrap-v1-3-d8e5a39cf7ef@protonmail.com>
References: <20260714-6572-pwrap-v1-0-d8e5a39cf7ef@protonmail.com>
In-Reply-To: <20260714-6572-pwrap-v1-0-d8e5a39cf7ef@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784033096; l=5555;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=MPPYOgzDqoNCcN6F5iF2Dxp5T0TD89ZEJks3TwVCRQY=;
 b=JF16gx8q+zpMiZXOKBwHA9fCCmx8KQ+k5V9GLIDoEui8/ctpGb81KmpUv+9n/RaAHUe/WHlfA
 DFv2NlPy7FlDEzIeLKfKg/GWwJgWy46OfbSmDfWLY+pK6HsLwpeK0Ez
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com

From: Roman Vivchar <rva333@protonmail.com>

Add mt6572 registers and platform data for the pmic wrapper.
The mt2701 SoC-specific initialization function is used because they
share the same GPS_INTF settings.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 111 +++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index a4b10b0a97cb..4b8a5dc80a36 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -569,6 +569,96 @@ static const int mt2701_regs[] = {
 	[PWRAP_ADC_RDATA_ADDR2] =	0x154,
 };
 
+static const int mt6572_regs[] = {
+	[PWRAP_MUX_SEL] =		0x0,
+	[PWRAP_WRAP_EN] =		0x4,
+	[PWRAP_DIO_EN] =		0x8,
+	[PWRAP_SIDLY] =			0xc,
+	[PWRAP_OP_TYPE] =		0x10,
+	[PWRAP_MSB_FIRST] =		0x14,
+	[PWRAP_RDDMY] =			0x18,
+	[PWRAP_SI_CK_CON] =		0x1c,
+	[PWRAP_CSHEXT_WRITE] =		0x20,
+	[PWRAP_CSHEXT_READ] =		0x24,
+	[PWRAP_CSLEXT_START] =		0x28,
+	[PWRAP_CSLEXT_END] =		0x2c,
+	[PWRAP_STAUPD_PRD] =		0x30,
+	[PWRAP_STAUPD_GRPEN] =		0x34,
+	[PWRAP_STAUPD_MAN_TRIG] =	0x38,
+	[PWRAP_STAUPD_STA] =		0x3c,
+	[PWRAP_GPS_STA] =		0x40,
+	[PWRAP_WRAP_STA] =		0x44,
+	[PWRAP_HARB_INIT] =		0x48,
+	[PWRAP_HARB_HPRIO] =		0x4c,
+	[PWRAP_HIPRIO_ARB_EN] =		0x50,
+	[PWRAP_HARB_STA0] =		0x54,
+	[PWRAP_HARB_STA1] =		0x58,
+	[PWRAP_MAN_EN] =		0x5c,
+	[PWRAP_MAN_CMD] =		0x60,
+	[PWRAP_MAN_RDATA] =		0x64,
+	[PWRAP_MAN_VLDCLR] =		0x68,
+	[PWRAP_WACS0_EN] =		0x6c,
+	[PWRAP_INIT_DONE0] =		0x70,
+	[PWRAP_WACS0_CMD] =		0x74,
+	[PWRAP_WACS0_RDATA] =		0x78,
+	[PWRAP_WACS0_VLDCLR] =		0x7c,
+	[PWRAP_WACS1_EN] =		0x80,
+	[PWRAP_INIT_DONE1] =		0x84,
+	[PWRAP_WACS1_CMD] =		0x88,
+	[PWRAP_WACS1_RDATA] =		0x8c,
+	[PWRAP_WACS1_VLDCLR] =		0x90,
+	[PWRAP_WACS2_EN] =		0x94,
+	[PWRAP_INIT_DONE2] =		0x98,
+	[PWRAP_WACS2_CMD] =		0x9c,
+	[PWRAP_WACS2_RDATA] =		0xa0,
+	[PWRAP_WACS2_VLDCLR] =		0xa4,
+	[PWRAP_INT_EN] =		0xa8,
+	[PWRAP_INT_FLG_RAW] =		0xac,
+	[PWRAP_INT_FLG] =		0xb0,
+	[PWRAP_INT_CLR] =		0xb4,
+	[PWRAP_SIG_ADR] =		0xb8,
+	[PWRAP_SIG_MODE] =		0xbc,
+	[PWRAP_SIG_VALUE] =		0xc0,
+	[PWRAP_SIG_ERRVAL] =		0xc4,
+	[PWRAP_CRC_EN] =		0xc8,
+	[PWRAP_TIMER_EN] =		0xcc,
+	[PWRAP_TIMER_STA] =		0xd0,
+	[PWRAP_WDT_UNIT] =		0xd4,
+	[PWRAP_WDT_SRC_EN] =		0xd8,
+	[PWRAP_WDT_FLG] =		0xdc,
+	[PWRAP_DEBUG_INT_SEL] =		0xe0,
+	[PWRAP_DVFS_ADR0] =		0xe4,
+	[PWRAP_DVFS_WDATA0] =		0xe8,
+	[PWRAP_DVFS_ADR1] =		0xec,
+	[PWRAP_DVFS_WDATA1] =		0xf0,
+	[PWRAP_DVFS_ADR2] =		0xf4,
+	[PWRAP_DVFS_WDATA2] =		0xf8,
+	[PWRAP_DVFS_ADR3] =		0xfc,
+	[PWRAP_DVFS_WDATA3] =		0x100,
+	[PWRAP_DVFS_ADR4] =		0x104,
+	[PWRAP_DVFS_WDATA4] =		0x108,
+	[PWRAP_DVFS_ADR5] =		0x10c,
+	[PWRAP_DVFS_WDATA5] =		0x110,
+	[PWRAP_DVFS_ADR6] =		0x114,
+	[PWRAP_DVFS_WDATA6] =		0x118,
+	[PWRAP_DVFS_ADR7] =		0x11c,
+	[PWRAP_DVFS_WDATA7] =		0x120,
+	[PWRAP_CIPHER_KEY_SEL] =	0x124,
+	[PWRAP_CIPHER_IV_SEL] =		0x128,
+	[PWRAP_CIPHER_EN] =		0x12c,
+	[PWRAP_CIPHER_RDY] =		0x130,
+	[PWRAP_CIPHER_MODE] =		0x134,
+	[PWRAP_CIPHER_SWRST] =		0x138,
+	[PWRAP_DCM_EN] =		0x13c,
+	[PWRAP_DCM_DBC_PRD] =		0x140,
+	[PWRAP_ADC_CMD_ADDR] =		0x144,
+	[PWRAP_PWRAP_ADC_CMD] =		0x148,
+	[PWRAP_ADC_RDY_ADDR] =		0x14c,
+	[PWRAP_ADC_RDATA_ADDR1] =	0x150,
+	[PWRAP_ADC_RDATA_ADDR2] =	0x154,
+	[PWRAP_SW_RST] =		0x180,
+};
+
 static const int mt6765_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
@@ -1314,6 +1404,7 @@ enum pmic_type {
 
 enum pwrap_type {
 	PWRAP_MT2701,
+	PWRAP_MT6572,
 	PWRAP_MT6765,
 	PWRAP_MT6779,
 	PWRAP_MT6795,
@@ -1733,6 +1824,11 @@ static void pwrap_init_chip_select_ext(struct pmic_wrapper *wrp, u8 hext_write,
 static int pwrap_common_init_reg_clock(struct pmic_wrapper *wrp)
 {
 	switch (wrp->master->type) {
+	case PWRAP_MT6572:
+		pwrap_writel(wrp, 0x8, PWRAP_RDDMY);
+		pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_RDDMY_NO], 0x8);
+		pwrap_init_chip_select_ext(wrp, 5, 0, 0, 0);
+		break;
 	case PWRAP_MT6795:
 		if (wrp->slave->type == PMIC_MT6331) {
 			const u32 *dew_regs = wrp->slave->dew_regs;
@@ -1839,6 +1935,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 		pwrap_writel(wrp, 1, PWRAP_CIPHER_START);
 		break;
 	case PWRAP_MT2701:
+	case PWRAP_MT6572:
 	case PWRAP_MT6765:
 	case PWRAP_MT6779:
 	case PWRAP_MT6795:
@@ -2277,6 +2374,19 @@ static const struct pmic_wrapper_type pwrap_mt2701 = {
 	.init_soc_specific = pwrap_mt2701_init_soc_specific,
 };
 
+static const struct pmic_wrapper_type pwrap_mt6572 = {
+	.regs = mt6572_regs,
+	.type = PWRAP_MT6572,
+	.arb_en_all = 0x1ff,
+	.int_en_all = 0x7ffffffd,
+	.int1_en_all = 0,
+	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
+	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
+	.caps = PWRAP_CAP_RESET | PWRAP_CAP_DCM,
+	.init_reg_clock = pwrap_common_init_reg_clock,
+	.init_soc_specific = pwrap_mt2701_init_soc_specific,
+};
+
 static const struct pmic_wrapper_type pwrap_mt6765 = {
 	.regs = mt6765_regs,
 	.type = PWRAP_MT6765,
@@ -2446,6 +2556,7 @@ static const struct pmic_wrapper_type pwrap_mt8186 = {
 
 static const struct of_device_id of_pwrap_match_tbl[] = {
 	{ .compatible = "mediatek,mt2701-pwrap", .data = &pwrap_mt2701 },
+	{ .compatible = "mediatek,mt6572-pwrap", .data = &pwrap_mt6572 },
 	{ .compatible = "mediatek,mt6765-pwrap", .data = &pwrap_mt6765 },
 	{ .compatible = "mediatek,mt6779-pwrap", .data = &pwrap_mt6779 },
 	{ .compatible = "mediatek,mt6795-pwrap", .data = &pwrap_mt6795 },

-- 
2.54.0


