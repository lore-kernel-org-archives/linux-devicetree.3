Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A825045A2AB
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 10:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037097; cv=none; b=EETMGruYbFW+eZ2c7ipMupaJcDKpZizeAX2lsBlzdP2FDtasT7X0bp8CAuWlquMBAqCV9+CZwafa79NC2oNiDEsEzpyuVe9mDJ4K22pMT7DpgQ/pN8Wd1KT6iqmIylu2VBmhCCUCB6HZJBANcOZc+TO73VIvBXaB5pKqz6cvVN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037097; c=relaxed/simple;
	bh=je4IU/IAiNq5H5O0okakTCOl1tHQPQzrOgxF5PvigMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gQhhROVO+f4LlsImVo0EfNU+1U/ceAb+JUqHaBBijmDMcMTL1I6VCkHCdBsRsvFjTchjYxVcpCTURYIr8/1g8RikZUtnCQTdgEZRHvHi+of7BR/YNu90icZrrFadBqM00xYCvB9CAfLGDvJAn164LlpUUh2KTtVU9ijysg9gmIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XTm2ur24; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XTm2ur24"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b94fce6e8so9993555e9.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 03:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789037089; x=1789641889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oFwgLyL207NuimkwPEL2xJQg2+Ohyu6vwh5w42Gzx6g=;
        b=XTm2ur247I3tfEhieZ+NSA6FJwNFLzoEsdPc0bJ/++aCDpEWFrMJHkLcqBZ8jRu/Sn
         zELSOsc32E1CP9AnUzvJzaYX8DXjndKQpqG9M7WFAekdgAuYaaH4oGh1hz2hJIcmFSai
         I5IAGoes3sGeJ5cm/PGWiu0qfUM/uMLSCO7tPDZ+3pcNOXz9mPhyylTtQGYbBrPeArry
         DLPdTWcXoCI3FTngRkVnahiqAsGBZabBWlk0PvKc4GNcBogd321aCuQAgEcwZXYNmzW1
         t2A3JaXOqOZ9lY3O5K+v0bG2n4fwWX5n7d2fbOpFlNR0JoAb184SJTOl5oVkNEI+QfRl
         Xnyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789037089; x=1789641889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oFwgLyL207NuimkwPEL2xJQg2+Ohyu6vwh5w42Gzx6g=;
        b=C5c3p2zIzqmIpjIu8AO8uvrbfkq0zeQhGlDdG2hPkn5c9KqkmvoMDWnPqAXci8RWut
         yOQDfQ1W7pAKJ935X9z0J27XNkUPENjmroQujJoXGO6vxaN21aH1yHknz1FFQiXrug8e
         JGxgHFTG4cTuFHtTdOzJWV6DnOjZ5hxlkPzgs+gich3iqPdV/SZE5j2Rxz5fWh9PdxcL
         ogVnCkiDaxJlcVDZZ5rhZIOxCwYnidGJjCjMgxDsPeY1/xIMFCF1R+yiW8+I5cb3H92i
         lcbEAzsmu4Cr8swvfUkXXrlFPiwkzTvzrkZXGXw67TvVuhhhgP2SQO/ceTim8bRPuEp1
         ewkw==
X-Gm-Message-State: AFuF++m0D/xCay8IW1bE8vvgQ5/JG4AoXyjEa/EmSnmYM4yNfkga9gbR
	1gHxjyEPe/Jd04vPTCUXgf8aO2ExE7dImgfkaojmBqqAfeVwdVnj+sWdHPoK5VY7ko0=
