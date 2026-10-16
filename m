Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C60D4749D1
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 10:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146862; cv=none; b=LVF9x1J0r+4Mt87H5G1WWyKGof6D6P6FNefVbNS/scYnSM32Xgp2lRwsTxJtsRGbqXTJsRryxOsolZ/54hD0qOy8RqgkhCVrvqeOXuEgaAZLk1V4Jw0wlq18thINOKNsV/vfEw0pZdIFd4E5rQynGjC0TnsSgMD6I6FCt7HM+1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146862; c=relaxed/simple;
	bh=CocjqBK1bf5KCvJSo6fMTgVPCgDyzqgdFwf2wui+jZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rqk//OB3jX9NYPyKQZ+bUeVR1gCugU4fpvQruX3q2vr9/P1Kgvv4ddlJYxNHSw2O3ipMYU28XrC/Vhj7BV3AdEKE3gLr1M2K6p8JxgH6beQHqQJ+6YYF1SLTicfv6t+E3YeWOgN+uv03tupICikUbJhhQTw7VwH6ItzS1CXAi2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=nrXZQTsj; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="nrXZQTsj"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-486e70f2457so1181137f8f.2
        for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 03:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792146860; x=1792751660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vL18oGUd8P1r7kwxwBhDb5d5aEOYYG8Ck5OmuOWVWk=;
        b=nrXZQTsj4bP3VB7bYOf+GqsPDGBv0JKkU1wH83ZyjYhBNquKviOkVpYgF+XFcNuM7Z
         Sn/pc2xFQoQu0cRRVPjjh7Z258ndzXmC34VZ19ZrqOs9+78YZKRTQbZHNDIPt5e4Jqox
         KKBVOVJaog1zCmztq4SPZaXlzHa2WQByKmcm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146860; x=1792751660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2vL18oGUd8P1r7kwxwBhDb5d5aEOYYG8Ck5OmuOWVWk=;
        b=aY8vVph47hbiOfggv/6BH9nSSLtT2RyGRuxp3DTgc2K8Cf1TZr9CaFzoJXzWz57d7H
         Ka/52W93zvu9DyXIJ16Ocri4WqvH2IeaK/l3tba5HdYYTw8R+W0ZIvwjEhJJXZTSGUcn
         P0THjStKtZAsdwRBomyY2KaQGoxz244TeE1SOCT48k1ffziFHqfyN+TJTnsHgx3UayPn
         Gj2S6sIsvPiBD/aDtSXdQz/TE57hydozTzGjWNciHYtK/Fp+bk10uyxYO2o9S6rH9wHv
         O4UEsLioYsP82HB/mDEj0Y9Iza2+iX4wXvN9fX0Ql2tvARaqrg7nL7bnedFN1jqpyxp3
         HdHA==
X-Forwarded-Encrypted: i=1; AKwUvBx5x6lURKAsBz2Ot1ZdDSKfb5OsK3sZqqfJWpL9Pxp2DitPc/ZT4LTqX2OoetVfgOqe8V2JCnne9eHF@vger.kernel.org
X-Gm-Message-State: AFq9FYL+MmuwQlzcitjJLhhXYfG30NiQkY65khb8a4zpoQnSdCq9S9eg
	yALPcozpVyH4d0UfsIJ2bw5k3qgkkdTuCoaIlxkgbP7PHIIKTSOwGakRAbPv2M7hmsg=
X-Gm-Gg: AYBFou1ZGDnTMx4GzPkc4/bwAhGc0pyE+XXwg6Ddcb8I8uO7N8HJS2feLMzzY2r3RRD
	Z1H+KQqo95CIeF/J5VsMj52VBN2bGWkhMXjpEBWXNoCjXpRfbxWA0Si4trbb7VuOsublYQPIfmw
	b7TOzVMD+xgblsGJPfQjpdK+y8UdjvtO2Qm0M7YFEB89lqkEIWBWGsF01Ch3S+uqDLVfE6lvtLq
	LMqhvpteYohaOuA5omLx9P+yeZeNMqtBKecXufhWUBVgKLfZi2CZ6yX48bOk84sQTTcjw1VJff9
	otbfMUpc3pcU51Dsed7ILMOAgbOw9HLTaoLxKMhNLi4/IIkCb2dOAGFRghdR7bqXojiD8bCYpzB
	SYICbsy1GAot4dKwQ9+mY6KQ7KxanuxtdY6UCaLI1bJUbWuNRp5osUJi3TZI2tbIp8C/ehyCU7z
	ZRX3I8QQ9N9UlN4AetPZcyG1vtwy1cudfBuB2AzSYZDh7y1vqO0nmT/0WMsa9VPs69ZruyJBSnG
	Pw2l1CKS1AJG9MvKhVnM+loOn82tWCUbLCgUPnWKvFgsKkFQgaTt/M=
X-Received: by 2002:a05:6000:2583:b0:48d:ff81:5201 with SMTP id ffacd0b85a97d-48dff815434mr2832521f8f.41.1792146859019;
        Fri, 16 Oct 2026 03:34:19 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-8382-0206-0000-0000-0000-0bc0.ipv6.o2.cz. [2a00:1028:8382:206::bc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm4163148f8f.2.2026.10.16.03.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:34:18 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 16 Oct 2026 12:33:57 +0200
Subject: [PATCH v2 4/5] ASoC: pcm179x: Add compatible string for pcm1796
 and spi_ids entry
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261016-work-v2-4-9340b9555fbb@amarulasolutions.com>
References: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
In-Reply-To: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
To: Peter Rosin <peda@lysator.liu.se>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
X-Mailer: b4 0.16.0

The PCM1796 is fully compatible with the PCM1792A.

Signed-off-by: Roman Smrž <roman@amarulasolutions.com>

---
Changes in v2:
- Added missing entry to spi_ids.
---
 sound/soc/codecs/pcm179x-i2c.c | 1 +
 sound/soc/codecs/pcm179x-spi.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/sound/soc/codecs/pcm179x-i2c.c b/sound/soc/codecs/pcm179x-i2c.c
index 5337bcc7c62c..e81e20fadadf 100644
--- a/sound/soc/codecs/pcm179x-i2c.c
+++ b/sound/soc/codecs/pcm179x-i2c.c
@@ -32,6 +32,7 @@ static int pcm179x_i2c_probe(struct i2c_client *client)
 #ifdef CONFIG_OF
 static const struct of_device_id pcm179x_of_match[] = {
 	{ .compatible = "ti,pcm1792a", },
+	{ .compatible = "ti,pcm1796", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcm179x_of_match);
diff --git a/sound/soc/codecs/pcm179x-spi.c b/sound/soc/codecs/pcm179x-spi.c
index 192fee90c971..4b873f2986c7 100644
--- a/sound/soc/codecs/pcm179x-spi.c
+++ b/sound/soc/codecs/pcm179x-spi.c
@@ -31,12 +31,14 @@ static int pcm179x_spi_probe(struct spi_device *spi)
 
 static const struct of_device_id pcm179x_of_match[] __maybe_unused = {
 	{ .compatible = "ti,pcm1792a", },
+	{ .compatible = "ti,pcm1796" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcm179x_of_match);
 
 static const struct spi_device_id pcm179x_spi_ids[] = {
 	{ "pcm1792a", 0 },
+	{ "pcm1796", 0 },
 	{ "pcm179x", 0 },
 	{ },
 };

-- 
2.55.0

