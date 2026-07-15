Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB36A45BD67
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115861; cv=none; b=GwlSu38ww1+P/FiYcHSOvtxP9/2YL3nX2XzM/62rSuzlAejtIkR3hjkizNyyNFC62U01fH2WFJz9b9wQWjvfukWp0anEM0wz+S5L0q56fXgv9LeVp05E4Rkat1TiZbbCqwj6ynJdu0dJM/d/YptETwp8GlkGoCN72Wl64J9C9Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115861; c=relaxed/simple;
	bh=yrRUmnSyEvhIK7E6vTe4dWuMD4iAEtmjXkE8Ai+aFMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iGnVe3AM3gAD149OEEu+nyN4chS5yxLNQ4zf49BbCzrk8asUfuMa5gnLfHHR2nyYX0SJl8TphoLXrMEX73MJgFcBF3kE1Axr539PP1/p8A6eRNbLfbBc9GvzqqMZ/pcIgCwM+St6pzPtEveZpfqFrZ2q7hauaWOZOsbDhthvfQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=PBdq39DR; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="PBdq39DR"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493e4ccccc2so33761975e9.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 04:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115858; x=1784720658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V2rwbDSH9DqOd4xH4FVieXVkmcyN4+tA9pTQwzpFDLY=;
        b=PBdq39DRxkq1V6x9oMH5NJgtabLLtOEgmz24imrm21WJe1+hOLGEymFfiJdx5tErUT
         huLkrkYP2TfTXEzeh+fAQBThXo77ALXJRTXxQnp8u4TAbUehx/AVft9fikimHPs8ZrtP
         iCenkiZCORXY+GgHtWserCZhI3B/NKIePPTNFZ8mGOjX5ToG1MGgD9dGr5ENgNzfCPx1
         RSMhHCYCXSF+20SpWCrQOKuWdUhwlbVN+Ei3c+PtO9vOpRSK88E3sTRF2rlmXkTuJznl
         Wh6ELur1rrOvaerMY10KYG6flavLnwDwiLn22blW4SxnUsoBTbSARUBzsHOY0guWgL7n
         GtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115858; x=1784720658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V2rwbDSH9DqOd4xH4FVieXVkmcyN4+tA9pTQwzpFDLY=;
        b=BT7acASumWG2tU0hNiIgV5d0ZDtKHlKuXbcBJCjgQInSv9q4my8htgD4qTb/Nb3ct7
         CKGgOHA9TVb6STVXUZS5MBQVFZbbyZw+ZKTGafYpL56SjCFchX2X2XzzRPqnMsNVGXvK
         1dEGysekG8NJ64W4r7w1s2WJcAKDX66lncP3LynqOZnNolLYbJO+fsXOMelao+6GrhH9
         HJovrjh+3zpYEJnctbbJJheGVSKALPvBChp8oAEcjn2Fa9gmpJ8a656yvl+1ond0BaHx
         C3lYMg49IPwG7Gi9PjfR5weTuGKoQdTwy87s+okadvQ/boE0NsfuGkr/laQ17IGVHIpi
         oD9w==
X-Forwarded-Encrypted: i=1; AHgh+RpSLVT3byLVx8ueQB+FKEJoKfhPMLeLXshKnTlT1YNpAKYKyViV0QpYojHGRBGryNDhnDKusjaAFlM6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8zY3ohCeWImX3rbE7W1I1ztw9upHS6KJcdFTQj34MzdzWSAr7
	xPVgmHbz3/BJhRSCj/31454XZg2Jq+3jnWMdK7lq+iOBf65gLzvg4n99EB7QXINyc3Y=
X-Gm-Gg: AfdE7ckGgLpAQxH1rkhooTwYDQnJRqQe6UgCq5WbuO8c6ZQa5upIWoU0Ld1Dt2rsl0M
	895/ICNCO0tFOHMzEIIymO9xEBQKY7KiWEG/ZE1exwQVPn7qC4dw8FBf5csWBehQFiCq4MPSHnm
	y7p6ZsnNOdyjWmsC/VwTYZJGJrbjA4YaPUUe8wqyfOSd768uwKA2Xb8YcrfJEgzkjZabFA26lfC
	/MVySW7vOeRFbYP1SdtJcqbjUhbHClZK7lf3RxYT0wE+WoX9DCCU1yrByvAnHEp3s4wj+KQnetG
	pDL/9+yfsXVC8ng1UqsEHg7lOnyLo13Y1/RN7mE5eYeXqxqwirgSPvd0fODIpBBhQTbOt9xyRiT
	ENAnlIdvNENIE6XRxlXUkE+8qFebO/XdlBtUiNTq3GEnT28AIOkK/9oeR6KIorKxlCBBK2funBo
	+XcfJk65FEjCMBU21xfwVj20yPDTpWsx5EH7VtwbbBsaepIBZgtmnrSqw5GSGtlLmA
X-Received: by 2002:a05:600d:8445:10b0:493:c634:952 with SMTP id 5b1f17b1804b1-49538992d4cmr53020215e9.7.1784115857928;
        Wed, 15 Jul 2026 04:44:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:17 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:22 +0100
Subject: [PATCH v4 09/21] media: imx355: Remove link_freq_index from each
 mode as ununsed
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-9-f7f966fb9ffd@raspberrypi.com>
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

The link_freq_index value in imx355_mode is unused, so remove it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx355.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 95487b12939d..b329da85ddc0 100644
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

