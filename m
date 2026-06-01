Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A573DC4B8
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 15:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327168; cv=none; b=SHGm75767elHwtc1fYMBTR6sGdtDFnYBMGPBKvtePfHBkReE0ia460LEbtRmB8nAaFPbTcc1cX4r9SLyjhvYQuiR6jEJfhPqHP8u8RPTXJkFHRl4XNRFM+kcX/2y2Nsu1SqidhwrHEhbrCuw0GogO4BD57Z9/1uU/ST+9j8wTmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327168; c=relaxed/simple;
	bh=S8Y/SLmqiOO5N/roCezf9U+wAzAxng5Uw10f73gGxPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gTvPBu8ul/E8yCGvA98HLCX1zQqtWCXJMCaEorvPzbD0i62gj6+cyZrKjYSiyyc+2Ly0wnFjS6eKusdXanwOvCa+i5tUlDcvphJGsNOB5gCLCpM/L20MowlRnMumlv3fMydXnNQ/btV8BLXbnPI3VlhFMmOYQ376bUcfXmzaqpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ez3BPqnQ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ez3BPqnQ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45eedc94d37so2038911f8f.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 08:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327151; x=1780931951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMbWeeGe7TfgpPAVjQgWggP+Fym0ITJZjA/DygAtKOs=;
        b=ez3BPqnQg6HprkBZSv6xqhsXTAShRms5YEHj4EaMCgbYcbWvGXfZUTUmqmUQte3P4b
         nPA8+O1jPMuHQp/QQm9dUIyUORq45UXNKBxrkJ6My5DWTT8x7wg9GCZwml6Qdy4bpBE0
         YMgRlxbmfH38ctG9mgfNrYKTSeKOFwqjfON8ih0tbbrT6RsysRZkkEHGEfQ5rCPaAvKq
         eI0JJRWbFRv/dOAYZxVVQXwuF3SvUZ+yv4IgvjQjFo+AGstLGO5ZNfNnbNwMdJcnv8fY
         FCjQbKE9j1PAzBSKMlrrj/GXDW8onJB1MT7O2keqxEBh7r7RCI3tzHSxKrb+hD2eQKfS
         OWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327151; x=1780931951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nMbWeeGe7TfgpPAVjQgWggP+Fym0ITJZjA/DygAtKOs=;
        b=X7ru3upn90+oDg6fxSV8EjmflSwt0r9aj1/73kWe8f/X4vYyB7vqXGw/ofGQPFVyQS
         ndrTBKiknIcBoR2/eODP4igti8hVjUt71OpLmy6Mt+sEzLTHhIO9rvAQtIDNjcLVL3aw
         RNg12K/8NDG8Ht/mKBYQ+X1ugbYP7m1Yrfbq748o/hV09UVzbO8Oax3RCjB8BaprJFbh
         u1eAE2nk+9US/sANoXyIcl79fd0wWygOKkuTU5vnKyUNMAOTmHBhSJnVTv+KFXx21hf1
         Omy+OeDeVcWVA8GywSy72jdCiTr2fqAGgvpvhgSH8BSPf9Cx/GPR+86h5ZpOnuj6vxAN
         1sRw==
X-Forwarded-Encrypted: i=1; AFNElJ8lDEM7gyxiYqgnrHIpqL/Nab/FFZI8hro5RjscSHzt/cYsR79yFxbXs4ImQwnQGSY5+bTkCL1WJWFf@vger.kernel.org
X-Gm-Message-State: AOJu0YxT78HIFc1t/93X2llspwfjbaQ4bNHfL89S4bKQMl5yuXJshzpN
	MkXnmeXpID7jffNHjo1oN0HSRTx1QRqhgeLrahGXe5MXANp53GN2xy/v
X-Gm-Gg: Acq92OFUw5AobpCRispqqPW9Oa3JnnWXgiWYyFlqOhLzKv2VNyDlKpJHJ95bZmLc6zT
	c4Zr/E9DYtpDhRb5xhNiVjRJcAALehFmtJ28/ZBesD/nankPttkaHtx43wRrg3q79KiEb7LH0VX
	h2+KFGSvweMYDrH5isFzt/g3XTZMneM//yN3VD04KUdHtOSfe30eOWRzH4DreX1vVk9dafXxygj
	Ndy9EnE6Z5aOHXmQR32Yue1Upj9GbxhT81eyTpulaQhygiFyOt+ZcCksyvRHOlkCwK1jVFqJiUw
	wfxQXTgFdntKRnK8gqV4iK73Z7W66sxxMYgUeUEPpY+SRrqEN6ubJwHxihs9F4vS5Llmlxub7Xp
	EDiouNVyU1+vu34jAcPQt3142/umt4KsInCtS1TI4FFn4CPoFxnhvx8g2Iya3yYxo33O2eMBs5K
	bkE/jBH9adZWkBBOHPjLgwwp8=
X-Received: by 2002:adf:f190:0:b0:44f:9b70:2996 with SMTP id ffacd0b85a97d-45ef6b4f4f5mr15476481f8f.21.1780327151236;
        Mon, 01 Jun 2026 08:19:11 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cd7csm25753103f8f.18.2026.06.01.08.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:19:10 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v3 09/11] video: backlight: lm3533_bl: Set initial mapping mode from DT
Date: Mon,  1 Jun 2026 18:18:29 +0300
Message-ID: <20260601151831.76350-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260601151831.76350-1-clamor95@gmail.com>
References: <20260601151831.76350-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support to obtain the initial mapping mode from DT instead of leaving
it unconfigured.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/video/backlight/lm3533_bl.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index 36e6f027613a..f0d88b7bc229 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -34,6 +34,7 @@ struct lm3533_bl {
 
 	u32 max_current;
 	u32 pwm;
+	bool linear;
 };
 
 
@@ -247,8 +248,15 @@ static struct attribute_group lm3533_bl_attribute_group = {
 
 static int lm3533_bl_setup(struct lm3533_bl *bl)
 {
+	int id = lm3533_bl_get_ctrlbank_id(bl);
 	int ret;
 
+	ret = regmap_update_bits(bl->lm3533->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
+				 CTRLBANK_AB_BCONF_MODE(id),
+				 bl->linear ? CTRLBANK_AB_BCONF_MODE(id) : 0);
+	if (ret)
+		return ret;
+
 	ret = lm3533_ctrlbank_set_max_current(&bl->cb, bl->max_current);
 	if (ret)
 		return ret;
@@ -299,6 +307,9 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 	device_property_read_u32(&pdev->dev, "default-brightness",
 				 &props.brightness);
 
+	bl->linear = device_property_read_bool(&pdev->dev,
+					       "ti,linear-mapping-mode");
+
 	bd = devm_backlight_device_register(&pdev->dev, name, &pdev->dev,
 					    bl, &lm3533_bl_ops, &props);
 	if (IS_ERR(bd)) {
-- 
2.51.0

