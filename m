Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690484;
	b=Nw+yj11ZJT8nXCAW1fVd5Jnpk1/kSZJJK4daPNwLyPLurp8RTeXwFqnLbEDeHsrOpkKX
	 agkCRaZ7dMz5w1ONsGk1m5pJFXoWAP/3A9ABWPatvvro83Y+AFoL8td0UF1FndeElFXu8
	 UR8sov5BwiKri8PAV/ZaCibaEpj3ueHUiDI1radDu2UI/oDowxtEgqIiUsiYf1SVbJtwg
	 9VHlrU8IzTDs0prRHREVfoWkqjxQRJlI9h62cEr/vTXS+3cq3bzDjoMcGSrqpNRfBzcB0
	 WhkPEbmAMRBHdvGZh9CuWQ46gi/ggcz0VxNO1D5YUpH+hp3Iy55HHSPaN06DTrArxkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=feAclFqGqANXGk5ANej1oUGx0E55rEkA+ZUZcmvKBcM=;
	b=dUjxQcCL8mYP2SkX8VIVh/IItdwD82f+LwAWVHSQMGiHtkvPlv5rDrlY1Ji7IDZsbz0S
	 xetMB24vV+FLsv1jqmTB6TsWQ64iBVjc6FTu0kYDVQiBW8OZKXxc6FTDFyxI268yOgbA/
	 LnF9vek1usO0GfdaqkQMwKJRCiXPPpCQ7p6GmyXmdP/AwBZ4AW/U6ic/3OoO/E4vPfYIk
	 zBnJPrYZgZBOuXO5xuHIa0kZmK2QxSTVs39TaJ4ZnD+9l2pHFbRcyBPpIMaSTkPU8eFQ1
	 HNc3JTWZX9FtAZtabEJDNH+B2CjiTBhD3pyEZwR/0eJ40kWsHcHfuCZ5Ui35YRss2Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDBE606A337
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BDBE606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c45111bebso43077f8f.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690472; x=1793295272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feAclFqGqANXGk5ANej1oUGx0E55rEkA+ZUZcmvKBcM=;
        b=UqZWCCgwCvKJBT4smaaYFVnVgDXYyKVK0yELWyBgCt5mjL4oNyzmg9C23wwGPK6T/J
         7EGFzAYg8pGIhWFkxsRzAceI1axpuBEB5BQNA6fmndwBDZobPvyp9Tw+cgNHl2GIjk3u
         DhIlpr2rnQXU3ybxJKeptpXOyZBr4/thJZw41FuDjQO3TeO+MNaLGte5uOUY2qlzCdi5
         6UeFy26oyEUJb0pdBVsYN+9N5GYCzQZz/qh08jfWi4mG3P7xHP9FbhSV7BVlXkP9wqyx
         46cbvF/eW6Zjt3cIGS3cODi6v/RF/tWSYl5HlUH/s9JkNtdhuWNVN9ihwLH14FpJ8fZT
         gv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690472; x=1793295272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=feAclFqGqANXGk5ANej1oUGx0E55rEkA+ZUZcmvKBcM=;
        b=TYBqKY9PLT+vtLzHTFEZJNa0w3hRxId17Hx04ceiPDu/IVOHA/0aNHKn9vqyJYE4Zn
         bcungFjqqAmyBHy6k2UNEAhTry9LX9ovncsUlhx6VpgX6Rnx022l9pJVm45S85T5Xjaj
         tHv2P3wEe2+wL/Jdo/Mz//yULm0qumz2H6R5KP6z267L8wLeMkqXAE2lbR4PenqUo6m6
         j10CxVCzVzOeCZaYE4SGg2q3kW0cs0GCI0do+BooHH19mZDA9azJ1k0QImjQopuFngic
         tJnb92DQw660X2LCoAkWdJQlJECjtVOw+YKPM3KSn9fXO2kf6Sdk+BPvFqvM+IgZRVLk
         TGvg==