X-Gm-Gg: AYBFou2m2t5By33qyCrSTBVffQLu9c9a9Dl4dn/fr12GSgrxzpVQda7o6opYnYyTV7P
	b5O05J75fbdJg5DkwucdsO8gk3AlpQibH9meUO+xBDVESFygOe/BIilpnGUeBhK6eE2a7+OawJ/
	EwE/k9jO8welg9IaVJU+ac3+9fMvhM0fn8kfuWQpIt6kki7ZHFxKPH0QQHVFAD5NKYCE+qMGG2S
	CaVpu8zc36/1ezDaBuyrU3XR6wjCp1eGmY8YHiQ3aBWV1NlX2s27t/1eo1RUKrd8n3j7TSqmnPQ
	o7N+3m9I1egTTibqSAqvjfy2rOBGOyjIsAPmnjexsy5UPcz0g7zM5+33sbAFVAsZlIyaehA8lBd
	eDWWD3a8KwtUIK0ZGWEeHJo8vhvzFcxvYXkfXCEok0WmPwoocr581dAUtN0wRsgn2XKuZQO/58P
	tG3vwehsEa0J6lCBKq93tgpezIQPZmw0tbLachnQ+zQJdYGsL9rRDbCrJatOT9gjJJyB+GoqVCN
	e/IvHc4Wenj9K867A==
X-Received: by 2002:a05:600c:4f4b:b0:49d:1fd8:b874 with SMTP id 5b1f17b1804b1-49d2590a8aamr63493805e9.19.1789037089485;
        Thu, 10 Sep 2026 03:44:49 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fc1be3sm59311885e9.4.2026.09.10.03.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:44:49 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 10 Sep 2026 12:44:36 +0200
Subject: [PATCH v8 2/5] mfd: axp20x-i2c: Fix i2c instantiation
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-axp318-regulator-v8-2-e906a61a7f3d@baylibre.com>
References: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
In-Reply-To: <20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Hans de Goede <hansg@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sunxi@lists.linux.dev, 
 Sashiko <sashiko-bot@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3852; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=je4IU/IAiNq5H5O0okakTCOl1tHQPQzrOgxF5PvigMM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqoooXI2FPbcy5D4dzaZLIQfK0JjInNHjIj/fsQ
 C2n7o393jWJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqKKFwAKCRDm/A8cN/La
 hcYjEACMMwiVJofpRxE5wvVz8a5UJPrh5vMeNxuETytkLx6pEu4wj/5Vd3oH/Ijh8pEUCbBTU2E
 CaJLHpMHIiMREmTK3U3bk//62uew5b68ZGF9ABO4OXPv1VhjJkS2BXk9Veb1vWWeqdbrL+I8G2E
 V97hM7Jfrhn0McyS6uOttH45cE0oPS0oQwsiMW3k3XwiKmXwhS/UsuDYGudk99sKd9qTix8WlQP
 w7SM8F8JLocGKhi2ZHAKgLBdwDgIpdO53baiC3+LWMaFzLMfxVdMYN2wBmhkMjin58fxNXr/70n
 83NPdV0x3jJ9T7VFEU5mV3mG685ZJZipllGx0BDVRPUjsRdvY3/nprekZ1Y7k5nl877fX5YbSgI
 t82+BAxr4mrFhTKWk/eNT7+zKMK1oypunbaEtiFKPvakLsB5je5v77RtvOGG9NoRS65KquLClfn
 Dh7qF+cM3wngtumnzIY7TV5H+vH7qgWfeEv8xCtBtJ03j0S5STgBteCAREueO2ypoUOMrxLOcdS
 LmlDY2GYAz1Sg9g4/Oh1rXZJWxCqNhYqSQRC5NX5ApGLIDaBShA4pTKRZEyVV7sxgu8o/mPzt7p
 xNPQA30W1rWcMZd19ko+k1aiQDJXPBjQAMRAfK804dz6wWel6pqxNPCSfq3/rDXPS3CjxVpvpoJ
 867+tHFELvOIvvA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Apparently this device never really supported i2c instantiation via
sysfs, because the driver does not even look at the i2c device data,
which are not set. It would only probe if the device matched through DT.

