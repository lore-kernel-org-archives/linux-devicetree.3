Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AC143787B
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 17:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443981; cv=none; b=rdNvnDk6ogxE+RJVptNKQRbWkT+I3Lhn2fqUm2TVmvugzm+lEMp5UHPIbjBFhkbGpHDcKHmJbNUQiw+gLHWakZTHGdzVYEragPc+EeYxZ57ThX1z2jGAqUZWZ32h9oCSmISuIVLCDGc8vioMX4fwfspNVPZpXtonGLnDjAcr6GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443981; c=relaxed/simple;
	bh=dWe7fdfz83IEYiqGch/t5IutS1JQedpS8VD2GVOkn6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aLhMbUwbg5rms8kr2nvXJc4NcZSRSfNVGX6X3hMMob8gh6CmB/Z82pu0eSVjTxGrQWR0E3V8vOy54JllMTOI4QgF3lBBNqKYACWz3dTH09GQDDDHsoEqKv6EsCPs8S7HjqslFLGUcSt3Uxs0ehLnIuzIdYzTa80EAtH3EDUiSuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=nXICI14h; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="nXICI14h"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47d70879764so1916756f8f.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443978; x=1784048778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9NSVFUlLgPK8add8rYXeVgvsQOurEtlqw3qn1n6vCXQ=;
        b=nXICI14hMuHxRz6onZuTjWUtD650L510k1fvOBVje1TtkBsExqm8JjzGnYTbamBimI
         OG97RUcxDiixVSYp4S4+MKJUJCGPM/I2JCkl3FLoaBwsv3LacQkdp2QEGO+hk/Kjnqgi
         dxpHHUmoSGGo7ZhYpD0W4To/JajeZY1IWxueG0SXLmK8COTA6EpA5XM2mSa/yc/jS7l8
         oZKeJ0y0Ds8fHQZUWG4W3Yimj4LHCSdGbna/RZtQnGX1cAezPUJ/Vx/W5s5AbNmfwAng
         vyJCeLOtFbo/SMxWGtGfOZGeHf59mpRL/DRB9G/H8wDMonDayPQRSMGCFUxYMgYd6d2v
         EhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443978; x=1784048778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9NSVFUlLgPK8add8rYXeVgvsQOurEtlqw3qn1n6vCXQ=;
        b=PX12ERMZ2rdor7gd1+FX+sn/0SSw0wh3JsoglvNwq2j5wXmqrPpOp2fouvHLcvAntb
         bir35wpSt724m+G4jhCT/7NrlQtdqyb8q9dFv+BZJRR/pi53B5yA/m3nBncOistybHe1
         9fDNsNY4iN3iPTppj+d0qvyKW2AyXy9GobMAVQWusyrvd3nl2+dMx7cpXvMVCyr48tr5
         MsNd+THi0EUkDPD1CGqcc/BTNgADQrZJh+s1pUiqsBPvoYExzcYSNITlURYWkpI0UG50
         s9M6QdB2UNEzH/TdhdO4gJKe+JCXnqXufGnXbL4Fa8sV4L2+03MrUPGdD8iz7vEjWOSV
         FYqA==
X-Forwarded-Encrypted: i=1; AHgh+RpAd/QWa9pT4sRVOGomnloyCn+f92A7yjP64+jcYNBZ/ozTuJluhc7A/lUR3jk7KVcTyHeY4e1E6/zp@vger.kernel.org
X-Gm-Message-State: AOJu0YyH5fC0iKjmM+w2o7/Vexy2F6Jb5DoVjjednet7SE7gBSWDYN1K
	YRDxIp7lRwrn0PlCo63DHdbDue83Bds5LOeHyMGFPlm63SJQbOpdQAo2Eofe4psiQdw=
X-Gm-Gg: AfdE7clGeRCpFtKPTdUaeC1NOqSTTu9HKyi87rzS3avqZoOONxx8AwLV+uQvS663drE
	BmghDiUqyCk3jRH4qHnajq+ELAprRF4pJ03KOyTQmwH+Q1/dCEKtoU7qw6IE4q0hqMyBUZSl6HW
	YoFiVleR5cv94ARaNn4SHOH2880lrQHq+U7CLvHSlUdBDa+l4A8GZ32ugETJyrJM7nW3yRWUSvW
	helfeMGeXVL1xxPwzXemI6OY56zq0y6M0dSWr1N0CjYpt+r/4Dot/KQ0CzHO61gdYRD8nulVYvz
	4q+4RnJEj/OW/rU6bo+nP6KvU6IjgLvp7o5IucDkOLnuFVw38kqD3wvZVJG/WD45dUW73jYLhjn
	4WX6S9IYlMBxGcMKQoF2mQPYvPtyltC5nqpIb/8aLVrpB6tvzWBL1huV4Ka2GGPXC0JqClRCA/R
	Q/4Ojv3vk6Kgl2MH4Tq6249peumsj7la6A2dZz4Te8pkJf6ZMr0v1NaPTWXFwCfEow2VNRE8iKN
	Ig=
