Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EF5449EB8
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115859; cv=none; b=EyRPzZCcFpM5yAmE7isMxfbZ+kkBzzx9/EUmPvRlDJeBN860kzHA9egzGEgsjHL56vwafghDg1907vDFV1oUeovlRTTZRQu26FWPN7jhnTOY8ekMdoLhuAbSqa9ANeCintheaIflurYNMYDzaCGcxaUG7KVkK9PcqlMZWcu260o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115859; c=relaxed/simple;
	bh=wqkitN5tW+qsIkaXe0dl5rCtTLGiBd7TWW1o/DfPW1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JxQ3xreNZFUfcrethnlxCKEu8EI9HwGQv6HqSPMeUFj9WWCvBYRJQx6hq7BwREjYH1IQW0cSZFqDAH7oFEEwn28iwq6RhYvo82LZCwmWt7IM6qz12+gCjszc34sF83CZazzx5ha4j5YCQLT0QXVJNrOQCRVbFWdclcvFT59CGfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=jl/JE4y2; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="jl/JE4y2"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-470174001a0so1072123f8f.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 04:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115855; x=1784720655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M+7U9Gq7RsgJEjog9vowp9MZwvnIxwjwziQPVrI23AQ=;
        b=jl/JE4y2hiXNzyxURqpQOiWs9CaXkjGtGYC/Pl42Z+mscBDK8cZCXCLfluwaOwC+n6
         st9qzS8uUf4WIECoSX3ehEULAF8lRkybI0R+LCoFZGWttm3nxVaPMc309qKerDRsVcn+
         8QuTu2UjliY9IiHMrpPi5IgSR1ZIoRp/YqosRg0QKtKd4sNdXpNKRImpNvi/VecVrTYB
         wIbUmP5lId0gcpqvkzDNt0+O4Uotc0N9urloeSBiqRGpp8CdJ14Ks/PgIMOgCog5yiyD
         SrsfqnvibV3HJPqC5U6qk+FOdt0kMdEgjn4WaPRTTFGb28XZ6wzmnH5DFvw1QLgr9e87
         3H5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115855; x=1784720655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+7U9Gq7RsgJEjog9vowp9MZwvnIxwjwziQPVrI23AQ=;
        b=qnz6lPL+U9kQ7OT4FOdiEpxY4U2xm74T73p1rft6GFEmtSoL1ruzfZ9GldZooaoMng
         xBjPbxU9GFSVeQ7QHwQpQceIKy3tv8Y9czxNVVBCXOXiGvFI/HQjiqpNrvy/woVzsurL
         b35Oy1WFbyn3nTn+We0SjSZhad24eLfZ/pqBpSV4IpYS00TzeZ5UnBt8UUTSYgabnTvL
         ydYimzT4eKV7+r2qYqqjju/71Os2ihcZL5bMo9aTJkl+5+QKXRKLMzY5OGdAN+EioLmC
         3TdOnNvqupPnmJNNOBCykzCQiJEZpvNOf1RknAPL+7pUEC9GTN0fo1+vpbmGYvD5Js7k
         wD7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp+LUMFib1luHPwm205pGUA6ST7cVdrLuhoIK859FVNo0PJ+p/iGrLfq3cceCJEEsDIC2NzxZuy6RHK@vger.kernel.org
X-Gm-Message-State: AOJu0YyHAVLp6hYPm6NgRjzPMXHu+U8OPItKkiCB27EkgAjiM+IanSkS
	K1m9fMar22LBSnxI1jzM+j5bNgDVCpEmgOLRMtFLO06v7Lt43ocBp+MQRB5JeENiRl4=
