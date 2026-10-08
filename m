Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775443BFE33
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 06:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439615; cv=none; b=tJbl9H2VQdFiGdOdRr1WhOW92QNZlOYiHOuVzrDbzKf2I4OnCJqOKTCUY92fpTNIWKSrcukd/Duc1ZIVVKA+kCJZo6VWW9snP3ZzCOx2PipIESjwiTTI9K0IczkgU82aopedOBtO3MdGnI87UdAfv0DGse9LuFM2zJL9jjnVE7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439615; c=relaxed/simple;
	bh=gFIo3+PKqwDQ76IJIBhzzfJ5ppWEViq5zF7nzXm0nzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t5TbrDb7C5Z6/2sGczPW0QV9GjjS31MKojWfjyPV6Q78HDZKsTKI1D2nu1+ddwajbsV3W/RBdIi2pDD8UXc7hAcMqiJMVPEoreJjlfWWWYDqXNhDie9qKwGFPlVsZVq5XnErf8aFP14wbUjX+TDdN6uu0V5+OErj9dPmTx7B2z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ylp0aHLu; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ylp0aHLu"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc50ad2d650so1584413a12.1
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 23:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791439613; x=1792044413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tpp/l8x0FFNoRUazKgX/VoKBSK9SpVfGhmopGIzKydQ=;
        b=Ylp0aHLuyui1gNdCe3No3ekJBzkNsABN31s3My37n2GldOTWxJ8pkF6fFWDAhvwKkO
         TIgcOLTu9QMIrSeJbrFq4tf0gcpaHwwBgrbyOIrdd5iPMoa27vWsg55Sc+gOPeFIu+6d
         8mJqdJ7YLg8MRyrX5jRCV1ci/XOpGv5KdGsm9R1meSyTyybNJ0TbSfEfgZVwGta4NG98
         CfmfwAlinFX6cI3ByOwyHw2RFMkZV+bHT4NBhEgbj+oeaNxq7CvJbYE+gzzIJGgmY0Ka
         MgC5Q4nk/DnF7Yp2zKlFLYWTXT/WFeQymm4bj/ZD0KaNgA+WUWDDTUdf2u5uyB9flVsZ
         nW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439613; x=1792044413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tpp/l8x0FFNoRUazKgX/VoKBSK9SpVfGhmopGIzKydQ=;
        b=WIphHbgRmnuEhaQ255MPIF2Xx19EgMNlUt9PQocLlL9ElQ7PixXu10iSIT2tc/QWL/
         03s+4QXPQi7XCk+karMgmTFAn8w4R+6lGLvF9uxNdeX8MRH8LQfGXNchEp5D+auhpVVg
         10baRSXe52/85DJssz1d636LsMGzebdFcYlDFd8DKXByOOAu2+8WiwuO1HKeMUqNCl6O
         7b0cX1Y9F07FGimzklwBkDYa6Nk3JpGOg7xILT3EyXz22YPAm3efDUoS/5xftHOVd4hw
         Zyr0AT6EfcTlYws/RXAloTxVdQZl/59fPudpnRx1fH+socyfcekCySHdaBuAuM8EdBZ1
         bSeA==
X-Forwarded-Encrypted: i=1; AKwUvBxbbGYOW2/mZF/b2305+0bwS/P1PFOT/IhRzHSm+eKCd5A9dUwPYz/+0sfitfREQ34BcXn/HznRroLi@vger.kernel.org
X-Gm-Message-State: AFq9FYIAmIqEdKBRJPSt6z5dXH0ipgmCgFd3rpnfpWu6kfeQN+Hi4A5h
	D0InotAc22Vt7D8C9L5gUUf+zJiqN5eRaJ4KV8m3cqeBeJzLFSYyhTsC
X-Gm-Gg: AYBFou0pqsB3bWA/HMES8TaoRC4+FSNMBSV5pk3s33b3xkcgb3WIw0ShcM1cwRbRgUM
	uiSeni4LoitHPYaFsChVHqCYY2W9a5AQpJhL0Mq42r7zFsl40M0xO59vievE9Dy8LRzNGHvbN/s
	wJtdMn7ZOVbqI2craAQ43Vpcuw3Uxjhc8wUgbHxCRhVi60sFUv3GW2eWEBJNCpJIH8gPmZ+yV1e
	/BdVTrnIfzNY4hfoJFzrxJkZVvkF6GgKXulZsXY+FdHEgQt5XngvprO4fBYHDtvR6iKN2OkFFPC
	bgzJr0NcR5ykPLgxJyma1UYGEh4BD72TrGiPkhLzlHRZsNyih+RUZ1pdy2VmDFetFKsbMjlEgnj
	HhbOynxLmThfkzH5Xzkdkp/ZzbK7fwDAQVoIsvyI6uCE7kkezM0Kk6s+unEB0BfJFo4tRR+Dxde
	lIGEJTndSOIhNqAcVN3n7IJEU9IVYDNfSATWNTQjwZBFiIroKFXOHF2pDd2SywJrVEyBfWP/zt1
	orF+VpK/mS1WtwVK8U3sOBog403Q1p91fw+rznZgWHflTuAVk0bHe5GH39OUH4=
