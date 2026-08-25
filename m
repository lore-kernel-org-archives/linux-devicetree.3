Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B397C3A7198
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 04:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787632424; cv=none; b=ibH6Y9lTKqremHVjaWb6BkRHWP5/QFcv4aHoO1tGXvKPafMRNVQ9MciyqO77J0QQY8RKUniIzM9Z2I0HAFtQAds1u5X/OFsq4GLK4cx/VskZa/C7TNom1QQial+kvK+lUlKpnaD538s+scS395H1aRXdrqYKuRN6dXS+Vfs8zQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787632424; c=relaxed/simple;
	bh=Ilgr0c2G4UGsySFV2bD0fiAVVF8lI3iPrBZ7oXN+Wgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PZO2+iepu11HNcM3XJBKX4f8KsOK+Kx6Yf1SHH/6jZ9Sl7s9nC7M3R1XD0p26emMdgoRj8C+ZrprKiC0GHaUodAB98g1YlFCX3crvS0O764lBDH1qh8dkjLYdOfa+IqtRgENi/a8/tm/TPVkqToPqfuYKVOiuyFB1rRm8FaIC48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c9K8cPqX; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c9K8cPqX"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so393328a91.1
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 21:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787632422; x=1788237222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GFuutJe+E+uxqdXe1I5xllbey7G2lsjmwPbc3FHp/cg=;
        b=c9K8cPqXigFe5zjywcRxm/M/n49+Cxa+zh+2mbO2oWIDexxYpJH8rxXXcCzup93G3+
         R2ibgROjUigyp1L3YT6t34gfmGlHlhNJR8Bfuvvb50PkHB1hR/wWuH71TRXwbr5VJ5Qx
         XnN56lnnXzsN5MM2dEDufwFOrSgHCUb0IQWeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787632422; x=1788237222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GFuutJe+E+uxqdXe1I5xllbey7G2lsjmwPbc3FHp/cg=;
        b=TS3CTOQ6NO6Kvky7ZmGShtZ9JNvLcwsvh2WDmrgptB0H53HUk8Op3+HQ0hUhP+vwWr
         n7CY5atDmnXm4f8KTFlhLgXauU42egDvBD1PMUdQ3r4kWw2+L+qukugE50w6fgbGjKdn
         2ivqcinlGeFxpV8r7QLD+uRb9CmC+6WoPJxwp/UJuMMLampxr/2UeaU581ak8r7FUe7N
         fMPbR2t6L6sOTfdXGN5jwhoycPPn92CgvBCew0x7Mdl5aLSrx8ywY966K3bcm/f6R0hZ
         u2Wer4oBsAx1DOMuwtgtViyfK1WJ+uBhxitdYh5YN1gc3iD0iWwYvVZIGX0CVLLq5Coh
         LMVA==
X-Forwarded-Encrypted: i=1; AHgh+RrRvn0bDINqoVBRiAlKK0VjMAPCx/XULF2nmr4Ra60rTfVb9pio2rjwjzOTJhMz21R4S7QL/gDfxdzD@vger.kernel.org
X-Gm-Message-State: AFuF++m3Nl1bQdZNxaXbJgURgCk2dMj51OD29Q9EW31Gay6cmTE6dcSH
	nl3ERN/3pb4kMDENIn5doUCAZ0rzZgSn4LV0luwjRCUcFwC3X9Rl1nCkp6GrGjIQaw==
X-Gm-Gg: AR+sD10+AamJLiKGiVG9C+mTTtfNxJGWOcUz4Z2zQSpXlBeho3qYAZyQfbgJuraIWjm
	cwZ4NE2rkK0OtemXF77W1+y5tgp40P9TU31z9ozuufHDA0xblvRgyXd/gBa7pDR5Hi7PZCZ0sX1
	R7eT/VW3+wD/abvyct+LbJon2gmAgTiafVRfX1oVvkFaDZCH2D5uKkaSKnhw+AGilsPM0cMg0lG
	c32/qHmUgHiBaM9UbZ2cx2qbZ4U3HavZqA58PYNvRaufvcH2GqYXxWXI9XsJ63ljiCpHDWYPhmx
	Sdh8CKd7B6UGE9cjdViSXAwCyVr7rdDi2Jr+F25Hk7xgg2DYxSu2AUGgiKdTx3R1h3AV/zLIu6K
	peGW4/C5yaBj9uXEpcBtcX4y9+ZGS9cWD/mmlpqOrIwUBkFPR+M7EE4y/Sl7m5HgTD+3qK8dGsi
	Xc9rNaqRaMsqrs6YhztH9mXbut37ytuuzTsCvcsn92faNK+OTOJVvLgq+jgzrsrlHtW/BXcq7lr
	ZX94b1hmsZKGxM+GZ6E1Qs6iKpiaU5goj/1cQqBgGtkROutYGjO1WnZDw==
X-Received: by 2002:a17:90b:164e:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-395c352fa60mr48644179a91.9.1787632422068;
        Mon, 24 Aug 2026 21:33:42 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:a442:9780:24da:cb4e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396458212absm2187823a91.0.2026.08.24.21.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 21:33:41 -0700 (PDT)
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
Subject: [PATCH v5 3/7] HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently long
Date: Tue, 25 Aug 2026 12:16:21 +0800
Message-ID: <20260825041628.988369-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
In-Reply-To: <20260825041628.988369-1-wenst@chromium.org>
References: <20260825041628.988369-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some devices the HID device is powered from an always-on power rail,
or the power rail has been left on by either POR defaults or the
bootloader. By the time the driver probes, the device most certainly
has finished initializing. There is no need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree. This is undesired, as the device tree is not fully describing
the hardware.

Switch to the new regulator_bulk_enable_and_wait() function that makes
sure a certain amount of time has passed since the regulator supplies
were actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_bulk_enable_and_wait() API
---
 drivers/hid/i2c-hid/i2c-hid-of.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index 59393d71ddb9..fdaad451e710 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -29,6 +29,7 @@
 #include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/regulator/consumer.h>
+#include <linux/time.h>
 
 #include "i2c-hid.h"
 
@@ -48,16 +49,14 @@ static int i2c_hid_of_power_up(struct i2chid_ops *ops)
 	struct device *dev = &ihid_of->client->dev;
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ihid_of->supplies),
-				    ihid_of->supplies);
+	ret = regulator_bulk_enable_and_wait(ARRAY_SIZE(ihid_of->supplies),
+					     ihid_of->supplies,
+					     ihid_of->post_power_delay_ms * USEC_PER_MSEC);
 	if (ret) {
 		dev_warn(dev, "Failed to enable supplies: %d\n", ret);
 		return ret;
 	}
 
-	if (ihid_of->post_power_delay_ms)
-		msleep(ihid_of->post_power_delay_ms);
-
 	gpiod_set_value_cansleep(ihid_of->reset_gpio, 0);
 	if (ihid_of->post_reset_delay_ms)
 		msleep(ihid_of->post_reset_delay_ms);
-- 
2.55.0.860.g4b6b3295ed-goog

