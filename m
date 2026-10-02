Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F7549AA59
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 13:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947008; cv=none; b=sZZTL6Uwcyl5lqHjDOssOpnhk3YK2iUkwtrjOYg+udP52RkgS8CzTocscFIOhgBhnpqZCQU9j9h2DnyFA7WGd4MPJ+IHpEXdjtKvL430s6HgaZ1+gPRjJjzV2HiQ1XVBn8wGF+J7kiCQoJkD3iwdY4PmYQhDQc2w3gGk1c4kqVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947008; c=relaxed/simple;
	bh=9CdMhYIOLSytyFTmKeedprbNxEo885w4wOK42k36eDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t/bh5lX0tEZ49omypPKoCAyf+9BlYvLPL/+f39VcH9Y9ETvaUmQSSXrLkgMLyPKP7tobv8PJEeBVgEVionp9Co5FWx3ZpgQFCtxPpya4BxTnAN/BPNpbxlgHjGwE+ud/fbRvMqgsqTKvyml+hATnTEcM4pp2zIAujJaQSoo0n50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ie4dCGKb; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ie4dCGKb"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34daf1b9a1fso1488815eec.2
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 06:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790947004; x=1791551804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nvx/6wkLcHShWXkNZT1A0xIy9aByre6GFax+04vmtXM=;
        b=Ie4dCGKbtpHczsPL87QNune8WaSS4O8PeOvrrwApwzEto5iLHDhS3LYPKnO3hsZDdO
         83lrfUV5ZnO6fJvwYXt28NO1dfUjpurTFQ8/pwlMis5NDSUW9hYujIp9w5VEHkKMWOzT
         XCfyRqxjVkwK4Ur2vkjH2JqVz21zTurQX4I4hlnVaMojAxLOGISbzoaDtddU8s2Swx/D
         5Xo+S0FfYS5aMdkfoh9hPgVFrryMog/sZwgWMcP0Rkk9BSz8YLA2+Ea5Vc9xGsSKlk/d
         FmSBUdFQVLHeLFUIFD6OXgWewTg1Ph0MwF6HKjb6ORluRmQL5abxj9l7gyZUNKva4pfp
         di0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790947004; x=1791551804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nvx/6wkLcHShWXkNZT1A0xIy9aByre6GFax+04vmtXM=;
        b=h821+043Pd/2DlmMJkoFtqdgrV7XMMDe7fU6WbjZOjhajmLbc6C2pa5+3iaKxhVQOr
         ZwfCF65WtQ1eZ1FMNq1sd+wTB8fJxAmDAf0B59R9pom8dXs2Tno2UtymNdRHyn5D6FO7
         ICZujcWzs2PS2VwBkQ70wGxYCSSdsUIdm/OXZT+ETI4JKGfPsYhpseku+gO9QiT/J/IY
         vELkaIGwIv2W7rP3FNiAosm93arSeCmA2oiVFmx0f4loHxcIXOSC2ye0vr50kAChCDip
         nm0F3xtotcETZCuTwJoqEF813XKOlfqAJOrLhScGJe4b9+5K3/JlEpyyKPI7R1EkeTd/
         bEMg==
X-Gm-Message-State: AFq9FYKh7jFO991WfviJTobX7JAD4Vn9KIIGjS5rpOIW+jF6O9znKFUk
	tKS5XsFnvXbFLoHA9ihdzjcELq/kyof2n8vCk+xlOquyIfrlbU3ZPIl+jQmRpw==
