Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B15E4949E7
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522175; cv=none; b=h0D7iDX3tKu1THsD4zYFpP3fm591db0susWP+thhTnB6nlv/Au44sg5gEfT89Zy+5X/9+TzhWxqwzx7TKuQGpBdyYiUpKjOZ5Px6v6hToPcd3+ZExWAMB4QiMZOUBLdYJQw/LiBxkdfLoUzSxH8xmxtBBvdI56B5wgH76rC4qUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522175; c=relaxed/simple;
	bh=EC2k5Q0O6GiAWVyB1n2jyIk0jzm5yjtUjDUXeFdZxaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oTMIQABzzqijbuoXIKGqFsqcMPT4B3Lda62JhtsJNboOnrRLKcDrDyP7oNLsrDRynZ2VRJpzPKFewxxfPPhgjO6oCAcYg6+lEj7O3JzdtWUyTtTOmabLrOorT1+Ruuu93XNCMj0IjNRM9sIerKPie5aHtH+2MpCsw/5VPGM+T5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=r5+ZeL/u; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="r5+ZeL/u"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so6211865e9.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522164; x=1784126964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B9fBhGmPu1qXjzzF9oDlHeeaawJIqqZK7Ydx3tiH29k=;
        b=r5+ZeL/uXMdj5vOiklYk2Nndwq6U3ZIy+stMZePqQHLwvCNSJiRe+NK1VTZEZhOFeH
         D+Szf7Qjlb1cC5+A7N1CN1GhkxtFJiGellHlngOMJXTtss38tUp/7AuZRHuqshKMDGht
         TEccaxevviXd6Tdrm5P7NdBODrDmpvc9yKj66gV8oy49uWXC40AcWkc3UHA2Ymjk6liM
         2kJLl/GnAgCB1jO9Y96T/0TSoZ5DzilffFB9ukZV+NzMEAww1XGNyyzY/Zs7GJOmMitN
         TicX5ho9oTvtE3Cz/72jsCIvr8+kFVfbgNrV0y4y88umCQLrYdljC5MTzribb3CHCyrN
         WHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522164; x=1784126964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B9fBhGmPu1qXjzzF9oDlHeeaawJIqqZK7Ydx3tiH29k=;
        b=MRPDcQjQo76gj8wurDBzjL0BW2WN4U3fOP+DWc6o5bIFrhGhKq2yiSVzFsqsXPchAm
         cFrRWKAURW/AYHpxzkG9TgP555YkPqJ8bGPaUjKmIyfr9WG0IdBlkacTnBt2677YC2cw
         y5RjT01MIBq+9Jcat9Oridbvr5T+vbRdXkHtAbujSJuJagDQpUytKxNRbF2zIGK9Zpl0
         jsHDmLfo1lPZH6sHxKUukrvGAXML48i4AsyJEmC+Q0DgvoXUbjlZ0So6Exd8POSxG4kV
         SebjPxs6srq9/TsdNzXvbBHzN60e7MUM3TaxVBJU50G8qq5dGEBWPAsrYyNOuYONP3E8
         XFQQ==
X-Forwarded-Encrypted: i=1; AHgh+RrKRTY7EryOVLGEp705Fs41csxv5+x8+MurJemm77puvFCMrwx9yPDm6e/AlUVeLgQuOCW9+4BO9zGS@vger.kernel.org
X-Gm-Message-State: AOJu0YwHx/pr0UE2+SZIaduiojXfIEw550MZCXEyXsKxH7V4KgQGUE25
	m/UdUmlWSg0OKNsYQt9KZfTJqA+aY0QtyBAma7Xi0QSSnas+8EXgIPUFGuMm+dRRoFs=
X-Gm-Gg: AfdE7cmWmRbQbwpPLVOV94NolAPC/P+Gg3uCTwcqZXk9y5uUPgUvxnPPHjNUdfUQ+q8
	30hN99EPxXyD7t3wRkjjhEomXXXkWp5WZPNZliXHVTaNnFviyBKIyQVhfsVYdDaw/oziXCY1z2V
	zI8yzULO1o1suC0OSaalm29GjuH33ydfiLS9poC0D0IfMna9MYG5pCDJICmDTfX2v2OK1HjAD9y
	5yilWuQ23gYVdtpYxgeScVWX2/fUxGELbyVBAcXTtzUCJVvO48kqgI/SpKFyd/lPEg3m36SGRD3
	p50PLB2ufyKTU6zacRWCFo5++Ua+GAX08Y+8YSxY1xml7+EkE3HMaf8SP7VJ4S+AC8baXmqftTJ
	p2TarkCfHX3W9ksIplLnEIFoNr6yTQR72HSJpUz1BgcJTZWavY4ADpQldX1Q6lfE23r6OCKOIMa
	49xcFZDxdWstlV3eDZo3pWEsSCn5c3ClwoIXtt1cxSN/UvQVwI2FDDLvM46KnJICGkn0SZyTYm3
	Yo=
