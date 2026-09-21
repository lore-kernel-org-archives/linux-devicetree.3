Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D58515963
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 21:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790026900; cv=none; b=in3rBCnYE9AlN54JgR4spC7jB87+3SDK+/bjb+qmov2F+y5QOJcAdHMeyUAdk3kB9naeD7EEa/wWPGHSkGzhnGgyrAv47uGunyc1jGKOWIFDVnFDHk3iZ5g+qYodG4SnqRfC31Gjqs83T/XfyUCjBpTF+p2IE/K8oHsARlo0aZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790026900; c=relaxed/simple;
	bh=KVQGBMPZlIcAs+cY7SH1A/UdfmLIYgMA5O6rOzhYjK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gjWZ0+dKYSzWi/M44kG2crOVnteO87S45Geeimq9XfBShBSHdtEp8T/lwtswfd0X2C+l1PmAwZSLe/CQJ0PM7RF7/l6fyoJv1R/ogWR2ZxJqBYVZ8QhrW4BsEHwATIYqSqqO4/zzgGwO3GzORKheMEd6XeS9g6pEllUeIm1C6jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTGQVK4I; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTGQVK4I"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso2405502a91.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 14:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790026898; x=1790631698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kYvkwWgOoTHqSMKs+uOvBb6xRZ3jjBTtb5fdAS18f1I=;
        b=UTGQVK4Ig/FeB6Rk/+RxlPScmTar9c7+qT8XqVopni9w3LUA2Ng3WQTlyo20FX00OM
         dhq6rTKfbYvBTJIfoa2Tzkv17aec+3zIQePuYs1mqAEpIISRCfNgC7W1YezNvoVH/Fun
         kLsVeXMKOqvSf4vDaJK11Wl4YsyeWF5htwXCZtDMEcGHCRsPqxsVAgNgLVoopgkpUeSe
         hzO9pvjh/Fl3zkWIwwE2kcGiiGGcWX1Upk9iVw3fpNYiQMbXi8kaHljoUnNE1mi9UCIE
         KiTvoezsCpGooO5hKgd87lnhRv3+svhe28ap7sRtlZAuUDvLGFNZKn+OAg+Qvp0ROWC4
         g4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790026898; x=1790631698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kYvkwWgOoTHqSMKs+uOvBb6xRZ3jjBTtb5fdAS18f1I=;
        b=Xxjent0KB2ylp3MESappy3K6uhC4KifNOgXmstQWH2iYTzRgx2F5qEL0EU/b4sVlj1
         MBhon4yp/JgNw8i4chi2X/yx2HdxiQGG8K1i70Dr/PwcSZE/kVVdTsbG7wOO2//JZrL/
         BcfBSEM1dr3AuD1Vxf0kjeTXa1OwoZoSbNDcn10xnoQM0xzU5m7WZFWSi0B0622ah//y
         zwXXbdFDxP/whq7AEqMzax55xjXZcH5WlbnO/L+nthK1YqWH8zA83xKPUI2mL73Aa6JW
         d+lp93McvTt2K+1FVLEBo6WFZU2cf03eJKzOGaT7nSjqSpFs9C0XiUjuvvZ/OqSGO1Ch
         TPGA==
X-Gm-Message-State: AFuF++nHYlh8zBE8j73Piec/FDg7/j4O1OZPCiZdOBpddh8CdjE8Nuca
	IDCWRbechDwARWF/9mKFF9G62K3QMOqtHqJxsmZ7msXUUe2RPxmS5oTjuvid9g==