X-Gm-Gg: AYBFou2VgtCmW6kDZ8gTuaF2+gd/Ldu4eU2JZ7wMFxatylpnIygVl3Z63p8kKopRKoq
	/gBelv7y3GRtRQg18U7gWLOyIOq53Fpx23vz8X0qSvrMEFxwVjgSsL38VLMMrfyHKor+JmbmhQV
	xna3Y0njlc3oXXCBHvXAInsoqWr8ukszTllfa7t15S3rRVODVFMB+1uP02SCV4zEBFhgl2bXb2b
	5ciAOLK+LUQWsgEqR2qqU0MzYnji2N33hTb1kePjDQopnn+hlqMpvkCjL31jPhOa1FBBxlemJ1D
	fgJBiQ4BL037z+HEw5CUztutzwhz6qmYETCmqU5uy2LJFgmUOIOXLhQFAOSopQuIdCj5sMWtD9C
	3dv6d1AW6DyrCY90cu0FVX6F5u322Cacdjo6XKn0BIN/94VHUjL+HxuzQPKmUPS02Wd9xbCQ/TI
	/Fp9NC+9seoz/SEROSKGq2kS6k9E2UJFnWgriFL83qkRecH2VxeWls+ghG+DKFZ0jQ02UA2+hEs
	KcIwzt3JECMDNYsEKS4ZaO5tko=
X-Received: by 2002:a05:693c:8951:10b0:34d:2084:12d3 with SMTP id 5a478bee46e88-34f219a4e69mr2785581eec.39.1790947004214;
        Fri, 02 Oct 2026 06:16:44 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f9f2afsm15839228eec.18.2026.10.02.06.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:16:42 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	joel@jms.id.au,
	ryan_chen@aspeedtech.com,
	tan.siewert@9elements.com,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [RFC PATCH] soc: aspeed: Add B650D4U power passthrough support
Date: Fri,  2 Oct 2026 18:46:34 +0530
Message-ID: <20261002131634.113680-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the AST2600 SCU passthrough selector support used by the
ASRock Rack B650D4U host power-control circuit. This RFC includes
the driver, Devicetree binding, and board node to discuss the final
kernel-facing interface.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 .../asrock,b650d4u-power-passthrough.yaml     |  23 ++++
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  |   5 +
 drivers/soc/aspeed/Kconfig                    |   9 ++
 drivers/soc/aspeed/Makefile                   |   1 +
 drivers/soc/aspeed/aspeed-b650d4u-power.c     | 110 ++++++++++++++++++
 5 files changed, 148 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power-passthrough.yaml
 create mode 100644 drivers/soc/aspeed/aspeed-b650d4u-power.c

diff --git a/Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power-passthrough.yaml b/Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power-passthrough.yaml
new file mode 100644
index 000000000000..e6451d17955c
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/aspeed/asrock,b650d4u-power-passthrough.yaml
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/aspeed/asrock,b650d4u-power-passthrough.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASRock Rack B650D4U power passthrough
+
+maintainers:
+  - Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
+
+properties:
+  compatible:
+    const: asrock,b650d4u-power-passthrough
+
+  aspeed,scu:
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - aspeed,scu
+
+additionalProperties: false
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
index a4e384588a54..86291c250562 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
@@ -32,6 +32,11 @@ gfx_memory: framebuffer {
 			size = <0x01000000>;
 		};
 	};
