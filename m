Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339A4448D10
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115855; cv=none; b=F7mWGa1/us9EA2JfCr5I4FcBDd2PbeGhdxfX5GqqeLKoW+G+X2lDvreqaC50glKD5E7rzyIt5if7nJONe565zCiZi6yJsGeWpXo3dY4oz/h2E3Ka+obr2aANynEg8KKnVm1sgbcIjFQ8dpzrR15P1EwLZ37kB1SdmcT11kdlFBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115855; c=relaxed/simple;
	bh=FfDBIj0S/8C9L+ISh6gznoNbyDqTs3I8MyxJJq856q4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R6oMMl12re0NAMb6YpXoyvmdPU2Rdc3kOsO2FVKYgtMeQDst8XY27aHK4fPgqc041fM5KzjgDAhMxitLAkvLpGqnmPL5VyMW98o/pbkUhGRhVP5nMAKpWfIVMpXTgs0M+Xx64ESyS3NQik4sajTI0ozoZNVplWY6Db7zt09OhHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Aer92m7d; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Aer92m7d"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47d70879764so3615620f8f.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 04:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115850; x=1784720650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iy4onykfzqLZAXcH8RG3m0F3F0hQlrBfWap6/+klNeg=;
        b=Aer92m7dnv7QdsM7ToBCwaXPhZt3ff+q4tx3KOVOYbLfhiUxx0lco3hbXdVegYhJKK
         EG7oGaoQ6l9L2XJpw4Z8BLQXMy+JCEe4/DUN7BsV+pD5q2BbrWkSQ0HlLJ78lXIueiik
         th7mbi7HK/da1v+5oCEgbN7wYn5Unmw7FyxxXqYD4j1iPc13NdXllRpwx/gmZjsQ7aEa
         trY+/iCruE5lKuQ79bn2dey7mCEa0nroaCUYvfi916yXeAdFqw6/fTM4hutgi2VnUcBi
         nH9NQg2nExY+2/VJ1vrf2ZBwFtj7SFzR+VKrrnWGtF/gSdDDIHiZpr5HAtpY74QH4Xnn
         qVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115850; x=1784720650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iy4onykfzqLZAXcH8RG3m0F3F0hQlrBfWap6/+klNeg=;
        b=QJ6e8/R7umLjJeuIGhp1YZLsMolAgIgCaLyM2m06YRu+LroWG55BsP2jg693/9IDxt
         S8UEuTtBm+3QdgZVwr0wXFm/0wiiJ4sE0oikiofqVZdcGfx9Gw/mkmnnIWPGFNgEL/6S
         Ewe13ZJLwRxyQdL9r3ys+6DukvV++jk1HQhb+Gntx5ohalJzCdA7Z/iktQGgxfhyM13H
         WInU2/2yMpt28z8T3LyHCZtHwIE3Qb4yQc+DTzc8e9GZ48QaYUndq4Yk04O9DQlPKbLp
         Yr5iHNxqkBfGIUMyEVGgFRQcm4grcVFjkgPuf6P7zyYga+VCNBLRuTzpcVFD2aadfMnE
         CNBA==
X-Forwarded-Encrypted: i=1; AHgh+RpNQnAAFFlViwH4TPAOnFFKQ4wpgQ48iY7ydrXk2vXO9ib4pLm5UP9m8d27Hce2oI3t0k2wpv6SlCCr@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuo8wau4FfFdr8vqn4RWOqCgpd/vAHiBcg0ylLzM4/NTbZ/rXN
	vMh67jnwJiiVgAUoUEFMLJk2W/hnFKtsoVKVkaphgXP/f29e7eDeM8PnEvmobZ0dkkQ=
X-Gm-Gg: AfdE7ckVQZIGEpGFuA48o383Co/ZPV1lCsZkxPiacgBPY0WD/N+zNQIGvEjBaheEGw0
	XnPwXYwJX+9S+1kuBcP1cAGvsmE7SAW8vXZkE6b+VGgdjMR6aaPvLiqtR6XDVP4fqrPedKclVRP
	NSI5vg6u3AKOu1fjV4CXJl/ZQPHidEpMVPXAWBL5hqhBOeOr7TktKHJ4+3g7AM32MnpbEycOTwc
	5zo7pUX87V1ouF8x0T3gsxdgwxgsekiBQusy8P9DP9bEgWs/0IXdSEPGi+psYOE18sBezDGwdF+
	AZ1TlYMP40VmjJQCR5aS8aQNBAobPrCVhFZxbLnBbMeVV5qc9byS9Fk8AwFlJj6JMGQ2n+f3K52
	XV27dj8AZS7Hl8R6yLa75K7QYIRCVy5FUyjz5bKn6flPUb2cN7w4JNDUEk57AOcXRRC0k7nAtts
	Nafy4dJFtTBuQ8wIG9WJiAEjKiiDkZm+YPeaNi+ITCM869785t47XJ5DMJiuG625Wi
X-Received: by 2002:a05:6000:2586:b0:47f:48d4:3f0a with SMTP id ffacd0b85a97d-47f4fcef4d5mr2742756f8f.45.1784115850249;
        Wed, 15 Jul 2026 04:44:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:09 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:15 +0100
Subject: [PATCH v4 02/21] media: i2c: imx355: Add support for 24 MHz
 external clock
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-2-f7f966fb9ffd@raspberrypi.com>
References: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
In-Reply-To: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

From: David Heidelberg <david@ixit.cz>

The IMX355 sensor supports multiple external clock frequencies,
including 19.2 MHz and 24 MHz. The driver currently supports only
fixed 19.2 MHz input clock.

