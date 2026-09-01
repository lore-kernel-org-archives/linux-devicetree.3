Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B359470453
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 07:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249008; cv=none; b=J31sQRgxRW1xsns39jCPJI+6mX54GCJdf8NPUW/YRSmgsuezjJZ/tnxjJepmixn4iYpp4LiLCDntfyk346vmkkqU6WJykmtwCkfsetOeVLfyGI/KsSQdPBhs3GJLWu3ecRzHretzbbUozT4No/UyDCZkyssppG6k16X9Cn2vwvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249008; c=relaxed/simple;
	bh=SPcW+mZp0p9SXTvYafIM3g/Oq10MKnc+TqcPitNlh8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p+X8LfPHuym8qNet3+1mnQe8qAOOhiVI3vX8KQiyADdqtRf31MwC0Cc77eIsXCamV6klY5UN8t+o9OLAEuclP73rnnXAr+Zm8F/beh6IcKnKCgl2XVnr19KhUaMOdWa8dbZjQdS9Kxkg1osXM2TpjCC6oJAqQ4euI/LMTvCNWR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Zr/ZDFJ3; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Zr/ZDFJ3"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso46479405ad.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 00:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788249004; x=1788853804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lkkm1waPZ+HrT9oYZpgc7xZ9xBFanNK2vNiOpJD6Fs8=;
        b=Zr/ZDFJ33z6iPtyMTtb6LEYHj0DKmGGV7xYUfeiTEx1TN65aGbYzIn6Ngx3GZPMBvQ
         kj0GCrxvwIRzY5r04DMSTdmuRiWaGs01ehvy0ynLmhArjdZ0pOMXwePMKcFPMg9vJ6/t
         PqEIK4SyadtP2uOUd+VAOc+pBrpLA4rMXCUaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249004; x=1788853804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lkkm1waPZ+HrT9oYZpgc7xZ9xBFanNK2vNiOpJD6Fs8=;
        b=nHJ4BrdlrpbbNltRrWGrvZ3aCja6Sav4H9EFS5qWaMyXJceVug+zs7TcDvUND24Qrv
         biZxyWCU1G7EkAMQ//Aj5DZvdLadtAcXlxipE5jId+7etSOWziBhW8esT5CMpwKTZZ/F
         75mpSiddiYM/RsxSp4ZWJVVE8NXGjb4anlpQVg8R8hwD1aX7qZh3TmPs5N7htLIqDHJW
         /XIe9hzcyBoZHmtew2bBejZKzsgSzinmaZNJsNkAHOsJIm4WOASoZiD61BZz6JxpYWcD
         zlhfH2gGJRJS4hP/+hy8gcrSxABdLmlh0SLArYSczt8wMtoEyqmzSNkp9/jMdxtOAzDR
         /kXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeFWYZDSKjnvRlhW/ii//YJrNu1PM/2vIEAwu79fX1cR9vB9Ebdar53Rt0/x1Lw8lLKE83sCYoyyw2@vger.kernel.org
X-Gm-Message-State: AFuF++nV2XwNjjkjtJ2daD2O+zLaMz282pnbNOIygT6aJc3jImy5Xc5D
	SzesPc/I850cnZ8iBUw8VuxGdqxQXv/i+ONOlc7tDq+69pq+YZ7q1bYHIN0iY/xGMg==
X-Gm-Gg: AYBFou2txaOyRAlyc65nBY2VCkaQJEKXSleueGBRgPrlSdAqw050XFJ5WSRjKP8d1+g
	t2M6XrkN/oakMj6GgGBrB7EWdB28pG6YkvOX6p+f/0tO8mWkYmnkkCavlcUL0HVIGgFOWIiNu9T
	PVAESPzHuV3LBHGC5fBlOQm/Arp7kXcjFKC/bQLJwoPe8jJfVSnJlSJzQu+zOljH/IoFVJHM0Do
	7BvunMd2RPO17KD1qFJZF7WlX+JdGeQWQfEFZeNOGnzRS/cZ64iIui1jEwA/UYXkcZ+NHnxmAzB
	yOCAL8btPdG787Xs9UwCCqAfbPngxYm42Kc/rCs+VxoDrRIF6q1f+DACiE6mko79Fq4XIin+q7m
	+edEEimk9vAxKMuwyC6hxS4NajM0oa5yeH8RnpYyrPQaF5u1umBRBV31wWJ+keyamkzBCHM5UiV
	QNmtlMXbzhQxU2/kAgkVkmvWTKcqoH+mhjNGpfZZxuhqbukxZaPh7kooQXV2geXnQDJRLXyzbp0
	IfJewOdXVbOWFWfoQgLAsWjErdA4suwvIk6auteip9e+A==
X-Received: by 2002:a17:903:3d0f:b0:2d8:d4ce:7e3b with SMTP id d9443c01a7336-2d95d5fc28amr40543015ad.16.1788249004522;
        Tue, 01 Sep 2026 00:50:04 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:8cf:6df0:9c4e:f5e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm48142515ad.59.2026.09.01.00.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:50:04 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/8] i2c: of-prober: skip post-power-on delay if powered on sufficiently long
Date: Tue,  1 Sep 2026 15:49:22 +0800
Message-ID: <20260901074930.764550-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260901074930.764550-1-wenst@chromium.org>
References: <20260901074930.764550-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some devices the I2C component is powered from an always-on power
rail, or the power rail has been left on by either POR defaults or
the bootloader. By the time the prober probes the device, the device
most certainly has finished initializing and can respond. There is no
need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree and the component prober. This is undesired, as the device tree
is not fully describing the hardware.

Switch to the new regulator_enable_and_wait() function that makes sure
a certain amount of time has passed since the regulator supply was
actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_enable_and_wait() API
---
 drivers/i2c/i2c-core-of-prober.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 6a82b03809d4..f9f3c0ef93ff 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/stddef.h>
+#include <linux/time.h>
 
 /*
  * Some devices, such as Google Hana Chromebooks, are produced by multiple
@@ -226,13 +227,11 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
 
 	dev_dbg(dev, "Enabling regulator supply \"%s\"\n", ctx->opts->supply_name);
 
-	ret = regulator_enable(ctx->supply);
+	ret = regulator_enable_and_wait(ctx->supply,
+					ctx->opts->post_power_on_delay_ms * USEC_PER_MSEC);
 	if (ret)
 		return ret;
 
-	if (ctx->opts->post_power_on_delay_ms)
-		msleep(ctx->opts->post_power_on_delay_ms);
-
 	return 0;
 }
 
-- 
2.55.0.897.gb25b4bd76c-goog

