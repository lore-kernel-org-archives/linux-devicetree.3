Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E5D43784F
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 17:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443984; cv=none; b=PP5dRMFYPjScnre5+dWNHXTrR2lqwdsswyDRpYgFfWS3yx6OIp5onsNXC0OT06NShD1Jnji4VZqgolQYWKBi2ODKOygZY+UuUPKNrza9jKWgEYNDe7fXvf9FAgaMr3RP9rRR1a5bfX8MOm3XZ0ET5+YkzbK8GLU9D91v0Zb+jE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443984; c=relaxed/simple;
	bh=PFkZIUGI8c5gKx0ZfGBiuXQnWrcqWPcJ4PDkAcsK8b4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a6CwfyVM1tqJF53B0ZcGUvpxBdrX6oGWXaXBUH4TNy4qvjg9VnbcALONF0mye+9ErjVqcHyi7OL8HI15e81WuEvprSgFJCXLIBNhzGZRN+vJL2YRkcB2BWuRGZkmYGqMpc3MbBm7s+Za0rw95MHK4ZSn9x09OQ0C4rOr9plEpoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ipS3xobq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ipS3xobq"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493e4cccd8dso1799445e9.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443981; x=1784048781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOJ1x8VZvdDC9hBUkn9XRjGYXcp7CmDAs2/sVHErw+4=;
        b=ipS3xobqPJxluEYHB02JBAbzrflJv/tbpGh27GCwqQLUzTwb9sTswrbHcd90W+bbgv
         9VFaCN4BIlB7ZuQCiw8eyUlHjG0IlXBUGnkiE+rjdydrIZmRlQJiRei8huof74bnAqvM
         8dk6KSonH3Dfq7N3wa1zmGDoKlCVZyMMahNxRIsnujmJ5hJ7baauXaJUgzK7mr7hb6Dr
         BG8D3R/r00NTt9BvaTXCUh+402mQVxGxEpTLLT/zVkg3Ohnpwve581QZvGpx75QBjZxJ
         IRgJ703Co1QfdiCQs5xY6wdbyNPpCkS4VblxEzcPrMWL40RLvqkTd6VVrDn8n7CT10Fx
         6wpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443981; x=1784048781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOJ1x8VZvdDC9hBUkn9XRjGYXcp7CmDAs2/sVHErw+4=;
        b=Cg6Vm45Uv5uZH3PcT7ojeTeFSYQTojji6PPcXj7bV9q74FmMPXKTGv00WfpZ4LRjW8
         NRIvIkf1Yij0MJKUUR+LFg8Wve2uIN3ObJyzGPNXaypS0530AJicVY6+FMTncrlfnFSH
         lfgYPz5EIs4+vYSwJeGaeHTMLCt2pA64FNsqn6Z3rEC4YBMEoGljJkvEZwTTNNJ+Liv7
         bZ9FLpz4tySKnSVjnjWfpAmWAEZVkuOUW5cf9Dc4JA+lMMiRAMf45zQ7PmQ5ZZm/e4Cn
         kx32aFKEhGRoSMYkE3kkZfbDbqqJkQsPpgC7yEG447Qj5S6OA/xtwo7a//JkBGRD+ueN
         OH/Q==
X-Forwarded-Encrypted: i=1; AHgh+RoVKDvuSUcqFFt29hR9L73DROA1AfgewfP/O0rTYvH3n7Tq7VMu3VG5RuC0fzi/6+Sq2FTa1kccdaRH@vger.kernel.org
X-Gm-Message-State: AOJu0YxkGbUNWr9haUJ9RiNlxITH/TJpr5sPgfIJ3FOgmcSNvDYnYSLd
	mlX2yCkuQFScYm4hht+Z9eWEzYipWvqgGmYSzcpxxvbUUdWhSTOr8LpxEjXCjs1O9AVMy5/H8hE
	O/1Mr
X-Gm-Gg: AfdE7ckUoTUM66PHYPCB6z5df2L3ejnYYD+dwDKau9OvDAUhVuF7YZsQF79GlXr95li
	n+EK33l4/aineJ8b/IRkwehWu+xcLaCE1CXYDRPJQVP+3OuT9VlDT4gsHsYpJVHYtghe8JB51+H
	06rEjPjcqyulQEXfC1+lGF2R5aI7xOlE79lk3JaBegIX/iYtsZHA/3SuqbwW/7n5AQ+ZZsFu8EJ
	3Yt4IAioltqIrS7DUXnStpawPlwv2Vt8FXsTZeHmE6XEvUY4iz0sXdxglwtDt98ws2SEQToHfFe
	3JCWEoZzDrMPRpAag5pxG79hiQzT56QYqbO+8w6MQ8xzh5KqPp96Ier0VhKjvkYHL3anuBvy9Gn
	B+M9cqnUKy6yB0WLdPAufTp8sv+sBHAtFGl0vYwQQkvG6EB+/ShYKNRmM6Qr4AsdTC7eUnjCtii
	peLoRqV7xrhvlnu4rgCEqmrGQGXRWZn240I7+L7orpLF+7sgSthBu43FQKa/Zsw5U8
