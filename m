Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9428C3C3F5B
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 02:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785896919; cv=none; b=BfVB/ofpvARaYnK06laH7o/yYAJ9aeyIfHNNlWtkId+BhX0LM99kRYy8qYDtvXDkxQdn9ePb0WIGcJdFXbR5SlWCMc7Z5EUe2tWVKtn2nFkCiajWesaHWxZjt6ZV90bRMi8cp98UbbgGeSjTD+RE7CXXFlWql12VgcmjJQoVYvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785896919; c=relaxed/simple;
	bh=EtsvSPxIGmlk0h5JqXOaBe4OHq/KZ7Qoebh3PMfLeHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F+qK5dWszHhBtGuBT7LMgYSvOeG5oaY1sIDNbV8lZUPHHbDEfB4bxEyRBv1kfGSkAS7M3ZbHHViM3iw2qH5tDb8mvQ1eyIj8s7sNW3dw12UAdmMnOEs3L/da8zjhqSgNvNJv+KPmiA5kNOhQK0GQSFoqQje4mOJIDzo5ZQVdxx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXhAm54C; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXhAm54C"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7ec49608332so288380a34.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 19:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785896915; x=1786501715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D64PmTVEKzBZLdk+xtOtavancebLmpSxAZFhbcTQDwg=;
        b=FXhAm54Cd7Wsixj6hEpdKFOtDWXNN0Z1JnhXDLdyB5z1BNjbiTfHnm0e3UkSHN/GjJ
         4yk0aK1QmxukRRW6SZe20IAMf2V8lBPIck31Zs5lSap9/fngln81XNozYD1D9LKYYbP4
         Rs9jtr0du/sXDjdTyAfCe0CLCv5H00WpXQirYS7oTfYSHgIvjM31Ii2ykEVq/XhZAaEO
         ETanSk1+9Wbmqgwm+rTOGayofNd0C+WnsD6XHeXwOfgPZmJ9q/vORHi4PqsXsq+93q0g
         Rnom+HC8Tqlh+0DHNzFthT8zdLIZu8ePtWVqp7eFyAVGxosJFSDcFAd/XlTmJEpUxbe1
         2KXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785896915; x=1786501715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D64PmTVEKzBZLdk+xtOtavancebLmpSxAZFhbcTQDwg=;
        b=PVEbm+Xqr6vf9XU6aPGlKcinvpivuz/mfKPKjNSwsYudAwX4RD2nmbttWZqk2u+U8K
         riIZ6SWV7WoJFdw7MlkRD2Xtfa0EUFK10pbgL1A43NXXXeIKIL8BjsRSMueNjVfeUili
         jeKL1BkO6756oPJYSLqL71pAjsY9618p/BdfIxSSqaf9+dRhQgrEQZbBOQJwkfL5EJbl
         zoKtAaytwY5vDpsV+le6QfeL4wx7N4T2gltIRAOmgqjCnjMtCUmhGuM4QtKQOTKqqZtj
         6jEpGYJ7IaLxAJNbIaXRk0x9XxqSkTsm/aNdE0YSp69VojKyuFotAxFV2esquKnCaBg3
         /xrg==
X-Forwarded-Encrypted: i=1; AHgh+Rqxum0v8pNquSEDgz84R/w5sUIjUrYDLFWEjBNZ7VcbSlFAQ0a177B8lZ3tkPWEoRzb9fpv5KRHoGxm@vger.kernel.org
X-Gm-Message-State: AOJu0YyEibjPgiQro/KnWVcBV3yJazBElybEqkrdaOf3ANeEX4oJMGSD
	ZxDfVgyXHFSLeqSLyv9nmL+jgazx8CJ1SB6aXvs3hIh5uo0zTUpmVw/o
