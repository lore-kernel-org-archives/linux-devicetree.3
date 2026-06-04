Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F953E3176
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 10:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780567957; cv=none; b=TDLVXJ4UUqTWWKTW6bMwW4UbfRMOLB26SjIx789GLr/oBaPZzK738fJZikf0Z7hHlkrGgWeO/adXDJYYTn68fyaCvQRbZAMnK916ejIRlTjOpsysGS21ateugQHmFn6Sh01Fy/H8UCc3zGV45eb2hXi425CAH6MVSOIzayHoOsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780567957; c=relaxed/simple;
	bh=P74ofiRfGsghjpSUERmpaOaj+GQ5IknRdHaPhINrkZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MfCHEl3Bm+6IgN4AqUz8tR+H0OJrsza1eQZJUp4VeRMO/tQU5RyBZzy31NSIjs1Ze2tKOiZwVVydGSGKsiaeFsXs2w0LspM5P7bbFVO3o07sOfurU85CVXR5CBX4qi/jvOjICUMUcJZExhF1Cxsl3LWQUTkBhOd18HgLQa757Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qs2WSZph; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qs2WSZph"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so338270a91.1
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 03:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780567954; x=1781172754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNgQ3uIDHmbUKLYb1HRZcPl4cxTs8/vnDz7ZCuCW2h8=;
        b=qs2WSZphGGtXmuPoWWJyXfOzaEFDiWrgGTwpIbxOEonagdbThlXFSqISb/ZMQe+mu2
         20buh6qojcFdKvv+z3G3SPBjR8AV+8RDzG1m1rO8NlD6EryYYoUOBSepQGDLO2fay+mc
         +Sj9xK4ZSje9Qhq8Oy6UY86qmQRK7joS/UZmo8gy4djNGX4ElQzvsjaqKw/OiTxxz9kc
         KRZWiOulwiyTFRdsARC1sIwlBbPpU1AXHPV7I7+P+k7eLa26D8Ul6BCJNGGgCGk6ldhb
         PTWQNbp4NcVqVfdW2Zd/pQrfXWO+Pgxqmgmxx8tAZjjlxC+Bnn3GD3nC74AW6+UqNfVq
         7gww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780567954; x=1781172754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KNgQ3uIDHmbUKLYb1HRZcPl4cxTs8/vnDz7ZCuCW2h8=;
        b=FbGDAStNaCkFdeRgrX8l4DpQSXQb2rAlFCvk18x119YAqmjeTjlucnVpRpFzSoned0
         fVNeVzhbxyCMhg6C0q5iBVa5HIk9QTNEzOY8/O34MjkXMb1NnPCr66PaKh8LRgp2l817
         WFygHuef7XE+g29xlbsex5vuIkJhKggcleqka0XawmRDviUQfq5/B04h6y2vblqxPi8P
         RbCLNxv4SSpZnr0SLHUxjxchjqtnKrMTRDOJVrhsgeUOCBwbu9jTqth0Z58rJ54cakRs
         sK8IJxPh7teQaQ9Wnk5IXqjost6OXaKrYSelvuzYzn8DwGsaDnHSDVfwe4lnpLnZNcTg
         anIw==
X-Forwarded-Encrypted: i=1; AFNElJ/x2WFWL15sdA5MI1yO2eIkOeP0UPnrGU4OjRhoZptyLo0JhHCWuAHbrI6CDx1YKkmfulUqHS6/6URp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5bIm3hP4VTsYhgHXhOGnbUcCItQZY7vkY6Gd7FVpYIJvAM34I
	STm3Rh+MrR+2ukFsZsvEJCNtCP3Do3byjWsf7mejTituuAoZWfAShpnx
X-Gm-Gg: Acq92OGIs9DRZPlDRdCV1QrvxMaRy4NhkpxGL72O9eDcHeHuUKK4+T9Nq3BYfDjQU38
	SKli2R1LdskR/cvRUxTtnElgGb/dcm3OFe/yqyPMdbV4a/QryzetKQrV0CzyUgJpANroe2OS4vs
	Oh58XkR2GFM2fHv7+LMxD28qBZOAzZjgL+2BDLLgC4Ab8DtE/0DuOj1kn9UkRRzCXxEM/LQsdWE
	Q2+CjyXkZqZvQ6uadRYu7TdpcdxSuZxzX52qpJoQEpwjE2MtE2ydFei4ppJrXD8EWp68KcvUHBf
	6J0+j4pARHBrG80W8WcPZbzr0FIkT06j+0oJ5uxF9yP90lGSqShK/o0aHujbunKvPm+oVS9o2m7
	9FKfRbc/oEbPnCTfoI+BF0Q4edEHfFezRlF1oVcYyigzME8//YBOmq3+reyoxrc9bqge98Y7hev
	UxxnXFzQzpP6NGfFJBJAaZeoYESWC/EF0P8Pk4ZpQ8m4cKU5HErlKJV+np18MLTI6A81O+WAz/i
	7Cl4DWNO0NT/eJmeXDlxz5bVcpsI/VqHA==