X-Received: by 2002:a17:90a:d2c8:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3a8a072a966mr3904946a91.10.1791439612496;
        Wed, 07 Oct 2026 23:06:52 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbccea3sm2632203a91.15.2026.10.07.23.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:06:52 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v7 4/4] phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support
Date: Thu,  8 Oct 2026 14:06:29 +0800
Message-ID: <20261008060629.2736806-5-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008060629.2736806-1-a0987203069@gmail.com>
References: <20261008060629.2736806-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PHY0 and PHY1 use the same power-on/reset sequence in USBPMISCR, with
PHY1 control bits shifted 16 positions relative to PHY0.  A separate
driver for PHY1 would duplicate this logic, so the existing driver is
extended to manage both ports.

The original driver polled only DEVCKSTB after releasing PHY0 from
reset.  When USB0 operates in host mode (USB ID pin floating or tied
high) only HSTCKSTB and CK12MSTB assert; DEVCKSTB never sets.  Polling
exclusively for DEVCKSTB in host mode causes a 1 ms timeout on every
phy_init() call from the EHCI driver.  The init callback is changed to
accept either host-mode or device-mode clock stability, whichever
asserts first.

The power_on and power_off callbacks are replaced by a single init
callback that handles PHY reset and clock-stable polling, because
there is no PHY-specific clock gate on MA35D1; the PHY analog block
derives its reference from the HXT crystal.

A read-only USB role switch is registered for PHY0 to expose the USB0
role to userspace via the standard role-switch sysfs interface.  The
.set callback returns -EOPNOTSUPP because the hardware mux is fully
automatic with no software override path.  When CONFIG_USB_ROLE_SWITCH
is not enabled, the registration returns -ENODEV and the driver skips
the role switch gracefully without failing probe.

Two new optional device-tree properties are implemented:
  - nuvoton,rcalcode: writes per-port 4-bit resistor calibration trim
    codes to the RCALCODE field in USBPMISCR.
  - nuvoton,oc-active-high: sets the UHOVRCURH bit in MISCFCR0 to treat
    the over-current detect input as active-high.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/phy/nuvoton/phy-ma35d1-usb2.c | 285 +++++++++++++++++++-------
 1 file changed, 211 insertions(+), 74 deletions(-)

diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
index 0b9976fb15c1..25bd0a7a1314 100644
--- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
+++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
@@ -1,6 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2024 Nuvoton Technology Corp.
+ * Nuvoton MA35D1 USB 2.0 PHY driver
+ *
+ * Supports PHY0 (USB0 OTG port, shared between DWC2 gadget and EHCI0/OHCI0)
+ * and PHY1 (USB1 host-only port, used by EHCI1/OHCI1). The hardware mux on
+ * PHY0 switches automatically via the USB ID pin.
+ *
+ * Copyright (C) 2024-2026 Nuvoton Technology Corp.
  */
 #include <linux/bitfield.h>
 #include <linux/clk.h>
@@ -12,131 +18,262 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/usb/role.h>
 