X-Received: by 2002:a05:600c:8a16:10b0:493:bef8:ba8 with SMTP id 5b1f17b1804b1-493e68fc32amr24755525e9.39.1783522163580;
        Wed, 08 Jul 2026 07:49:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:23 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:54 +0100
Subject: [PATCH v3 18/20] media: imx355: Support 2 lane readout
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-18-9df386a623d7@raspberrypi.com>
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
In-Reply-To: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
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

The sensor supports 2 or 4 lane readout, but the driver only allowed
for 4 lanes. Add 2 lane support.

The clock tree only supports single PLL mode to feed both IOP (MIPI)
and IVT (Pixel array).
2 lane mode supports a MIPI link frequency of up to 445MHz (890Mbit/s)
cf 360MHz (720Mbit/s) for 4lane. Update clock setup and pixel rates to
match.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 67 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 19 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index e45d60d665a1..2be665b5b453 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -27,11 +27,14 @@
 #define IMX355_REG_CHIP_ID		CCI_REG16(0x0016)
 #define IMX355_CHIP_ID			0x0355
 
+#define IMX355_REG_LANE_SEL		CCI_REG8(0x0114)
+
 /* PLL registers that depend on the external clock frequency */
 #define IMX355_REG_EXTCLK_FREQ		CCI_REG16(0x0136)
 #define IMX355_REG_PLL_OP_PREDIV	CCI_REG8(0x030d)
 #define IMX355_REG_PLL_OP_MUL		CCI_REG16(0x030e)
 #define IMX355_REG_PLL_IVT_PCK_DIV	CCI_REG8(0x0301)
+#define IMX355_REG_PLL_IVT_SYSCK_DIV	CCI_REG8(0x0303)
 #define IMX355_PLL_OP_PREDIV		2
 #define IMX355_PLL_IVT_PCK_DIV		5
 
@@ -80,6 +83,8 @@
 #define IMX355_TEST_PATTERN_GRAY_COLOR_BARS	3
 #define IMX355_TEST_PATTERN_PN9			4
 
+#define IMX355_REG_REQ_LINK_BIT_RATE	CCI_REG16(0x0820)
+
 #define IMX355_REG_BINNING_MODE		CCI_REG8(0x0900)
 #define IMX355_REG_BINNING_TYPE		CCI_REG8(0x0901)
 #define IMX355_REG_BINNING_WEIGHTING	CCI_REG8(0x0902)
@@ -87,9 +92,6 @@
 /* Flip Control */
 #define IMX355_REG_ORIENTATION		CCI_REG8(0x0101)
 
-/* number of data lanes */
-#define IMX355_DATA_LANES		4
-
 #define IMX355_PIXEL_ARRAY_TOP		0
 #define IMX355_PIXEL_ARRAY_LEFT		0
 #define IMX355_PIXEL_ARRAY_WIDTH	3280