X-Gm-Gg: AR+sD12Y+rvSriBiZb3GDWZPvqro5Y6lsNBjl2bNW7dQEBdWGpGKvyEvRdAiy2rH/Qs
	x3kGJFU4y6eYf4A6VP8xXHjrzSD1GWdjAvCyPR+t707sA0Viu/QpaiHEd16FKmDzbFr1lpLkIjr
	WZk36yDm5GddunudYO+vuCPXoGAi4lvhWz+UCwV0EknDcFgU7EDaX+Zm+7M4UC1hQLjXGrlKXkj
	UijHrjbw1qCHnUxjmVlskrSWAXSIvoitIpzO7yGGcwbbWU2FN6lu7Qwcu7dUm/svxlRb27qpBvG
	6GL9k+XY9xwO0tZE8RPfMeR34pgbdzukYl9efsp7dWpNqvfoskfX7QtRRZOlb89ZhmPsdjKO9M6
	AYdXOipmnnI2TNSnE4sS5b/4qulvCAvOKPkZVWOlnl9GTpquJEjF9b2nTE6V9/JIedwB6L/lv4H
	grfg6yaH5CrPhXVBvmi1LcKle69ICBxm6JDjCNOuJiHW6R1N4h4DTD+AqGbki/euydzY52luRaz
	SAi1STb3BHE6CUrZZTQsITQ5LdaLe1ggLU2fHgIWC8kyH0OcOoivXQ4cpu6/jWpV2quDHKLwp9q
	C1d3MU9Sg9kXsfhLxfiVOcWdrrKD341dHLKLh6HKYOjuQA4LCUpMjOO33vJhgxSxn2eeHOiydOO
	PNapPkhKipwCWFMOL
X-Received: by 2002:a05:6830:828e:b0:7dc:c4ae:a689 with SMTP id 46e09a7af769-7f1e5c13d47mr2668638a34.2.1785896912411;
        Tue, 04 Aug 2026 19:28:32 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df565d37sm2078153a34.16.2026.08.04.19.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 19:28:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 04 Aug 2026 20:27:02 -0600
Subject: [PATCH net-next v2 4/8] net: phy: add X-Powers AC200 EPHY control
 driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-submit-acx00-of-dynamic-v1-v2-4-3eef49ff1d8c@gmail.com>
References: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
In-Reply-To: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The AC200 Fast Ethernet PHY needs package registers in the parent I2C
regmap to be configured before its Clause 22 endpoint becomes usable.

Add a control driver which obtains the calibration value, applies the
vendor offset, selects the documented 24 or 27 MHz input clock, programs
the link PHY address and performs the required reset, clock and shutdown
sequence. Use the optional SoC SID cell when supplied and otherwise read
the AC200's internal calibration eFuse.

Early PHY creation occurs before a MAC has attached, so use reset-default
MII initially. A separate operation later applies phydev->interface; when
the block is already powered it changes only RMII_SEL before the normal
PHY soft reset.

Expose serialized, idempotent power and interface operations to the
common PHY driver. Enable only the MII I/O pads in this basic driver;
dedicated LED outputs remain disabled until a later LED patch describes
and manages them.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/phy/Kconfig             |   9 ++
 drivers/net/phy/Makefile            |   1 +
 drivers/net/phy/xpowers-ac200-ctl.c | 294 ++++++++++++++++++++++++++++++++++++
 drivers/net/phy/xpowers-acx00.h     |  15 ++
 4 files changed, 319 insertions(+)

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index a29d3fed8a05..6119f4de880d 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -475,6 +475,15 @@ config VITESSE_PHY
 	help
 	  Currently supports the vsc8244
 
