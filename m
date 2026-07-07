Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FD7437865
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 17:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443985; cv=none; b=HZTJZsS0fktxa1aGlogbwiu8HKJ7LLYGdseKYrDOhY2OZ45IbjOCNR1OyVXQ6+nBAOuOxrSleidWaJsconYToz5X21geTt1tlQGjMswKjtjv5hvtIvzt46VxScZ/qGp9it2PkfmXC0bgXL1oqwC9VTaxDInjuZFtWn2Vpx5qRYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443985; c=relaxed/simple;
	bh=7wPLB5qxZzZcqlNyu8hcmCgAKLpamdTFAUjtl7sujeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KYxaw/zpwur7a3CMSSlPfzy4zqKy4l4/kWPa+afaQ1K2DjrGUoFcW8e3B/XWodjKagSA2yH94c5GKdUCxCeFE31Knb0bJ9XOWlAku92Y8TFp6x+9GYOuh8ZRSqFbJmLyUF2M/xbRfqWvMSXKCXnCQPR1lgPKKgXHtfiYTarlraA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=hjqo68N/; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="hjqo68N/"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso2722982f8f.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443982; x=1784048782; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nF6jbYLgBHixEFRkr7oWISoSB0GJvYVYu8+UfLZI1rk=;
        b=hjqo68N/Jfz2s6TbD2xjgZp6fajujXkQuj5jCWky+i/wLMPEFU7TcBeYC8LjD/BbqH
         V/ROliR0FdrPu0BMitDrBRVNUJgsOlrbGroxaSzBRPQOStiGAG9Oly0H6piHMaX2z3Lw
         b+x8rIq91bZ+1ESNVJ44WfS6cY2TAPX6Mi9x4BUiURP1vUWvyfvM+i17mBATg/ypWktj
         aclkr5g6GKGV2bj6aHHevvIgYLQZThERHPR6XQ5Wmg9xl1CDQX6MVp/Z80j8eZIu5STS
         XOIcwZ74qgf0rj2dwqp8JOTHqX9CmRNrVccYRjbruAceiMncLrvt0vOpyYmrtngteVOg
         i6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443982; x=1784048782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nF6jbYLgBHixEFRkr7oWISoSB0GJvYVYu8+UfLZI1rk=;
        b=PSDSuogAbMAB+JoA4ZgGg9f5jYAUpb8AK6rcuHTh/IzzpcbrYBJf1RlpHxfH/WIXOD
         nPn7OyZSPf0dafNptl8yhsmB/Ln/H5IvgdoLBrvQkZZWi6NQhgn34AqIf0qdXu2TRfR3
         lQAmgcD1gYniYp0FTzZfGmhT7iSbYOSM7K62gaB4Vss4uB8bPCy/xuUM59vO17qpnL6d
         h2ETf70wmbMsRw3Ywezl4SsnP1N6RBOcK3zLnmxpdsn7Wgje2J3OQne1ORYpfuw/xaJk
         ghxvmqGxA/HTnoQiXxSQ2Ix1o0INMFImFmhXP37HS1SjBqiMI4FnN/KvwFUbL4j6KYbq
         /dWQ==
X-Forwarded-Encrypted: i=1; AHgh+RpMZI8LBrrt3SU0xBq6wPmLE8+hshfGdl4djrccL9Jj9wpD1HiLBob05Wh9IxgEzEiKsFQihWP/iQ3B@vger.kernel.org
X-Gm-Message-State: AOJu0YzcezoMafTMOsXubaqgyiNFoVxJQbtjXN7SZJ8+ldcyvMKYeF15
	iYsiK39axmzbVtx1exTSqIlE2zy24HvGh+jHwDrIaqaMO1yRxzez9HJaJsn/oRpaiek=
X-Gm-Gg: AfdE7cn6OPcmfb3l00YLC6WQGdtTWU3IUtkUN67tJZxp+ruboHkhlqp1JtijYtOya8w
	ItUy5Y2dDYx2+yQzE+YjVY/1M112Kqvz30cIJ4DgOtvTZ0fn5YGJQI/12JUIn9xCkr3dl6r20LN
	kyzYOFYyTz6ZmhbKpyhJcirDzTGFl9IxLkiK79EmROkomNKzHpfTPju9MuWjvS9xjRcG7dbm1e8
	QijrjrB7Ztq9I94+Gotc43v9KcwaIoTLGAUIAB32bNmYk9wT+xQRmbovOV418LvU+cxaIN7oDwV
	nQ1ggC2dxEu4CoNT7y+FVGjx13Uc8E0sQNpyBtul1HZ/KwXQXPHIN+YjDafHCP869C/ddibsQwA
	U8fiB6k7+i9XU5717TXarVs2vQEP/2imwTYX2qIqPKQ2pDsSOP3lP+giJBwbQm8XbQZ4r4fja4v
	D2ygHndtLZrFaM+mNWYpKWeVMkRWmA1DHaruUc63yaaj9csKp3DsY4KxXr0AsbemNn
X-Received: by 2002:adf:fd86:0:b0:475:f3c5:f8a5 with SMTP id ffacd0b85a97d-47de66987a8mr5419185f8f.15.1783443981683;
        Tue, 07 Jul 2026 10:06:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:21 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:40 +0100
Subject: [PATCH v2 08/20] media: imx355: Remove link_freq_index from each
 mode as ununsed
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-8-1683ec07b897@raspberrypi.com>
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

The link_freq_index value in imx355_mode is unused, so remove it.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index cfc47b5100c4..20cf6afee43e 100644
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
@@ -365,7 +361,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 2615,
 		.fll_min = 2615,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3280x2464_regs),
 			.regs = mode_3280x2464_regs,
@@ -383,7 +378,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 2615,
 		.fll_min = 2615,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3268x2448_regs),
 			.regs = mode_3268x2448_regs,
@@ -401,7 +395,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 2615,
 		.fll_min = 2615,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_3264x2448_regs),
 			.regs = mode_3264x2448_regs,
@@ -419,7 +412,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1940x1096_regs),
 			.regs = mode_1940x1096_regs,
@@ -437,7 +429,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1936x1096_regs),
 			.regs = mode_1936x1096_regs,
@@ -455,7 +446,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1924x1080_regs),
 			.regs = mode_1924x1080_regs,
@@ -473,7 +463,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
 			.regs = mode_1920x1080_regs,
@@ -491,7 +480,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1640x1232_regs),
 			.regs = mode_1640x1232_regs,
@@ -509,7 +497,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1640x922_regs),
 			.regs = mode_1640x922_regs,
@@ -527,7 +514,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1300x736_regs),
 			.regs = mode_1300x736_regs,
@@ -545,7 +531,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1296x736_regs),
 			.regs = mode_1296x736_regs,
@@ -563,7 +548,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1284x720_regs),
 			.regs = mode_1284x720_regs,
@@ -581,7 +565,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 1306,
 		.fll_min = 1306,
 		.llp = 1836,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
 			.regs = mode_1280x720_regs,
@@ -599,7 +582,6 @@ static const struct imx355_mode supported_modes[] = {
 		.fll_def = 652,
 		.fll_min = 652,
 		.llp = 3672,
-		.link_freq_index = IMX355_LINK_FREQ_INDEX,
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mode_820x616_regs),
 			.regs = mode_820x616_regs,

-- 
2.34.1