-/* USB PHY Miscellaneous Control Register */
-#define MA35_SYS_REG_USBPMISCR	0x60
-#define PHY0POR			BIT(0)  /* PHY Power-On Reset Control Bit */
-#define PHY0SUSPEND			BIT(1)  /* PHY Suspend; 0: suspend, 1: operaion */
-#define PHY0COMN			BIT(2)  /* PHY Common Block Power-Down Control */
-#define PHY0DEVCKSTB			BIT(10) /* PHY 60 MHz UTMI clock stable bit */
+#define MA35_SYS_PWRONOTP		0x04
+#define PWRONOTP_USBP0ID		BIT(16)
+
+#define MA35_SYS_USBPMISCR		0x60
+#define USBPMISCR_PHY_POR(n)		BIT(0  + (n) * 16)
+#define USBPMISCR_PHY_SUSPEND(n)	BIT(1  + (n) * 16)
+#define USBPMISCR_PHY_COMN(n)		BIT(2  + (n) * 16)
+#define USBPMISCR_PHY_HSTCKSTB(n)	BIT(8  + (n) * 16)
+#define USBPMISCR_PHY_CK12MSTB(n)	BIT(9  + (n) * 16)
+#define USBPMISCR_PHY_DEVCKSTB(n)	BIT(10 + (n) * 16)
+/* Mask for control bits (POR, SUSPEND, COMN) */
+#define USBPMISCR_PHY_CTL_MASK(n)	(0x7u << ((n) * 16))
+/* Host-mode ready */
+#define USBPMISCR_PHY_HOST_READY(n)	(USBPMISCR_PHY_SUSPEND(n)  | \
+					 USBPMISCR_PHY_HSTCKSTB(n) | \
+					 USBPMISCR_PHY_CK12MSTB(n))
+/* Device-mode ready */
+#define USBPMISCR_PHY_DEV_READY(n)	(USBPMISCR_PHY_SUSPEND(n)  | \
+					 USBPMISCR_PHY_DEVCKSTB(n))
+/* RCALCODE: 4-bit resistor trim */
+#define USBPMISCR_RCAL_SHIFT(n)		(12 + (n) * 16)
+#define USBPMISCR_RCAL_MASK(n)		GENMASK(USBPMISCR_RCAL_SHIFT(n) + 3, \
+						USBPMISCR_RCAL_SHIFT(n))
+
+#define MA35_SYS_MISCFCR0		0x70
+/* USB host over-current detect polarity (shared, both ports) */
+#define MISCFCR0_UHOVRCURH		BIT(12)
+
+#define MA35_PHY_NUM			2
+
+struct ma35_phy_port {
+	struct phy *phy;
+	unsigned int idx;
+};
 
 struct ma35_usb_phy {
-	struct clk *clk;
 	struct device *dev;
 	struct regmap *sysreg;
+	struct ma35_phy_port port[MA35_PHY_NUM];
+	struct usb_role_switch *role_sw;
 };
 
