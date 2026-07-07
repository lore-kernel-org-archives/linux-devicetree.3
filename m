Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CC847886A
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 17:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443995; cv=none; b=r7klWQVsKw7YMDJF9JJprRyu2HTMIXRFWC1K7LUHm3JFrwbbXhOey526dWCecIfCxiCUXsBEfezJjTIhuy/QUoSMEAen9vgIhuNcktZiNFJzhIv9d++9xlxOfP0xXrzm3UopvLmw0lEhxfs3Ym1xD3T+Bx7Y6GKmgXsQMwdWotM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443995; c=relaxed/simple;
	bh=GKxgAlQcENWoPnBSztmkpKtupSjBdjy8jxrnxeI69JU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=El4cFiPU5xmn+svpn0iJA7hQEnfBK4TqDIhW4fAjtB3VQHf6/pHGqqXmNBtBmI3OBuSRDIRdO3Kyl1nxdysCuz7xbV0BOZA33P1Ly4hNC17IZhyEeZKThKB/i+q5/GCghTErqAkZrhbfo9RldmW7o36AY2CVUP7zENtNHSMk62I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Q+H2t+De; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Q+H2t+De"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so2744495f8f.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443991; x=1784048791; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jO4NW6D4VKncK5S5NZ9klSmvH5Pn0jlwBF1rjTKsC28=;
        b=Q+H2t+DewcHydmM4KzRXBZ1w52Zyz89WBUbk/JAioXpbc/pENMshUC1cmGKg0lH3aK
         imBCD6FkDI6tcNL1GayxEpwrxnG8BnhjcKsb81JVMlOUv107f7AGsKUTypmhK2irJTJj
         bebnyuUOfVTt0iuwDXXXw/fgXF1bskehkyzlLwrfvh80f/tG4+zUGzvSKki+Cyjvn8az
         1+61EE+EOYtpQm+RyuySzkImek3mtrJIHISSAlhmxf2TFGw8C2dsHW7/5WXkyRjO3FpU
         BWP4EIKcVSlf7OaP2cJdQjB3N/GgJQPZJcy3Ecd9+R2ixUtjZfT+7ISx7M1MDYXXsfe1
         NdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443991; x=1784048791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jO4NW6D4VKncK5S5NZ9klSmvH5Pn0jlwBF1rjTKsC28=;
        b=IKYoAlgRDLPT+nmeB5ePbhUVn/iwek4PoCIw5paXJ2tXrl/saq1GzElqPNFEC1uA2s
         E51+BMOWcZPTqFsB7vYuvuy/0o/xacwFitlykWeAGTfQiepV/nJQCMG1m/mMBVGPNibP
         PWF+qQR6od44GC/cj+TT9SemLnRxRVhQ062208REesF0+aUXhZL/15yEgJ/y4jtroTt4
         OPG4aU1VBhlJ/s5JGtX6Vr8q1tET3rQQwWv0QnaJiREnH7j87WpmYk+3W3jL24kp4ZFb
         QfvEVlr/NYufuxOLHlUJ3EsTvqhHeuUqdE0iQ0u/pV+pq0Z6HplRgg/41TlYNk2Ykioj
         DIZA==
X-Forwarded-Encrypted: i=1; AHgh+Rq2Lg9J7N0Zwz2AViFGiH4C8iAN32mhEbYlvInQtSonzYILKFqk77SrqHzUM1qZNnuUw7c3wDlCbfQd@vger.kernel.org
X-Gm-Message-State: AOJu0YwyPN4p0K0WhsZaZgN83g03/cZFADuRr9QRHYvOqSkzU0dKiuxk
	cmg+kXWS0zoe8dJw47MulhDL8PEmL4nGtRqfo+RAZZpG+NA3JKg5ABOXt1eJyI9SzwA=