X-Gm-Gg: AfdE7cktD5YaO2RXv4iEqleWMK0kFDFxG6V9boA4rBDGfpm5bC3ygsUobJqJ8RvGBk2
	W4mlICMMo3ZPRbvGtaKpI+Po/z4/ELXst9nEgK3f4eOM7N/8ovROENnWUe5eAiOERJ7Dyqablu9
	m128SNv884CxApvJXYdoVaP1bbiUD10Sk+c8nAQP30Pwbvpw1uil30qGrBHw12BCrdz9cCEjCxj
	M1IGzwliuSXyvrUv4Jo2SZv3NFjMmntgXiixs6ZEtnvj7OvMw72X5Z7QnTL4EyR6gv+bxnYYJgj
	QBIBLZjhRRisK5oKbAdCsjiV2AsNXcytbpGd3o+C4E+J02FUwbeW5YcA3iCUKDWEzI5unq1llqy
	bm9H46vMFAFaiusDl+ESl5vxJxM7u7Ty/MobGb51UW2OvhH66tP1wZzQhFy4jcToHaTX2eGlrQp
	FyWKRB6EDU6w0xDEls1kl5MWwzE/IFG6WNCz25HYZhaXVM9q5wLFfbSFLMcRMiIKouxukmlmY4T
	d0=
X-Received: by 2002:a05:6000:2210:b0:47d:df97:8186 with SMTP id ffacd0b85a97d-47f2dc8d716mr21510062f8f.7.1784115855183;
        Wed, 15 Jul 2026 04:44:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:14 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:19 +0100
Subject: [PATCH v4 06/21] media: imx355: Programmatically set the crop
 parameters for each mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-6-f7f966fb9ffd@raspberrypi.com>
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

Currently the cropping is set via register entries in the per mode
register lists. Add the crop information to the mode structure as
a v4l2_rect, and set the registers programmatically.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 290 +++++++++++++++++++--------------------------
 1 file changed, 121 insertions(+), 169 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index b40d89d86156..123ceed26d05 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -33,6 +33,13 @@
 #define IMX355_REG_FLL			0x0340
 #define IMX355_FLL_MAX			0xffff
 
+#define IMX355_REG_X_ADD_START		0x0344
+#define IMX355_REG_Y_ADD_START		0x0346
+#define IMX355_REG_X_ADD_END		0x0348
+#define IMX355_REG_Y_ADD_END		0x034a
+#define IMX355_REG_X_OUT_SIZE		0x034c
+#define IMX355_REG_Y_OUT_SIZE		0x034e
+
 /* Exposure control */
 #define IMX355_REG_EXPOSURE		0x0202
 #define IMX355_EXPOSURE_MIN		1
@@ -88,6 +95,7 @@ struct imx355_mode {
 	u32 width;
 	/* Frame height */
 	u32 height;
+	struct v4l2_rect crop;
 
 	/* V-timing */
 	u32 fll_def;
@@ -254,21 +262,9 @@ static const struct imx355_reg_list imx355_global_setting = {
 static const struct imx355_reg mode_3268x2448_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0344, 0x00 },
-	{ 0x0345, 0x08 },
-	{ 0x0346, 0x00 },
-	{ 0x0347, 0x08 },
-	{ 0x0348, 0x0c },
-	{ 0x0349, 0xcb },
-	{ 0x034a, 0x09 },
-	{ 0x034b, 0x97 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x0c },
-	{ 0x034d, 0xc4 },
-	{ 0x034e, 0x09 },
-	{ 0x034f, 0x90 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -276,21 +272,9 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
 static const struct imx355_reg mode_3264x2448_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0344, 0x00 },
-	{ 0x0345, 0x08 },
-	{ 0x0346, 0x00 },
-	{ 0x0347, 0x08 },
-	{ 0x0348, 0x0c },
-	{ 0x0349, 0xc7 },
-	{ 0x034a, 0x09 },
-	{ 0x034b, 0x97 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x0c },
-	{ 0x034d, 0xc0 },
-	{ 0x034e, 0x09 },
-	{ 0x034f, 0x90 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -298,21 +282,9 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
 static const struct imx355_reg mode_3280x2464_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0344, 0x00 },
-	{ 0x0345, 0x00 },
-	{ 0x0346, 0x00 },
-	{ 0x0347, 0x00 },
-	{ 0x0348, 0x0c },
-	{ 0x0349, 0xcf },
-	{ 0x034a, 0x09 },
-	{ 0x034b, 0x9f },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x0c },
-	{ 0x034d, 0xd0 },
-	{ 0x034e, 0x09 },
-	{ 0x034f, 0xa0 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -320,21 +292,9 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
 static const struct imx355_reg mode_1940x1096_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0344, 0x02 },
