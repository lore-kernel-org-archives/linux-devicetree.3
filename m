Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0806347CC85
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522175; cv=none; b=P+z1yC38tkJo4Qli9vbEBdhsnwCO77sN5s2qhpx2LCCzPiMOEQXPV1VmEEgDx7TJL23byEErMOCFPtBCoIORZiSc/jtKmsALXoUGty9TRkaOPI456T5pXB+AG+g+0sX/p47shUe93yqO3lwLC69C2v8ZaSqm0/+us4J4I3M2iGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522175; c=relaxed/simple;
	bh=xUTMOWk5+CT994jr6gP3kud/mZi2SFkhl+KumJEc/R0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dr2WGXB2YgEBTzx+8+DH+f6tXHRh2qIVKIcf9U6i6ESKuuqlxsMB3b0HvQCG9IN5f2ez+uHWvMBPWpcgtKpGEW5nndD7/nniEtE/mMuRg3nIcd4KuCQ2wc41lr9YCnzgXBF3lpBRwudA9ZkG1eceX4IFQRj0Wwgkv3IYkfK1IFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Trmf1Cql; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Trmf1Cql"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493e497643fso4226015e9.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522163; x=1784126963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+RDtHzsl2KamU1JjxV3tuy+ogtFxRgmslfEKzaLXknw=;
        b=Trmf1CqlJ5VYl+Z+eiBpe5HnWwJnkkqPcrm5SZxNWKFIq9nyc3yc+hH+geEQuXe2XE
         ZZ00FPkC0YipD2EyhljZ9dQkM/tgKprNMOr31ZhgQ8TxyxdvBuJFrMihL6HTJ3+iWtQt
         u4OWN2LGzHuNtAptjN7kXg4iTBq3if5sU8syD1vwaMD63/579MPHTzt1+rGA6BXIm9bX
         oaa39TUDtC2txQ0uPnFRt5n1dTjjC3XQmeiFiUOYuXxWsKcW7vJHirJJWh2WvqGR0F8c
         cU9ClBLxZWp6Vw8tuSXmUzbmv0ra9PLcmkyh+LRYSMH0xSiU0h81K6F6y8uR3WNQUn4g
         4hPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522163; x=1784126963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+RDtHzsl2KamU1JjxV3tuy+ogtFxRgmslfEKzaLXknw=;
        b=YCcPIkBdXUrNSzfg8QHCzkz3mvo2xw8S5vMwsgmW0HWBmpfIve/NJe6D/msHpR2o/w
         dvctOl/wntQ2H8bVZWoWoyzz2wGelQzqcvnUWTF5vzpOtmqjn0Zr/l+dEcRxxC6AEcR6
         NdLyXqqsffYmx4H22BDyVFe2WmA0DmR+um0QKWDhB5pyuj8yxrcV+nJXFkag5zwKmLvU
         jOPGT7QkLu0kOl2C+Fmm1xEo3rTnZbNIu4/Rrj3WTTVLtUqHyXdOtcvAxSW5MwVaii7S
         7T0nZplzNH+Pt3Os9eLFft0PBktW/SpTJWgSbzUd9OYfi5OqskrgI7+6wZ0kfE2ThUod
         r1oQ==
X-Forwarded-Encrypted: i=1; AHgh+RoHZatgIjT85gJiax8UzNO74H9UK73tKulrEQoP8iqnvNnjtMexearIsOPESGwlCgWtlzK1bMdljOBz@vger.kernel.org
X-Gm-Message-State: AOJu0YybX/PL7kvCCur3ZcetTCS6H3tTVlsCaIMbObCM9Z3kCfGhtCyw
	Tnn5PPYaOOsUJ+2cgH20zHBwDoosBnbqbiP7CvcxVBaj8c5N8+YMoho1a1GmSmLDGVg=