-static int ma35_usb_phy_power_on(struct phy *phy)
+static int ma35_usb_phy_init(struct phy *phy)
 {
-	struct ma35_usb_phy *p_phy = phy_get_drvdata(phy);
+	struct ma35_phy_port *port = phy_get_drvdata(phy);
+	struct ma35_usb_phy *p = container_of(port - port->idx,
+					      struct ma35_usb_phy, port[0]);
+	unsigned int n = port->idx;
 	unsigned int val;
 	int ret;
 
-	ret = clk_prepare_enable(p_phy->clk);
-	if (ret < 0) {
-		dev_err(p_phy->dev, "Failed to enable PHY clock: %d\n", ret);
-		return ret;
+	regmap_read(p->sysreg, MA35_SYS_USBPMISCR, &val);
+
+	if (!(val & USBPMISCR_PHY_SUSPEND(n))) {
+		regmap_update_bits(p->sysreg, MA35_SYS_USBPMISCR,
+				   USBPMISCR_PHY_CTL_MASK(n),
+				   USBPMISCR_PHY_POR(n) | USBPMISCR_PHY_SUSPEND(n));
+		udelay(20);
+
+		regmap_update_bits(p->sysreg, MA35_SYS_USBPMISCR,
+				   USBPMISCR_PHY_CTL_MASK(n),
+				   USBPMISCR_PHY_SUSPEND(n));
 	}
 
-	regmap_read(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, &val);
-	if (val & PHY0SUSPEND) {
-		/*
-		 * USB PHY0 is in operation mode already
-		 * make sure USB PHY 60 MHz UTMI Interface Clock ready
-		 */
-		ret = regmap_read_poll_timeout(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, val,
-						val & PHY0DEVCKSTB, 10, 1000);
-		if (ret == 0)
-			return 0;
+	if (n == 0) {
+		ret = regmap_read_poll_timeout(p->sysreg, MA35_SYS_USBPMISCR,
+					       val,
+					       ((val & USBPMISCR_PHY_HOST_READY(0)) ==
+						USBPMISCR_PHY_HOST_READY(0)) ||
+					       ((val & USBPMISCR_PHY_DEV_READY(0)) ==
+						USBPMISCR_PHY_DEV_READY(0)),
+					       10, 1000);
+	} else {
+		ret = regmap_read_poll_timeout(p->sysreg, MA35_SYS_USBPMISCR,
+					       val,
+					       (val & USBPMISCR_PHY_HOST_READY(n)) ==
+					       USBPMISCR_PHY_HOST_READY(n),
+					       10, 1000);
 	}
 
-	/*
-	 * reset USB PHY0.
-	 * wait until USB PHY0 60 MHz UTMI Interface Clock ready
-	 */
-	regmap_update_bits(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, 0x7, (PHY0POR | PHY0SUSPEND));
-	udelay(20);
-
-	/* make USB PHY0 enter operation mode */
-	regmap_update_bits(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, 0x7, PHY0SUSPEND);
-
-	/* make sure USB PHY 60 MHz UTMI Interface Clock ready */
-	ret = regmap_read_poll_timeout(p_phy->sysreg, MA35_SYS_REG_USBPMISCR, val,
-					val & PHY0DEVCKSTB, 10, 1000);
-	if (ret == -ETIMEDOUT) {
-		dev_err(p_phy->dev, "Check PHY clock, Timeout: %d\n", ret);
-		clk_disable_unprepare(p_phy->clk);
+	if (ret) {
+		dev_err(p->dev, "USB PHY%u clock not stable (USBPMISCR=0x%08x)\n",
+			n, val);
 		return ret;
 	}
 
 	return 0;
 }
 
-static int ma35_usb_phy_power_off(struct phy *phy)
+static const struct phy_ops ma35_usb_phy_ops = {
+	.init		= ma35_usb_phy_init,
+	.owner		= THIS_MODULE,
+};
+
+static int ma35_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
 {
-	struct ma35_usb_phy *p_phy = phy_get_drvdata(phy);
+	return -EOPNOTSUPP;
+}
+
+static enum usb_role ma35_role_sw_get(struct usb_role_switch *sw)
+{
+	struct ma35_usb_phy *p = usb_role_switch_get_drvdata(sw);
+	u32 val;
+
+	regmap_read(p->sysreg, MA35_SYS_PWRONOTP, &val);
+
+	return (val & PWRONOTP_USBP0ID) ? USB_ROLE_HOST : USB_ROLE_DEVICE;
+}
+
+static int ma35_role_switch_init(struct platform_device *pdev,
+				 struct ma35_usb_phy *p)
+{
+	struct usb_role_switch_desc sw_desc = {0};
+
+	sw_desc.set = ma35_role_sw_set;
+	sw_desc.get = ma35_role_sw_get;
+	sw_desc.allow_userspace_control = true;
+	sw_desc.driver_data = p;
+	sw_desc.fwnode = dev_fwnode(&pdev->dev);
+
+	p->role_sw = usb_role_switch_register(&pdev->dev, &sw_desc);
+	if (IS_ERR(p->role_sw)) {
+		if (PTR_ERR(p->role_sw) == -ENODEV) {
+			p->role_sw = NULL;
+			return 0;
+		}
+		return dev_err_probe(&pdev->dev, PTR_ERR(p->role_sw),
+				     "failed to register role switch\n");
+	}
 
-	clk_disable_unprepare(p_phy->clk);
 	return 0;
 }
 
-static const struct phy_ops ma35_usb_phy_ops = {
-	.power_on = ma35_usb_phy_power_on,
-	.power_off = ma35_usb_phy_power_off,
-	.owner = THIS_MODULE,
-};
+static void ma35_role_switch_exit(struct ma35_usb_phy *p)
+{
+	if (p->role_sw) {
+		usb_role_switch_unregister(p->role_sw);
+		p->role_sw = NULL;
+	}
+}
+
+static struct phy *ma35_usb_phy_xlate(struct device *dev,
+				      const struct of_phandle_args *args)
+{
+	struct ma35_usb_phy *p = dev_get_drvdata(dev);
+	unsigned int idx;
+
+	if (args->args_count == 0)
+		idx = 0;
+	else
+		idx = args->args[0];
+
+	if (idx >= MA35_PHY_NUM)
+		return ERR_PTR(-EINVAL);
+
+	return p->port[idx].phy;
+}
 
 static int ma35_usb_phy_probe(struct platform_device *pdev)
 {
 	struct phy_provider *provider;
-	struct ma35_usb_phy *p_phy;
-	struct phy *phy;
+	struct ma35_usb_phy *p;
+	struct clk *clk;
+	int n, ret;
+	u32 code;
 
-	p_phy = devm_kzalloc(&pdev->dev, sizeof(*p_phy), GFP_KERNEL);
-	if (!p_phy)
+	p = devm_kzalloc(&pdev->dev, sizeof(*p), GFP_KERNEL);
+	if (!p)
 		return -ENOMEM;
 
-	p_phy->dev = &pdev->dev;
-	platform_set_drvdata(pdev, p_phy);
+	p->dev = &pdev->dev;
+	platform_set_drvdata(pdev, p);
+
+	p->sysreg = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
+						     "nuvoton,sys");
+	if (IS_ERR(p->sysreg))
+		return dev_err_probe(&pdev->dev, PTR_ERR(p->sysreg),
+				     "failed to get SYS regmap\n");
 
-	p_phy->sysreg = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "nuvoton,sys");
-	if (IS_ERR(p_phy->sysreg))
-		return dev_err_probe(&pdev->dev, PTR_ERR(p_phy->sysreg),
-				     "Failed to get SYS registers\n");
+	clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk),
+				     "failed to get clock\n");
 
