Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7E43B776C
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522162; cv=none; b=BuZKqHrEMJhBMUWuwu0OQTw3gf5HwNblOJm75EY4yC2vPNdtAIrOiRm2ECDwgm4c1pwsRprT0GyFqs9xL+qZMi2LW24g7MUQ2wYNAZnd4TTH6xTlD0GMBhHPToL6awAEDjML0MOsbfjKQv3nO4TSr2OxFSb5t8J9qRfKRKIdKGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522162; c=relaxed/simple;
	bh=HhVZI9HK2acxh/kCiAWqs9TnSmdjguE30P1zXNPnXi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fQHuEK9LAQuzQLuTcE5yux8bM3KBESoAV53KBTuhPfzMXePhFZMzU0Mq66ylj0Q8fnAA2C+CazJc5TBcuGSP82q57R8PzVy2z3MPXXjuoyyenOf+D+q2cG0KUbZL1zLTgJTy8RGcrtlVje2PJ97MNesaQum+shFXK27k7LVTUt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=QeexdPjJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="QeexdPjJ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b6f1b14bso3500985e9.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522156; x=1784126956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpAz3t9DkUynz5Ilo0pkqB1DUV2Whn3ZOP7/Xd5aH4E=;
        b=QeexdPjJfKtJDaWvPEKOV7SY28EWuf9rSud+GD0CB9Dj+6B40/huKdNLN2S8TtHMA7
         pOeoIXKfL6M0xPAEn7JV7vVYfxxeyIB9oA0KbIeMxOwZQ/NKB94u4Gz6FLwkX24pGkRV
         7PPeVnP10Ujk09Wi3ls0sfFyWZvxFk1WPOuQAVmkKfu4OOFhthvG1mDm3GGCntm5uzZE
         b8tD+76gMQs9bo7iYWw3e6lDqDM68nqAiBQ6Fbh7q2PWFdldCN3T/UCyHFwwsXwHJwVD
         OwZl+XqbmEl4tVX9QzSahsuXTX2CA0/fChjKkJvrNi1xSzmdm1DdFfOs3CmlM0JSWCHZ
         PZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522156; x=1784126956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VpAz3t9DkUynz5Ilo0pkqB1DUV2Whn3ZOP7/Xd5aH4E=;
        b=Efd32WZxUDq9FRKc9yrEVjuOvN+jmw3KWXt101FCUji9k8vKp0oTIctGwfaS0PR2VZ
         n5XT7Q+AFH/Be1CxGxZBRjBO30lNCQsknJ278c4Z3NIWWV27RLHerexqMQHHri65oGLd
         IE84+00r2pYweT5z+2MVTkNtWsJVwQWe+s7FNRPjaWU3ojAYNdwm2Cn89cgweCL6vVMp
         3BEoyA3DDKim/88z/VIIUteGoq1LWK243OXOFXucx1ZmMztQmIkv9thSs1mcrn9MMfAw
         UgOjP8jlPpHBGMa4ZSTQfn1YDIQ9UTcMi3WIwrmjgEb7AyqISRNU7YT5W7REBONmHuT3
         Ackg==
X-Forwarded-Encrypted: i=1; AHgh+RpQOW4vUfTxFRsGoJStBCx1CW8ldkeC97XdF9fBUBOeYqvblAZ2iqF8baEuPbUvqHFq1N39/06Wamja@vger.kernel.org
X-Gm-Message-State: AOJu0YwtWtHRyMz6SE8+2BmTuT/Jm8AhMc/hwNPYWAk9ytK2nJT+GGS/
	dR7shUB+Y9OYrRhEDC+jb98nxVOfXVoC2bB+vsESvIMYMRR8MgWYnaIM86IR0b+CJJU=
X-Gm-Gg: AfdE7cnjtJiUu3KjDMVkmA0IdGDjC84tFQxvG6J8KCHh4XQ9rbnLl7sIQM3xcet+Nv9
	SFuLFL0B4hnmHv5Gwu1552IoS6q3QfoXXfBpP7z4kLZF/N+xd5s1ToiAZvlch9ZEwAU8i6E26Sr
	YWrJ8DXIfHkUpk8A8t+7iZIUHORuVwsDDFF9n40sR4/S0yrAdm2MnvyuzljMKbnkWMU2Mq/Pipz
	I+2FdmgoTCFmgas7Ktxr2bEj48DA51gXsCAkV/yLoSM4BOHkrDsiyOmM+ahpvurTIdLM9E4w1V/
	rsf5elho/AEhx8BNKg8D33r01ev0OOQl29kAiv0f4LJZJHzuuFeeCTqQ5y/mytU4BwaB9grrRvJ
	RZrpmY7SUPvLfhw03H4QInWtYE0q16oWZSrjRMivWHlSjlF8Axdpd4Kd9/hYGMIikpl677rEPKy
	jWE6i8brErB0jiJzYzjJnVZ82WTNlE99AkRmuFyv4AGRH0uYpIoy0qJPODbs8wLQsO
X-Received: by 2002:a05:600c:8b62:b0:493:adcb:d368 with SMTP id 5b1f17b1804b1-493e6843f10mr32091395e9.9.1783522156025;
        Wed, 08 Jul 2026 07:49:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:15 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:44 +0100
Subject: [PATCH v3 08/20] media: imx355: Remove link_freq_index from each
 mode as ununsed
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-8-9df386a623d7@raspberrypi.com>
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

The link_freq_index value in imx355_mode is unused, so remove it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx355.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 1010c32fe969..2880e03b3f08 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -81,7 +81,6 @@
 
 /* default link frequency and external clock */
 #define IMX355_LINK_FREQ_DEFAULT	360000000LL
-#define IMX355_LINK_FREQ_INDEX		0
 
 /* number of data lanes */
 #define IMX355_DATA_LANES		4
@@ -111,9 +110,6 @@ struct imx355_mode {
 	/* H-timing */
 	u32 llp;
 
-	/* index of link frequency */
-	u32 link_freq_index;
-
 	/* Default register values */
 	struct imx355_reg_list reg_list;
 };
@@ -366,7 +362,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 2615,
 		.fll_min = 2615,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
 			.regs = mode_3280x2464_regs,
@@ -384,7 +379,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 2615,
 		.fll_min = 2615,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3268x2448_regs),
 			.regs = mode_3268x2448_regs,
@@ -402,7 +396,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 2615,
 		.fll_min = 2615,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3264x2448_regs),
 			.regs = mode_3264x2448_regs,
@@ -420,7 +413,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1940x1096_regs),
 			.regs = mode_1940x1096_regs,
@@ -438,7 +430,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1936x1096_regs),
 			.regs = mode_1936x1096_regs,
@@ -456,7 +447,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1924x1080_regs),
 			.regs = mode_1924x1080_regs,
@@ -474,7 +464,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
 			.regs = mode_1920x1080_regs,
@@ -492,7 +481,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1640x1232_regs),
 			.regs = mode_1640x1232_regs,
@@ -510,7 +498,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1640x922_regs),
 			.regs = mode_1640x922_regs,
@@ -528,7 +515,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1300x736_regs),
 			.regs = mode_1300x736_regs,
@@ -546,7 +532,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1296x736_regs),
 			.regs = mode_1296x736_regs,
@@ -564,7 +549,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1284x720_regs),
 			.regs = mode_1284x720_regs,
@@ -582,7 +566,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
 			.regs = mode_1280x720_regs,
@@ -600,7 +583,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 652,
 		.fll_min = 652,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_820x616_regs),
 			.regs = mode_820x616_regs,

-- 
2.34.1

