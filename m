Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79851466B47
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 17:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443994; cv=none; b=HJj+WmsYV7DlUCd2RV9ZdbN/MrwZYV/FBWEdpi8tUyqUdS4v2ROjxgzFJITmd9L/PVxmPb51X/L6xn4oCHwJ+HE+V0VdmpakXDovIBqKSfnWIzb09mUqGIQFOSl6/C+2Zm2/PVM9pdKoAMf5j4REKN1sy6V8yfVBmoogzLeviGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443994; c=relaxed/simple;
	bh=0fRd2Shb9iwK17T3SXWtZhl1o68cmssCDMlehkQYDLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SFJbUvJDkY/V8gH0y72NnSCIC9zeh9GeMlfqDgMCxOdn4n7Gkyylx0MF14ol2OTQF45lRv05S+ab/IjaJnBhZ2SAnD3otI/EXeWLKKTZ224hjM/TvvEXvg8IeFqyBd0yweSJ/hiD+jHT7IxL7HDPwIscJRHkgmx7R7Re8hNJNgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=SbK8NgUQ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="SbK8NgUQ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso4476438f8f.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443990; x=1784048790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HsL30bF6hI9j0WHskUYBcTkcyemOoQL59FDGPoj0ZcY=;
        b=SbK8NgUQ8RRL9q4Fqdzwl4F98oPTSboX4GcOSqmdlajxl/XyXKi49ytMZzcwkoRLcN
         eY34MbFcHLQBVnyNz0EufLfZk6TLlERYVPJIbs2Nx2awDQld7IY2xVbTNaQleES2qEMp
         9nV0nSklSC2C8Vt6qZXc2NAnsVKR4tS+57SQghUbzVCzFD84pqXP5Xjp3gJe5t53j/DY
         DMpoMLObyqYVYyw+nt3DV+d8PXTk7R9Tvl821Qtk7+HfVHH0ZcagHysckf9KTzGC/dcY
         ACvveV8dnshlUszYYTFOwETxkqPsAMprUGu0gK19oos3RzxSwZXfYWPEYlnZkrUEGSGt
         6twA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443990; x=1784048790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HsL30bF6hI9j0WHskUYBcTkcyemOoQL59FDGPoj0ZcY=;
        b=VnawXfgmwChxWwyWPCK+kzbD4pIdtF4P9U2jr63zpNS+1zhv6dHcupYyaRXxkN3uGE
         KNe2jaMlsYVdvn1G4XqI316T2Z2wBm8vZNU7hHfcaPtuV+d3gsK8PrxdrPS2JjaddnV8
         VELjLPzf3gmqXl5iUjd/BeouWxNBGZ/LXpiaXqBEkw4dO67oRvfxrwqH+90j6qJth3R+
         HTrtqMB7RqrhQ0M+LFbgXSFC4OvtUbTRsNwjnnP1J5BIbZthCJrJOlWCJigaWrGXsMPh
         jL1oklaqR6rose4NgDaKg84hBX+fpBupbYT0ng+eIrXmGj8+cutqBnkBS+Y4M8QCiydl
         Cj9g==
X-Forwarded-Encrypted: i=1; AHgh+Rpou9ONW6sY2CB5PTF7kR6TgmxRDVY4hUShYYEEC7jQwActnqML3Bi2I5bZ+QJfLrnR4WvDitPsM9nv@vger.kernel.org
X-Gm-Message-State: AOJu0YztO1YsZQ03WBy2e1wX9FIpJAH6woaBlrRoQ9Uh5HXF6PydKGeG
	+1lB5si6dHKriM6sbzTE6+W4iQYU3qnZpGw1+xgrm/LmKwiBcOU4Db7tANw1PqaZ330=
X-Gm-Gg: AfdE7clwlYVhZbeTBlg6d8GiV7T5DOdiopnrsFFV+eXdPy62rQRqNHTiS4wOFPZJKv0
	TDuyvDU72VKmLdWcGBLvuRu5pK1m9Z/urlwmJdZkhgx7lEUdF6YckEPvpYQA9DuJ0BL9pSwhUdG
	+9kxoSe5dy4NZKc9QrtA7Lvjl6x9eMSRF0gl0o4GcTx7xkgkG4EP/nyOzvT1b2vC696r3CbJChM
	dJ6nC+AX3q7dA/ANZvf9+9a+U39HwwJbnNY+5yXGHcpeZPpJ6VCBfUjrkUdz0lD0BtggGQAHsh5
	B7Zy0t5iJdQZ+kf9f1kyT8iFZAn+sqrf9NCV8cSN3IVARE4O48XScNXR4bmT4PX0C5xxc9Fiww2
	PQhfM2oLcI/7hkOIqfY/2nf5WiTzb6UCcBodGCXyINkEyJMEFY0s8DwYyvvAcbSAFugcCKfhjp8
	J40RPVbR4HVhfBlZW0o+T20Y4cxbPq1y5NJOf8cPVBKqtJ/GpqRy8775OlXf4OgCq4
X-Received: by 2002:a5d:588b:0:b0:475:f0c2:75ab with SMTP id ffacd0b85a97d-47de66fac40mr6651149f8f.60.1783443989711;
        Tue, 07 Jul 2026 10:06:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:29 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:49 +0100
Subject: [PATCH v2 17/20] media: imx355: Compute link frequency from PLL
 setup
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-17-1683ec07b897@raspberrypi.com>
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

In preparation for additional options in the PLL setup, compute
the link frequency rather than using a hardcoded value.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 41 ++++++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index cff87c6ea789..3586c4cd3fbe 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -29,7 +29,11 @@
 
 /* PLL registers that depend on the external clock frequency */
 #define IMX355_REG_EXTCLK_FREQ		CCI_REG16(0x0136)
