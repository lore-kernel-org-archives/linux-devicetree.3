Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680673;
	b=dUgCY/mwdyTROajRxGfe3qtV4zPHD/gILgI45KwTKC7s0z5TNxleKNo7bw2rseQhrQMo
	 svhs6FT/KTMef/x7qchGiR3M+JS/5ffYWn5ockryF3aKOBKoGrR2xdbgrZ+bIv1+6rlKn
	 u5sEkVCpoi83AczElfpz+M1MOP4rhQTaK+S7tXk69rom2o30y6Jukh7jaQhzPfFlcKX1c
	 SVmJPrsQhnUuubaem9ZlBM101+Tw3am7A/GEUv+Wt/NvBUgy23VEA/89dj3gBui+ez1q+
	 Oza4Okurum1gPOifkSxgJDHmhcJGGbeeMlXYRlC9Xr0fYCB8fW/asOGKCN6uTsx8uRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ggqaj3bggsrUOqnPqyXrXYqxV+UfImDX5TnRZxULpTQ=;
	b=fexfva7rdJfuEInbtP0FxC2CaTr7UAjc5Py0apIadnMEsAhDUp6PiCj4pamxG7Mpjw4j
	 auUkzwgup7Qkw3/Ugi40SffjSHjiiCZKV4Kfeh4C4TPSB03yJVk48zdCc1Wq1OUpdQ255
	 v+6hKFsBaefHTti5CREGm15K5aD9N8Lsswnbw5tlYzTzkAjWGOlTsuWxjnvtY11QRyu9Q
	 hYO4TQvOxdYCspK/+fG2jpaSc+Wt6rsKib/SrCiamt0K8LB7ItM4E0+WvHGsRn3Pcn+bp
	 rUXq+jb/Dm8RACJoDoLQuhLRrXF93I873ad2Rti2AHEGehW8jrBIsoIzhmK5UNLXu0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PdJvRmCB;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A5F606A324
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 04:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02A5F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PdJvRmCB
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc751eddf25so2207717a12.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 20:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680672; x=1794285472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ggqaj3bggsrUOqnPqyXrXYqxV+UfImDX5TnRZxULpTQ=;
        b=PdJvRmCBW1wQ6OU3g6wpWwu1J+p3JTzSxLtDdRYLIr9+zCvOFml0datlWZ9ZCXiSL5
         jp0vGuECBDFT6Qk+GR4a7krValxFzz4CC2Yy4WM6IlDhVb1rY1oHPLq63weM1s8yeQlx
         ODTMOxlqBLRuml0PHSxQngt/9AX7NwITY+2VM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680672; x=1794285472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ggqaj3bggsrUOqnPqyXrXYqxV+UfImDX5TnRZxULpTQ=;
        b=ngntWFJWFbpFctGwREh+3FbmchwrLQHKl50o/GZ2P4AI1n/vAdcZ2GIcFdQ5B4gUgN
         756oieiEpLbZ6bCol8efQTrv/f07CpXtJTej97XCjYfYOgj8bC2SjxMPywA6tzYoRctK
         MhjrgoRbJnTVnGbCeKorWf03e1+P4w8P6qq9E3dg02YgcaMxw7sddUaEGR4rh/hMk+Uh
         VMM1vlpEzC9kOWKNsd9jj9KuoIPzCOSejFlwiydwXu1BX51lLthujGVpI56W2mApKYNZ
         Nymye7bMWLXp+LCrEw6MXyTPgkWitt634oESZfeNDWsa4YBUiEC1+NvXXrPWgchK4cF0
         Zvhg==
X-Forwarded-Encrypted: i=1; AKwUvBz7LwqT71wEJvLaIPBrugRGm6PdcjjLajJq3Wym9ebICfi6CYj6szBiCOlVIAy0Y0tk5XXV4FGhnDRM@vger.kernel.org
X-Gm-Message-State: APuU4Z+Dk5n/8Olw93lz9ty64UH99qNahYBSjskyWmZUp5DgUJZgS449
	7fsxdvPeps3yHb31OPRWw9BYlVZBbt/+ajJcOu52qzt8qP/P2YUNW5OOKKcfanZw9A==