Fix that for correctness, even-though it is probably useless.
Add the missing AXP323 while at it.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260717090209.2A09B1F000E9@smtp.kernel.org
Fixes: 41751b033aaa ("mfd: axp20x-i2c: Add i2c-ids to fix module auto-loading")
Acked-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mfd/axp20x-i2c.c   | 24 +++++++++++++-----------
 drivers/mfd/axp20x-rsb.c   |  1 +
 drivers/mfd/axp20x.c       |  1 -
 include/linux/mfd/axp20x.h |  3 +--
 4 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
index 5c93136f977e..a76bec5604c4 100644
--- a/drivers/mfd/axp20x-i2c.c
+++ b/drivers/mfd/axp20x-i2c.c
@@ -35,6 +35,7 @@ static int axp20x_i2c_probe(struct i2c_client *i2c)
 	axp20x->irq = i2c->irq;
 	dev_set_drvdata(axp20x->dev, axp20x);
 
+	axp20x->variant = (kernel_ulong_t)i2c_get_match_data(i2c);
 	ret = axp20x_match_device(axp20x);
 	if (ret)
 		return ret;
@@ -76,17 +77,18 @@ MODULE_DEVICE_TABLE(of, axp20x_i2c_of_match);
 #endif
 
 static const struct i2c_device_id axp20x_i2c_id[] = {
-	{ "axp152" },
-	{ "axp192" },
-	{ "axp202" },
-	{ "axp209" },
-	{ "axp221" },
-	{ "axp223" },
-	{ "axp313a" },
-	{ "axp717" },
-	{ "axp803" },
-	{ "axp806" },
-	{ "axp15060" },
+	{ .name = "axp152",	.driver_data = AXP152_ID },
+	{ .name = "axp192",	.driver_data = AXP192_ID },
+	{ .name = "axp202",	.driver_data = AXP202_ID },
+	{ .name = "axp209",	.driver_data = AXP209_ID },
+	{ .name = "axp221",	.driver_data = AXP221_ID },
+	{ .name = "axp223",	.driver_data = AXP223_ID },
+	{ .name = "axp313a",	.driver_data = AXP313A_ID },
+	{ .name = "axp323",	.driver_data = AXP323_ID },
+	{ .name = "axp717",	.driver_data = AXP717_ID },
+	{ .name = "axp803",	.driver_data = AXP803_ID },
+	{ .name = "axp806",	.driver_data = AXP806_ID },
+	{ .name = "axp15060",	.driver_data = AXP15060_ID },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, axp20x_i2c_id);
diff --git a/drivers/mfd/axp20x-rsb.c b/drivers/mfd/axp20x-rsb.c
index 059656f2a1bd..8fdc870c1fe4 100644
--- a/drivers/mfd/axp20x-rsb.c
+++ b/drivers/mfd/axp20x-rsb.c
@@ -35,6 +35,7 @@ static int axp20x_rsb_probe(struct sunxi_rsb_device *rdev)
 	axp20x->irq = rdev->irq;
 	dev_set_drvdata(&rdev->dev, axp20x);
 
+	axp20x->variant = (kernel_ulong_t)device_get_match_data(axp20x->dev);
 	ret = axp20x_match_device(axp20x);
 	if (ret)
 		return ret;
diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 4d770e718716..de6946d4bb13 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1267,7 +1267,6 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
 	const struct mfd_cell *cells_no_irq = NULL;
 	int nr_cells_no_irq = 0;
 
-	axp20x->variant = (long)device_get_match_data(dev);
 	switch (axp20x->variant) {
 	case AXP152_ID:
 		axp20x->nr_cells = ARRAY_SIZE(axp152_cells);
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index b352661d99a1..1badb4868d17 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -997,8 +997,7 @@ static inline int axp20x_read_variable_width(struct regmap *regmap,
 /**
  * axp20x_match_device(): Setup axp20x variant related fields
  *
- * @axp20x: axp20x device to setup (.dev field must be set)
- * @dev: device associated with this axp20x device
+ * @axp20x: axp20x device to setup (.dev and variant fields must be set)
  *
  * This lets the axp20x core configure the mfd cells and register maps
  * for later use.

-- 
2.53.0