X-Gm-Gg: AYBFou2HyEQ1C1L4hzmH+yotj2l80NNyEW1gt5pY/Zhpzs7zC3/4AufNT7zViGtz8yd
	cxSE5Ty/rzR3VN6At7Hau7vIF0l1EUmDnyffdeAlxP1Hzk73IYYpB/1j9QDZwy5u4JsEL40ls2Z
	ESaOHcNjDavSXSPu4tIh0MXsqS1ANk+F+FEBGImxIoj5XI40TGF2tpiICPJslDf3MmI87rOrPR2
	WIWGNhI47dKJmqfBqiq5ufphug7qdw11fASzUxox2I4KgzBg1hjUU73wLRFOHW9B/RTI939Q+7V
	tPIr022y4P+YSFP1b5CkjGkL/GLTB00QIAaQY0rfQzMKh2Z+cPurMc15+Pm132CGFmIfSPPr1ji
	NpcFlamMTtLkHLxsKq22odv92yEvnEuhA6c4meH37ez6lR1xaU7P1WcyXnWGrajfCyDnPGTWk/R
	M7hik5geoBqkluic0AIDcl8hikP771bZA3xCjQLLKsgQ4l/5U1e646a7Kg/82hJNJ5A267kh5QW
	yCmnX9o5u88gS+74bWNzpSGi0jSIN+SW/YNSdsxe+VB19pyfYX1cxFfVMkOMOCj5hoD7yaxbZAn
	eXVYyR97hhLORsdOGZ9cDhLuozyC/QP22RuAcFSYpOGm31fU
X-Received: by 2002:a17:90a:d00e:b0:39d:fd82:de0c with SMTP id 98e67ed59e1d1-39e54aeed0emr16493965a91.2.1790026898410;
        Mon, 21 Sep 2026 14:41:38 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a069a0b05esm608892a91.15.2026.09.21.14.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:41:37 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCHv2 1/2] usb: bcma: add regulator support
Date: Mon, 21 Sep 2026 14:41:32 -0700
Message-ID: <20260921214133.16519-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921214133.16519-1-rosenp@gmail.com>
References: <20260921214133.16519-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bcma-hcd drives the USB power line by grabbing the undocumented
"vcc-gpio" from the controller node and poking it through gpiolib.
Besides relying on a non-standard binding, this cannot work on boards
such as the NETGEAR R7000 and R8000 where one chipcommon GPIO powers
both the USB2 and USB3 cores: the two controllers each request that
GPIO exclusively, so the second one fails with -EBUSY and its port
stays dead.

Add support for the standard regulator interface. Each core obtains its
(shared) VBUS supply through devm_regulator_get() and the regulator core
reference-counts the enable/disable requests, allowing both controllers to
drive one GPIO without conflicts.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/usb/host/bcma-hcd.c | 54 +++++++++++++++++++++++++++++--------
 1 file changed, 43 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/host/bcma-hcd.c b/drivers/usb/host/bcma-hcd.c
index 519386255886..0d5a220b6988 100644
--- a/drivers/usb/host/bcma-hcd.c
+++ b/drivers/usb/host/bcma-hcd.c
@@ -26,6 +26,7 @@
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/regulator/consumer.h>
 #include <linux/usb/ehci_pdriver.h>
 #include <linux/usb/ohci_pdriver.h>
 
@@ -41,6 +42,7 @@ struct bcma_hcd_device {
 	struct platform_device *ehci_dev;
 	struct platform_device *ohci_dev;
 	struct gpio_desc *gpio_desc;
+	struct regulator *regulator;
 };
 
 /* Wait for bitmask in a register to get set or cleared.
@@ -280,14 +282,23 @@ static int bcma_hcd_usb20_ns_init(struct bcma_hcd_device *bcma_hcd)
 	return 0;
 }
 
-static void bcma_hci_platform_power_gpio(struct bcma_device *dev, bool val)
+static int bcma_hci_platform_power(struct bcma_device *dev, bool on)
 {
 	struct bcma_hcd_device *usb_dev = bcma_get_drvdata(dev);
+	int err;
+
+	if (usb_dev->gpio_desc)
+		return gpiod_set_value(usb_dev->gpio_desc, on);
 
-	if (!usb_dev->gpio_desc)
-		return;
+	if (!usb_dev->regulator)
+		return 0;
 
-	gpiod_set_value(usb_dev->gpio_desc, val);
+	if (on)
+		err = regulator_enable(usb_dev->regulator);
+	else
+		err = regulator_disable(usb_dev->regulator);
+
+	return err;
 }
 
 static const struct usb_ehci_pdata ehci_pdata = {
@@ -395,12 +406,12 @@ static int bcma_hcd_usb30_init(struct bcma_hcd_device *bcma_hcd)
 static int bcma_hcd_probe(struct bcma_device *core)
 {
 	int err;
+	struct device *dev = &core->dev;
 	struct bcma_hcd_device *usb_dev;
 
 	/* TODO: Probably need checks here; is the core connected? */
 
