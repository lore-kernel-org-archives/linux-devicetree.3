Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0C93FB7E5
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497849; cv=none; b=UwEPs6y7t5VId/3DfF8MbIgBvmvrQPobifMGeT6m5K56GP3LHKb0ycDnonw4pGknxxcAGebX59RVtTfYy+7E0oom0CDGIwPOjAbEmCojCAcl7No7Xx4v5XF/Eg0MfyHQn62CFCfo3/0/ZE/VifupJ240ZFAlkUUulJmgYoKvrwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497849; c=relaxed/simple;
	bh=XJPW9wWVGIYK13Jj227Wper/L2IcVnCSHBbetNAUY0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tMKKAdwzGvftSZJhkGkLo7F6SClCLUw8fYu75odcx2Tx5ez2hd1359Z1zlMlUAYKrWNfIG1tsZsUyzxQc+Bc7Bxsla2DV2UsePnAOL4pi3aormBW615My9K7arzh2iSHKlLFtSzbrThw3XKpZ3JgsjUjBUFaux7i8k20ce8XyUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbucWX2v; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbucWX2v"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so191421f8f.2
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 04:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497842; x=1786102642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PPCwNXXQzUx5SzGc5RGFQWtwM4MIgHKgBLvTAnTdtiI=;
        b=QbucWX2vUkkVvgFOpAgNC9g4ykz22qPanhiYrqlinSt8/GfMk+dld9sTzfSoMBtCGq
         OHsoc5dxVD1Zp6yyObFQ1d1RtCGnKlKYyhGmvtBDQ6CsPFvL3zBk/NAOFSV9+65LbXBs
         Qz+ozBtWfMjzk3+BjbLbRN2fud6uSo7VEtIW6+iKXyDadQfUB/fZJgXK8sGC8DMzzBg7
         9erfpBa2w8qQ561kHoBrCyPl4iVO0ILzy+IbJrJXSYdRSWhNCTt+UOfR0/t74p9INGeC
         yxU8x2GmI9uRiyjzIxrjCcjcrrbGju1zjDGQnbAUAH+3OiRVlcvuCePM+/qYQFXKzmXi
         eZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497842; x=1786102642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PPCwNXXQzUx5SzGc5RGFQWtwM4MIgHKgBLvTAnTdtiI=;
        b=rMnhBSmR9FnXXtCqVDlF905MSisdf9eao6dQv0UOQOGqLjOl1noaGjCJx8bDVKr5UN
         eJZazgo2LBFa29o4xJ+4gaSdRxey4KavX23qGMgKO8JR7+l0gJ5dpTTIQNgDSOfE/C3B
         vOo7T/GLFzfYPISbguwDaRz5hyQSzG60zOwi/q6RETRvgwXsjQ16k5hiD/Gde0d6/Ehs
         joM1SwTQdrrrlaQROjwqNcHMgsLfdlLRJv3uX6ApOS0mz+jpGoWJ90H/JBGblVTq5sxq
         i2n5bqXcOcd/yDE5DLc+kSnubHJ0cHnpqUu6eDw68zlUGSxhP0SZQ1Zv9iXhJMpWAe1z
         kwxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqkvjQRkAECtEZVhu5BbdCP628tToHAZIPILIzi5B7aeC6MW7cLjloL/9i3g++OvvaXRgMOoY5+35c/@vger.kernel.org
X-Gm-Message-State: AOJu0YwyGGYupkJzyvr5RqwaRQZS3PaJUxiKGTcMHNAjpLuV/ViccXH8
	oYe8iIS6FmSxI3c4EZ/IwaeaGe0UiZfxtUeNNccsTg7Tm4+9aHHC5I08
X-Gm-Gg: AR+sD13fTD4VTgWeEaQrPPgQkNtm7KBvgbfDA5ri+BvRlTdo7+M+T56w7W6UCs55aqm
	duz9zjbJXoQYK/0SB53RqR/4ZSE0e7r0vyX3YYAYuI7Q51wvan/UoOfBkQg290WBM9i9SYKUPq+
	L3VE+jXlzrH1Gg1ljd26G/uR/nY0y6R+co3MFdLUtRMrbJXXNBN2i2EOHG6E8q3S3qDDMPsUK6c
	8/b6KstO+V+TLbFYAGM2Kxzq4voBkAC11TCIEr6+/bs0AKEKMBqRPbtaYzpZPTYIPthR1hcjdPT
	l+/qLgJ2CSd5r9tkN4HJ61R9CddGp2g3ofNZfNSqR4PAJPsGXnF9Ghe75k6fHVtF7LREOGUpubg
	gamILzTzcitIaLN5Xk4CBZAoQHXurlj91Q0gs7svY18JQkTpXQOcRsCQ7aKDyldLEmm1n9Z214z
	H6cY5jcYhOGeFdJNhAImyFX7fXEJUzCDIsDp9RC0ejS8wADqTG5yaeLgJVlsd+yAG7+cpJskX+H
	Tlla1foDA==
X-Received: by 2002:a05:6000:29c2:b0:478:4de8:9b91 with SMTP id ffacd0b85a97d-47fd2b55e06mr2408925f8f.41.1785497841644;
        Fri, 31 Jul 2026 04:37:21 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm3670646f8f.34.2026.07.31.04.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:37:20 -0700 (PDT)
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
	mfd@lists.linux.dev,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v6 13/14] video: backlight: lm3533_bl: Implement backlight_scale property
Date: Fri, 31 Jul 2026 14:36:31 +0300
Message-ID: <20260731113632.158440-14-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731113632.158440-1-clamor95@gmail.com>
References: <20260731113632.158440-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the device supports linear and non-linear modes, implement the
backlight_scale property to describe this state.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
---
 drivers/video/backlight/lm3533_bl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index 666213cab667a..adcd6ac7cf229 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -141,6 +141,7 @@ static ssize_t store_linear(struct device *dev, struct device_attribute *attr,
 {
 	struct lm3533_bl *bl = dev_get_drvdata(dev);
 	int ctrlbank = lm3533_bl_get_ctrlbank_id(bl);
+	struct backlight_device *bd = bl->bd;
 	unsigned long linear;
 	int ret;
 
@@ -152,6 +153,9 @@ static ssize_t store_linear(struct device *dev, struct device_attribute *attr,
 	if (ret)
 		return ret;
 
+	bd->props.scale = linear ? BACKLIGHT_SCALE_LINEAR :
+				   BACKLIGHT_SCALE_NON_LINEAR;
+
 	return len;
 }
 
@@ -294,6 +298,8 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 
 	bl->linear = device_property_read_bool(&pdev->dev,
 					       "ti,linear-mapping-mode");
+	props.scale = bl->linear ? BACKLIGHT_SCALE_LINEAR :
+				   BACKLIGHT_SCALE_NON_LINEAR;
 
 	bd = devm_backlight_device_register(&pdev->dev, name, &pdev->dev,
 					    bl, &lm3533_bl_ops, &props);
-- 
2.53.0

