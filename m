Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1763CAE74
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 16:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783788518; cv=none; b=slSPnPkuy+Og3RgHfEvorWFIkJoJ5Xt8ZDwclil3J/IuaKgvGWyJyN7j5FfM/zz4W1gwppqG7Y20w/YlBbsJzBrdimNAk1LfNj6gVUtOawWOT2moKAYNzQ+10IW+TLA8TDUxnQsR8ujjqKao161xiIl6ZJZULFXBi1zKljiAMIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783788518; c=relaxed/simple;
	bh=JGx8vLrxPA3/wNpjLIcKZMzqlLOJCUnCsboNlS4acXk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kvdLQgyoYgOfqbFMLr04SJJoCSumXx5Um1lK42ti0AsxylRuPM1OndboLck/Qt4ptkVpf0IcLkGfcLe57nNpPwE9rFT+DJ9TfFKbe7GiFajVuCudrrYgdskE+vTUNUfCcx7Br/Myi0jC5II5jYKoFhKUfDOgbgc/6KdzDTFijys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=paI+YSnz; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="paI+YSnz"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47df6a5202bso1093764f8f.0
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 09:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783788513; x=1784393313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uUs89C+zAejcNnfDQ8q3Fa2LOUmGMmgh0ewi2+CW7gM=;
        b=paI+YSnzvxO6qXWcN2dEKfVPxgsTfvj7Re/364vviv+kbHEn1yP2wlFM1gxxGW0lra
         AfUp6Nz3evreCrBppbvWzcFKpblYGfr6JgIZtYpKa/jzMxGIDkKqvZHjrLi4EFb2PAow
         mKlUeCyIV4FXDdnSl91k4iJl6VDKgvg6+Y3wE4EnMf9trJC+AKl3ByDMHvyyqXmR9EJ3
         u/RmBy8Vt877ilmRfC/lauV7KSdZArqrpXanP6OeU77DB4ghfi0Tktw/sJmoVYYnWWo7
         wXNq1fRX8Aq9UI/g3vGd858RbOrFjvR7GS73JfWmbrV7idDdQUaK/wbJbrSMu3NqLbe2
         NDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783788513; x=1784393313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uUs89C+zAejcNnfDQ8q3Fa2LOUmGMmgh0ewi2+CW7gM=;
        b=NzQJAo/FpdHmz9qHe9y5/3D1qNHS5udFN7+jyY31afEWvtBjt3NdhIc6+Y3SEvCVCV
         0kLWiPTCSVffPGDDM3+wvqwlxze+FDUGg1HjpVra9oLoqBVpr0vEYmJkqtWR58Z39I2A
         /GUdwLX/ooNyVpziBtT2cO7sxczAFyIBvKNJIwcGpdn2TYdZLonoIFb7mkqI0KRHW+cD
         7mSkSV3zn1n72qwHu5O4GLCC1jBgcH+AmgzGS9t3KLZy0VzeNb+CNhQcQA5JTb5yz7g0
         BGSx2/8Z+Y7LznkPbIP4aj8kHiaPtC15o6SkDCyICvENM2dhm4Ly34h8oQk+izguMrV2
         PhsA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9UFFVku0qoV9Up3y/7gIMDq2G/no0yV1Us4KqXEB0TnOX0MTcbfqvQGJ/iiRpbBssjro71+qwkUSg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Iro+lhY3XwOOH34BReiUoQPLJL7jA67rkhW+naegx4ATuVVy
	A6wgYhkzUVmaR3oeYqMDu59ApdsrQ5VwmGl5oHLquBTvJj5p37qWieF/
X-Gm-Gg: AfdE7cnLrvop0UsO1YrjN9uMcD5ckbNGczGRVeQ7slf4jd5GrkEgEd+TNbieo+7Mlqw
	oP8psphKUYu1+bipiFHuavrkXYK/BMYmNlQvXfhIDBcU4lvwbCUz5CDkIvgaTeerwneBNSC/+zb
	cihCEt5Ul12BzEJExvUUVHhj2LunL7aQC8WyNIpkSBeJawuvPvhX69SCXMfxRpR/eUBnuD65606
	f0X1YyVw7Z3laqnA1x4TVgaB9qK+KtYSxEPRrJ2izIgu4vjyweNrYCW7A44SHxtQPOErDxifVx8
	FWww4jIrxKQeaP2U4yroM8xRn1ba6f8Oem1RjzlNY9vO1O2oPYe4QQHhy2rgmb7gFyZAphpVZOG
	lzhbYydo62OCHKxvzh3ZILq4mUBSzyZW1pYBzd7RnR3kB7Hn1Bu0E5bA22hrBXgYdcqt7vizQ7m
	sAld7SCCmN0BsAtDawVl+1gJTZv2F7M2mOvQ==
X-Received: by 2002:a5d:5887:0:b0:474:b860:b7b1 with SMTP id ffacd0b85a97d-47f2dca82dcmr3244640f8f.9.1783788512502;
        Sat, 11 Jul 2026 09:48:32 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d83bdsm69152875f8f.13.2026.07.11.09.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 09:48:31 -0700 (PDT)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	--cc=linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v4 4/6] phy: cpcap-usb: add extcon support
Date: Sat, 11 Jul 2026 19:47:52 +0300
Message-Id: <20260711164754.185565-5-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260711164754.185565-1-ivo.g.dimitrov.75@gmail.com>
References: <20260711164754.185565-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register an Extcon device and report the detected cable state.