-	usb_dev = devm_kzalloc(&core->dev, sizeof(struct bcma_hcd_device),
-			       GFP_KERNEL);
+	usb_dev = devm_kzalloc(dev, sizeof(*usb_dev), GFP_KERNEL);
 	if (!usb_dev)
 		return -ENOMEM;
 	usb_dev->core = core;
@@ -411,6 +422,14 @@ static int bcma_hcd_probe(struct bcma_device *core)
 		return dev_err_probe(&core->dev, PTR_ERR(usb_dev->gpio_desc),
 				     "error obtaining VCC GPIO");
 
+	usb_dev->regulator = devm_regulator_get(dev, "vbus");
+	if (IS_ERR(usb_dev->regulator))
+		return dev_err_probe(dev, PTR_ERR(usb_dev->regulator), "error obtaining VBUS regulator");
+
+	err = regulator_enable(usb_dev->regulator);
+	if (err)
+		return dev_err_probe(dev, err, "error enabling VCC regulator");
+
 	switch (core->id.id) {
 	case BCMA_CORE_USB20_HOST:
 		if (IS_ENABLED(CONFIG_ARM))
@@ -427,13 +446,16 @@ static int bcma_hcd_probe(struct bcma_device *core)
 		err = bcma_hcd_usb30_init(usb_dev);
 		break;
 	default:
-		return -ENODEV;
+		err = -ENODEV;
 	}
 	if (err)
-		return err;
+		goto error;
 
 	bcma_set_drvdata(core, usb_dev);
 	return 0;
+error:
+	regulator_disable(usb_dev->regulator);
+	return err;
 }
 
 static void bcma_hcd_remove(struct bcma_device *dev)
@@ -442,6 +464,8 @@ static void bcma_hcd_remove(struct bcma_device *dev)
 	struct platform_device *ohci_dev = usb_dev->ohci_dev;
 	struct platform_device *ehci_dev = usb_dev->ehci_dev;
 
+	regulator_disable(usb_dev->regulator);
+
 	if (ohci_dev)
 		platform_device_unregister(ohci_dev);
 	if (ehci_dev)
@@ -452,7 +476,7 @@ static void bcma_hcd_remove(struct bcma_device *dev)
 
 static void bcma_hcd_shutdown(struct bcma_device *dev)
 {
-	bcma_hci_platform_power_gpio(dev, false);
+	bcma_hci_platform_power(dev, false);
 	bcma_core_disable(dev, 0);
 }
 
@@ -460,7 +484,11 @@ static void bcma_hcd_shutdown(struct bcma_device *dev)
 
 static int bcma_hcd_suspend(struct bcma_device *dev)
 {
-	bcma_hci_platform_power_gpio(dev, false);
+	int err;
+
+	err = bcma_hci_platform_power(dev, false);
+	if (err)
+		return err;
 	bcma_core_disable(dev, 0);
 
 	return 0;
@@ -468,7 +496,11 @@ static int bcma_hcd_suspend(struct bcma_device *dev)
 
 static int bcma_hcd_resume(struct bcma_device *dev)
 {
-	bcma_hci_platform_power_gpio(dev, true);
+	int err;
+
+	err = bcma_hci_platform_power(dev, true);
+	if (err)
+		return err;
 	bcma_core_enable(dev, 0);
 
 	return 0;
-- 
2.55.0

