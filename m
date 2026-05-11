Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391BB3D9DD3
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496202; cv=none; b=Ev/JoZ4CNyQF+1Fdh1am4sKfl8cO4lxMsmOJ2H3/0B7xN4cMhxZ6pA3YG7gu4Zx490EyqFqYefolD/0pzscM6dCn/mvdpKIAnFaQ39tr5NMgKhz7QskYTU2G1p8CP86ZDpbhOMGE88HhoVQOeV+oDdbBYocz5Jirwr1ZGHiaMCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496202; c=relaxed/simple;
	bh=Arh65FwgpuoQyK0HMQPAmmIpzCVfFvZU3gN/HmExq5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FpDhwulw4otB8IPnNm0nSAFl0ZszuxW6jkrAoJiZyI8D1GJrwX52qzwhLPyWuFDYLXy68BlhFtPMBlRjMZ0q9bXHaHjB6wVRuRks3Us9zj342sxydmTNTdvR7FW02qK46LFGEe41ktmznRrM9WX7Q5140CIbD2Xk7BiCKaU0dYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTribr/m; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTribr/m"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3667cf0136fso2336036a91.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 03:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496200; x=1779101000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRXDOC53itDbvSH3E3HyxAV1yZ2/7SesuEGqqAx3Huo=;
        b=GTribr/mh2Ti4TE9bjSPs5RsdDpXreue5rGGMRR1P1ZMU1ZFvxd/TC5rileFOBOlUZ
         kggNLzORFR0NgyhBWFZiVH+XHO79bZHPLpvNiYi59gC6jWng6hMYw/mHEWj6t1wMPTGX
         PROPxdSpGnqTBBgPtqWNMOgR3FKdsJG8NeqamqsI+5txPgvNxVypDQ2Y50gi9Q68qY2q
         HhZ4tkEbo6oIFsdwkE/F5Mbj62NNsl0Q6vn3NLaYxb+cBe68GTLtN9D8gg4AmXyS2vvi
         QxufEjeT7ljXeHv97ITsh+EP7yLbVdHoKcpWEOWbriPauJQos3tPyAYwQeKDl51YlDBw
         V62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496200; x=1779101000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DRXDOC53itDbvSH3E3HyxAV1yZ2/7SesuEGqqAx3Huo=;
        b=ZPtOTjwJLgIVP+KtIixis4fMXsJJcd64uWaiXXewcRQ7lzm6G3no3Wda+pRGFsZRVy
         oKNEdQXbVziayq7/L7cX1eWWnuaK/guO8rcstG+Gvh8hd+brQ/BKCkkQLJelu5MFSAbq
         rxA+bcbLpP96CBivG5lofZSUI40cBfraRU5/EG2eWXs0+ulk7rwqrnbxPAJCtQldS08a
         lnW7z5vGrwEiUUqOmn39lJ6Aa56qZckQoEjLr2CRcCexYMXopC95FcxSxXLW7lwT+4pc
         3ushVDni2CAfa/LjJZeAlY5D6PwtQprbxaP9c1aACP5NCt4p3aaOK+RF7Ya5JEZDvHb8
         ph2g==
X-Gm-Message-State: AOJu0YwYZ9O45KFT5ZjhI5aGw8qRYADKpxQ4XBnfyIy4JZVNUBt+GnJJ
	c8yiIBFP945UjTOgiL14iy273jSUmECxVGCpzrEuDdjp46yTXY9EMIxO
X-Gm-Gg: Acq92OH8t+j51q2gvPa9tfyFLXiPv52kxZg3xa5vI0zujUIjpaixfPeGF1oh2N/z0Ys
	3h/KMsUhZeHkIQZRNjqfl3qNsTJj6vks45+XragkASitnJbfOiVFBn++9VCrHvj6L5HoSDK6S3Y
	XNjRQaiwTtGWiUIXLds/Iy3tPawph6uJO7p83gxk9PEKTJstlUA9gSd3sp+swCKjYt9YGDwvqw3
	h8yLrbXXY+KU17dysNVSsmkEL7QPKJdE2giRR76Ky7y7/X5Fi2zBQ+aeHk/rOPGgMDLojDURRWw
	urln7d2FtSUPMc9+MdE0RWk6E1jZ+shanPylG3mQztqMEWKmlbSp1hiDJPo9MTwwxZqUQXMjFxQ
	hdAiPYZA+DYOmmXFMccnhDsnlXGVSWw3izwHf5ZTAvEpjb4l72lT0z5nnXrnR63Rmnnkp98JdyR
	M8b0K4CpvT/xjsW1o7XL6Kgf3BISeB