-	{ 0x0345, 0xa0 },
-	{ 0x0346, 0x02 },
-	{ 0x0347, 0xac },
-	{ 0x0348, 0x0a },
-	{ 0x0349, 0x33 },
-	{ 0x034a, 0x06 },
-	{ 0x034b, 0xf3 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x07 },
-	{ 0x034d, 0x94 },
-	{ 0x034e, 0x04 },
-	{ 0x034f, 0x48 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -342,21 +302,9 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
 static const struct imx355_reg mode_1936x1096_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0344, 0x02 },
-	{ 0x0345, 0xa0 },
-	{ 0x0346, 0x02 },
-	{ 0x0347, 0xac },
-	{ 0x0348, 0x0a },
-	{ 0x0349, 0x2f },
-	{ 0x034a, 0x06 },
-	{ 0x034b, 0xf3 },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x07 },
-	{ 0x034d, 0x90 },
-	{ 0x034e, 0x04 },
-	{ 0x034f, 0x48 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -364,21 +312,9 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
 static const struct imx355_reg mode_1924x1080_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0344, 0x02 },
-	{ 0x0345, 0xa8 },
-	{ 0x0346, 0x02 },
-	{ 0x0347, 0xb4 },
-	{ 0x0348, 0x0a },
-	{ 0x0349, 0x2b },
-	{ 0x034a, 0x06 },
-	{ 0x034b, 0xeb },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x07 },
-	{ 0x034d, 0x84 },
-	{ 0x034e, 0x04 },
-	{ 0x034f, 0x38 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -386,21 +322,9 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
 static const struct imx355_reg mode_1920x1080_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0344, 0x02 },
-	{ 0x0345, 0xa8 },
-	{ 0x0346, 0x02 },
-	{ 0x0347, 0xb4 },
-	{ 0x0348, 0x0a },
-	{ 0x0349, 0x27 },
-	{ 0x034a, 0x06 },
-	{ 0x034b, 0xeb },
 	{ 0x0900, 0x00 },
 	{ 0x0901, 0x11 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x07 },
-	{ 0x034d, 0x80 },
-	{ 0x034e, 0x04 },
-	{ 0x034f, 0x38 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -408,21 +332,9 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
 static const struct imx355_reg mode_1640x1232_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0344, 0x00 },
-	{ 0x0345, 0x00 },
-	{ 0x0346, 0x00 },
-	{ 0x0347, 0x00 },
-	{ 0x0348, 0x0c },
-	{ 0x0349, 0xcf },
-	{ 0x034a, 0x09 },
-	{ 0x034b, 0x9f },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x06 },
-	{ 0x034d, 0x68 },
-	{ 0x034e, 0x04 },
-	{ 0x034f, 0xd0 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -430,21 +342,9 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
 static const struct imx355_reg mode_1640x922_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0344, 0x00 },
-	{ 0x0345, 0x00 },
-	{ 0x0346, 0x01 },
-	{ 0x0347, 0x30 },
-	{ 0x0348, 0x0c },
-	{ 0x0349, 0xcf },
-	{ 0x034a, 0x08 },
-	{ 0x034b, 0x63 },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x06 },
-	{ 0x034d, 0x68 },
-	{ 0x034e, 0x03 },
-	{ 0x034f, 0x9a },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -452,21 +352,9 @@ static const struct imx355_reg mode_1640x922_regs[] = {
 static const struct imx355_reg mode_1300x736_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0344, 0x01 },