The driver already determines the type of cable attached during USB cable
detection. Export the detected state through the Extcon framework so
other drivers can consume it using a standard kernel interface.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 drivers/phy/motorola/phy-cpcap-usb.c | 69 ++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/phy/motorola/phy-cpcap-usb.c b/drivers/phy/motorola/phy-cpcap-usb.c
index d4eb8086b600..8f9bea1d8a21 100644
--- a/drivers/phy/motorola/phy-cpcap-usb.c
+++ b/drivers/phy/motorola/phy-cpcap-usb.c
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/extcon-provider.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -123,6 +124,7 @@ struct cpcap_phy_ddata {
 	struct regmap *reg;
 	struct device *dev;
 	struct usb_phy phy;
+	struct extcon_dev *edev;
 	struct delayed_work detect_work;
 	struct pinctrl *pins;
 	struct pinctrl_state *pins_ulpi;
@@ -135,12 +137,23 @@ struct cpcap_phy_ddata {
 	struct regulator *vusb;
 	atomic_t active;
 	enum cpcap_mode mode;
+	int cable;
 };
 
 static bool cpcap_enable_uart;
 module_param_named(enable_uart, cpcap_enable_uart, bool, 0644);
 MODULE_PARM_DESC(enable_uart,
 		 "Enable UART on the USB connector while idle (increases power consumption)");
+
+/* List of detectable cables */
+static const unsigned int cpcap_extcon_cables[] = {
+	EXTCON_USB,
+	EXTCON_USB_HOST,
+	EXTCON_CHG_USB_SDP,
+	EXTCON_CHG_USB_DCP,
+	EXTCON_NONE,
+};
+
 static bool cpcap_usb_vbus_valid(struct cpcap_phy_ddata *ddata)
 {
 	int error, value = 0;
@@ -226,6 +239,46 @@ static void cpcap_usb_try_musb_mailbox(struct cpcap_phy_ddata *ddata,
 		__func__, error);
 }
 
+static void cpcap_usb_set_extcon(struct cpcap_phy_ddata *ddata)
+{
+	int cable;
+
+	switch (ddata->mode) {
+	case CPCAP_CHARGER:
+		cable = EXTCON_CHG_USB_DCP;
+		break;
+	case CPCAP_USB:
+		cable = EXTCON_CHG_USB_SDP;
+		break;
+	case CPCAP_USB_HOST:
+	case CPCAP_DOCK:
+		cable = EXTCON_USB_HOST;
+		break;
+	case CPCAP_IDLE:
+		cable = EXTCON_NONE;
+		break;
+	case CPCAP_UNKNOWN:
+		dev_warn_once(ddata->dev, "called with unknown PHY mode\n");
+		return;
+	}
+
+	if (cable == ddata->cable)
+		return;
+
+	if (ddata->cable == EXTCON_CHG_USB_SDP)
+		extcon_set_state_sync(ddata->edev, EXTCON_USB, false);
+	else if (cable == EXTCON_CHG_USB_SDP)
+		extcon_set_state_sync(ddata->edev, EXTCON_USB, true);
+
+	if (ddata->cable != EXTCON_NONE)
+		extcon_set_state_sync(ddata->edev, ddata->cable, false);
+
+	if (cable != EXTCON_NONE)
+		extcon_set_state_sync(ddata->edev, cable, true);
+
+	ddata->cable = cable;
+}
+
 static void cpcap_usb_detect(struct work_struct *work)
 {
 	struct cpcap_phy_ddata *ddata;
@@ -275,6 +328,7 @@ static void cpcap_usb_detect(struct work_struct *work)
 
 		ddata->mode = CPCAP_DOCK;
 		cpcap_usb_try_musb_mailbox(ddata, MUSB_ID_GROUND);
+		cpcap_usb_set_extcon(ddata);
 
 		/*
 		 * Force check state again after musb has reoriented,
@@ -303,6 +357,7 @@ static void cpcap_usb_detect(struct work_struct *work)
 
 		ddata->mode = CPCAP_USB_HOST;
 		cpcap_usb_try_musb_mailbox(ddata, MUSB_ID_GROUND);
+		cpcap_usb_set_extcon(ddata);
 
 		return;
 	}
@@ -341,6 +396,8 @@ static void cpcap_usb_detect(struct work_struct *work)
 		if (ddata->mode == CPCAP_USB)
 			cpcap_usb_try_musb_mailbox(ddata, MUSB_VBUS_VALID);
 
+		cpcap_usb_set_extcon(ddata);
+
 		return;
 	}
 
@@ -359,6 +416,7 @@ static void cpcap_usb_detect(struct work_struct *work)
 
 	ddata->mode = CPCAP_IDLE;
 	cpcap_usb_try_musb_mailbox(ddata, MUSB_VBUS_OFF);
+	cpcap_usb_set_extcon(ddata);
 
 	return;
 
@@ -781,7 +839,18 @@ static int cpcap_usb_phy_probe(struct platform_device *pdev)
 	if (!otg)
 		return -ENOMEM;
 
+	ddata->edev = devm_extcon_dev_allocate(&pdev->dev, cpcap_extcon_cables);
+	if (IS_ERR(ddata->edev)) {
+		return dev_err_probe(&pdev->dev, PTR_ERR(ddata->edev),
+				     "failed to allocate extcon device\n");
+	}
+
+	error = devm_extcon_dev_register(&pdev->dev, ddata->edev);
+	if (error < 0)
+		return error;
+
 	ddata->mode = CPCAP_UNKNOWN;
+	ddata->cable = EXTCON_NONE;
 	ddata->dev = &pdev->dev;
 	ddata->phy.dev = ddata->dev;
 	ddata->phy.label = "cpcap_usb_phy";
-- 
2.39.5

