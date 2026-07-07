Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC68437857
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 17:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443983; cv=none; b=bhGDXTjq+0BGpI/UJ3/9JD6ioLyG5bqVizDKXEnSLSAfjhcZS0mVx0CrflRiBY1hEgCH+W63QrMhkDB80y99TcAXamSKhuKToehtG4fhGRN4HAeoEPhxuyf0kg2pI3v221rFbOCnEYZwoppzKQ+NuVLl357ILJqLk8h2U+xAbvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443983; c=relaxed/simple;
	bh=6wybT/vQ3s3sa5L9zjoKLE7sUmMRn61udW215atpXmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZuYEGh6MzdDmQ/ZtcpCRj5L2XCyevIFrd331HG9/AsNek3vrmGwav8KoDsllfXl9bmyqd7H06XXJekeMfqs2ofQEO7fJu7nBdN84Ekh29yjCIiIXEhn3ZGpDbXkeab6BSBhdoH0V5E0kk6K+ZJIZOK/EG0NZRmwCwQjJpZ6EUuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=VfQ5JSnu; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="VfQ5JSnu"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4728c12ba97so2597038f8f.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443979; x=1784048779; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IY7qdRiJ97lzkzmxC3qyXU+HQqSneRV9zIsrzkIBGW0=;
        b=VfQ5JSnuQUt1lSa6ICfNuw9uO0d8ri1CUn/2JSRG1E1MtlFU7RxVr5vgWfw+LH7QLW
         jlQPicfL/TaKU1p3pBwnUixuBLrSQeHD9TaIrqA33OphfMLTKZDEzmYs9Mp7bKKNBmcf
         kg5Ugf/5CXBWl60jo/PKh6cWdklAGreGrdNBQ+ib+MhsJKQ6EhnYCuPX1udCUs7vSbSi
         osGd5DZfNgtJ+PtxJbmKUZF8x3uyxouaxcLCbIyK+eDAv84df6U/uDuGXuTh62OCUTHy
         rV5QJjfzzjPmSGXj2358wzDfGSKcEHY4JS1y+89sNum6uz0+cg1dleRQPmGlHbVTTb1t
         OYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443979; x=1784048779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IY7qdRiJ97lzkzmxC3qyXU+HQqSneRV9zIsrzkIBGW0=;
        b=CzG5bSLHVjE2OTJaPEeqbEUF2QFcT/Em1ORiFeOcPh+ZqO2m+FCkcb2OZq+PYvD97A
         kavagvnHz0WmUmIlMSkyGTTv6pXrc5flAwWsBY7nYQ54fbiolxU0BRjqw9ufyZlLJCB9
         ojqtceWx3dQmyLOKitD3NQ4pXaleNUXFcLC0nj+XhNn2t1HgAGEaKgcuJKmGd/OIv2tI
         SX7OP7bNNIsceMKsdfdfIqnFRUFZ+fqqqWwsPq4kmOzVtLpsGGGBO4NU623gJdz/SZqB
         c9QMKRU4TY/5sBSY4G6D2GtMAxdSF4/jdx10vZ2C5gbPyeFufEh737b3NGT826WnNGqO
         sWKA==
X-Forwarded-Encrypted: i=1; AHgh+RrEefHJykWJZ0hDavA/tYZMYGemdPVIMG+7QWTgm3CftHpN2gc5DQ7C4sky01QHs3oYvuXaqwIhfDT0@vger.kernel.org
X-Gm-Message-State: AOJu0YyIY8q4rQWbnAHVkLS1zgZLKiIo6gq+qmg58SIdje/DGVlkkZzG
	VTjKae6L3jge63leYUVYtLcb8L32VOTFR9aYryuXNPupDfbDhErpP3rfvOEmW9mdw6o=
X-Gm-Gg: AfdE7cl3UCTb7UWvNhoS9sb/+JAKQZr4hTJb8MndBKrDpfXxpfyf6qZ6OkNyUp5l/ru
	OowlvWetEnDLt13TXrxStgL2vY36zo7f5W1497Yej8+sHGPOWyf4V4xU3kSmAVa8hj4E3tjq9kY
	qGaL07/kQuh1fMaPiDhaQlZA4QdOBTgesBNpuO64EobDbUs9pTFdB5NLr10Lhz0CMAmo1C5IpB3
	VUBYJ0yr9i1Qf8eAXyUeRFzlvNTg5FpxxgiXhM1VyQMWKGUFH6gMPe9zIEWof7dmdg9Y0n3baKo
	e61xtJ0/weD1YRPKAtyWT3TgK+1NeJ4QEGPA/jlnICPCz3VucZLIHMqdYtzujTh9xsIxtZfVqbn
	uo4s+GrtZLkZZdDunT8P0pTm6oVOy2tre1PCZ7Amk/BowDGJ3k1BsUQdvSDnBuh1jdLlCaG1TsK
	haysYpAPxNBj0yWUr6Ld0Cvn9YK+pjwidZiYR9kvMHtGy5uqmZDJvbLK/tG4tecjt6
