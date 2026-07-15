Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C2944A701
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115861; cv=none; b=l0ITxab/JhM2VQlwOy1tECmFutj3p2gFjw7kFNID+rSPE5STXoTv8RfOYh5IujHZUVqvkhDYLZobntH3W8Uwo0Dhip+fxXsDPne1E09wRICkfhTRctx3uHSVitJ9KnZlf6g4sGCpdhS3rFgHd1iXhF6qLLx3Sag6nP/AuVp7ndc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115861; c=relaxed/simple;
	bh=aZ8n57U1j2jY+o1haOa0aouu6Bwg3e2b0NapU1cYUUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MChqoX6jLAJL9Y0G7PKdtB/0nrAwd03VpzTYFsbwr4zAKlsdxtuCqP73kLDL6uTK4kdHGr5rPB/4HKOZgvIUv5DYE0FVrfQiEnnA7FU1OEiYmuAsTCHR1qVWGVdbOB90cwYZsKX800QEUVlzdZl9vSpHxjxSY43AVoMpVhBe2CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=kQOJ5zpT; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="kQOJ5zpT"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47362928f65so4875304f8f.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 04:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115857; x=1784720657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LaA0Iag3STAJeBMnk4x8b7GHaELfh57GksWF24FaP5Q=;
        b=kQOJ5zpTjh7puS+qtU9Sj5Wnu8A16H104rTHRtkn4s6HRZfI05hJ1X1weMV+bTjRuG
         MDiQ/ZzffBqg6dqADY2Hbc+E8vmvcSjfhNwsz8P6EoJvzSJ0T08z9xemw6dJq+X8Gp46
         423WIwYAeyvelk4N6naI6lFCvnEv/9BBy/Yv7mMTrkQ4unU9aa0b2IbSiDqnBba18L4S
         1c6gaMeHYkP9lx277uFmTQ4Fl7KVj1LqDK2RgPdWttIEkTjEpWqkeQp9fthyD60dWh4k
         KM1soToXx0s1OtbEcy2XyQ/hu3guw1NjcVQHBniGLQQovhF/spQWZ9QkB36M77g8hElB
         sMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115857; x=1784720657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LaA0Iag3STAJeBMnk4x8b7GHaELfh57GksWF24FaP5Q=;
        b=rT12pPw/OHqWSyLE19pVWOiLvFF3011Bo+iKilD0rIxjvCzpaK20Pg1zi9AsVj3/hR
         km8V5wl8MC8c2pDFUo7Ao4mDT6uNtSS1HWAKvI/jYoXSyYPtIFNqr/88HMPLAuL30Lge
         pqWLbo9LHqLkae1xFTcOBgBnivRLvbdc/EUoK/BTsKUasGsvpGUL6sckGWOVOQAod2w9
         49MFvcqXuTxDfVngDdT3HPNeeIpJV0KhWYEH16Suh25IoT8nn5NKJyn983kAp2eATPHf
         uclj35HyLfM5TwsCOZW1EQ4I730QT8mkL9JCrfC6JjyYbv6IEyz00t7zL8wcmvaoSteD
         aZ+A==
X-Forwarded-Encrypted: i=1; AHgh+Rr0DQJ1h3EM3XYCVDhAT5SbNcEk0qLKUTSBCv+R7xsLqXMU502XV1zI2iNiehuIKhdR6STFZEiVgWNi@vger.kernel.org
X-Gm-Message-State: AOJu0YwjSwsj31cI9bb7Kmf+G/VljkRRDSAZYpvGqsKjF6PwFTmxQOjM
	J5C3QljnY+5+4Jx2NEtjUIBoNfqHRHPMzFYHbUreC3QlpsUpZcCs/RojF/m04V4sFFo=
X-Gm-Gg: AfdE7ckjRiACOA82B3eZP47ztnwyHtDPJAFRaYgscd3jSjTHAWYaSEcO20IhBuASlBO
	TDr3jJ+0wNd95qacNi3hFx9iIKfmbDXxxdXEA/YOyBCXJpWT9oV6WrWC49OjqIvus35AzT2c7G2
	ewSH6FUSeEkjQrAzJycAr24j3bKaMTcF8i/PRWrRrN8YGyh0fhj7QiRLwYg2akD0yFZcUaGcSvp
	7cjfbjVMdpAgkYEQHqNWvvyO1kJf2v7WeDqpDy26zHrUAEOBFao8NuRxx2Ifj7F8NYPD+dGbI+9
	eMyZRr7oy5GoWfCDun/YW81IMiOKra+hrv2KnbhXRsOb36j7k5881rw1k7Q7oC5LTWec6lhoZZE
	dy8v0txmjCBNoECC29xV99JAJjnJWLAYese7qYge3latLZUQGNP72D8COuJi0JAJ9fh20vWbSub
	j3WOR5mWsljF3LUzYu8MaWKCFMnzZNC2tScoI5gfZcUEwfrr1NFH3D973Uj6cxp55T
X-Received: by 2002:a05:6000:4602:b0:47d:fb9e:c3f6 with SMTP id ffacd0b85a97d-47f488573eamr6671556f8f.20.1784115857101;
        Wed, 15 Jul 2026 04:44:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:16 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:21 +0100
Subject: [PATCH v4 08/21] media: imx355: Set binning mode registers
 programmatically
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-8-f7f966fb9ffd@raspberrypi.com>
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

Compute the binning registers based on the difference between
the mode width/height vs the crop width/height.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 61 +++++++++++++++-------------------------------
 1 file changed, 19 insertions(+), 42 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index e9f4bea67d3a..95487b12939d 100644
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
 
@@ -263,113 +267,71 @@ static const struct imx355_reg_list imx355_global_setting = {
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
@@ -974,6 +936,7 @@ static int imx355_start_streaming(struct imx355 *imx355)
 {
 	const struct imx355_reg_list *reg_list;
 	const struct imx355_mode *mode;
+	u8 binning_mode;
 	int ret;
 
 	/* Global Setting */
@@ -1019,6 +982,20 @@ static int imx355_start_streaming(struct imx355 *imx355)
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

