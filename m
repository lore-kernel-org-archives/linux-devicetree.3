Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE493ACA54
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 04:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783572802; cv=none; b=R//jAxrG5wwDe2v4VdCZ1GGCXUKhoYcuMlRepjbJWXJq1FTl4NGfhUf09QB0cwZH291w8bUqUYC3iQPqW1mp1L+iQ7FLsy4xUpqGXwva9EFoYGKHqS6F/ABzstJvJYNeXHfRrfiI44mGiw7UT61bDIdOsunK4hC59UbntVNeqk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783572802; c=relaxed/simple;
	bh=mzHOAKnpIclZ+dUrEFlyAHDhi9NRf/snVduAybPIKTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xc3F9wutLwoyvEFvMRE4kAfnsEh8d9F5VEE7hnaa65/VWwqB0HpngIh+F8fsXaH9tWzWlBPlLofDpzPmNonyRXw3PKjX6ZxTgtJlsYSfKg3yEXN5fozHjWzezdUWoAJC3y/9uCbceA733mWBfpiUw1PrG3owzhscHuvv2/9RwKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVW4xiDe; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVW4xiDe"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c8894387780so825455a12.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 21:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783572799; x=1784177599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O1LTw3WK/9p+ZPz0q4JfjCRwvq1FGfxGeOWFBZeZJ2E=;
        b=RVW4xiDeN1YnumIhixUFEQYvR56ILRWmDs2pn1bIVpRGgeJ0bUKV1MldxLLDVNsmaj
         0J2uzdVCfusVLYwqzHiyZYk9B9vXAsA/g0K7SU/Mcel0PrbAJgQH0QtepZvY22vwsjeT
         RqnGU6aUfvIqPAqMtfIT1R+dTgfTNUnw3iTWddKw1pIu9iZhkkLV5RxNY4ystAUGKlT5
         qG2XYLOp+ydDqP1dmLxoEQaPL5xe0rczD+pBZ9Hu1IcNbP+HOsnwAs8poA7wvlIryJvZ
         0tM3u8xPZFTr1zKXJO04m4nady7STS84xIriJsLrQqxTVlMTsqLGjp9fPD1OQ/6Ol5zh
         zumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783572799; x=1784177599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O1LTw3WK/9p+ZPz0q4JfjCRwvq1FGfxGeOWFBZeZJ2E=;
        b=p5KWHC7ewOCyqnUzkriA4frDcdvfIapVZmTjARukdx7wnfHFSsaarmRx3M2Tj3Mgm5
         tOGWslJMHRQ1eH2zm3WeRh3Sr512+7iYjiag7+CCfHTNgPzfbvG1nL2JK9pV0d32LHEj
         E5HL8qYhg/QXrKRLD41HkxNRoX9Sd0eZKjIIT9Mu/w8DB0Qi6Ll3ASftKXeFVLcHNshA
         UGcN0I7buTLalhtT1006/MvROSWvpe98hOuPDsGDLG1Mx2cnBIReDOWgsjUYJA4/d6p0
         XV3JO0A1Ej493zJA+Vb8pi3TxxVzDxT1HZUhRkl980MERnDm7+p5I+Pmo8tUkKSRqmpA
         vc5Q==
X-Forwarded-Encrypted: i=1; AHgh+RoG7C3IkToc5yNCiiBWYg3AKdlXOF7k5Ig0TZYcvG4/iTlidvLEVz47xptemr5/9fpY0VTyBUPSqdDu@vger.kernel.org
X-Gm-Message-State: AOJu0YxQs+whU7uxQ/XqpxPZF/LcEFcyywPVQvlJzSX5uznQE+9D5FX8
	7tV9QQeimsxnlvQX2D3M0PLeJanaPOg1eAyJU8R5+W+jdAtjs1CYn9rC
X-Gm-Gg: AfdE7cnNGUHC2TbIhK2LDcjidn6dW7M8Ag48juIc9CvYEla1i3HA/DhcXeNOXtCsOBc
	/n/43FHRM9CulCJ8zoRayAtcvLSP3/giL76RhBPVASygzoh3wfgexmfAFDh7fsiXKQWx9Bw0u5n
	zlDWt6jIBa0NbCvEHK9V6ijYDrDTd5VyTd1c/i4jpTaus4W13H4+mXPEahJcM+WhSYBIUfeIg7H
	DtoQbn1k71E5MEWw9LROmoD4h/nxf30T30FRm7XBsplMOKVfr5o9DRsIhCQyatOJdxAe2EMdtSv
	E8Pz55Z44nfiPTArXF4Y7EU9vbkCjpa+j6m5c+ibqEyODs9AsG39ssJU/KO4rumLENWSKbO0fUa
	QLRlpgl45WN6QjcxeZd2jzk1hcuCfpuh6ppbzfLc6Slcro+zl25KD+uwLN1R4PPtxI0ExVj/nRV
	nokZFloG1r35Nb0+tGqg7YLIFjwsPNaREUTG34G4wd1Wm5zJMW+kllAptuFrEPAh1BsEyuCH9Ua
	gbA
