Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36E244C678
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115857; cv=none; b=dB+7gaUXlURQMcXXz6rOSoz8o2nVQHdnBxz1oektx0UfC9VG+LIVtkCFkXYv2F5QUm1YQZKZ8oiWBQzjKQ9g0lTKD1Ef7fGlbmYDV1p/c/GRRHOp6iZ+Ow1X/O8Y2D3wgrr9G9xD/xYS1uHXt/dPtGvJ3sLtj4NfbDwFUH899XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115857; c=relaxed/simple;
	bh=B3V+HwP2YfOyiyHB6H9H9T7aO3Q5SXhcKZNK2vZkcIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pOW8scabgAwCQtKZaonSyS00+/JmWUfia6F8Z0wLlMtJtRk91O3LV60MuQmE20e26StTj7XgxNLmHY8fspIipU7fK7s1tqsvkmKtNeE+q3yByOMwbibxWLPO/KRhvrHNE7N4kTCSN9rPbe1w9QD/79zIyBk3GxmZchJNKclduRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=t/fK+58R; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="t/fK+58R"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4798bea72f9so2901867f8f.1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 04:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115854; x=1784720654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3JXztZss7n+GcgZQ7d9yNTwhZSqmPdrdCaY06YjdH6M=;
        b=t/fK+58RClzIrkTFd0XZq+89d5D7omk3q4SUnpsdUuhlh2FOxwNfB4r4vsKOs2BHjN
         bS52dQpfXqDC5nuUwdnwUFqwxYHMwFtn7nszK8MT/gVCfvdNMlfVMn8ikhHYPVsowap7
         bKtEihydcVNDhH4UyCzbxyInnH8mgpfWmjyclVkoDFcvHzjMGdnOe9qt3WKGrXhbRNhu
         JpEcLtw53vP7me7nTNN0N6GlMFL8JCg2drH/fMGhDTOEbK4TseTnO2ZycBlx98MNPlPu
         gVBFO5G9Wi7FW/ju5X5bT0mOJdTMFLQOue8S+YEqMOdVKnuLf5KmtgsCdoFvK8Osd6vW
         R6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115854; x=1784720654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3JXztZss7n+GcgZQ7d9yNTwhZSqmPdrdCaY06YjdH6M=;
        b=K+oXkP3hgMOgNlhfoIK1kFgPuLwR1kqE/VbFCZKyE18QPJBoOeHLOePQCof5iUdbHU
         Pb2pwWZATBSL2vwG3entA5aC1uqSD+DrPELzfKtRpmICOL1eZi+4O1N21/lfk+ExMwpk
         h5MXiARaeIVKV1ve/pdO2QMf4ifGENQaDQWqUZdWpzONFcgXMWBz6JHZ8/ftnN6Pqcbb
         S21WQAWSuf/RBaKecNCdiPZeNX2SbcXXoTFixVVED7T82yq6LkHEgMnLZlXQcmaVLaMF
         Z4vh8baroYAl486WLxP+qak+HwvaraakmM2m6/ReFKSNg1OBFZbGZA5TURYoPpV7mWAf
         DQww==
X-Forwarded-Encrypted: i=1; AHgh+RoXn+qnebbUzzP+VdgnokjCFqHsojMPGghMuJvS6WlDoYbSgjQMrWkfFso2ZshMTiLom40sHqSZIbid@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8o4k4FPsGCdq0zIp8c/NaZTMP4P28DaEfOyqswXnnYXCe43Ub
	zCY31igzjOqu8S2VOIWxnn7xHm8LDi02/sEo0mpDxJ1GPfksMQ8cwCvcgYUGeIBF/Ns=
X-Gm-Gg: AfdE7ckJqM6ymogbDkBSIZq27JXq8uQS93KwsvrBDiRb1mvy6y3l1WCggcYDN6sPC0Z
	0tFI/4dXDA+nVEC3pEwpNAb0xuX4Hiv3ndjq9iBXjOgZx1xpNQ4hiKRxwoac9e7oo2efDBx0W4n
	MoSxSGSeB3vcwBO/7xIihSHyzpvk412gRwI7uz7NXc0RA8tIu2HUuF4JnJkHOCL4/gB4XcFr7jR
	l7V5pAR8SwvyBpiSRgATKedW9gDNwk2RiOdBDEo7K9lcFvpKKDK9qPRXl+MArT8v26b8M7du9DE
	zcTxNG0SUXZ0f9S/3Icb6lHLuuNHH2vjKsGid+UMeKOh4OB9PD5NIzv1YB5MCnFla7JZP2fwuvJ
	Par9qHBuBKIOOBuLABfC8wRlzG83ScbkbYkIC9LSJNiKIiX8+hSV/rvq2Vg6FpWTTZnYtNd2DpJ
	HLK28AMyQOTpNO5CWOlVci/13pjZ6BfRKmXYcpoZEnXpJxL6oTpZ8Nr9xYi92RPhGK
