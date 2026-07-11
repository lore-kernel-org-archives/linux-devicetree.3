Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA84E3128D7
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 20:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783802573; cv=none; b=TXnQhRdXXL4lUzc3cYGqOvOfLsBmcj317DhbrG1TaiW15RisO0vmGaS9tJ2eaN2+MgBFvEzo0c9gqJBpozMBoefGPcMNNQCqdobCjDeY1niVg+Q1Bg0912e1ok/9nrbY6s8GNXfbUotwcYIj6G4/nfL/ydMx43KyZlOWUyANO4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783802573; c=relaxed/simple;
	bh=keh7k5g99s9JFAlPqxaGS+ggiP+D3wffEqkcASw/DCs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Uctxvc8A6WvFGOfQRaG/77n6MK0LY7/sF3rIik/j6+w/ANMEYvcgjDKf0cWAsoiRJ9b7jcG6ZThmbxN+32/vUDcMfnXwk6CFpx1KZcV9vG0ydJUluDOrKN4aUfB91Om3zb0y1wnXtB/wbMTzBhfRilcu02uK2/KhvkXMb0IVh1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qtzeryNK; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qtzeryNK"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493bf73ec2aso13574285e9.2
        for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 13:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783802568; x=1784407368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1bSIbMOG7dMBWAgtFylVuhg8C83qfhMuIPQBzICKRrc=;
        b=qtzeryNKQwbRA3kgmXQEil/yVhyupYXX600fJLd46ydEjBHn+UUtGqlngxblws8Y7P
         BHwg+fOITfb6GMck8STTAkI0+tbkfiPv35q8hiIjnV2jcpbJFY3CWYJSu4gszj8+uTCe
         InOExOtd0Z84+ouhdeQXxQnN0tfaYaEEgUQetrZsRklqw7jQWehAPJiN/Kp+iSQFCZ/Y
         bkRxcJ9tRcRTTWYJTBNBqxJ39K66UckipfVMzu/oQN4tVBmpWPjvhcnqfgzy30tyYS9Z
         tY5wTgPsO9qBdtiqJKYw+JhZ1mQvPsEvvYxyCixUj9yoFmlpQrBpEy7HoAsya1QV4SNa
         /KPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783802568; x=1784407368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1bSIbMOG7dMBWAgtFylVuhg8C83qfhMuIPQBzICKRrc=;
        b=CLf8r7dutlpcVAF3NoGFxBAvzpO3mDQgZCFwfyasMWEb5hoXq1Cx8QpJj+iBGAHN7s
         jMNM+C8kudsIcYgy3szNHPGVYnQWmfl+sRSP3MkwLzqNXcpyOQFuGzXt7Y7+3m0Yr2k6
         brOdAlyjtqquIq6vbekcmFIcZlqVPcMkpFQT/I2cVUZtFA5iJdQ30B2ba/ABULUvAegs
         1RjZqBwLB5ktY9y/dJcEPOjo5pbJ5t3LzCvFXOrj20U/+tzgvV4Ot6dhw54R1je42U9c
         xrUOGb86a7tSM++R15dzmm97QeY2/8GWdsm8KnNW+YRd69G14MjtwaD09zu+Kl7gcDxa
         jRnA==
X-Forwarded-Encrypted: i=1; AHgh+RpUs10cdJXZRjYDrHx44Jftmd0tm/IE4CkU4D4LbX65gIGX9ueYJ4fhhuMyP5I/TKO/xGGmFO8L0Yrk@vger.kernel.org
X-Gm-Message-State: AOJu0YyMfFLvj59IFHMqednBX31paTcaVts9WEjmlo8nV19gSUjAIzaG
	AQq3Tvq3C3iVeQB/ivpfx5LfyTADC8jEJXm534+GFvunkJGMfk0HmBmS
X-Gm-Gg: AfdE7clTA0eK8RwayArLWKMaCjAumB62otUBo2pf3kgLJ1FX9944+PW0qgP5ujUFitK
	RdH8wpT8sadNzaqy3S+YbThf6tB8MPQTplNSk3945BJDF3JchmVSePedQkdK5V1yZe464IwWFah
	lIM0DjAts6P8vxvA/4iluu5FVBIJO+rbnsaZLQne3LTYooLz/TjP7uPvvSzV7L7uyumKXqFP0ze
	46K0KZ9Jk77waHMeGQt1cIk1mE7p4z3g4qoS8VHwSuju0EMl9dphg/te5aF1tFjnDdcBt7GsAD4
	Yxr+6d+orNJRikDayzQZT2Uqh251erXckHrrBHoXf6amoH6RVAFKCb1q1BwaA34B49PWMjPsNRx
	fKxCHkTMu7cbHiJL2cjHfpZrG2A6c5ItJslRgYrVbwiw/UirP97xI3GI5an6LZKP3i+wU2uIQZt
	AbDFRm8zqXStXuDP32GvLw68aTspLoPrqGMw==
X-Received: by 2002:a05:600c:2d56:b0:493:f639:9b2f with SMTP id 5b1f17b1804b1-493f8834f8amr22456715e9.39.1783802568144;
        Sat, 11 Jul 2026 13:42:48 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm172704725e9.2.2026.07.11.13.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 13:42:47 -0700 (PDT)
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
Subject: [PATCH v5 5/7] phy: cpcap-usb: add extcon support
Date: Sat, 11 Jul 2026 23:42:08 +0300
Message-Id: <20260711204210.197144-6-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260711204210.197144-1-ivo.g.dimitrov.75@gmail.com>
References: <20260711204210.197144-1-ivo.g.dimitrov.75@gmail.com>
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
index 2d770ff19e93..23d8709a0026 100644
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
+	if (ddata->cable != EXTCON_NONE)
+		extcon_set_state_sync(ddata->edev, ddata->cable, false);
+
+	if (ddata->cable == EXTCON_CHG_USB_SDP)
+		extcon_set_state_sync(ddata->edev, EXTCON_USB, false);
+	else if (cable == EXTCON_CHG_USB_SDP)
+		extcon_set_state_sync(ddata->edev, EXTCON_USB, true);
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
@@ -351,6 +406,8 @@ static void cpcap_usb_detect(struct work_struct *work)
 		if (ddata->mode == CPCAP_USB)
 			cpcap_usb_try_musb_mailbox(ddata, MUSB_VBUS_VALID);
 
+		cpcap_usb_set_extcon(ddata);
+
 		return;
 	}
 
@@ -369,6 +426,7 @@ static void cpcap_usb_detect(struct work_struct *work)
 
 	ddata->mode = CPCAP_IDLE;
 	cpcap_usb_try_musb_mailbox(ddata, MUSB_VBUS_OFF);
+	cpcap_usb_set_extcon(ddata);
 
 	return;
 
@@ -813,7 +871,18 @@ static int cpcap_usb_phy_probe(struct platform_device *pdev)
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