X-Received: by 2002:a05:6a20:7486:b0:3c0:9c1a:894c with SMTP id adf61e73a8af0-3c0bd2ea843mr7270196637.68.1783572799026;
        Wed, 08 Jul 2026 21:53:19 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:e229:88c8:fd09:9a39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm26559252c88.0.2026.07.08.21.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:53:18 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 08 Jul 2026 21:53:05 -0700
Subject: [PATCH v2 07/11] regulator: wm831x: support software node in
 platform data
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-samsung-kp-v2-7-3c6ed4c9b3b6@gmail.com>
References: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
In-Reply-To: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 patches@opensource.cirrus.com
X-Mailer: b4 0.16-dev-b242f

Allow passing a software node via platform data to the wm831x buckv
regulators. This is useful for non-DT/non-ACPI platforms that want to
associate device properties (like DVS GPIOs) with the regulator devices
using software nodes.

If the software node is present, the driver will also attempt to read
DVS configuration ("wlf,dvs-init-state" and "wlf,dvs-control-src") from
it, falling back to legacy platform data fields if properties are missing.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/regulator/wm831x-dcdc.c  | 24 +++++++++++++++++++++---
 include/linux/mfd/wm831x/pdata.h |  2 ++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/wm831x-dcdc.c b/drivers/regulator/wm831x-dcdc.c
index 834d7c181971..ce43c51c0170 100644
--- a/drivers/regulator/wm831x-dcdc.c
+++ b/drivers/regulator/wm831x-dcdc.c
@@ -16,6 +16,7 @@
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/gpio/consumer.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 #include <linux/mfd/wm831x/core.h>
@@ -332,14 +333,26 @@ static void wm831x_buckv_dvs_init(struct platform_device *pdev,
 	struct wm831x *wm831x = dcdc->wm831x;
 	int ret;
 	u16 ctrl;
+	int dvs_control_src;
+	u32 val;
 
 	if (!pdata)
 		return;
 
+	if (pdata->swnode) {
+		struct fwnode_handle *fwnode = software_node_fwnode(pdata->swnode);
+
+		if (fwnode)
+			device_set_node(&pdev->dev, fwnode);
+	}
+
 	/* gpiolib won't let us read the GPIO status so pick the higher
 	 * of the two existing voltages so we take it as platform data.
 	 */
-	dcdc->dvs_gpio_state = pdata->dvs_init_state;
+	if (device_property_read_u32(&pdev->dev, "wlf,dvs-init-state", &val) == 0)
+		dcdc->dvs_gpio_state = val;
+	else
+		dcdc->dvs_gpio_state = pdata->dvs_init_state;
 
 	dcdc->dvs_gpiod = devm_gpiod_get(&pdev->dev, "dvs",
 			dcdc->dvs_gpio_state ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW);
@@ -349,7 +362,12 @@ static void wm831x_buckv_dvs_init(struct platform_device *pdev,
 		return;
 	}
 
-	switch (pdata->dvs_control_src) {
+	if (device_property_read_u32(&pdev->dev, "wlf,dvs-control-src", &val) == 0)
+		dvs_control_src = val;
+	else
+		dvs_control_src = pdata->dvs_control_src;
+
+	switch (dvs_control_src) {
 	case 1:
 		ctrl = 2 << WM831X_DC1_DVS_SRC_SHIFT;
 		break;
@@ -358,7 +376,7 @@ static void wm831x_buckv_dvs_init(struct platform_device *pdev,
 		break;
 	default:
 		dev_err(wm831x->dev, "Invalid DVS control source %d for %s\n",
-			pdata->dvs_control_src, dcdc->name);
+			dvs_control_src, dcdc->name);
 		return;
 	}
 
diff --git a/include/linux/mfd/wm831x/pdata.h b/include/linux/mfd/wm831x/pdata.h
index 75aa94dadf1c..d73a04c82ca1 100644
--- a/include/linux/mfd/wm831x/pdata.h
+++ b/include/linux/mfd/wm831x/pdata.h
@@ -12,6 +12,7 @@
 
 struct wm831x;
 struct regulator_init_data;
+struct software_node;
 
 struct wm831x_backlight_pdata {
 	int isink;     /** ISINK to use, 1 or 2 */
@@ -50,6 +51,7 @@ struct wm831x_buckv_pdata {
 	int dvs_control_src; /** Hardware DVS source to use (1 or 2) */
 	int dvs_init_state;  /** DVS state to expect on startup */
 	int dvs_state_gpio;  /** CPU GPIO to use for monitoring status */
+	const struct software_node *swnode; /** Software node for properties */
 };
 
 /* Sources for status LED configuration.  Values are register values

-- 
2.55.0.795.g602f6c329a-goog

