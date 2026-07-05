Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C512367B8E
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 07:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783238331; cv=none; b=iKa1iPeLpdGhcvTaNbsThnszIXBu72h4zHRZvVk6YmFKBAp8XmfR/WFSCgEvDVwvxTdvvue4StPkrU1UvWuktaSG8LjHW+/FTnecCQhGRhJN6XQ5LNuzzDqq8gwXX505j476yp11mp8lyGRwUWfkmAs2uBIvIVqwaEjOVqpiHQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783238331; c=relaxed/simple;
	bh=qt6ETH0PLZPEtdrN7zLYk2gemtuPga9vD/OeXKZZEtQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M7hvJvbgACxYDOm3zD9wwQeUrO91c/QIB/y4Ws7ApAQhoTTaRMleMbToeauCM1zuqHN9UAka/pyScF7YCAKwKzeyTE3D0vWJkrPjd/nH8XhFEY65VrbE//moPZJkfWFF1pofq4+bPzRfyO0uT/ijHxkU5ix3CzHFcPKpBZGFCbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpbPwnuB; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpbPwnuB"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493c733f15aso19688005e9.0
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 00:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783238328; x=1783843128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZByqymHXsan4FAIX/tL67BkYQ4wx58LlUk2KuZbE1aE=;
        b=PpbPwnuBFHF5zzfTMXn2nxU4+es1AKBQtL7pVEQEvZgnRqJEGO7XC4gjQBh3w4TK6R
         paUzL+PZqHmFGXFf9Ca/TTgMLsC+zl6KvtJVwyzv8Hi+6VQ4aqeSy3FFaBwz4Sd73pT2
         2krXdq4x2tenglxRFNz4eJYD/+fDhEjd2IiTn/FNSgmcKOr2qX9vb85Kwo8q9U7pF+bd
         fXY8yL5bDntTwIr+cGlADwR1rs+MqJAQSCfnx/qJVGTwA+smIE1ZosPFII3/lrPOWw/V
         m9vtFzg6Wv1wUspuFtSgmErlRdZkNggSb6iweTbxIGZaAqX5tnUomboEOKrkAxXoWPlZ
         4pig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238328; x=1783843128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZByqymHXsan4FAIX/tL67BkYQ4wx58LlUk2KuZbE1aE=;
        b=XkraiYkyRdvYe9qo22dniKpcs9FzqD/qqQG6YaoIAYkkkkBkDvlgfoHuXlDpfhZLYX
         cgQ+pmjhJD8bEMaSfKoVEqpWdEP6a1bv5Vg88zdjHEhiL+P6Fa1hZN0Ov2L5BpvcF2iI
         gDW5VL0zSYS3ZOcJr9HHCJPhU0qVAzkyL572hrM1zE9du9l/wm6CbdGQY4ipOKcb4vsY
         6bTc/0yGlqqMLFc7cQIG/fGfCcGHukzah5N/MO+N4/ibYYMuaSi3zKA0/xs+izxgUtFw
         aHb48bnthSOXR6XGuV1PsRVbri8NzS25+vSOFPqd0UNgphf2nsns0qRkAVYZywvdgW9P
         Gr5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/SmphPybxXk1/Ghd3/LC6KRaTe8aWLPFcFANCLfvO9yMTK5LACFMsHa3TpWOk7nTBYTTNE84EAAFqs@vger.kernel.org
X-Gm-Message-State: AOJu0YzFTpynjYapa8EBY8rmJkHXbYpDILT2C7nh8EyawQUvtG0w8P5D
	8N0YBs8364cphVnR+KB4QUlmMF0EPMYV8TZ5IJzhZH+P03GsznbS+moSF99Zw7NT
X-Gm-Gg: AfdE7ckubCgwbtUtRAx9EfmcavRwrLwkEp2F35xW+nt9kEgUmpFnlxG37wiGo8//jol
	whlVLvtCxSaB+oihF8jPG11yyuiDZwqB5MRCgXeIf2jWRtxXQcjydOPVzCI9ghx6+6LaQ+b8usm
	1BBJ3+bSrGoNY2Gsy6ocSvyofGetj+BnAIUYU44/7TP8z+BdDrMPWBlceNOwC4fY5+HwYzuQcAI
	JboivYSfsJeD+JNbsKOiW/45zRjPFUfUlsljXsvzebpsMQObWaKlyAgqyO9kGmRNT4MOQJHwkvH
	oXWOMzaA4XqxEmANDDzvgi6XcjV5+oeiBgGZhDzjwws93tEtnPKC6WUFJAXxbzmj31TCiVZVQSK
	7Et5yrEf343F+JibHj7sprMCcIz8tHEndh1j0Y9X7RNuQvYwnvdZ4kfQI6MltEiVkQI/0rHZqTq
	UzZ0jMK2MeFgD3lP/CIMhLDhT4yHBTAKBXoA==
X-Received: by 2002:a05:600c:8208:b0:493:d216:ed8a with SMTP id 5b1f17b1804b1-493d216ef2amr57217655e9.16.1783238328308;
        Sun, 05 Jul 2026 00:58:48 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63bfba1sm305769765e9.15.2026.07.05.00.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 00:58:47 -0700 (PDT)
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
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH v2 5/5] phy: cpcap-usb: add extcon support
Date: Sun,  5 Jul 2026 10:58:09 +0300
Message-Id: <20260705075809.1793784-6-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260705075809.1793784-1-ivo.g.dimitrov.75@gmail.com>
References: <20260705075809.1793784-1-ivo.g.dimitrov.75@gmail.com>
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
index e776e54bbfd5..f1f2fe818324 100644
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
@@ -124,6 +125,7 @@ struct cpcap_phy_ddata {
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
@@ -227,6 +240,46 @@ static void cpcap_usb_try_musb_mailbox(struct cpcap_phy_ddata *ddata,
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
@@ -276,6 +329,7 @@ static void cpcap_usb_detect(struct work_struct *work)
 
 		ddata->mode = CPCAP_DOCK;
 		cpcap_usb_try_musb_mailbox(ddata, MUSB_ID_GROUND);
+		cpcap_usb_set_extcon(ddata);
 
 		/*
 		 * Force check state again after musb has reoriented,
@@ -304,6 +358,7 @@ static void cpcap_usb_detect(struct work_struct *work)
 
 		ddata->mode = CPCAP_USB_HOST;
 		cpcap_usb_try_musb_mailbox(ddata, MUSB_ID_GROUND);
+		cpcap_usb_set_extcon(ddata);
 
 		return;
 	}
@@ -345,6 +400,8 @@ static void cpcap_usb_detect(struct work_struct *work)
 		if (ddata->mode == CPCAP_USB)
 			cpcap_usb_try_musb_mailbox(ddata, MUSB_VBUS_VALID);
 
+		cpcap_usb_set_extcon(ddata);
+
 		return;
 	}
 
@@ -357,6 +414,7 @@ static void cpcap_usb_detect(struct work_struct *work)
 
 	ddata->mode = CPCAP_IDLE;
 	cpcap_usb_try_musb_mailbox(ddata, MUSB_VBUS_OFF);
+	cpcap_usb_set_extcon(ddata);
 
 	return;
 
@@ -785,7 +843,18 @@ static int cpcap_usb_phy_probe(struct platform_device *pdev)
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