X-Received: by 2002:a17:90b:48cf:b0:36d:633a:e8aa with SMTP id 98e67ed59e1d1-36e30a2855amr7656208a91.13.1780567953772;
        Thu, 04 Jun 2026 03:12:33 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a29cd6sm2483385a91.11.2026.06.04.03.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 03:12:33 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH 2/2] phy: nuvoton: Add MA35D1 USB2 OTG PHY driver
Date: Thu,  4 Jun 2026 18:12:20 +0800
Message-ID: <20260604101220.1092822-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604101220.1092822-1-a0987203069@gmail.com>
References: <20260604101220.1092822-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a PHY driver for the USB 2.0 PHYs in the Nuvoton MA35D1 SoC,
intended for use with the EHCI and OHCI host controllers.

The MA35D1 SoC has two USB ports:

  - USB0: an OTG port shared between a DWC2 gadget controller and
    EHCI0/OHCI0 host controllers.  A hardware mux automatically routes
    the physical USB0 signals to the appropriate controller based on the
    USB ID pin state.  The DWC2 IP is device-only in hardware,
    so host-mode operation on USB0 is handled entirely by EHCI0/OHCI0.

  - USB1: a dedicated host-only port served by EHCI1/OHCI1.

The driver implements:
  - Power-On Reset sequence with a guard that skips re-initialization if
    the PHY is already operational.  This protects PHY0 when the DWC2
    gadget driver has already run its own init before EHCI0 probes.
  - Optional resistor calibration trim via nuvoton,rcalcode.
  - Optional over-current detect polarity via nuvoton,oc-active-high.
  - For PHY0 only: a USB role switch that exposes the hardware ID pin
    state (PWRONOTP[16]).

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/phy/nuvoton/Kconfig          |  15 ++
 drivers/phy/nuvoton/Makefile         |   1 +
 drivers/phy/nuvoton/phy-ma35d1-otg.c | 264 +++++++++++++++++++++++++++
 3 files changed, 280 insertions(+)
 create mode 100644 drivers/phy/nuvoton/phy-ma35d1-otg.c

diff --git a/drivers/phy/nuvoton/Kconfig b/drivers/phy/nuvoton/Kconfig
index d02cae2db315..5fdd13f841e7 100644
--- a/drivers/phy/nuvoton/Kconfig
+++ b/drivers/phy/nuvoton/Kconfig
@@ -10,3 +10,18 @@ config PHY_MA35_USB
 	help
 	  Enable this to support the USB2.0 PHY on the Nuvoton MA35
 	  series SoCs.