-	{ 0x0345, 0x58 },
-	{ 0x0346, 0x01 },
-	{ 0x0347, 0xf0 },
-	{ 0x0348, 0x0b },
-	{ 0x0349, 0x7f },
-	{ 0x034a, 0x07 },
-	{ 0x034b, 0xaf },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x05 },
-	{ 0x034d, 0x14 },
-	{ 0x034e, 0x02 },
-	{ 0x034f, 0xe0 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -474,21 +362,9 @@ static const struct imx355_reg mode_1300x736_regs[] = {
 static const struct imx355_reg mode_1296x736_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0344, 0x01 },
-	{ 0x0345, 0x58 },
-	{ 0x0346, 0x01 },
-	{ 0x0347, 0xf0 },
-	{ 0x0348, 0x0b },
-	{ 0x0349, 0x77 },
-	{ 0x034a, 0x07 },
-	{ 0x034b, 0xaf },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x05 },
-	{ 0x034d, 0x10 },
-	{ 0x034e, 0x02 },
-	{ 0x034f, 0xe0 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -496,21 +372,9 @@ static const struct imx355_reg mode_1296x736_regs[] = {
 static const struct imx355_reg mode_1284x720_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0344, 0x01 },
-	{ 0x0345, 0x68 },
-	{ 0x0346, 0x02 },
-	{ 0x0347, 0x00 },
-	{ 0x0348, 0x0b },
-	{ 0x0349, 0x6f },
-	{ 0x034a, 0x07 },
-	{ 0x034b, 0x9f },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x05 },
-	{ 0x034d, 0x04 },
-	{ 0x034e, 0x02 },
-	{ 0x034f, 0xd0 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -518,21 +382,9 @@ static const struct imx355_reg mode_1284x720_regs[] = {
 static const struct imx355_reg mode_1280x720_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0344, 0x01 },
-	{ 0x0345, 0x68 },
-	{ 0x0346, 0x02 },
-	{ 0x0347, 0x00 },
-	{ 0x0348, 0x0b },
-	{ 0x0349, 0x67 },
-	{ 0x034a, 0x07 },
-	{ 0x034b, 0x9f },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x22 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x05 },
-	{ 0x034d, 0x00 },
-	{ 0x034e, 0x02 },
-	{ 0x034f, 0xd0 },
 	{ 0x0700, 0x00 },
 	{ 0x0701, 0x10 },
 };
@@ -540,21 +392,9 @@ static const struct imx355_reg mode_1280x720_regs[] = {
 static const struct imx355_reg mode_820x616_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0344, 0x00 },
-	{ 0x0345, 0x00 },
-	{ 0x0346, 0x00 },
-	{ 0x0347, 0x00 },
-	{ 0x0348, 0x0c },
-	{ 0x0349, 0xcf },
-	{ 0x034a, 0x09 },
-	{ 0x034b, 0x9f },
 	{ 0x0900, 0x01 },
 	{ 0x0901, 0x44 },
 	{ 0x0902, 0x00 },
-	{ 0x034c, 0x03 },
-	{ 0x034d, 0x34 },
-	{ 0x034e, 0x02 },
-	{ 0x034f, 0x68 },
 	{ 0x0700, 0x02 },
 	{ 0x0701, 0x78 },
 };
@@ -580,6 +420,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 3280,
 		.height = 2464,
+		.crop = {
+			.width = 3280,
+			.height = 2464,
+			.left = 0,
+			.top = 0,
+		},
 		.fll_def = 2615,
 		.fll_min = 2615,
 		.llp = 3672,
@@ -592,6 +438,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 3268,
 		.height = 2448,
+		.crop = {
+			.width = 3268,
+			.height = 2448,
+			.left = 8,
+			.top = 8,
+		},
 		.fll_def = 2615,
 		.fll_min = 2615,
 		.llp = 3672,
@@ -604,6 +456,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 3264,
 		.height = 2448,
+		.crop = {
+			.width = 3264,
+			.height = 2448,
+			.left = 8,
+			.top = 8,
+		},
 		.fll_def = 2615,
 		.fll_min = 2615,
 		.llp = 3672,
@@ -616,6 +474,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 1940,
 		.height = 1096,
+		.crop = {
+			.width = 1940,
+			.height = 1096,
+			.left = 672,
+			.top = 684,
+		},
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
@@ -628,6 +492,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 1936,
 		.height = 1096,
