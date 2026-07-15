Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997DF388397
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 15:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784130748; cv=none; b=HIPWk3UqmyABGyW3aCmbJqXevs22L8mCqJ1JCqgTJfVwOrjMoMzbMWpfDYYL+kmpVOMTThLbC7SkOyS/COO0yhg1zZB+P7VIbfc9CbHypCuOk9vUKQyH1wI0+OCvZqvjFAQvczAb2vcAaZOuqbOLmmrSSaGudx9BDXdCx00LKTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784130748; c=relaxed/simple;
	bh=+0O8k47UhydlRcUqncJniMnLS5IQDdrGAhIJKWN0NFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b/fmKvI/CqJPpvUMe2vyrzvhoYclDpiEauXsG1npSbUccT6YECIiXI7QW2SI6HwvXzY0hjCQ666Z2KIfXmmZiLpbFdThpItxxmr019DKtvQvAdSsR4+97FNmYH0khUlwxY3xbPA6pijMAtsCKTHQqQPjm/WybxTU6+bBcN2lEHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com; spf=pass smtp.mailfrom=arturia.com; dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b=Vjc7Avmm; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arturia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arturia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arturia.com header.i=@arturia.com header.b="Vjc7Avmm"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493f45e20cdso33427255e9.2
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arturia.com; s=arturia; t=1784130743; x=1784735543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+TbjkJi/gkPxEVKLbX9I7DU/6yxxJZNJ37w9s7tlOKU=;
        b=Vjc7Avmm2u5VKYZ7z8PTKAc3FNKCXeBcgI3O0LWWNMjrFnZognTpWZARnWdXInpHNO
         qKxUIj+UgEgF1um5WWbbFcHH6aajXOOiEl8xMHcDAb8U2b02iT4rPV5gEn5SHvhJsVoU
         /zXdypHteqT+CNqOgcwAubaJejjOpO42qVPgE/pDP+JbiCfJw1g5Di9/BY+KFXiTNk17
         c3F21dmhioxnxxAhjjKGN+LYewdGqNUaMz3iNnWu2hAnteaw0k/CiUARoXpMbuluL+fc
         fAUo9+nyoe1NFzPfBfaAjlrOwdG6j1TKDxGzqdYlTl27HAG6LqrQ86KNdpc+JefvHTK4
         jU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784130743; x=1784735543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+TbjkJi/gkPxEVKLbX9I7DU/6yxxJZNJ37w9s7tlOKU=;
        b=sHzpcYxDvSRrREF0gURKvawLTOvMGHGU51nOWb9DuIAKJ+uidvrnXxx9/mJ6do5aL2
         ZiXkhvDWt0IQi0IZ6XWadphcccXRSba7r4uYeH9XreUmHKflmoJmjJG0admBU8C+AcwY
         kKFrMyqdkMdm7FrUa3u8kI3ur9xknHIdQadUWItwTiXAdRsMqgSjau/NJU6Ndv/a7d9C
         8u/iFs7aHFfHxWy/fawlKIlEz6G5f+5Lo7lBWFZG9yRrf7+hnccTcCXfwCDl4Sff9eSK
         LZVQQOmkcA82bDJ0zos++m6tM2otz6To+4JCFZ7za9GFNNxgkvyIeR+zprezlzx4sXS0
         wwJw==
X-Forwarded-Encrypted: i=1; AHgh+RpT6Bv9mJNFToYonFfk9f4LdBacAn3YF4dgf92UD987Ml1eYP6ky5C0rI5ud3bh6HxzHIA1Qy1rAf4u@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu7ibCJBlQtUpYIDnpRZgKJ1mtW+PjY8JW2zxWGK4XCuVzAB1D
	6k77ZpkyZIlz7Sd7DaG5sYjg+RUfaWHih/kf/iPtipf8oMjZM0Ef8SFE+kxTUhCQLIg=
X-Gm-Gg: AfdE7cldI9V++WgzGm4+KGiLc7e9Esgd1hyI7rGX8Q4bF11ElYR5y8vIh1Dgq0G497l
	VzPRyGipL9QWe6nKOTQRyawpDXp5TDIzcLoROPNdv0+BnVQKIhsEbMZlRLs7R+tUUGTU8ZABAxT
	aIfXhfCwtXWHPtYgr/60APajHC+hHP/2anFT/FDHOYajnNAsXrko3UAbUUWsIpfiE9yxL5g2CRF
	JsnTZJE/R+GXVFv+GkvJ/5zHKQt4W3kqwoHFcKrlV0Rqa7GkM3un+Y68iT3ZVWZb/Wuep4aMdmG
	gK+Cjg9WnT/T93sfYZnAM6IXh9ixCbx5lp9WYtJvn/02uNrp3/2MXkh7JegsVONUCqk/cjby3hL
	WP4gVi80I0TzTAKq9fhXNiFhVF2DlNIQpJHqUypqEk4/tqB6mSioAaYe5iLCROTgMSv8SvqHa70
	gbYbytwgSf6R8bSEpsf/g4WY/rSA==