Refactor the clock handling to make the PLL configuration dependent
on the external clock frequency and add support for 24 MHz. Introduce
a table of clock parameter sets and program the corresponding EXTCLK
frequency and PLL multipliers to maintain consistent internal VCO
frequencies across supported inputs.

The PLL settings are adjusted so that OP VCO remains at 720 MHz

This preserves existing timing characteristics while allowing systems
using a 24 MHz clock to operate correctly.

No functional change for existing 19.2 MHz users.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 77 +++++++++++++++++++++++++++-------------------
 1 file changed, 45 insertions(+), 32 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index ac59908f57aa..a6ee7532018f 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -25,6 +25,10 @@
 #define IMX355_REG_CHIP_ID		0x0016
 #define IMX355_CHIP_ID			0x0355
 
+/* PLL registers that depend on the external clock frequency */
+#define IMX355_REG_EXTCLK_FREQ		0x0136
+#define IMX355_REG_PLL_OP_MUL		0x030e
+
 /* V_TIMING internal */
 #define IMX355_REG_FLL			0x0340
 #define IMX355_FLL_MAX			0xffff
@@ -63,7 +67,6 @@
 
 /* default link frequency and external clock */
 #define IMX355_LINK_FREQ_DEFAULT	360000000LL
-#define IMX355_EXT_CLK			19200000
 #define IMX355_LINK_FREQ_INDEX		0
 
 /* number of data lanes */
@@ -100,6 +103,29 @@ struct imx355_mode {
 	struct imx355_reg_list reg_list;
 };
 
+struct imx355_clk_params {
+	u32 ext_clk;
+	u16 extclk_freq; /* External clock (MHz) in 8.8 fixed point) */
+	u16 pll_op_mpy;	/* OP system PLL multiplier */
+};
+
+/*
+ * The clock tree is in single PLL mode, so PREDIV_VT and MPY_IVT do nothing.
+ * All modes use the same PLL setup for OP, with IOPCK being 720MHz.
+ */
+static const struct imx355_clk_params imx355_clk_params[] = {
+	{
+		.ext_clk = 19200000,
+		.extclk_freq = 0x1333,	/* 19.2 MHz */
+		.pll_op_mpy = 75,	/* 19.2 / 2 * 75  = 720 MHz */
+	},
+	{
+		.ext_clk = 24000000,
+		.extclk_freq = 0x1800,	/* 24.0 MHz */
+		.pll_op_mpy = 60,	/* 24.0 / 2 * 60  = 720 MHz */
+	},
+};
+
 struct imx355_hwcfg {
 	unsigned long link_freq_bitmap;
 };
@@ -125,6 +151,7 @@ struct imx355 {
 	const struct imx355_mode *cur_mode;
 
 	struct imx355_hwcfg *hwcfg;
+	const struct imx355_clk_params *clk_params;
 
 	/*
 	 * Mutex for serialized access:
@@ -144,8 +171,6 @@ static const struct regulator_bulk_data imx355_supplies[] = {
 };
 
 static const struct imx355_reg imx355_global_regs[] = {
-	{ 0x0136, 0x13 },
-	{ 0x0137, 0x33 },
 	{ 0x304e, 0x03 },
 	{ 0x4348, 0x16 },
 	{ 0x4350, 0x19 },
@@ -235,8 +260,6 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -284,8 +307,6 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -333,8 +354,6 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -382,8 +401,6 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -431,8 +448,6 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -480,8 +495,6 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -529,8 +542,6 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -578,8 +589,6 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -627,8 +636,6 @@ static const struct imx355_reg mode_1640x922_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -676,8 +683,6 @@ static const struct imx355_reg mode_1300x736_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -725,8 +730,6 @@ static const struct imx355_reg mode_1296x736_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -774,8 +777,6 @@ static const struct imx355_reg mode_1284x720_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -823,8 +824,6 @@ static const struct imx355_reg mode_1280x720_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
@@ -872,8 +871,6 @@ static const struct imx355_reg mode_820x616_regs[] = {
 	{ 0x0307, 0x78 },
 	{ 0x030b, 0x01 },
 	{ 0x030d, 0x02 },
-	{ 0x030e, 0x00 },
-	{ 0x030f, 0x4b },
 	{ 0x0310, 0x00 },
 	{ 0x0700, 0x02 },
 	{ 0x0701, 0x78 },
@@ -1422,6 +1419,16 @@ static int imx355_start_streaming(struct imx355 *imx355)
 		return ret;
 	}
 
+	/* Set PLL registers for the external clock frequency */
+	ret = imx355_write_reg(imx355, IMX355_REG_EXTCLK_FREQ, 2,
+			       imx355->clk_params->extclk_freq);
+	if (ret)
+		return ret;
+	ret = imx355_write_reg(imx355, IMX355_REG_PLL_OP_MUL, 2,
+			       imx355->clk_params->pll_op_mpy);
+	if (ret)
+		return ret;
+
 	/* set digital gain control to all color mode */
 	ret = imx355_write_reg(imx355, IMX355_REG_DPGA_USE_GLOBAL_GAIN, 1, 1);
 	if (ret)
@@ -1749,7 +1756,13 @@ static int imx355_probe(struct i2c_client *client)
 				     "failed to get clock\n");
 
 	freq = clk_get_rate(imx355->clk);
-	if (freq != IMX355_EXT_CLK)
+	for (unsigned int i = 0; i < ARRAY_SIZE(imx355_clk_params); i++) {
+		if (freq == imx355_clk_params[i].ext_clk) {
+			imx355->clk_params = &imx355_clk_params[i];
+			break;
+		}
+	}
+	if (!imx355->clk_params)
 		return dev_err_probe(imx355->dev, -EINVAL,
 				     "external clock %lu is not supported\n",
 				     freq);

-- 
2.34.1