+		.crop = {
+			.width = 1936,
+			.height = 1096,
+			.left = 672,
+			.top = 684,
+		},
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
@@ -640,6 +510,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 1924,
 		.height = 1080,
+		.crop = {
+			.width = 1924,
+			.height = 1080,
+			.left = 680,
+			.top = 692,
+		},
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
@@ -652,6 +528,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 1920,
 		.height = 1080,
+		.crop = {
+			.width = 1920,
+			.height = 1080,
+			.left = 680,
+			.top = 692,
+		},
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
@@ -664,6 +546,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 1640,
 		.height = 1232,
+		.crop = {
+			.width = 3280,
+			.height = 2464,
+			.left = 0,
+			.top = 0,
+		},
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
@@ -676,6 +564,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 1640,
 		.height = 922,
+		.crop = {
+			.width = 3280,
+			.height = 1844,
+			.left = 0,
+			.top = 304,
+		},
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
@@ -688,6 +582,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 1300,
 		.height = 736,
+		.crop = {
+			.width = 2600,
+			.height = 1472,
+			.left = 344,
+			.top = 496,
+		},
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
@@ -700,6 +600,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 1296,
 		.height = 736,
+		.crop = {
+			.width = 2592,
+			.height = 1472,
+			.left = 344,
+			.top = 496,
+		},
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
@@ -712,6 +618,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 1284,
 		.height = 720,
+		.crop = {
+			.width = 2568,
+			.height = 1440,
+			.left = 360,
+			.top = 512,
+		},
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
@@ -724,6 +636,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 1280,
 		.height = 720,
+		.crop = {
+			.width = 2560,
+			.height = 1440,
+			.left = 360,
+			.top = 512,
+		},
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
@@ -736,6 +654,12 @@ static const struct imx355_mode supported_modes[] = {
 	{
 		.width = 820,
 		.height = 616,
+		.crop = {
+			.width = 3280,
+			.height = 2464,
+			.left = 0,
+			.top = 0,
+		},
 		.fll_def = 652,
 		.fll_min = 652,
 		.llp = 3672,
@@ -1074,6 +998,7 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 static int imx355_start_streaming(struct imx355 *imx355)
 {
 	const struct imx355_reg_list *reg_list;
+	const struct imx355_mode *mode;
 	int ret;
 
 	/* Global Setting */
@@ -1085,13 +1010,40 @@ static int imx355_start_streaming(struct imx355 *imx355)
 	}
 
 	/* Apply default values of current mode */
-	reg_list = &imx355->cur_mode->reg_list;
+	mode = imx355->cur_mode;
+	reg_list = &mode->reg_list;
 	ret = imx355_write_regs(imx355, reg_list->regs, reg_list->num_of_regs);
 	if (ret) {
 		dev_err(imx355->dev, "failed to set mode");
 		return ret;
 	}
 
+	/* Set readout crop and size registers  */
+	ret = imx355_write_reg(imx355, IMX355_REG_X_ADD_START, 2,
+			       mode->crop.left);
+	if (ret)
+		return ret;
+	ret = imx355_write_reg(imx355, IMX355_REG_Y_ADD_START, 2,
+			       mode->crop.top);
+	if (ret)
+		return ret;
+	ret = imx355_write_reg(imx355, IMX355_REG_X_ADD_END, 2,
+			       mode->crop.width + mode->crop.left - 1);
+	if (ret)
+		return ret;
+	ret = imx355_write_reg(imx355, IMX355_REG_Y_ADD_END, 2,
+			       mode->crop.height + mode->crop.top - 1);
+	if (ret)
+		return ret;
+	ret = imx355_write_reg(imx355, IMX355_REG_X_OUT_SIZE, 2,
+			       mode->width);
+	if (ret)
+		return ret;
+	ret = imx355_write_reg(imx355, IMX355_REG_Y_OUT_SIZE, 2,
+			       mode->height);
+	if (ret)
+		return ret;
+
 	/* Set PLL registers for the external clock frequency */
 	ret = imx355_write_reg(imx355, IMX355_REG_EXTCLK_FREQ, 2,
 			       imx355->clk_params->extclk_freq);

-- 
2.34.1

