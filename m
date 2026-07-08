Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846D53FADF1
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522163; cv=none; b=P6fdo7V8hY5qHhnatwPkHUpsDGVEMM8/LKjBfdUI/H7DnipurCbAp9VypvwzaaqWQ6zBcXxijdSic5dhhsFuRB2XQgzL1+zgPbFDrBNP+0bERaPO4ES/TQ5/V2NVFdN/guD7zyVloEJUsxZAYjxSZkeBmiPTJZAVPy+SWFCrEHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522163; c=relaxed/simple;
	bh=txsXplviUmDHwFPKQ6jWBrpAUkebsjly2sdg2MnkYvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gKVzpy6tRwzUVYScyX9AV9vOPUVoReSURkxQo2n/kWxWXuWzLi/5fxtMnBtHUqv8lGDckainb3DMGEfpgEeclruk0dRD84Baciw+3gGmr6RdAwJVYEvrmX3HAiKZO0wATg4GMUzEkp8VIH0RZWBq1cywlqxgJiKl42KdO8FyCX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=YRZDl254; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="YRZDl254"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so6061805e9.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522155; x=1784126955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hgjXoLy1TNwMfRKhbBheihYw6qXgsO9wJkLUPpf+nec=;
        b=YRZDl254+mwg1K6mexONkd7ZNLjKpvcjWtMjbF808vm5l6tAQ2K6mkL4d6hTFV1F52
         /IOMMW7W0sYrRkteZJ3TD6JIJMaWTDSVtv5eEQo4JBsktwvy8EUw4N9rUMoiQmzCJd4z
         hyFcLPtdCOaGrcC/WH4oBleIjhLxGUwkGtx+Xf7W/1romncZ+6rAXb/A/vSVC4jQwMvA
         DfK6OM/0AbMNg60/zC1jLB6CUtWeQ8YW2m7j5199xi387IuaZ0AHT/bqwHSyjgSqUAMW
         F4to890vLmm2CpTDGxp97Iy9NtmGhIS2Q5dpZXgn+5EjurPfmse9VfQihoIG6zlo9cxK
         wFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522155; x=1784126955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hgjXoLy1TNwMfRKhbBheihYw6qXgsO9wJkLUPpf+nec=;
        b=C9+7jWwyw9ftCgCod83egw3u/YkWhR+rJl7gBvko+Qe3mqXZ20xPj+SGsnJ3uhYJYW
         6f1lgApCg8LU7cfx7Pl04U9Km+msUvhRoeCfXIeURS4S3rR2nyNf5EhPFN4q01+3ql6k
         d6LfPqnWEdWL7eTAcb9M9uU6Cnfzrd8lKwMutq54DDWUgBLmSufdXb1MT34qywjWhUmh
         NjJy+gtQJLGgc2utSGmMzgpRRxd7qfi6fq4M5BGTV5I4wD9pmwCGW5yE/sZBXV4oikHH
         pMXpXY5dyE9afHiC32ccV4xE8Qiq5CGgWF89ZAWUKuTtHVZ6qmkGTXzcGNlRrged+DMs
         FLfw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+mkriIFCRNMLPM0RK6NHsM/Gknaa4drsQ+3CZ6iYEiXHaOAE5s5dRTzFlp3NlBoKy9eYZTPweMg6e@vger.kernel.org
X-Gm-Message-State: AOJu0YydxQq7MSdRS40iPoq3kAtbZ8QudEQ8+a4pg6xGdEeSTOSSp4WC
	xJPEtPjn1xdwMYRFvfeQuXfo24ZJuHmdUydztWkFXDDrWJ9YWiONQmaffqXgFkiKfaA=
X-Gm-Gg: AfdE7clvHjpGt5XxutlhiDClPboRtyXtuRUJZHd/21hM4LCpPloyVwG0kc4obck97MT
	r0S2/gnfJlnM+AX/qlRcAB/uRFnMcr1Qu684frXzq7qEAoNgBwL3YeZ1ROMPjIbpGSEPy8XgyzK
	kO8rPSZ7dNq5SeKm/mzpzTtYgZ0JdLJvoXBcRq6dcjx1E1CXwUCPf7wMaBIKXcZamnU2X8RpTAK
	lAAfm1SyyFobqb43tSjUv0pXskj1sgxz5TQQLB9tE5k2w/flBY8lRtmXZGyfC42Mg2hjlfu40+u
	qunUHDpSgTC/cfouGCjI+y4FApyJ3z/r6BWX6fvNYpCQFtqk5nrC3c/wbHIp8ngiO/FL5wRz+6e
	3vHZOSxM2lP7oWOecH3ojQio4P++n9DQyTziWCPWwiP8nE0sGjAN6tW+UjGRj9pHIP0J1wnCu8L
	vGVhKsAmFkUIuS0DdwWs3kxYcuu5AUr1YdNWat9fjoBcDNMD0YLPiBr7A8waSahlG2D6CPxb2uV
	yQ=
X-Received: by 2002:a05:600c:3acf:b0:493:e46a:ab with SMTP id 5b1f17b1804b1-493e68db6edmr29746535e9.34.1783522155321;
        Wed, 08 Jul 2026 07:49:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:14 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:43 +0100
Subject: [PATCH v3 07/20] media: imx355: Set binning mode registers
 programmatically
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-7-9df386a623d7@raspberrypi.com>
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

Compute the binning registers based on the difference between
the mode width/height vs the crop width/height.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 61 +++++++++++++++-------------------------------
 1 file changed, 19 insertions(+), 42 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 7aabd281cd3c..1010c32fe969 100644
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