X-Received: by 2002:a05:600c:860b:b0:493:b9cd:1272 with SMTP id 5b1f17b1804b1-493df065f66mr71013645e9.23.1783443980824;
        Tue, 07 Jul 2026 10:06:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:20 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:39 +0100
Subject: [PATCH v2 07/20] media: imx355: Set binning mode registers
 programmatically
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-7-1683ec07b897@raspberrypi.com>
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

Compute the binning registers based on the difference between
the mode width/height vs the crop width/height.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 61 +++++++++++++++-------------------------------
 1 file changed, 19 insertions(+), 42 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 66e70650e666..cfc47b5100c4 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -72,6 +72,10 @@
 #define IMX355_TEST_PATTERN_GRAY_COLOR_BARS	3
 #define IMX355_TEST_PATTERN_PN9			4
 
+#define IMX355_REG_BINNING_MODE		0x0900
+#define IMX355_REG_BINNING_TYPE		0x0901
+#define IMX355_REG_BINNING_WEIGHTING	0x0902
+
 /* Flip Control */
 #define IMX355_REG_ORIENTATION		0x0101
 
@@ -262,113 +266,71 @@ static const struct imx355_reg_list imx355_global_setting = {
 };
 
 static const struct imx355_reg mode_3268x2448_regs[] = {
-	{ 0x0900, 0x00 },
-	{ 0x0901, 0x11 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_3264x2448_regs[] = {
-	{ 0x0900, 0x00 },
-	{ 0x0901, 0x11 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_3280x2464_regs[] = {
-	{ 0x0900, 0x00 },
-	{ 0x0901, 0x11 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1940x1096_regs[] = {
-	{ 0x0900, 0x00 },
-	{ 0x0901, 0x11 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1936x1096_regs[] = {
-	{ 0x0900, 0x00 },
-	{ 0x0901, 0x11 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1924x1080_regs[] = {
-	{ 0x0900, 0x00 },
-	{ 0x0901, 0x11 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1920x1080_regs[] = {
-	{ 0x0900, 0x00 },
-	{ 0x0901, 0x11 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1640x1232_regs[] = {
-	{ 0x0900, 0x01 },
-	{ 0x0901, 0x22 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1640x922_regs[] = {
-	{ 0x0900, 0x01 },
-	{ 0x0901, 0x22 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1300x736_regs[] = {
-	{ 0x0900, 0x01 },
-	{ 0x0901, 0x22 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1296x736_regs[] = {
-	{ 0x0900, 0x01 },
-	{ 0x0901, 0x22 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1284x720_regs[] = {
-	{ 0x0900, 0x01 },
-	{ 0x0901, 0x22 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_1280x720_regs[] = {
-	{ 0x0900, 0x01 },
-	{ 0x0901, 0x22 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
 
 static const struct imx355_reg mode_820x616_regs[] = {
-	{ 0x0900, 0x01 },
-	{ 0x0901, 0x44 },
-	{ 0x0902, 0x00 },
 	{ 0x0700, 0x02 },
 	{ 0x0701, 0x78 },
 };
@@ -973,6 +935,7 @@ static int imx355_start_streaming(struct imx355 *imx355)
 {
 	const struct imx355_reg_list *reg_list;
 	const struct imx355_mode *mode;
+	u8 binning_mode;
 	int ret;
 
 	/* Global Setting */
@@ -1018,6 +981,20 @@ static int imx355_start_streaming(struct imx355 *imx355)
 	if (ret)
 		return ret;
 
+	binning_mode = ((mode->crop.width / mode->width) << 4) |
+			(mode->crop.height / mode->height);
+	ret = imx355_write_reg(imx355, IMX355_REG_BINNING_MODE, 1,
+			       binning_mode == 0x11 ? 0x00 : 0x01);
+	if (ret)
+		return ret;
+	ret = imx355_write_reg(imx355, IMX355_REG_BINNING_TYPE, 1,
+			       binning_mode);
+	if (ret)
+		return ret;
+	ret = imx355_write_reg(imx355, IMX355_REG_BINNING_WEIGHTING, 1, 0x00);
+	if (ret)
+		return ret;
+
 	/* Set PLL registers for the external clock frequency */
 	ret = imx355_write_reg(imx355, IMX355_REG_EXTCLK_FREQ, 2,
 			       imx355->clk_params->extclk_freq);

-- 
2.34.1

