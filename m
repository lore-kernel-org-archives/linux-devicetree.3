Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388B8526ABE
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 15:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904670; cv=none; b=MXcYVH2UWOLNk4FHKvUii4I0xvYQCZA/slO2WzNT7hfVRNlGaGMxE+Q9WUA+mxU3CJ9mIjksbTjcNcOLcMWRLmNs2jHMAT0hBLdTo5kyhjiU8M/bgmZvY8Le2Ket0F0ezbcZ6U3RRZNbc5RkU5ZfqKiSlZxJ5TPCqidWshNwMfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904670; c=relaxed/simple;
	bh=ITBx4rYenor8V3bCi69HrLntm9Z1RYopRRSMyj9+/Is=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Amb8t/Yw68jbz2H6G/FtQunMxfZKOvPPgOLxo8LnLz/sO68S7rTpqCjFEVujyX7buvLJCFSGYfNZ7E8FFL8HYCfEuhQTT3FL/v4Pb9v2SEAJzjP54royuI/+FeC3gKZNxJ32s6t7YFkSkq4TeP4D9OjIYDPlr07w15Pato/P/Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=gXr3COGS; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="gXr3COGS"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso22601675e9.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 08:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791904665; x=1792509465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1J5fefXkYhWAaHQTn5c4Nz8sqR+9ImdFpBU6lFkTI4=;
        b=gXr3COGS2Koqo4DXB/twDYFV6TJR2QRessWlBAZdms9V3id9CiLKUM4fp9fdnBe5c+
         35FjcBdbZJIjVuZW22F18BjHghLN/Wel5yb5UEqDUy4Oc/DgIvDuIxy57+uM1l0VXpj6
         n+RefCqfSOVnrmJp00fZsnOkggBY9JkVeDslq8H0N+9kqV8bmCX3lPdvM0bZ86qhGMZ/
         0NGNqsr4FyDpijqMeCnmGBV0YYRw6Kev5Y87aMhfkJrOVN25/zeneGQVq/lAXEJW2Zwk
         2WsgOyeP9Z2K19eRdeNweVqfcegMr9uhZ1XVFIrv5ohG5EFsPt1jgKGRy7ItvQFzfcno
         BSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904665; x=1792509465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/1J5fefXkYhWAaHQTn5c4Nz8sqR+9ImdFpBU6lFkTI4=;
        b=SDfiSQZWTtarzuucUHVnJmBDEm6zTH9YN5X2x+m8THw1niEQJe+kn0IR34nwkzNa98
         B8M5Fpv2HZmmbcpxY50Y8wc4bVwx4GdEwL5u5lgxUVIu25X65FqdAnBdHxJcggseHeNP
         IiEUp0U+uKP4pEVe/0bXuinvFrVdiX2pVH86HrhljgEj4D1ZdGqWwaRi9BVnVook+1sh
         qLCz5z/QOsKtJ2KiGPJyP3aHFJlKEf+3gNxmfPHRHRwXTJB8yu5kfEV2mwWODJaxtRpZ
         BO+TFBC9BMCFS0mewUAdg38zPF2JDWaL2S4HAa26MEgDhUw4bB28b+VgndUu4jL0KjKd
         24nA==
X-Forwarded-Encrypted: i=1; AKwUvBxTTBTsurhL//wJxGySOiMYSMl5KgqYaBNMurfcTp9jiNYD+H+mPAyR+q3ZTGEYalBsz9Brqk+wIrV9@vger.kernel.org
X-Gm-Message-State: AFq9FYLtMkJTR5g04VEMpc7I2T8ElrRoKGeXLfQkB7/atn3Q/z3jeQ4q
	XJ0hMBPpjAGLmW4jGa8+ejdAvmJIPvxfedKX4XS1ebMkHPTTK4cVinsQagf250Sm4q0=
X-Gm-Gg: AYBFou0w/mXSSo8+8qBekLWA61gm7UPkc2YdD4fH9Wu6fJ7H6sq48fVKvuhjtLnTHCC
	TvbAfSCYocuNKHXz9Xl5l8p2r+iJGMpeDwLdB8oW6MDcpDTNF3LArBvq9oktrix4naFkiuLtlCn
	4g0yjXoE9AAs2XOIaPcs0n16ERgN6fYud6ZNuemWHSgtLvZUDG3w8StQ7HaNVN9shdLlpj66jzn
	fRuMoNn2nrntm8i1FL56vYo0SSF2B23BKZczdErzKieH2r2PDcNduQlilohnN5pCAIAQhlNv1o8
	73KPNnbNjVI59e0ldrf5FlpzhhBke/zIHAUvwtdCDlDiNE6JJcUW58iX9oEAXvGSXITLRFoXlXK
	cG2lH1Ps7+gUP7mvWpLjVrHSNFB1GISYfSHCMNLA9hv06v+4HEoos9agEVS+3rbUAJgF18DkCk7
	Pg1yHRY6XAX5rpU5SVDxMzJNE05Vh8BOjUHCb610ZKp0Ur5raI+WZBk+Td0lfsOKYXJc+f7JKmA
	+vsmBIt6IHsdOwJxf5T72d4DEBD/lnHAYdmsqfvKVCfgQiuLA==