+#define IMX355_REG_PLL_OP_PREDIV	CCI_REG8(0x030d)
 #define IMX355_REG_PLL_OP_MUL		CCI_REG16(0x030e)
+#define IMX355_REG_PLL_IVT_PCK_DIV	CCI_REG8(0x0301)
+#define IMX355_PLL_OP_PREDIV		2
+#define IMX355_PLL_IVT_PCK_DIV		5
 
 /* V_TIMING internal */
 #define IMX355_REG_FLL			CCI_REG16(0x0340)
@@ -83,9 +87,6 @@
 /* Flip Control */
 #define IMX355_REG_ORIENTATION		CCI_REG8(0x0101)
 
-/* default link frequency and external clock */
-#define IMX355_LINK_FREQ_DEFAULT	360000000LL
-
 /* number of data lanes */
 #define IMX355_DATA_LANES		4
 
@@ -141,6 +142,7 @@ static const struct imx355_clk_params imx355_clk_params[] = {
 };
 
 struct imx355_hwcfg {
+	s64 link_freq_menu;
 	unsigned long link_freq_bitmap;
 };
 
@@ -238,12 +240,12 @@ static const struct cci_reg_sequence imx355_global_regs[] = {
 	{ CCI_REG8(0x0112), 0x0a },
 	{ CCI_REG8(0x0113), 0x0a },
 	{ CCI_REG8(0x0114), 0x03 },
-	{ CCI_REG8(0x0301), 0x05 },
+	{ IMX355_REG_PLL_IVT_PCK_DIV, IMX355_PLL_IVT_PCK_DIV },
 	{ CCI_REG8(0x0303), 0x01 },
-	{ CCI_REG8(0x0305), 0x00 },
+	{ CCI_REG8(0x0305), 0x02 },
 	{ CCI_REG8(0x0306), 0x78 },
 	{ CCI_REG8(0x0307), 0x02 },
-	{ CCI_REG8(0x030d), 0x02 },
+	{ IMX355_REG_PLL_OP_PREDIV, IMX355_PLL_OP_PREDIV },
 	{ CCI_REG8(0x0310), 0x00 },
 	{ CCI_REG8(0x0220), 0x00 },
 	{ CCI_REG8(0x0222), 0x01 },
@@ -337,14 +339,6 @@ static const char * const imx355_test_pattern_menu[] = {
 	"Pseudorandom Sequence (PN9)",
 };
 
-/*
- * When adding more than the one below, make sure the disallowed ones will
- * actually be disabled in the LINK_FREQ control.
- */
-static const s64 link_freq_menu_items[] = {
-	IMX355_LINK_FREQ_DEFAULT,
-};
-
 /* Mode configs */
 static const struct imx355_mode supported_modes[] = {
 	{
@@ -1080,7 +1074,6 @@ static int imx355_init_controls(struct imx355 *imx355)
 	s64 hblank;
 	u64 pixel_rate;
 	const struct imx355_mode *mode;
-	u32 max;
 	int ret;
 
 	ctrl_hdlr = &imx355->ctrl_handler;
@@ -1089,15 +1082,14 @@ static int imx355_init_controls(struct imx355 *imx355)
 		return ret;
 
 	ctrl_hdlr->lock = &imx355->mutex;
-	max = ARRAY_SIZE(link_freq_menu_items) - 1;
 	imx355->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx355_ctrl_ops,
-						   V4L2_CID_LINK_FREQ, max, 0,
-						   link_freq_menu_items);
+						   V4L2_CID_LINK_FREQ, 0, 0,
+						   &imx355->hwcfg->link_freq_menu);
 	if (imx355->link_freq)
 		imx355->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	/* pixel_rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
-	pixel_rate = IMX355_LINK_FREQ_DEFAULT * 2 * 4;
+	pixel_rate = imx355->hwcfg->link_freq_menu * 2 * 4;
 	do_div(pixel_rate, 10);
 	/* By default, PIXEL_RATE is read only */
 	v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops, V4L2_CID_PIXEL_RATE,
@@ -1172,12 +1164,14 @@ static int imx355_init_controls(struct imx355 *imx355)
 	return ret;
 }
 
-static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
+static struct imx355_hwcfg *imx355_get_hwcfg(struct imx355 *imx355)
 {
+	struct device *dev = imx355->dev;
 	struct imx355_hwcfg *cfg;
 	struct v4l2_fwnode_endpoint bus_cfg = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY
 	};
+	const struct imx355_clk_params *clk = imx355->clk_params;
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
 	int ret;
@@ -1200,10 +1194,11 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
 	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX355_DATA_LANES)
 		goto out_err;
 
+	cfg->link_freq_menu = (clk->ext_clk * clk->pll_op_mpy) /
+			      (IMX355_PLL_OP_PREDIV * 2);
 	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
-				       link_freq_menu_items,
-				       ARRAY_SIZE(link_freq_menu_items),
+				       &cfg->link_freq_menu, 1,
 				       &cfg->link_freq_bitmap);
 	if (ret)
 		goto out_err;
@@ -1275,7 +1270,7 @@ static int imx355_probe(struct i2c_client *client)
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx355->sd, client, &imx355_subdev_ops);
 
-	imx355->hwcfg = imx355_get_hwcfg(imx355->dev);
+	imx355->hwcfg = imx355_get_hwcfg(imx355);
 	if (!imx355->hwcfg) {
 		dev_err(imx355->dev, "failed to get hwcfg");
 		ret = -ENODEV;

-- 
2.34.1