X-Gm-Gg: AfdE7ck5iyNgFImn3QCKQmcSnMCCWm5AVvfXjefMbNzz1DnjHr1VPGoP6sQd+0+1vof
	PQHwvBCJnk6D9zNNYkXup6fPNPEQ12fNQk95GSH4fbfc/AtQDr7mmv+a++qRpVHA1FBfcmbdIC7
	07Wd9bz3uHlw6rLZ2RMOOJhdd9mUuwnqHQRZDdeuYL3omQTqkJtctufvp6L3fG6vjRjtFdRwIeL
	0hc41BFqW1BZkZzT3Ydeiv6RQrdnkExisWjs1oYrKm03Ew68NbwlJSZoz4Aqq5+7+/HyR9nsAa/
	T/G5Hgd8rd+RDKV2oucWSSUssrR7LOCPHbcaynbXUbeUT4VS0asapZt5LHXJ+yTtk7c4yHP+FTL
	BLmjAz0IKK6EdH2HzcqgK1njrImSuwTBgq9wXfdKaHeXfmZv03wMdrYBIdhSE/W1kbBnv1rdq+6
	wfAwMt0YWdJMeFNLqwsV06MZSPbQe88Bq7ujVBpy6oHTwMSeq5K8qk9KCaMLoeXXT/
X-Received: by 2002:a5d:530c:0:b0:472:79bc:3919 with SMTP id ffacd0b85a97d-47de66d70c9mr5540828f8f.39.1783443990567;
        Tue, 07 Jul 2026 10:06:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:30 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:50 +0100
Subject: [PATCH v2 18/20] media: imx355: Support 2 lane readout
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-18-1683ec07b897@raspberrypi.com>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
In-Reply-To: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
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
index 3586c4cd3fbe..10b9cf56e8c5 100644
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
@@ -249,8 +258,6 @@ static const struct cci_reg_sequence imx355_global_regs[] = {
 	{ CCI_REG8(0x0310), 0x00 },
 	{ CCI_REG8(0x0220), 0x00 },
 	{ CCI_REG8(0x0222), 0x01 },
-	{ CCI_REG8(0x0820), 0x0b },
-	{ CCI_REG8(0x0821), 0x40 },
 	{ CCI_REG8(0x3088), 0x04 },
 	{ CCI_REG8(0x6813), 0x02 },
 	{ CCI_REG8(0x6835), 0x07 },
@@ -805,6 +812,7 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 		__v4l2_ctrl_modify_range(imx355->vblank, IMX355_VBLANK_MIN,
 					 height, 1, vblank_def);
 		__v4l2_ctrl_s_ctrl(imx355->vblank, vblank_def);
+
 		h_blank = mode->llp - imx355->cur_mode->width;
 		/*
 		 * Currently hblank is not changeable.
@@ -868,6 +876,8 @@ static int imx355_start_streaming(struct imx355 *imx355)
 {
 	const struct imx355_reg_list *reg_list;
 	const struct imx355_mode *mode;
+	int lane_idx = imx355->hwcfg->num_lanes == 4 ? 0 : 1;
+	u64 link_bitrate;
 	u8 binning_mode;
 	int ret = 0;
 
@@ -903,7 +913,21 @@ static int imx355_start_streaming(struct imx355 *imx355)
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
@@ -1089,9 +1113,9 @@ static int imx355_init_controls(struct imx355 *imx355)
 		imx355->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	/* pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
-	pixel_rate = imx355->hwcfg->link_freq_menu * 2 * 4;
+	pixel_rate = imx355->hwcfg->link_freq_menu * 2 * imx355->hwcfg->num_lanes;
 	do_div(pixel_rate, 10);
-	/* By default, PIXEL_RATE is read only */
+
 	v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops, V4L2_CID_PIXEL_RATE,
 			  pixel_rate, pixel_rate, 1, pixel_rate);
 
@@ -1174,6 +1198,7 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct imx355 *imx355)
 	const struct imx355_clk_params *clk = imx355->clk_params;
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	int lane_idx;
 	int ret;
 
 	if (!fwnode)
@@ -1191,11 +1216,15 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct imx355 *imx355)
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

