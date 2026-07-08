Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE46745BD7F
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522163; cv=none; b=blQFK4ghgSDK4gtzUXYOWC6xr8jIWkijvl0BNGqqaoR3IkQLS1r1EZ17kZqpsAwaLnuUeyqz54CdV1cNsXOLEnpzgxReVtfuYD5A+OcBqNoTapBuRe6EsmdsA+hagSgWH8aC1ZMF5otOQA8Gj09U4oMK2/R5b7nn3w6ynuwRp6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522163; c=relaxed/simple;
	bh=W23XwrRaIK45UKWx+pemC8iWWRlXIUUJWHH74piX54c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JvBu0HNWZIkCl6dpUrJ7V5PoH2bAEor9Bv60Kop7RkJEeWLnGMoK9dlQCuE7ZACsjozWr7Q7kwBKBYajyAn7ugbi+o0Qh7UZYYnF4He1pCsQSyCGdJ3S6n1fEEpleW0gf1FG3Rmpfi21EaK/8qNvAMJ3tYwx6K20LiFDY8XG4F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=SRYRgKln; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="SRYRgKln"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so741567f8f.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522153; x=1784126953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJcpwUL5OnSXVi1yEj1ZgDZ7aAujN4ZxyzVguEBXsyw=;
        b=SRYRgKlnwEAbdY2mhfvJmN3I3uE5D/4t1RYTUR3AV9VrD1l3TBGVIs5TlZBIy8OZ0N
         E2ybG+v2iWu+AXHIcaWTeyu24xv+BdB4sR5+FcDcY2XOowb+4gLkIU4vjFEBSyHaFG0y
         /3P/COVlD7MEnUqDueeO88DPv3DP8ifQi05BPDJby72lPlouRA5Xg3ZTAS0YnWgPqPp0
         E0+fEPdePBxbhkggWtcdoDVphDMJpCvrA8dt3y5C1meKqoxUIy8Hp3hBhWy/ltcfXLbl
         FZpsqmdJItSxEKtGJMMXQiYzq75uvuoIKBWfp8WngG56GQfwe0S9mAH3/ZJo7Ci47Fnj
         EwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522153; x=1784126953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJcpwUL5OnSXVi1yEj1ZgDZ7aAujN4ZxyzVguEBXsyw=;
        b=HNT+E+Zn8NeeDHjlje5aplmXQQzDIaZcAjFlV1Dy8mw3SVW4eFDh7Hyr05nUa59WQj
         EblbFVxkfrsKW5ns07VJpdtv0go9axZuD99C+4BZ4nf24Jnb13mjDqQIk9UGLPIQlruy
         HNCsi3uVPGG0/D+d3GKFBulU4W5BkRnFoC3aeYmAnyqTdsBK6AstB+DPYSJgFINH/EMq
         P6VWh5M8xwMqCciLWJcSTVDNCRJ4M7dNe022s047MMijsBB5VO0wE/V8hZKuP1M60woc
         5cl4Xf2AlUkHf9obkeqCL3J8/mDeTPOlLMjZMwiZHahRTHV/85Th5UtooAojMGwWMFNP
         qQaQ==
X-Forwarded-Encrypted: i=1; AHgh+RqXzxG21/RQtcENzci52mL7mbV+LokJ3qhG80KG5K6LeYzxX1PrKrRnMMs8pbdhPsAPZS7LpqUsBdDF@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg7T9f0sczpNpVwALaiVJoKx0JLa2Oq+9JPGDoJVgcD2+H4oja
	aykuaKJx3woa6kJKFck14Fb57SfBTuPFfEoBqzA4HFsrLTSxs75AYbXyOefsuEY4CZo=
X-Gm-Gg: AfdE7clErcO8PUa8zRPkQ0PYftX4F5VawdKcj9tLhEQ2lmPclk7WbtOXezdTw0zD8UY
	9/zFezF7KInPzvwlPgx01jcDDS7KzQoXsvxZvQ0L/HTpVmi+BMWFDxcAPIkhoFsHmmAKD2CH89+
	OBmyGa2GWIxVEPbDWU+e/oBdJxPXFYoxS2TkGpRWdRVAkXp82kbNDqdRWQdhod4r2KUX0XtKpfd
	iZZXmO8WRwDXoFUo+DMws5p0g/hptUEhJOkpUt9KSOpfmeRH9yNklLcCtHTX0NA0ATzEUGk1um7
	+5PMkRS8x1VsB8RHemSJ60cC0Nv0uPOsIi/QjL7IFY+uw2kwJLVs/KSHzSskKB159gUsVznp2jA
	9vy81bFk8ucTttKAj7D1fwtYiTZC2xvk+oR0xysoi8sAuAdIUuFVpngrTLPRhUZ07TEd0wVuz9T
	qenIIL6y3eHvrOhiuoj5IktMhLybhQh/sw69rAG36CuR/2o0kftE+8DaCnvt1z9+WNxlBgGOsJk
	qc=
X-Received: by 2002:a05:600c:4512:b0:493:b7cb:c5f with SMTP id 5b1f17b1804b1-493e6893c66mr27120565e9.11.1783522152948;
        Wed, 08 Jul 2026 07:49:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:12 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:40 +0100
Subject: [PATCH v3 04/20] media: imx355: Remove setting FRM_LENGTH_LINES in
 the mode regs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-4-9df386a623d7@raspberrypi.com>
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

Registers 0x0340 and 0x0341 (FRM_LENGTH_LINES) are already written
from the set_ctrl(V4L2_CID_VBLANK) handler, so don't write them
from the mode register list.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx355.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 4eaccd9e90f1..24c883a6c520 100644
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