X-Received: by 2002:a05:600c:1f94:b0:493:c8c6:4989 with SMTP id 5b1f17b1804b1-4953909f29cmr70140555e9.6.1784130743440;
        Wed, 15 Jul 2026 08:52:23 -0700 (PDT)
Received: from vkrawiec.lan ([2001:861:2128:c8c0:8e98:aced:6862:3133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4634e5c3sm16621663f8f.1.2026.07.15.08.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 08:52:23 -0700 (PDT)
From: Victor Krawiec <victor.krawiec@arturia.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Victor Krawiec <victor.krawiec@arturia.com>
Subject: [PATCH 4/4] regulator: fan53555: Add support for mode operations on Silergy devices
Date: Wed, 15 Jul 2026 17:51:41 +0200
Message-ID: <20260715155141.128601-5-victor.krawiec@arturia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715155141.128601-1-victor.krawiec@arturia.com>
References: <20260715155141.128601-1-victor.krawiec@arturia.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the PWM mode configurable from devicetree. Some boards require forced
PWM mode to keep the supply ripple within acceptable limits under light
load conditions

Signed-off-by: Victor Krawiec <victor.krawiec@arturia.com>
---
 drivers/regulator/fan53555.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/fan53555.c b/drivers/regulator/fan53555.c
index c282236959b1..8664659f0d80 100644
--- a/drivers/regulator/fan53555.c
+++ b/drivers/regulator/fan53555.c
@@ -21,6 +21,7 @@
 #include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
 #include <linux/slab.h>
+#include <dt-bindings/regulator/silergy,syr82x.h>
 
 /* Voltage setting */
 #define FAN53555_VSEL0		0x00
@@ -389,6 +390,18 @@ static int rk8602_voltages_setup_rockchip(struct fan53555_device_info *di)
 	return 0;
 }
 
+static inline unsigned int fan53555_silergy_map_mode(unsigned int mode)
+{
+	switch (mode) {
+	case SYR82X_REGULATOR_MODE_FORCE_PWM:
+		return REGULATOR_MODE_FAST;
+	case SYR82X_REGULATOR_MODE_AUTO:
+		return REGULATOR_MODE_NORMAL;
+	default:
+		return REGULATOR_MODE_INVALID;
+	}
+}
+
 static int fan53555_voltages_setup_silergy(struct fan53555_device_info *di)
 {
 	/* Init voltage range and step */
@@ -586,6 +599,17 @@ static int fan53555_device_setup(struct fan53555_device_info *di,
 	return ret;
 }
 
+static void fan53555_device_mode_map_setup(struct fan53555_device_info *di)
+{
+	switch (di->vendor) {
+	case FAN53555_VENDOR_SILERGY:
+		di->desc.of_map_mode = fan53555_silergy_map_mode;
+		break;
+	default:
+		break;
+	}
+}
+
 static int fan53555_regulator_register(struct fan53555_device_info *di,
 			struct regulator_config *config)
 {
@@ -686,6 +710,10 @@ static int fan53555_regulator_probe(struct i2c_client *client)
 	if (!di)
 		return -ENOMEM;
 
+	di->vendor = (uintptr_t)i2c_get_match_data(client);
+
+	fan53555_device_mode_map_setup(di);
+
 	pdata = dev_get_platdata(&client->dev);
 	if (!pdata)
 		pdata = fan53555_parse_dt(&client->dev, np, &di->desc);
@@ -695,7 +723,6 @@ static int fan53555_regulator_probe(struct i2c_client *client)
 				     "Platform data not found!\n");
 
 	di->regulator = pdata->regulator;
-	di->vendor = (uintptr_t)i2c_get_match_data(client);
 	if (!dev_fwnode(&client->dev)) {
 		/* if no ramp constraint set, get the pdata ramp_delay */
 		if (!di->regulator->constraints.ramp_delay) {
-- 
2.43.0