@@ -120,30 +122,38 @@ struct imx355_mode {
 
 struct imx355_clk_params {
 	u32 ext_clk;
-	u16 extclk_freq; /* External clock (MHz) in 8.8 fixed point) */
-	u16 pll_op_mpy;	/* OP system PLL multiplier */
+	u16 extclk_freq;	/* External clock (MHz) in 8.8 fixed point) */
+	u16 pll_op_mpy[2];	/* OP system PLL multiplier */
+	u8 pll_op_prediv[2];	/* OP system pre PLL d */
 };
 
 /*
  * The clock tree is in single PLL mode, so PREDIV_VT and MPY_IVT do nothing.
- * All modes use the same PLL setup for OP, with IOPCK being 720MHz.
+ * In 4 lane mode the MIPI rate is 360Mhz (720Mbit/s) and pixel rate is
+ * 288MPix/s.
+ * In 2 lane mode the MIPI rate is 444MHz (888Mbit/s) and pixel rate
+ * 177.6MPix/s with a 24MHz clock, and 441.6MHz (883.2Mbit/s) and 176.6MPix/s
+ * with a 19.2MHz clock.
  */
 static const struct imx355_clk_params imx355_clk_params[] = {
 	{
 		.ext_clk = 19200000,
-		.extclk_freq = 0x1333,	/* 19.2 MHz */
-		.pll_op_mpy = 75,	/* 19.2 / 2 * 75  = 720 MHz */
+		.extclk_freq = 0x1333,
+		.pll_op_mpy = { 75, 92 },
+		.pll_op_prediv = { 2, 2 }
 	},
 	{
 		.ext_clk = 24000000,
-		.extclk_freq = 0x1800,	/* 24.0 MHz */
-		.pll_op_mpy = 60,	/* 24.0 / 2 * 60  = 720 MHz */
+		.extclk_freq = 0x1800,
+		.pll_op_mpy = { 60, 111 },
+		.pll_op_prediv = { 2, 3 }
 	},
 };
 
 struct imx355_hwcfg {
 	s64 link_freq_menu;
 	unsigned long link_freq_bitmap;
+	unsigned int num_lanes;
 };
 
 struct imx355 {
@@ -239,7 +249,6 @@ static const struct cci_reg_sequence imx355_global_regs[] = {
 	{ CCI_REG8(0x305a), 0x00 },
 	{ CCI_REG8(0x0112), 0x0a },
 	{ CCI_REG8(0x0113), 0x0a },
-	{ CCI_REG8(0x0114), 0x03 },
 	{ IMX355_REG_PLL_IVT_PCK_DIV, IMX355_PLL_IVT_PCK_DIV },
 	{ CCI_REG8(0x0303), 0x01 },
 	{ CCI_REG8(0x0305), 0x02 },
@@ -250,8 +259,6 @@ static const struct cci_reg_sequence imx355_global_regs[] = {
 	{ CCI_REG8(0x0310), 0x00 },
 	{ CCI_REG8(0x0220), 0x00 },
 	{ CCI_REG8(0x0222), 0x01 },
-	{ CCI_REG8(0x0820), 0x0b },
-	{ CCI_REG8(0x0821), 0x40 },
 	{ CCI_REG8(0x3088), 0x04 },
 	{ CCI_REG8(0x6813), 0x02 },
 	{ CCI_REG8(0x6835), 0x07 },
@@ -816,6 +823,7 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 		__v4l2_ctrl_modify_range(imx355->vblank, IMX355_VBLANK_MIN,
 					 height, 1, vblank_def);
 		__v4l2_ctrl_s_ctrl(imx355->vblank, vblank_def);
+
 		h_blank = mode->llp - imx355->cur_mode->width;
 		/*
 		 * Currently hblank is not changeable.
@@ -879,6 +887,8 @@ static int imx355_start_streaming(struct imx355 *imx355)
 {
 	const struct imx355_reg_list *reg_list;
 	const struct imx355_mode *mode;
+	int lane_idx = imx355->hwcfg->num_lanes == 4 ? 0 : 1;
+	u64 link_bitrate;
 	u8 binning_mode;
 	int ret = 0;
 
@@ -914,7 +924,21 @@ static int imx355_start_streaming(struct imx355 *imx355)
 	cci_write(imx355->regmap, IMX355_REG_EXTCLK_FREQ,
 		  imx355->clk_params->extclk_freq, &ret);
 	cci_write(imx355->regmap, IMX355_REG_PLL_OP_MUL,
-		  imx355->clk_params->pll_op_mpy, &ret);
+		  imx355->clk_params->pll_op_mpy[lane_idx], &ret);
+	cci_write(imx355->regmap, IMX355_REG_PLL_OP_PREDIV,
+		  imx355->clk_params->pll_op_prediv[lane_idx], &ret);
+	cci_write(imx355->regmap, IMX355_REG_PLL_IVT_SYSCK_DIV,
+		  lane_idx ? 2 : 1, &ret);
+
+	/* Set MIPI configuration */
+	cci_write(imx355->regmap, IMX355_REG_LANE_SEL,
+		  imx355->hwcfg->num_lanes - 1, &ret);
+
+	link_bitrate = imx355->link_freq->qmenu_int[imx355->link_freq->val] *
+		       imx355->hwcfg->num_lanes * 2;
+	do_div(link_bitrate, 1000000);
+	cci_write(imx355->regmap, IMX355_REG_REQ_LINK_BIT_RATE, link_bitrate,
+		  &ret);
 
 	/* set digital gain control to all color mode */
 	cci_write(imx355->regmap, IMX355_REG_DPGA_USE_GLOBAL_GAIN, 1, &ret);
@@ -1100,9 +1124,9 @@ static int imx355_init_controls(struct imx355 *imx355)
 		imx355->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	/* pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
-	pixel_rate = imx355->hwcfg->link_freq_menu * 2 * 4;
+	pixel_rate = imx355->hwcfg->link_freq_menu * 2 * imx355->hwcfg->num_lanes;
 	do_div(pixel_rate, 10);
-	/* By default, PIXEL_RATE is read only */
+
 	v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops, V4L2_CID_PIXEL_RATE,
 			  pixel_rate, pixel_rate, 1, pixel_rate);
 
@@ -1185,6 +1209,7 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct imx355 *imx355)
 	const struct imx355_clk_params *clk = imx355->clk_params;
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	int lane_idx;
 	int ret;
 
 	if (!fwnode)
@@ -1202,11 +1227,15 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct imx355 *imx355)
 	if (!cfg)
 		goto out_err;
 
-	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX355_DATA_LANES)
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 2 &&
+	    bus_cfg.bus.mipi_csi2.num_data_lanes != 4)
 		goto out_err;
 
-	cfg->link_freq_menu = (clk->ext_clk * clk->pll_op_mpy) /
-			      (IMX355_PLL_OP_PREDIV * 2);
+	cfg->num_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
+
+	lane_idx = cfg->num_lanes == 4 ? 0 : 1;
+	cfg->link_freq_menu = (clk->ext_clk * clk->pll_op_mpy[lane_idx]) /
+			      (clk->pll_op_prediv[lane_idx] * 2);
 	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
 				       &cfg->link_freq_menu, 1,

-- 
2.34.1