X-Received: by 2002:a05:600c:870c:b0:492:4a70:faaa with SMTP id 5b1f17b1804b1-493df06fefbmr68802545e9.11.1783443977899;
        Tue, 07 Jul 2026 10:06:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:17 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:36 +0100
Subject: [PATCH v2 04/20] media: imx355: Remove setting FRM_LENGTH_LINES in
 the mode regs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-4-1683ec07b897@raspberrypi.com>
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

Registers 0x0340 and 0x0341 (FRM_LENGTH_LINES) are already written
from the set_ctrl(V4L2_CID_VBLANK) handler, so don't write them
from the mode register list.

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 83a59aa8b098..28b210f1a868 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -253,8 +253,6 @@ static const struct imx355_reg_list imx355_global_setting = {
 static const struct imx355_reg mode_3268x2448_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0340, 0x0a },
-	{ 0x0341, 0x37 },
 	{ 0x0344, 0x00 },
 	{ 0x0345, 0x08 },
 	{ 0x0346, 0x00 },
@@ -277,8 +275,6 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
 static const struct imx355_reg mode_3264x2448_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0340, 0x0a },
-	{ 0x0341, 0x37 },
 	{ 0x0344, 0x00 },
 	{ 0x0345, 0x08 },
 	{ 0x0346, 0x00 },
@@ -301,8 +297,6 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
 static const struct imx355_reg mode_3280x2464_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0340, 0x0a },
-	{ 0x0341, 0x37 },
 	{ 0x0344, 0x00 },
 	{ 0x0345, 0x00 },
 	{ 0x0346, 0x00 },
@@ -325,8 +319,6 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
 static const struct imx355_reg mode_1940x1096_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x02 },
 	{ 0x0345, 0xa0 },
 	{ 0x0346, 0x02 },
@@ -349,8 +341,6 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
 static const struct imx355_reg mode_1936x1096_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x02 },
 	{ 0x0345, 0xa0 },
 	{ 0x0346, 0x02 },
@@ -373,8 +363,6 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
 static const struct imx355_reg mode_1924x1080_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x02 },
 	{ 0x0345, 0xa8 },
 	{ 0x0346, 0x02 },
@@ -397,8 +385,6 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
 static const struct imx355_reg mode_1920x1080_regs[] = {
 	{ 0x0342, 0x0e },
 	{ 0x0343, 0x58 },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x02 },
 	{ 0x0345, 0xa8 },
 	{ 0x0346, 0x02 },
@@ -421,8 +407,6 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
 static const struct imx355_reg mode_1640x1232_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x00 },
 	{ 0x0345, 0x00 },
 	{ 0x0346, 0x00 },
@@ -445,8 +429,6 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
 static const struct imx355_reg mode_1640x922_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x00 },
 	{ 0x0345, 0x00 },
 	{ 0x0346, 0x01 },
@@ -469,8 +451,6 @@ static const struct imx355_reg mode_1640x922_regs[] = {
 static const struct imx355_reg mode_1300x736_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x01 },
 	{ 0x0345, 0x58 },
 	{ 0x0346, 0x01 },
@@ -493,8 +473,6 @@ static const struct imx355_reg mode_1300x736_regs[] = {
 static const struct imx355_reg mode_1296x736_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x01 },
 	{ 0x0345, 0x58 },
 	{ 0x0346, 0x01 },
@@ -517,8 +495,6 @@ static const struct imx355_reg mode_1296x736_regs[] = {
 static const struct imx355_reg mode_1284x720_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x01 },
 	{ 0x0345, 0x68 },
 	{ 0x0346, 0x02 },
@@ -541,8 +517,6 @@ static const struct imx355_reg mode_1284x720_regs[] = {
 static const struct imx355_reg mode_1280x720_regs[] = {
 	{ 0x0342, 0x07 },
 	{ 0x0343, 0x2c },
-	{ 0x0340, 0x05 },
-	{ 0x0341, 0x1a },
 	{ 0x0344, 0x01 },
 	{ 0x0345, 0x68 },
 	{ 0x0346, 0x02 },
@@ -565,8 +539,6 @@ static const struct imx355_reg mode_1280x720_regs[] = {
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