X-Received: by 2002:a05:600c:4e8e:b0:493:c83b:50d7 with SMTP id 5b1f17b1804b1-493df041398mr65931055e9.6.1783443978894;
        Tue, 07 Jul 2026 10:06:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:18 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:37 +0100
Subject: [PATCH v2 05/20] media: imx355: Programmatically set the crop
 parameters for each mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-5-1683ec07b897@raspberrypi.com>
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

Currently the cropping is set via register entries in the per mode
register lists. Add the crop information to the mode structure as
a v4l2_rect, and set the registers programmatically.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 290 +++++++++++++++++++--------------------------
 1 file changed, 121 insertions(+), 169 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 28b210f1a868..363b5667b6c9 100644
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
@@ -253,21 +261,9 @@ static const struct imx355_reg_list imx355_global_setting = {
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
@@ -275,21 +271,9 @@ static const struct imx355_reg mode_3268x2448_regs[] = {
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
@@ -297,21 +281,9 @@ static const struct imx355_reg mode_3264x2448_regs[] = {
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
@@ -319,21 +291,9 @@ static const struct imx355_reg mode_3280x2464_regs[] = {
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
@@ -341,21 +301,9 @@ static const struct imx355_reg mode_1940x1096_regs[] = {
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
@@ -363,21 +311,9 @@ static const struct imx355_reg mode_1936x1096_regs[] = {
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
@@ -385,21 +321,9 @@ static const struct imx355_reg mode_1924x1080_regs[] = {
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
@@ -407,21 +331,9 @@ static const struct imx355_reg mode_1920x1080_regs[] = {
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
@@ -429,21 +341,9 @@ static const struct imx355_reg mode_1640x1232_regs[] = {
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
@@ -451,21 +351,9 @@ static const struct imx355_reg mode_1640x922_regs[] = {
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
@@ -473,21 +361,9 @@ static const struct imx355_reg mode_1300x736_regs[] = {
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
@@ -495,21 +371,9 @@ static const struct imx355_reg mode_1296x736_regs[] = {
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
@@ -517,21 +381,9 @@ static const struct imx355_reg mode_1284x720_regs[] = {
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
@@ -539,21 +391,9 @@ static const struct imx355_reg mode_1280x720_regs[] = {
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
@@ -579,6 +419,12 @@ static const struct imx355_mode supported_modes[] = {
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
@@ -591,6 +437,12 @@ static const struct imx355_mode supported_modes[] = {
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
@@ -603,6 +455,12 @@ static const struct imx355_mode supported_modes[] = {
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
@@ -615,6 +473,12 @@ static const struct imx355_mode supported_modes[] = {
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
@@ -627,6 +491,12 @@ static const struct imx355_mode supported_modes[] = {
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
@@ -639,6 +509,12 @@ static const struct imx355_mode supported_modes[] = {
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
@@ -651,6 +527,12 @@ static const struct imx355_mode supported_modes[] = {
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
@@ -663,6 +545,12 @@ static const struct imx355_mode supported_modes[] = {
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
@@ -675,6 +563,12 @@ static const struct imx355_mode supported_modes[] = {
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
@@ -687,6 +581,12 @@ static const struct imx355_mode supported_modes[] = {
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
@@ -699,6 +599,12 @@ static const struct imx355_mode supported_modes[] = {
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
@@ -711,6 +617,12 @@ static const struct imx355_mode supported_modes[] = {
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
@@ -723,6 +635,12 @@ static const struct imx355_mode supported_modes[] = {
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
@@ -735,6 +653,12 @@ static const struct imx355_mode supported_modes[] = {
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
@@ -1073,6 +997,7 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 static int imx355_start_streaming(struct imx355 *imx355)
 {
 	const struct imx355_reg_list *reg_list;
+	const struct imx355_mode *mode;
 	int ret;
 
 	/* Global Setting */
@@ -1084,13 +1009,40 @@ static int imx355_start_streaming(struct imx355 *imx355)
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