+config XPOWERS_AC200_PHY_CTL
+	tristate "X-Powers AC200 Ethernet PHY control"
+	depends on MFD_AC200
+	help
+	  Enable the control driver for the Fast Ethernet PHY function in
+	  the X-Powers AC200 mixed-signal companion IC. It programs the PHY
+	  address, interface mode, calibration and I/O controls through the
+	  parent AC200 I2C regmap.
+
 config XILINX_GMII2RGMII
 	tristate "Xilinx GMII2RGMII converter driver"
 	help
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index e23df5e836e9..f81854fc9f12 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -100,4 +100,5 @@ obj-$(CONFIG_SMSC_PHY)		+= smsc.o
 obj-$(CONFIG_STE10XP)		+= ste10Xp.o
 obj-$(CONFIG_TERANETICS_PHY)	+= teranetics.o
 obj-$(CONFIG_VITESSE_PHY)	+= vitesse.o
+obj-$(CONFIG_XPOWERS_AC200_PHY_CTL) += xpowers-ac200-ctl.o
 obj-$(CONFIG_XILINX_GMII2RGMII) += xilinx_gmii2rgmii.o
diff --git a/drivers/net/phy/xpowers-ac200-ctl.c b/drivers/net/phy/xpowers-ac200-ctl.c
new file mode 100644
index 000000000000..c69e6a8c71a4
--- /dev/null
+++ b/drivers/net/phy/xpowers-ac200-ctl.c
@@ -0,0 +1,294 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * X-Powers AC200 Ethernet PHY control driver
+ *
+ * Copyright (c) 2022 Arm Ltd. (Andre Przywara <andre.przywara@arm.com>)
+ * Copyright (C) 2026 James Hilliard <james.hilliard1@gmail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/phy.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#include "xpowers-acx00.h"
+
+#define AC200_EPHY_BPS_EFFUSE_OFFSET	3
+
+#define AC200_SYS_EPHY_CTL0_REG			0x0014
+#define AC200_EPHY_RESET_DEASSERT		BIT(0)
+#define AC200_EPHY_SYSCLK_ENABLE			BIT(1)
+
+#define AC200_SYS_EPHY_CTL1_REG			0x0016
+#define AC200_EPHY_MII_IO_ENABLE			BIT(0)
+
+/* AC200-internal copy of the Ethernet PHY calibration eFuse. */
+#define AC200_EFUSE_EPHY_REG			0x8004
+
+#define AC200_EPHY_CTL_REG			0x6000
+#define AC200_EPHY_SHUTDOWN			BIT(0)
+#define AC200_EPHY_CLK_SEL_24_MHZ		BIT(2)
+#define AC200_EPHY_PHY_ADDR_MASK			GENMASK(8, 4)
+#define AC200_EPHY_RMII_SEL			BIT(11)
+#define AC200_EPHY_BPS_EFFUSE_MASK		GENMASK(15, 12)
+
+struct ac200_ephy_ctl {
+	struct acx00_ephy_control control;
+	struct regmap *regmap;
+	struct mutex lock; /* Serializes power sequencing and state. */
+	u16 ephy_ctl;
+	unsigned int phy_addr;
+	phy_interface_t interface;
+	bool powered;
+};
+
+static u16 ac200_ephy_ctl_config(const struct ac200_ephy_ctl *priv)
+{
+	return priv->ephy_ctl |
+		(priv->interface == PHY_INTERFACE_MODE_RMII ?
+		 AC200_EPHY_RMII_SEL : 0) |
+		FIELD_PREP(AC200_EPHY_PHY_ADDR_MASK, priv->phy_addr);
+}
+
+static int ac200_ephy_ctl_power_off_locked(struct ac200_ephy_ctl *priv)
+{
+	int err;
+	int ret;
+
+	if (!priv->powered)
+		return 0;
+
+	ret = regmap_write(priv->regmap, AC200_EPHY_CTL_REG,
+			   ac200_ephy_ctl_config(priv) | AC200_EPHY_SHUTDOWN);
+	err = regmap_write(priv->regmap, AC200_SYS_EPHY_CTL1_REG, 0);
+	if (!ret)
+		ret = err;
+	err = regmap_write(priv->regmap, AC200_SYS_EPHY_CTL0_REG, 0);
+	if (!ret)
+		ret = err;
+
+	priv->powered = false;
+
+	return ret;
+}
+
+static int ac200_ephy_ctl_power_off(struct acx00_ephy_control *control)
+{
+	struct ac200_ephy_ctl *priv =
+		container_of(control, struct ac200_ephy_ctl, control);
+	int ret;
+
+	mutex_lock(&priv->lock);
+	ret = ac200_ephy_ctl_power_off_locked(priv);
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static int
+ac200_ephy_ctl_set_interface(struct acx00_ephy_control *control,
+			     phy_interface_t interface)
+{
+	struct ac200_ephy_ctl *priv =
+		container_of(control, struct ac200_ephy_ctl, control);
+	u16 value;
+	int ret = 0;
+
+	switch (interface) {
+	case PHY_INTERFACE_MODE_MII:
+		value = 0;
+		break;
+	case PHY_INTERFACE_MODE_RMII:
+		value = AC200_EPHY_RMII_SEL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	mutex_lock(&priv->lock);
+	if (priv->interface == interface)
+		goto out_unlock;
+
+	if (priv->powered)
+		ret = regmap_update_bits(priv->regmap, AC200_EPHY_CTL_REG,
+					 AC200_EPHY_RMII_SEL, value);
+	if (!ret)
+		priv->interface = interface;
+
+out_unlock:
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static int ac200_ephy_ctl_power_on(struct acx00_ephy_control *control,
+				   unsigned int phy_addr)
+{
+	struct ac200_ephy_ctl *priv =
+		container_of(control, struct ac200_ephy_ctl, control);
+	u16 ephy_ctl;
+	int ret;
+
+	if (phy_addr > FIELD_MAX(AC200_EPHY_PHY_ADDR_MASK))
+		return -EINVAL;
+
+	mutex_lock(&priv->lock);
+	if (priv->powered && priv->phy_addr == phy_addr) {
+		ret = 0;
+		goto out_unlock;
+	}
+	if (priv->powered) {
+		ret = ac200_ephy_ctl_power_off_locked(priv);
+		if (ret)
+			goto out_unlock;
+	}
+	priv->phy_addr = phy_addr;
+
+	ephy_ctl = ac200_ephy_ctl_config(priv);
+
+	/* Start from a disabled state before applying the configuration. */
+	ret = regmap_write(priv->regmap, AC200_SYS_EPHY_CTL0_REG, 0);
+	if (ret)
+		goto err_disable;
+
+	ret = regmap_write(priv->regmap, AC200_SYS_EPHY_CTL1_REG,
+			   AC200_EPHY_MII_IO_ENABLE);
+	if (ret)
+		goto err_disable;
+
+	ret = regmap_write(priv->regmap, AC200_EPHY_CTL_REG,
+			   ephy_ctl | AC200_EPHY_SHUTDOWN);
+	if (ret)
+		goto err_disable;
+
+	ret = regmap_write(priv->regmap, AC200_SYS_EPHY_CTL0_REG,
+			   AC200_EPHY_RESET_DEASSERT |
+			   AC200_EPHY_SYSCLK_ENABLE);
+	if (ret)
+		goto err_disable;
+
+	fsleep(10000);
+
+	ret = regmap_write(priv->regmap, AC200_EPHY_CTL_REG, ephy_ctl);
+	if (ret)
+		goto err_disable;
+
+	priv->powered = true;
+	goto out_unlock;
+
+err_disable:
+	/* Attempt every step of the shutdown sequence after a partial start. */
+	priv->powered = true;
+	ac200_ephy_ctl_power_off_locked(priv);
+out_unlock:
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static int ac200_ephy_ctl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct ac200_ephy_ctl *priv;
+	unsigned long clk_rate;
+	unsigned int calibration;
+	u8 nvmem_calibration;
+	u8 bps_effuse_code;
+	struct clk *clk;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	mutex_init(&priv->lock);
+
+	priv->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!priv->regmap)
+		return dev_err_probe(dev, -EPROBE_DEFER,
+				     "parent regmap is not ready\n");
+
+	if (device_property_present(dev, "nvmem-cells")) {
+		ret = nvmem_cell_read_u8(dev, "calibration",
+					 &nvmem_calibration);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to read calibration data\n");
+		calibration = nvmem_calibration;
+	} else {
+		ret = regmap_read(priv->regmap, AC200_EFUSE_EPHY_REG,
+				  &calibration);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to read on-chip calibration data\n");
+	}
+
+	/* The vendor driver supplies no transfer function beyond this offset. */
+	bps_effuse_code = (calibration + AC200_EPHY_BPS_EFFUSE_OFFSET) &
+			   FIELD_MAX(AC200_EPHY_BPS_EFFUSE_MASK);
+	priv->ephy_ctl =
+		FIELD_PREP(AC200_EPHY_BPS_EFFUSE_MASK, bps_effuse_code);
+	/* EPHY_MODE and BIST_CLK_EN stay clear for normal operation. */
+
+	clk = clk_get(dev->parent, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to get input clock\n");
+
+	clk_rate = clk_get_rate(clk);
+	clk_put(clk);
+
+	switch (clk_rate) {
+	case 24000000:
+		priv->ephy_ctl |= AC200_EPHY_CLK_SEL_24_MHZ;
+		break;
+	case 27000000:
+		break;
+	default:
+		return dev_err_probe(dev, -EINVAL,
+				     "unsupported input clock rate %lu Hz\n",
+				     clk_rate);
+	}
+
+	priv->control.power_on = ac200_ephy_ctl_power_on;
+	priv->control.power_off = ac200_ephy_ctl_power_off;
+	priv->control.set_interface = ac200_ephy_ctl_set_interface;
+	/* MII is the reset default used until the MAC supplies its interface. */
+	priv->interface = PHY_INTERFACE_MODE_MII;
+	platform_set_drvdata(pdev, &priv->control);
+
+	return 0;
+}
+
+static void ac200_ephy_ctl_remove(struct platform_device *pdev)
+{
+	struct acx00_ephy_control *control = platform_get_drvdata(pdev);
+
+	control->power_off(control);
+}
+
+static const struct of_device_id ac200_ephy_ctl_of_match[] = {
+	{ .compatible = "x-powers,ac200-ephy-ctl" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ac200_ephy_ctl_of_match);
+
+static struct platform_driver ac200_ephy_ctl_driver = {
+	.probe = ac200_ephy_ctl_probe,
+	.remove = ac200_ephy_ctl_remove,
+	.shutdown = ac200_ephy_ctl_remove,
+	.driver = {
+		.name = "ac200-ephy-ctl",
+		.of_match_table = ac200_ephy_ctl_of_match,
+	},
+};
+module_platform_driver(ac200_ephy_ctl_driver);
+
+MODULE_AUTHOR("James Hilliard <james.hilliard1@gmail.com>");
+MODULE_DESCRIPTION("X-Powers AC200 Ethernet PHY control driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/net/phy/xpowers-acx00.h b/drivers/net/phy/xpowers-acx00.h
new file mode 100644
index 000000000000..482ba6faba6e
--- /dev/null
+++ b/drivers/net/phy/xpowers-acx00.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __DRIVERS_NET_PHY_XPOWERS_ACX00_H
+#define __DRIVERS_NET_PHY_XPOWERS_ACX00_H
+
+#include <linux/phy.h>
+
+struct acx00_ephy_control {
+	int (*power_on)(struct acx00_ephy_control *control,
+			unsigned int phy_addr);
+	int (*power_off)(struct acx00_ephy_control *control);
+	int (*set_interface)(struct acx00_ephy_control *control,
+			     phy_interface_t interface);
+};
+
+#endif

-- 
2.53.0