-	p_phy->clk = of_clk_get(pdev->dev.of_node, 0);
-	if (IS_ERR(p_phy->clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(p_phy->clk),
-				     "failed to find usb_phy clock\n");
+	for (n = 0; n < MA35_PHY_NUM; n++) {
+		if (of_property_read_u32_index(pdev->dev.of_node,
+					       "nuvoton,rcalcode", n, &code))
+			continue;
 
-	phy = devm_phy_create(&pdev->dev, NULL, &ma35_usb_phy_ops);
-	if (IS_ERR(phy))
-		return dev_err_probe(&pdev->dev, PTR_ERR(phy), "Failed to create PHY\n");
+		if (code > 15)
+			return dev_err_probe(&pdev->dev, -EINVAL,
+					     "rcalcode[%d] %u out of range (0-15)\n",
+					     n, code);
 
-	phy_set_drvdata(phy, p_phy);
+		regmap_update_bits(p->sysreg, MA35_SYS_USBPMISCR,
+				   USBPMISCR_RCAL_MASK(n),
+				   code << USBPMISCR_RCAL_SHIFT(n));
+	}
 
-	provider = devm_of_phy_provider_register(&pdev->dev, of_phy_simple_xlate);
-	if (IS_ERR(provider))
+	regmap_update_bits(p->sysreg, MA35_SYS_MISCFCR0, MISCFCR0_UHOVRCURH,
+			   of_property_read_bool(pdev->dev.of_node,
+						 "nuvoton,oc-active-high") ?
+			   MISCFCR0_UHOVRCURH : 0);
+
+	for (n = 0; n < MA35_PHY_NUM; n++) {
+		p->port[n].idx = n;
+
+		p->port[n].phy = devm_phy_create(&pdev->dev, pdev->dev.of_node,
+						 &ma35_usb_phy_ops);
+		if (IS_ERR(p->port[n].phy))
+			return dev_err_probe(&pdev->dev, PTR_ERR(p->port[n].phy),
+					     "failed to create PHY%d\n", n);
+
+		phy_set_drvdata(p->port[n].phy, &p->port[n]);
+	}
+
+	ret = ma35_role_switch_init(pdev, p);
+	if (ret)
+		return ret;
+
+	provider = devm_of_phy_provider_register(&pdev->dev, ma35_usb_phy_xlate);
+	if (IS_ERR(provider)) {
+		ma35_role_switch_exit(p);
 		return dev_err_probe(&pdev->dev, PTR_ERR(provider),
-				     "Failed to register PHY provider\n");
+				     "failed to register PHY provider\n");
+	}
+
 	return 0;
 }
 
+static void ma35_usb_phy_remove(struct platform_device *pdev)
+{
+	struct ma35_usb_phy *p = platform_get_drvdata(pdev);
+
+	ma35_role_switch_exit(p);
+}
+
 static const struct of_device_id ma35_usb_phy_of_match[] = {
-	{ .compatible = "nuvoton,ma35d1-usb2-phy", },
-	{ },
+	{ .compatible = "nuvoton,ma35d1-usb2-phy" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ma35_usb_phy_of_match);
 
 static struct platform_driver ma35_usb_phy_driver = {
 	.probe		= ma35_usb_phy_probe,
-	.driver	= {
-		.name	= "ma35d1-usb2-phy",
-		.of_match_table = ma35_usb_phy_of_match,
+	.remove		= ma35_usb_phy_remove,
+	.driver		= {
+		.name		= "ma35d1-usb2-phy",
+		.of_match_table	= ma35_usb_phy_of_match,
 	},
 };
 module_platform_driver(ma35_usb_phy_driver);
 
 MODULE_DESCRIPTION("Nuvoton ma35d1 USB2.0 PHY driver");
 MODULE_AUTHOR("Hui-Ping Chen <hpchen0nvt@gmail.com>");
+MODULE_AUTHOR("Joey Lu <a0987203069@gmail.com>");
 MODULE_LICENSE("GPL");
-- 
2.43.0

