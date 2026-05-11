Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B8F3BFE20
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 09:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778490704; cv=none; b=lHTrvZODElUzErIF9LloFccTNDSgo89HGf0edbgWo2snoFJl4YgBpNTq+KtZ+ADVAA7vEnW0nJeKh1WfEJdDpUJTp4bmM9z8MRQR6F9pqOJzyZAEXVbA7fiU7hByBhl7jwQsWxw28vK/UUxJjSwt47Y3yGhg8g2zpVUKReTJN8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778490704; c=relaxed/simple;
	bh=BmKgwW+huMEmoGPoLpy+I+GMFUXpf5lF+r7mZMlbwFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iFVT2q/mkUee6eMnL0CZ9ji8MWEnFMTaGbuWGhwDAq9js3utAw3TaTNBFfnPc5CTeMPyJ7Q77WCv8UNvRX+my55a6ELbTSDfySa3zxPrMJm0d0MG4Tm8hZBd77rli3il8sW1C9VBmqDoYHpJrhqSgGIx7PaovPZE1IW+fXxygac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gn24wuQo; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gn24wuQo"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-83ec36a13e9so360994b3a.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 02:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778490703; x=1779095503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozLkte7ETpH86EHwtLlaK+Q8ddy25XuHUv04YnH5k94=;
        b=Gn24wuQoOj8rjYSpTaMU80gbJk/X//XiQce9OPwwuc3r9v+oUHLHOFkQNe76NXB/KZ
         QLceuBCGd2V/PeVmmD/9Fig6TsaPTFm9WNc0X4PK4gB+EjAHNJpKF6+a8LW120JkdLpB
         uIOtaAFc3GFoIo6CuEn9edIJtqiCuZ1vPMq4seBasyuM96Lq0PVuxZVRH+yyMwjSylRH
         lalYorpN0zVsPYowSIP0edE3ydvbDdsVlgj+vIrIpdkaik+DTGmzF4YuvnXUjXLACzc9
         zxHDjO4mbp/WXZJ8548ijayeJN1R89YXjCwlPc/NVWcZNzt5b9iUnKOgL7SzRIeTu+bi
         B39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490703; x=1779095503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ozLkte7ETpH86EHwtLlaK+Q8ddy25XuHUv04YnH5k94=;
        b=AEFWyVbfUOimg0vVunzDYZenc/jqsq0Wy3PvkgCUQrsTSs7uLvz77Wjbela8AiMnDP
         D4yCDo52XRbzu9DD9YyS77uBtXpRh6T4sOXuKdGiYPixDa19+FtoUj6fQkOZZ5weOZ4c
         Ae40IEPYCyOLa+julfKh4ve/kWjYT1qk82TjqXNYiDsi1N1cSXgW3YVRA+AyWqru9a5J
         Mxc+5VkZxVunLXVCPIkbtoDTUZRo9oLTWYsng5Kgd1t6OG1eob++7r/5LuiDZhSTfh66
         92NTX4FccLCAx7xe9F6RO3C0StVDE37vFl0cDM6LnjlT4U75HbceUD/RxxhBrboOAq4v
         vF0Q==
X-Gm-Message-State: AOJu0Ywrzolh+ILhNUpu3aWAyN2FwJPTXG9W2ZwvRg2n49FVBI7qOjA4
	SbnS0rPayjwQYwiEPy4eISYkj2goq9zeA4wkox2LLh1DUW8anFdf9cNk
X-Gm-Gg: Acq92OFP07vSd715s+QZyJIyYY5+vs+2nhCiNTQtm1p+Sj0cxU+VdHeYoa7S+3wd2SC
	a4A9ncVXw3TbrBJyXC4Wkh9FsEHYaVrrSzuFBgQJuRvn2xyWBWfltIkMvD+wlHdtHw1I4dckehn
	TUwxizkFkKOSQAKXC0qwaZEwHWBfG+ooQCPsZql+jzZiL3U8Yx+U2mlXjVkdDsGXnBSF0ZIRlHY
	GV3n9RA2P+Cif+1gkTpeWGdugQbgtjj/yvsdIDSKD5iZiLkZ53HE/dB5Vv0UC2ItmxW3nfSDiCD
	5xWJ9dzAhdJ23md9CmHK0nrE7+G635gOUYh4DGfbCDvvlN6vfpEIDlzpo7RkQyv8gusN5uWkf3q
	5w1ORZ7KyySTX3HsZ8lOzITcqim3KIPdwgXFHGmP42IjP7zGQlhCLUYaTsVPGzn35nLtyJLkXxH
	jpf/PyKf/vK52TXU0cIS2isV/GJzdt7YwGqQ==
X-Received: by 2002:a05:6a00:914a:b0:83e:b22f:373a with SMTP id d2e1a72fcca58-83eb22f4300mr4998591b3a.11.1778490702569;
        Mon, 11 May 2026 02:11:42 -0700 (PDT)
Received: from nuvole ([2409:8a34:5f37:1974:abc5:99cd:a924:4e86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f11csm24775517b3a.3.2026.05.11.02.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:11:42 -0700 (PDT)
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
Subject: [PATCH v3 3/5] media: hi846: fix modes handling for different lane cases
Date: Mon, 11 May 2026 17:09:22 +0800
Message-ID: <20260511090924.269106-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511090924.269106-1-mitltlatltl@gmail.com>
References: <20260511090924.269106-1-mitltlatltl@gmail.com>
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
index befd54553df2..9decfda74787 100644
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