+
+	host-power-passthrough {
+		compatible = "asrock,b650d4u-power-passthrough";
+		aspeed,scu = <&syscon>;
+	};
 };
 
 &fmc {
diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index 11e4db998c06..1b0281e0bfb0 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -58,6 +58,15 @@ config ASPEED_SBC
 	  Say yes to provide information about the secure boot controller in
 	  debugfs.
 
+config ASPEED_B650D4U_POWER
+	tristate "ASRock B650D4U host power passthrough"
+	select REGMAP
+	select MFD_SYSCON
+	default ARCH_ASPEED
+	help
+	  Enable the AST2600 GPIO passthrough selector used by the
+	  ASRock Rack B650D4U host power-control circuit. This selector routes the host power pulse through the board's passthrough logic during power sequencing.
+
 config ASPEED_XDMA
 	tristate "ASPEED XDMA Engine Driver"
 	select REGMAP
diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
index 5f61bb4cc36c..3e9618d1eafc 100644
--- a/drivers/soc/aspeed/Makefile
+++ b/drivers/soc/aspeed/Makefile
@@ -5,4 +5,5 @@ obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
 obj-$(CONFIG_ASPEED_P2A_CTRL)		+= aspeed-p2a-ctrl.o
 obj-$(CONFIG_ASPEED_SOCINFO)		+= aspeed-socinfo.o
 obj-$(CONFIG_ASPEED_SBC)		+= aspeed-sbc.o
+obj-$(CONFIG_ASPEED_B650D4U_POWER)	+= aspeed-b650d4u-power.o
 obj-$(CONFIG_ASPEED_XDMA)		+= aspeed-xdma.o
diff --git a/drivers/soc/aspeed/aspeed-b650d4u-power.c b/drivers/soc/aspeed/aspeed-b650d4u-power.c
new file mode 100644
index 000000000000..22a6925539dc
--- /dev/null
+++ b/drivers/soc/aspeed/aspeed-b650d4u-power.c
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mutex.h>
+#include <linux/kstrtox.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/bits.h>
+
+#define ASPEED_SCU_PROTECTION        0x000
+#define ASPEED_SCU_GPIO_PASSTHROUGH  0x4bc
+#define ASPEED_SCU_GPIO_ACTION       0x51c
+#define ASPEED_SCU_UNLOCK_KEY        0x1688a8a8
+#define ASPEED_B650D4U_POWER_MASK    GENMASK(27, 26)
+
+static struct regmap *b650d4u_scu;
+static DEFINE_MUTEX(b650d4u_lock);
+
+static int b650d4u_set_passthrough(bool enable)
+{
+	int ret;
+
+	mutex_lock(&b650d4u_lock);
+
+	ret = regmap_write(b650d4u_scu, ASPEED_SCU_PROTECTION,
+			   ASPEED_SCU_UNLOCK_KEY);
+	if (ret) {
+		pr_err("B650D4U: SCU unlock failed: %d\n", ret);
+		goto out;
+	}
+
+	ret = regmap_update_bits(b650d4u_scu,
+				 ASPEED_SCU_GPIO_PASSTHROUGH,
+				 ASPEED_B650D4U_POWER_MASK,
+				 enable ? ASPEED_B650D4U_POWER_MASK : 0);
+	if (ret) {
+		pr_err("B650D4U: passthrough update failed: %d\n", ret);
+		goto out;
+	}
+
+	if (!enable)
+		ret = regmap_write(b650d4u_scu,
+				   ASPEED_SCU_GPIO_ACTION, 0);
+
+out:
+	mutex_unlock(&b650d4u_lock);
+	return ret;
+}
+
+static ssize_t passthrough_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	bool enable;
+	int ret;
+
+	ret = kstrtobool(buf, &enable);
+	if (ret)
+		return ret;
+
+	ret = b650d4u_set_passthrough(enable);
+	return ret ? ret : count;
+}
+static DEVICE_ATTR_WO(passthrough);
+
+static int aspeed_b650d4u_power_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	b650d4u_scu = syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
+						      "aspeed,scu");
+	if (IS_ERR(b650d4u_scu))
+		return dev_err_probe(&pdev->dev, PTR_ERR(b650d4u_scu),
+				     "failed to get AST2600 SCU regmap\n");
+
+	ret = b650d4u_set_passthrough(true);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to enable power GPIO passthrough\n");
+
+	ret = device_create_file(&pdev->dev, &dev_attr_passthrough);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to create passthrough control\n");
+
+	dev_info(&pdev->dev, "enabled GPIO passthrough selector 1\n");
+	return 0;
+}
+
+static const struct of_device_id aspeed_b650d4u_power_of_match[] = {
+	{ .compatible = "asrock,b650d4u-power-passthrough" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, aspeed_b650d4u_power_of_match);
+
+static struct platform_driver aspeed_b650d4u_power_driver = {
+	.probe = aspeed_b650d4u_power_probe,
+	.driver = {
+		.name = "aspeed-b650d4u-power",
+		.of_match_table = aspeed_b650d4u_power_of_match,
+	},
+};
+module_platform_driver(aspeed_b650d4u_power_driver);
+
+MODULE_DESCRIPTION("ASRock Rack B650D4U host power GPIO passthrough");
+MODULE_LICENSE("GPL");
-- 
2.47.3