X-Received: by 2002:a05:600c:e547:10b0:493:f7d9:8183 with SMTP id 5b1f17b1804b1-495389e40admr47630215e9.39.1784115853895;
        Wed, 15 Jul 2026 04:44:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:13 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:18 +0100
Subject: [PATCH v4 05/21] media: imx355: Remove setting FRM_LENGTH_LINES in
 the mode regs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-5-f7f966fb9ffd@raspberrypi.com>
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

Registers 0x0340 and 0x0341 (FRM_LENGTH_LINES) are already written
from the set_ctrl(V4L2_CID_VBLANK) handler, so don't write them
from the mode register list.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx355.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 01d6c28a2656..b40d89d86156 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -254,8 +254,6 @@ static const struct imx355_reg_list imx355_global_setting = {
 static const struct imx355_reg mode_3268x2448_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0340, 0x0a },
-	{ 0x0341, 0x37 },
 	{ 0x0344, 0x00 },
 	{ 0x0345, 0x08 },
 	{ 0x0346, 0x00 },
@@ -278,8 +276,6 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
 static const struct imx355_reg mode_3264x2448_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0340, 0x0a },
-	{ 0x0341, 0x37 },
 	{ 0x0344, 0x00 },
 	{ 0x0345, 0x08 },
 	{ 0x0346, 0x00 },
@@ -302,8 +298,6 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
 static const struct imx355_reg mode_3280x2464_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0340, 0x0a },
-	{ 0x0341, 0x37 },
 	{ 0x0344, 0x00 },
 	{ 0x0345, 0x00 },
 	{ 0x0346, 0x00 },
@@ -326,8 +320,6 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
 static const struct imx355_reg mode_1940x1096_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x02 },
 	{ 0x0345, 0xa0 },
 	{ 0x0346, 0x02 },
@@ -350,8 +342,6 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
 static const struct imx355_reg mode_1936x1096_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x02 },
 	{ 0x0345, 0xa0 },
 	{ 0x0346, 0x02 },
@@ -374,8 +364,6 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
 static const struct imx355_reg mode_1924x1080_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x02 },
 	{ 0x0345, 0xa8 },
 	{ 0x0346, 0x02 },
@@ -398,8 +386,6 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
 static const struct imx355_reg mode_1920x1080_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x02 },
 	{ 0x0345, 0xa8 },
 	{ 0x0346, 0x02 },
@@ -422,8 +408,6 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
 static const struct imx355_reg mode_1640x1232_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x00 },
 	{ 0x0345, 0x00 },
 	{ 0x0346, 0x00 },
@@ -446,8 +430,6 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
 static const struct imx355_reg mode_1640x922_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x00 },
 	{ 0x0345, 0x00 },
 	{ 0x0346, 0x01 },
@@ -470,8 +452,6 @@ static const struct imx355_reg mode_1640x922_regs[] = {
 static const struct imx355_reg mode_1300x736_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x01 },
 	{ 0x0345, 0x58 },
 	{ 0x0346, 0x01 },
@@ -494,8 +474,6 @@ static const struct imx355_reg mode_1300x736_regs[] = {
 static const struct imx355_reg mode_1296x736_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x01 },
 	{ 0x0345, 0x58 },
 	{ 0x0346, 0x01 },
@@ -518,8 +496,6 @@ static const struct imx355_reg mode_1296x736_regs[] = {
 static const struct imx355_reg mode_1284x720_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x01 },
 	{ 0x0345, 0x68 },
 	{ 0x0346, 0x02 },
@@ -542,8 +518,6 @@ static const struct imx355_reg mode_1284x720_regs[] = {
 static const struct imx355_reg mode_1280x720_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x01 },
 	{ 0x0345, 0x68 },
 	{ 0x0346, 0x02 },
@@ -566,8 +540,6 @@ static const struct imx355_reg mode_1280x720_regs[] = {
 static const struct imx355_reg mode_820x616_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0340, 0x02 },
-	{ 0x0341, 0x8c },
 	{ 0x0344, 0x00 },
 	{ 0x0345, 0x00 },
 	{ 0x0346, 0x00 },

-- 
2.34.1