X-Gm-Gg: AfdE7cn5gvg9JZp4P+Ji65mrySn5ZwaQsT77N89mERvXwGGHePcfG33mUXAAn36O05Y
	aw6udw46mRFVOkI4Ofw++2u12CcOx8BurjdtBdz4CxlOEdGuZmalGW/q7BFUnFp0/L5GPL/NCii
	5IsdQoiJtMw1HTtZsgvhFECXpLmK1x7GjDWJbiUa6MHc6UKUIoQqCzfF5NaLTsS7r1tHq+uXdRW
	HteijrQCL2DfSWJligMFSPTayfE1aEyYIlWzjD920DgRo28rpnvMa25iPoPvdejdxOBkpyPiloV
	Wqu6lUv8TkX3HSzrpYpJ3BvROngSRf8vGRbVaUoYFzI2j30o0WtB51xBGJ5thKOS6xENVLdCiSr
	AoC6QOiabkNmgcwiE535aq1pit3BJ7civACAAtPHWG6Wpc+g82bEdpLMEOmDPAcoLvCHi4I/WRP
	zzLsce91mPkxyyoj5o7sqB1wfUZL0dks8JWS1R+IM05mkSA0KMTtUWR7dwLmrpMrlFqg3ls51oR
	DA=
X-Received: by 2002:a05:600c:4709:b0:490:b7e6:bd1d with SMTP id 5b1f17b1804b1-493e689c16dmr28929185e9.16.1783522162862;
        Wed, 08 Jul 2026 07:49:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:22 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:53 +0100
Subject: [PATCH v3 17/20] media: imx355: Compute link frequency from PLL
 setup
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-17-9df386a623d7@raspberrypi.com>
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

In preparation for additional options in the PLL setup, compute
the link frequency rather than using a hardcoded value.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 6a779d700a4b..e45d60d665a1 100644
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
 
@@ -238,13 +240,13 @@ static const struct cci_reg_sequence imx355_global_regs[] = {
 	{ CCI_REG8(0x0112), 0x0a },
 	{ CCI_REG8(0x0113), 0x0a },
 	{ CCI_REG8(0x0114), 0x03 },
-	{ CCI_REG8(0x0301), 0x05 },
+	{ IMX355_REG_PLL_IVT_PCK_DIV, IMX355_PLL_IVT_PCK_DIV },
 	{ CCI_REG8(0x0303), 0x01 },
 	{ CCI_REG8(0x0305), 0x02 },
 	{ CCI_REG8(0x0306), 0x00 },
 	{ CCI_REG8(0x0307), 0x78 },
 	{ CCI_REG8(0x030b), 0x01 },
-	{ CCI_REG8(0x030d), 0x02 },
+	{ IMX355_REG_PLL_OP_PREDIV, IMX355_PLL_OP_PREDIV },
 	{ CCI_REG8(0x0310), 0x00 },
 	{ CCI_REG8(0x0220), 0x00 },
 	{ CCI_REG8(0x0222), 0x01 },
@@ -338,14 +340,6 @@ static const char * const imx355_test_pattern_menu[] = {
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
@@ -1091,7 +1085,6 @@ static int imx355_init_controls(struct imx355 *imx355)
 	s64 hblank;
 	u64 pixel_rate;
 	const struct imx355_mode *mode;
-	u32 max;
 	int ret;
 
 	ctrl_hdlr = &imx355->ctrl_handler;
@@ -1100,15 +1093,14 @@ static int imx355_init_controls(struct imx355 *imx355)
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
@@ -1183,12 +1175,14 @@ static int imx355_init_controls(struct imx355 *imx355)
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
@@ -1211,10 +1205,11 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
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
@@ -1285,7 +1280,7 @@ static int imx355_probe(struct i2c_client *client)
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx355->sd, client, &imx355_subdev_ops);
 
-	imx355->hwcfg = imx355_get_hwcfg(imx355->dev);
+	imx355->hwcfg = imx355_get_hwcfg(imx355);
 	if (!imx355->hwcfg) {
 		dev_err(imx355->dev, "failed to get hwcfg");
 		ret = -ENODEV;

-- 
2.34.1