X-Forwarded-Encrypted: i=1; AKwUvBweWqhDRIdKu+IdEbnPZtQjKJsynA3xKB9R6BEFD2v0KbG3wkPtDKwZJHyV6nYRwIW2z2+e4V2bg7rR@vger.kernel.org
X-Gm-Message-State: AFq9FYKmS36NajzVRsyvIlAZ4iYo1uB0GQfui/BIu6GseQuZPUINr5c3
	xJ+c583kkeh2wEIrsYvQSNxE9HnSI4GC4bEa4dOtEEzokjIL+YEiylJ0oSNaW76PWRM=
X-Gm-Gg: AYBFou3CiTacJ8aWlKocBZy/C1aL9oxl2zS1FlO6awgU0VBwZobAiUpX7Z19JYTGok5
	600eJDuGmeZ8V9lkvXObNxWXZU6vfbGrkoBAzCYYFGKaWX5c3b6NP2qSHsnvhFxv+h0116WALrg
	kKiwLQNfzgH3x2Tc8LuRfge6HY9FEqz7bBERZY+tjyMDv9YeuH6u/sD22+geo7bM148TMEmpO+k
	QXMZ6FfQkI0lSblGQsLJfbfWEP9dQNWl2vFGyRrZqnw/0RlLWmgNM0m3tqfNbOQWVfjQ+aO8Onc
	VZD/iRvQuvjsc2xhECVlUgnNi0X0wgAbuSB/+hFXj5UMiqn2/TxuQMcyMV/TldzsPi3DKzK/Phv
	hAlzagSIoJlu4AcTthNcS7dj/x0gG1u8lSKC9wsbfOkz327nBshRZzdDfwtSePwXBQEfdolmkOP
	CgBhqx7632JF1Vcj1NoT6WVirxTSf2MrRq9wnX9cPqzoLd3YDx1vu60m4tc4p10Kqi/8L8e4vw8
	+/rI8rLueG1sQs8ckOoLYHwskQbhNL308QpBKpTLMu7N/25dzLHM+ik/uKEAYhk7N6t8aBnMZp0
	WlQW6LMOqxRRwCAucrZWNM2+eTKNf8V7MdpKVt0la4rFaW+8lzCI
X-Received: by 2002:a05:6000:4213:b0:488:8931:b1b2 with SMTP id ffacd0b85a97d-48e264bd584mr14628357f8f.28.1792690472691;
        Thu, 22 Oct 2026 10:34:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:31 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:33:58 +0100
Subject: [PATCH v6 05/18] media: sony-starvis2: Rework 2 lane support for
 higher link freqs
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
Message-Id: <20261022-media-starvis2-v6-5-374343f55fd3@raspberrypi.com>
References: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
In-Reply-To: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
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
index b54e1c68afa0..5dcd760c1a27 100644
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
@@ -632,7 +632,8 @@ struct starvis2_variant {
 	const struct cci_reg_sequence *common_regs;
 	unsigned int num_common_regs;
 	unsigned int vmax_default;
-	const u16 *hmax_min;
+	const u16 *hmax_min_link_freq;
+	u16 hmax_min_pixel_array;
 };
 
 static const struct starvis2_variant imx678_variant_def = {
@@ -658,7 +659,8 @@ static const struct starvis2_variant imx678_variant_def = {
 	.common_regs = imx678_common_regs,
 	.num_common_regs = ARRAY_SIZE(imx678_common_regs),
 	.vmax_default = 2250,
-	.hmax_min = imx678_min_hmax_4lane,
+	.hmax_min_link_freq = imx678_min_hmax_2lane,
+	.hmax_min_pixel_array = 550,
 };
 
 struct starvis2_model_info {
@@ -1207,11 +1209,8 @@ static const struct v4l2_subdev_internal_ops starvis2_internal_ops = {
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
@@ -1228,7 +1227,10 @@ static int starvis2_init_controls(struct starvis2 *starvis2)
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