+
+config PHY_MA35_USB_OTG
+	tristate "Nuvoton MA35 USB2.0 OTG PHY driver"
+	depends on ARCH_MA35 || COMPILE_TEST
+	depends on OF
+	select GENERIC_PHY
+	select MFD_SYSCON
+	select USB_ROLE_SWITCH
+	help
+	  Enable this to support the USB2.0 OTG PHY on the Nuvoton MA35
+	  series SoCs.  This driver handles PHY initialization for the
+	  EHCI/OHCI host controllers, including per-PHY power-on reset,
+	  resistor calibration trim, and over-current polarity
+	  configuration.  For the OTG port (PHY0), it also monitors the
+	  USB ID pin and registers a USB role switch.
diff --git a/drivers/phy/nuvoton/Makefile b/drivers/phy/nuvoton/Makefile
index 2937e3921898..3ecd76f35d7c 100644
--- a/drivers/phy/nuvoton/Makefile
+++ b/drivers/phy/nuvoton/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_PHY_MA35_USB)		+= phy-ma35d1-usb2.o
+obj-$(CONFIG_PHY_MA35_USB_OTG)		+= phy-ma35d1-otg.o
diff --git a/drivers/phy/nuvoton/phy-ma35d1-otg.c b/drivers/phy/nuvoton/phy-ma35d1-otg.c
new file mode 100644
index 000000000000..53bc6ddf755e
--- /dev/null
+++ b/drivers/phy/nuvoton/phy-ma35d1-otg.c
@@ -0,0 +1,264 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Nuvoton MA35D1 USB 2.0 OTG PHY driver
+ *
+ * PHY0 (USB0) is shared between DWC2 gadget and EHCI0/OHCI0 host
+ * controllers. The hardware mux switches automatically via the USB
+ * ID pin. PHY1 (USB1) is host-only.
+ *
+ * Copyright (C) 2026 Nuvoton Technology Corp.
+ */
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/usb/role.h>
+
+#define MA35_SYS_PWRONOTP		0x04
+#define PWRONOTP_USBP0ID		BIT(16)
+
+#define MA35_SYS_USBPMISCR		0x60
+#define USBPMISCR_PHY_POR(n)		BIT(0 + (n) * 16)
+#define USBPMISCR_PHY_SUSPEND(n)	BIT(1 + (n) * 16)
+#define USBPMISCR_PHY_COMN(n)		BIT(2 + (n) * 16)
+#define USBPMISCR_PHY_HSTCKSTB(n)	BIT(8 + (n) * 16)
+#define USBPMISCR_PHY_CK12MSTB(n)	BIT(9 + (n) * 16)
+/* Mask for control bits (POR, SUSPEND, COMN) of one PHY */
+#define USBPMISCR_PHY_CTL_MASK(n)	(0x7 << ((n) * 16))
+/* Host-mode ready: SUSPEND + HSTCKSTB + CK12MSTB */
+#define USBPMISCR_PHY_HOST_READY(n)	(USBPMISCR_PHY_SUSPEND(n)  | \
+					 USBPMISCR_PHY_HSTCKSTB(n) | \
+					 USBPMISCR_PHY_CK12MSTB(n))
+/* RCALCODE: 4-bit resistor trim at bits [15:12] (PHY0) or [31:28] (PHY1) */
+#define USBPMISCR_RCAL_SHIFT(n)		(12 + (n) * 16)
+#define USBPMISCR_RCAL_MASK(n)		GENMASK(USBPMISCR_RCAL_SHIFT(n) + 3, \
+						USBPMISCR_RCAL_SHIFT(n))
+
+#define MA35_SYS_MISCFCR0		0x70
+/* MISCFCR0[12]: USB host over-current detect polarity (shared, both ports) */
+#define MISCFCR0_UHOVRCURH		BIT(12)
+
+struct ma35_otg_phy {
+	struct clk *clk;
+	struct device *dev;
+	struct regmap *sysreg;
+	unsigned int phy_idx;
+	struct usb_role_switch *role_sw;
+	enum usb_role cur_role;
+};
+
+static int ma35_otg_phy_init(struct phy *phy)
+{
+	struct ma35_otg_phy *p = phy_get_drvdata(phy);
+	unsigned int n = p->phy_idx;
+	u32 ready_mask = USBPMISCR_PHY_HOST_READY(n);
+	unsigned int val;
+	int ret;
+
+	regmap_read(p->sysreg, MA35_SYS_USBPMISCR, &val);
+	if ((val & ready_mask) == ready_mask)
+		return 0;
+
+	regmap_update_bits(p->sysreg, MA35_SYS_USBPMISCR,
+			   USBPMISCR_PHY_CTL_MASK(n),
+			   USBPMISCR_PHY_POR(n) | USBPMISCR_PHY_SUSPEND(n));
+	msleep(20);
+
+	regmap_update_bits(p->sysreg, MA35_SYS_USBPMISCR,
+			   USBPMISCR_PHY_CTL_MASK(n),
+			   USBPMISCR_PHY_SUSPEND(n));
+
+	ret = regmap_read_poll_timeout(p->sysreg, MA35_SYS_USBPMISCR, val,
+				       (val & ready_mask) == ready_mask,
+				       10, 1000);
+	if (ret) {
+		dev_err(p->dev, "USB PHY%u clock not stable (USBPMISCR=0x%08x)\n",
+			n, val);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ma35_otg_phy_power_on(struct phy *phy)
+{
+	struct ma35_otg_phy *p = phy_get_drvdata(phy);
+
+	return clk_prepare_enable(p->clk);
+}
+
+static int ma35_otg_phy_power_off(struct phy *phy)
+{
+	struct ma35_otg_phy *p = phy_get_drvdata(phy);
+
+	clk_disable_unprepare(p->clk);
+	return 0;
+}
+
+static const struct phy_ops ma35_otg_phy_ops = {
+	.init = ma35_otg_phy_init,
+	.power_on = ma35_otg_phy_power_on,
+	.power_off = ma35_otg_phy_power_off,
+	.owner = THIS_MODULE,
+};
+
+static enum usb_role ma35_otg_read_id(struct ma35_otg_phy *p)
+{
+	unsigned int val;
+
+	regmap_read(p->sysreg, MA35_SYS_PWRONOTP, &val);
+	return (val & PWRONOTP_USBP0ID) ? USB_ROLE_HOST : USB_ROLE_DEVICE;
+}
+
+static int ma35_otg_role_sw_set(struct usb_role_switch *sw,
+				enum usb_role role)
+{
+	struct ma35_otg_phy *p = usb_role_switch_get_drvdata(sw);
+
+	p->cur_role = role;
+
+	return 0;
+}
+
+static enum usb_role ma35_otg_role_sw_get(struct usb_role_switch *sw)
+{
+	struct ma35_otg_phy *p = usb_role_switch_get_drvdata(sw);
+
+	return ma35_otg_read_id(p);
+}
+
+static int ma35_otg_role_switch_init(struct platform_device *pdev,
+				     struct ma35_otg_phy *p)
+{
+	struct usb_role_switch_desc sw_desc = { };
+
+	p->cur_role = ma35_otg_read_id(p);
+
+	sw_desc.set = ma35_otg_role_sw_set;
+	sw_desc.get = ma35_otg_role_sw_get;
+	sw_desc.allow_userspace_control = true;
+	sw_desc.driver_data = p;
+	sw_desc.fwnode = dev_fwnode(&pdev->dev);
+
+	p->role_sw = usb_role_switch_register(&pdev->dev, &sw_desc);
+	if (IS_ERR(p->role_sw))
+		return dev_err_probe(&pdev->dev, PTR_ERR(p->role_sw),
+				     "failed to register role switch\n");
+
+	return 0;
+}
+
+static void ma35_otg_role_switch_exit(struct ma35_otg_phy *p)
+{
+	if (!p->role_sw)
+		return;
+
+	usb_role_switch_unregister(p->role_sw);
+	p->role_sw = NULL;
+}
+
+static int ma35_otg_phy_probe(struct platform_device *pdev)
+{
+	struct phy_provider *provider;
+	struct ma35_otg_phy *p;
+	unsigned int sys_args[1];
+	struct phy *phy;
+	u32 rcalcode;
+	int ret;
+
+	p = devm_kzalloc(&pdev->dev, sizeof(*p), GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+
+	p->dev = &pdev->dev;
+	platform_set_drvdata(pdev, p);
+
+	p->sysreg = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
+							 "nuvoton,sys",
+							 1, sys_args);
+	if (IS_ERR(p->sysreg))
+		return dev_err_probe(&pdev->dev, PTR_ERR(p->sysreg),
+				     "Failed to get SYS regmap\n");
+
+	p->phy_idx = sys_args[0];
+
+	if (p->phy_idx > 1)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "invalid PHY index %u (must be 0 or 1)\n",
+				     p->phy_idx);
+
+	p->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(p->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(p->clk),
+				     "failed to get PHY clock\n");
+
+	if (!of_property_read_u32(pdev->dev.of_node, "nuvoton,rcalcode",
+				  &rcalcode)) {
+		if (rcalcode > 15)
+			return dev_err_probe(&pdev->dev, -EINVAL,
+					     "rcalcode %u out of range (0-15)\n",
+					     rcalcode);
+		regmap_update_bits(p->sysreg, MA35_SYS_USBPMISCR,
+				   USBPMISCR_RCAL_MASK(p->phy_idx),
+				   rcalcode << USBPMISCR_RCAL_SHIFT(p->phy_idx));
+	}
+
+	if (of_property_read_bool(pdev->dev.of_node, "nuvoton,oc-active-high"))
+		regmap_update_bits(p->sysreg, MA35_SYS_MISCFCR0,
+				   MISCFCR0_UHOVRCURH, MISCFCR0_UHOVRCURH);
+
+	phy = devm_phy_create(&pdev->dev, pdev->dev.of_node, &ma35_otg_phy_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(&pdev->dev, PTR_ERR(phy),
+				     "Failed to create PHY\n");
+
+	phy_set_drvdata(phy, p);
+
+	provider = devm_of_phy_provider_register(&pdev->dev,
+						 of_phy_simple_xlate);
+	if (IS_ERR(provider))
+		return dev_err_probe(&pdev->dev, PTR_ERR(provider),
+				     "Failed to register PHY provider\n");
+
+	if (p->phy_idx == 0) {
+		ret = ma35_otg_role_switch_init(pdev, p);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void ma35_otg_phy_remove(struct platform_device *pdev)
+{
+	struct ma35_otg_phy *p = platform_get_drvdata(pdev);
+
+	ma35_otg_role_switch_exit(p);
+}
+
+static const struct of_device_id ma35_otg_phy_of_match[] = {
+	{ .compatible = "nuvoton,ma35d1-usb2-phy-otg" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, ma35_otg_phy_of_match);
+
+static struct platform_driver ma35_otg_phy_driver = {
+	.probe	= ma35_otg_phy_probe,
+	.remove	= ma35_otg_phy_remove,
+	.driver	= {
+		.name		= "ma35d1-usb2-phy-otg",
+		.of_match_table	= ma35_otg_phy_of_match,
+	},
+};
+module_platform_driver(ma35_otg_phy_driver);
+
+MODULE_DESCRIPTION("Nuvoton MA35D1 USB 2.0 OTG PHY driver");
+MODULE_AUTHOR("Joey Lu <a0987203069@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.43.0