X-Gm-Gg: AYBFou2U8FIDJADXufvGIzDmr4mA3MTC0Qj5STEO6Ib9Bn8wAKFPh/ncQLEcfDr/j7w
	PFy8G0ks5rflkDWJ/uTQXlllbyF0cH5y1okcpSbfkssM0Fquv+t8y9pr3/37UqxP2MTeKuy9MW2
	/96RjSS3okWYpB+3jVPWNYSZvBDC2fN3ajs6A4mK7l1sTsXD5ClxrboA1WUiNETespZCwYV4kpw
	vEP6Sff0l9QRPek++5y5Y2clXmwlte8tUgXVfcqC2VSD91n+pjldZrPuKLCPMY4vKmlqEovhFC0
	4YeOLcjVB20ONmQJfoSYSqWCYsCBYJ5qY5v7RlZxlfysjw38mZNXRVXsU60MMEq6839TCLFBuJM
	XjBJ4hnTgz+zSpioBVI3GJqMBQT5Se8LGMfxSnb7ollSGHgcWAraLA4RalacuCPXf1h68q9ue/7
	UFfFkER2eOEUJctgKM8VCz7l/ljS771uYCbfcfhrnKSssj9dE24K5sqZNk443GAHUAkLcFGxi7c
	pWQTN4i98slMz1ivxVh84s5hyzJCKjrBzhD1JTWmlMR1UnidUbE3YLKGfpaVKRcSCoo7sJg2JJ+
	M1X5yNgJ1DFAyiZ9ZU+CIDCuJ1DKUZxIgFgtYbzQrv0j6MDsDluePARkkALZ/LHaBP6I93s+XQE
	ZcYGfLSs9Lxv9
X-Received: by 2002:a17:90b:562d:b0:3ac:8527:3fcd with SMTP id 98e67ed59e1d1-3ae898385a1mr9902090a91.39.1793680672423;
        Mon, 02 Nov 2026 20:37:52 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:37:51 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v7 2/8] Input: elan_i2c - Wait for initialization after enabling regulator supply
Date: Tue,  3 Nov 2026 12:37:26 +0800
Message-ID: <20261103043734.2179858-3-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Elan trackpad controllers require some delay after enabling power to
the controller for the hardware and firmware to initialize:

  - 2ms for hardware initialization
  - 100ms for firmware initialization

Until then, the hardware will not respond to I2C transfers. This was
observed on the MT8173 Chromebooks after the regulator supply for the
trackpad was changed to "not always on".

Switch to the new regulator_enable_and_wait(). This makes sure that
enough time has passed since the regulator was first enabled, satisfying
the power sequencing delay requirement. This allows the delay to be
skipped if the regulator supply was already enabled by some other part
of the kernel, such as the I2C OF component prober.

Fixes: 6696777c6506 ("Input: add driver for Elan I2C/SMbus touchpad")
Cc: <stable+noautosel@kernel.org> # needs new regulator API
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Added noautosel tag

Changes since v2:
- Switched to new regulator_enable_and_wait() API

Changes since v1:
- Delay only if the regulator was previously disabled / turned off
- Link to v1
  https://lore.kernel.org/all/20241001093815.2481899-1-wenst@chromium.org/
---
 drivers/input/mouse/elan_i2c_core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index f5e505edbc33..4bbc6cef8be6 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -36,6 +36,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
+#include <linux/time.h>
 #include <linux/uaccess.h>
 #include <linux/unaligned.h>
 
@@ -47,6 +48,8 @@
 #define ETP_FWIDTH_REDUCE	90
 #define ETP_FINGER_WIDTH	15
 #define ETP_RETRY_COUNT		3
+/* H/W init 2 ms + F/W init 100 ms w/ round up */
+#define ETP_POWER_ON_DELAY_US	(110 * USEC_PER_MSEC)
 
 /* quirks to control the device */
 #define ETP_QUIRK_QUICK_WAKEUP	BIT(0)
@@ -1260,7 +1263,7 @@ static int elan_probe(struct i2c_client *client)
 	if (IS_ERR(data->vcc))
 		return dev_err_probe(dev, PTR_ERR(data->vcc), "Failed to get 'vcc' regulator\n");
 
-	error = regulator_enable(data->vcc);
+	error = regulator_enable_and_wait(data->vcc, ETP_POWER_ON_DELAY_US);
 	if (error) {
 		dev_err(dev, "Failed to enable regulator: %d\n", error);
 		return error;
@@ -1416,7 +1419,7 @@ static int elan_resume(struct device *dev)
 	int error;
 
 	if (!device_may_wakeup(dev)) {
-		error = regulator_enable(data->vcc);
+		error = regulator_enable_and_wait(data->vcc, ETP_POWER_ON_DELAY_US);
 		if (error) {
 			dev_err(dev, "error %d enabling regulator\n", error);
 			goto err;
-- 
2.56.0.385.gac671c819a-goog