X-Received: by 2002:a17:90b:3903:b0:367:f9f1:af78 with SMTP id 98e67ed59e1d1-367f9f1b66amr8598826a91.7.1778496200549;
        Mon, 11 May 2026 03:43:20 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d684009esm7533423a91.11.2026.05.11.03.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:43:20 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v4 3/5] media: hi846: fix modes handling for different lane cases
Date: Mon, 11 May 2026 18:39:25 +0800
Message-ID: <20260511103927.279550-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511103927.279550-1-mitltlatltl@gmail.com>
References: <20260511103927.279550-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using 4-lane, v4l2_find_nearest_size may return an unsupported
mode, 640x480 mode, and it is set to the default mode.

To fix it, specifying the supported modes for different lane cases,
once the lane count is determined.

Reported-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Closes: https://lore.kernel.org/linux-media/OmTXoHZJTSGePymL9I-1Cw@puri.sm/
Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 61297ef66a0e..c77b34a5e166 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1130,6 +1130,8 @@ static const struct hi846_mode supported_modes[] = {
 		},
 	}
 };
+#define NUM_MODES_2LANE		ARRAY_SIZE(supported_modes)
+#define NUM_MODES_4LANE		(ARRAY_SIZE(supported_modes) - 1)
 
 struct hi846_datafmt {
 	u32 code;
@@ -1162,6 +1164,8 @@ struct hi846 {
 
 	struct mutex mutex; /* protect cur_mode, streaming and chip access */
 	const struct hi846_mode *cur_mode;
+	const struct hi846_mode *supported_modes;
+	int num_modes;
 	bool streaming;
 };
 
@@ -1736,8 +1740,8 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 	hi846->fmt = fmt;
 
 	hi846->cur_mode =
-		v4l2_find_nearest_size(supported_modes,
-				       ARRAY_SIZE(supported_modes),
+		v4l2_find_nearest_size(hi846->supported_modes,
+				       hi846->num_modes,
 				       width, height, mf->width, mf->height);
 	dev_dbg(&client->dev, "%s: found mode: %dx%d\n", __func__,
 		hi846->cur_mode->width, hi846->cur_mode->height);
@@ -1821,8 +1825,11 @@ static int hi846_enum_frame_size(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct hi846 *hi846 = to_hi846(sd);
+	const struct hi846_mode *supported_modes = hi846->supported_modes;
+
 
-	if (fse->pad || fse->index >= ARRAY_SIZE(supported_modes))
+	if (fse->pad || fse->index >= hi846->num_modes)
 		return -EINVAL;
 
 	if (fse->code != HI846_MEDIA_BUS_FORMAT) {
@@ -1950,12 +1957,12 @@ static int hi846_identify_module(struct hi846 *hi846)
 static s64 hi846_check_link_freqs(struct hi846 *hi846,
 				  struct v4l2_fwnode_endpoint *ep)
 {
-	int freqs_count = ARRAY_SIZE(supported_modes);
+	int freqs_count = hi846->num_modes;
 	u64 link_freq;
 	int i, j;
 
 	for (i = 0; i < freqs_count; i++) {
-		link_freq = hi846_get_link_freq(hi846, &supported_modes[i]);
+		link_freq = hi846_get_link_freq(hi846, &hi846->supported_modes[i]);
 		for (j = 0; j < ep->nr_of_link_frequencies; j++)
 			if (link_freq == ep->link_frequencies[j])
 				break;
@@ -1999,6 +2006,13 @@ static int hi846_parse_dt(struct hi846 *hi846, struct device *dev)
 
 	hi846->nr_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
 
+	hi846->supported_modes = supported_modes;
+	hi846->num_modes = NUM_MODES_2LANE;
+	if (hi846->nr_lanes == 4) {
+		hi846->supported_modes = supported_modes + 1;
+		hi846->num_modes = NUM_MODES_4LANE;
+	}
+
 	if (!bus_cfg.nr_of_link_frequencies) {
 		dev_err(dev, "link-frequency property not found in DT\n");
 		ret = -EINVAL;
@@ -2088,7 +2102,7 @@ static int hi846_probe(struct i2c_client *client)
 	if (ret)
 		goto err_power_off;
 
-	hi846->cur_mode = &supported_modes[0];
+	hi846->cur_mode = &hi846->supported_modes[0];
 
 	ret = hi846_init_controls(hi846);
 	if (ret) {
-- 
2.54.0