X-Received: by 2002:a05:600c:8105:b0:4a1:775b:5eb2 with SMTP id 5b1f17b1804b1-4a18e48362emr250494715e9.13.1791904665309;
        Tue, 13 Oct 2026 08:17:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaabb8sm6529743f8f.15.2026.10.13.08.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:17:44 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 13 Oct 2026 16:17:04 +0100
Subject: [PATCH v2 05/13] media: sony-starvis2: Rework 2 lane support for
 higher link freqs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-media-starvis2-v2-5-3670722d250a@raspberrypi.com>
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
In-Reply-To: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

With some Starvis 2 sensors, the link frequency on 2 lanes is sufficient
to achieve a lower line time than the 4 lane value divided by 2, as
the 4 lane value hits the minimum that the pixel array can handle.
That can't easily be handled with the way the values are currently stored.

Storing the 2 lane hmax alongside the pixel array's minimum allows the
4 lane support to divide the value by 2, and then clip to the pixel
array value as a minimum.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index f62a957ff1a8..66c77c5957e3 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -176,15 +176,15 @@ static const u64 link_freqs[] = {
 	[STARVIS2_LINK_FREQ_1188MHZ] = 1188000000,
 };
 
-static const u16 imx678_min_hmax_4lane[] = {
-	[STARVIS2_LINK_FREQ_297MHZ] = 1584,
-	[STARVIS2_LINK_FREQ_360MHZ] = 1320,
-	[STARVIS2_LINK_FREQ_445MHZ] = 1100,
-	[STARVIS2_LINK_FREQ_594MHZ] =  792,
-	[STARVIS2_LINK_FREQ_720MHZ] =  660,
-	[STARVIS2_LINK_FREQ_891MHZ] =  550,
-	[STARVIS2_LINK_FREQ_1039MHZ] = 550,
-	[STARVIS2_LINK_FREQ_1188MHZ] = 550,
+static const u16 imx678_min_hmax_2lane[] = {
+	[STARVIS2_LINK_FREQ_297MHZ]  = 3168,
+	[STARVIS2_LINK_FREQ_360MHZ]  = 2640,
+	[STARVIS2_LINK_FREQ_445MHZ]  = 2200,
+	[STARVIS2_LINK_FREQ_594MHZ]  = 1584,
+	[STARVIS2_LINK_FREQ_720MHZ]  = 1320,
+	[STARVIS2_LINK_FREQ_891MHZ]  = 1100,
+	[STARVIS2_LINK_FREQ_1039MHZ] = 1100,
+	[STARVIS2_LINK_FREQ_1188MHZ] = 1100,
 };
 
 struct starvis2_inck_cfg {
@@ -631,7 +631,8 @@ struct starvis2_variant {
 	const struct cci_reg_sequence *common_regs;
 	unsigned int num_common_regs;
 	unsigned int vmax_default;
-	const u16 *hmax_min;
+	const u16 *hmax_min_link_freq;
+	u16 hmax_min_pixel_array;
 };
 
 const struct starvis2_variant imx678_variant_def = {
@@ -656,7 +657,8 @@ const struct starvis2_variant imx678_variant_def = {
 	.common_regs = imx678_common_regs,
 	.num_common_regs = ARRAY_SIZE(imx678_common_regs),
 	.vmax_default = 2250,
-	.hmax_min = imx678_min_hmax_4lane,
+	.hmax_min_link_freq = imx678_min_hmax_2lane,
+	.hmax_min_pixel_array = 550,
 };
 
 struct starvis2_model_info {
@@ -1189,11 +1191,8 @@ static const struct v4l2_subdev_internal_ops starvis2_internal_ops = {
 static int starvis2_init_controls(struct starvis2 *starvis2)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr;
-	const u32 hmax_4lane =
-		starvis2->variant->hmax_min[__fls(starvis2->link_freq_bitmap)];
-	const u32 lane_scale =
-			starvis2->lane_mode == STARVIS2_LANEMODE_2L ? 2 : 1;
 	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
+	const struct starvis2_variant *variant = starvis2->variant;
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl *link_freq;
 	s32 hblank, max_hblank, vblank, max_vblank;
@@ -1210,7 +1209,10 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
 		return ret;
 
 	starvis2->vmax = starvis2->variant->vmax_default;
-	hmax = hmax_4lane * lane_scale;
+
+	hmax = variant->hmax_min_link_freq[__fls(starvis2->link_freq_bitmap)];
+	if (starvis2->lane_mode == STARVIS2_LANEMODE_4L)
+		hmax = max(hmax >> 1, variant->hmax_min_pixel_array);
 
 	/* PIXEL_RATE is fixed and read-only */
 	v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_PIXEL_RATE,

-- 
2.34.1

