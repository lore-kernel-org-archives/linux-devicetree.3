Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8311243D50D;
	Tue, 14 Jul 2026 09:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784021209; cv=none; b=hI27g1Nu4wL/JGn+eq/Il9Fqh0h9uMKtnCZpe6YppSgjsi/OvO1WjiLXdPrqvITLbd1Jdx3uJmxjr2pRdcsZ671E9ObFXR4AUVmmxb8ypgdsDqS9U4MzgbSHn02sws2l2TOjh92dSUxU22bHZOekZZU7hHkjTWyBiPY2tHELHVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784021209; c=relaxed/simple;
	bh=dDP+4Sgi/5dtKpjKs2tq3p0sNcsBvEIJR5G1XpP/1IQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I7pS8fn1c17mV3awrKPTjqXvEqIohEl5I/Z2n9YfSnw+WlcNKL6EYR35D+gxjFdvAy38GjHUEZA/3J3iqPibdhRqD8Qmwu4yCrJpy8TBwqzf0vKWtepTFECe35MblTa+zv1rbuF6xZgkVAI+mL82ixDNxTMKdvXzb7HXFoqSUPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 484E51A0045;
	Tue, 14 Jul 2026 11:21:08 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id ADF9F1A006D;
	Tue, 14 Jul 2026 11:21:07 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 4431E18000B0;
	Tue, 14 Jul 2026 17:21:06 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	broonie@kernel.org,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [PATCH v14 7/8] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality
Date: Tue, 14 Jul 2026 14:50:52 +0530
Message-Id: <20260714092053.2461482-8-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
References: <20260714092053.2461482-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

Add I3C hub functionality for the NXP P3H2x4x family of multiport hubs.
These devices support downstream target ports that can be configured
as I3C, I2C, or SMBus.

This driver enables:
- I3C/I2C communication between host and hub
- Transparent communication with downstream devices
- Target port configuration (I3C/I2C/SMBus)

P3H2440/P3H2441 support 4 target ports.
P3H2840/P3H2841 support 8 target ports.

Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>

---
Changes in v14:
 - Replace temporary parent dev->of_node reassignment with
   i3c_master_register_fwnode()
 - Use the shared MFD protected_reg_lock for protected hub configuration
   writes
 - Fix SMBus polling interval calculation to avoid oversleeping the computed
   transaction timeout
 - Change SMBus transfer loop counters from u8 to int
 - Clean up already registered SMBus adapters on adapter allocation or
   registration failure

Changes in v13:
 - Fix SMBus transaction handling by replacing fixed delay with polling (read_poll_timeout)
   to avoid premature reads and data corruption
 - Fix DT and of_node handling: prevent duplicate target-port node leaks and avoid corrupting
   parent dev->of_node by restoring it after registration
 - Add proper cleanup using devm actions (relock registers, release DT nodes, unregister adapters)
   and fix minor comment mismatch

Changes in v12:
 - Fix target-port configuration register updates
 - Correct default pull-up and drive-strength values
 - Improve OF node and SMBus adapter cleanup
 - Remove dead code and simplify cleanup by relying on devm-managed resources

Changes in v11:
 - Fix IBI resource cleanup on error paths
 - Fix adapter unregister cleanup handling

Changes in v10:
 - Split SMBus target/slave mode support, including IBI and MCTP receive
   handling, into a separate patch

Changes in v9:
 - Added CONFIG_I2C_SLAVE guards where necessary to avoid build issues
   when I2C slave support is disabled.

Changes in v8:
 - No change

Changes in v7:
 - Remove CONFIG_I2C_SLAVE guards
 - Use Kernel API find_closest instead of custom helper
 - Use devm_regulator_get_enable_optional()
 - Fix kernel-doc warnings

Changes in v6:
 - Remove generic I3C code and keep reg dependent code only.

Changes in v5:
 - Updated supply names.

Changes in v4:
 - Split the driver into three separate patches (mfd, regulator and I3C hub)
 - Added support for NXP P3H2x4x I3C hub functionality
 - Integrated hub driver with its on-die regulator

Changes in v3:
 - Added MFD (Multi-Function Device) support for I3C hub and on-die regulator

Changes in v2:
 - Refined coding style and incorporated review feedback
 - Updated directory structure
 - Revised logic for parsing DTS nodes
---
---
 MAINTAINERS                              |   1 +
 drivers/i3c/Kconfig                      |   1 +
 drivers/i3c/Makefile                     |   1 +
 drivers/i3c/hub/Kconfig                  |  11 +
 drivers/i3c/hub/Makefile                 |   4 +
 drivers/i3c/hub/p3h2840_i3c_hub.h        | 327 +++++++++++++++++++
 drivers/i3c/hub/p3h2840_i3c_hub_common.c | 379 +++++++++++++++++++++++
 drivers/i3c/hub/p3h2840_i3c_hub_i3c.c    | 118 +++++++
 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c  | 322 +++++++++++++++++++
 9 files changed, 1164 insertions(+)
 create mode 100644 drivers/i3c/hub/Kconfig
 create mode 100644 drivers/i3c/hub/Makefile
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub.h
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_common.c
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
 create mode 100644 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a0b7fd85f8e3..718c5fca4746 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19312,6 +19312,7 @@ L:	linux-i3c@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
 F:	drivers/i3c/hub.c
+F:	drivers/i3c/hub/*
 F:	drivers/mfd/p3h2840.c
 F:	drivers/regulator/p3h2840_i3c_hub_regulator.c
 F:	include/linux/i3c/hub.h
diff --git a/drivers/i3c/Kconfig b/drivers/i3c/Kconfig
index 7536f3740c94..81d5ebd8025c 100644
--- a/drivers/i3c/Kconfig
+++ b/drivers/i3c/Kconfig
@@ -35,6 +35,7 @@ config I3C_HUB
 
 	  Say Y here if your platform includes an I3C hub device
 
+source "drivers/i3c/hub/Kconfig"
 endif # I3C
 
 config I3C_OR_I2C
diff --git a/drivers/i3c/Makefile b/drivers/i3c/Makefile
index 9ddee56a6338..2950820db9ea 100644
--- a/drivers/i3c/Makefile
+++ b/drivers/i3c/Makefile
@@ -3,3 +3,4 @@ i3c-y				:= device.o master.o
 obj-$(CONFIG_I3C)		+= i3c.o
 obj-$(CONFIG_I3C)		+= master/
 obj-$(CONFIG_I3C_HUB)		+= hub.o
+obj-$(CONFIG_I3C_HUB)		+= hub/
diff --git a/drivers/i3c/hub/Kconfig b/drivers/i3c/hub/Kconfig
new file mode 100644
index 000000000000..816879fda326
--- /dev/null
+++ b/drivers/i3c/hub/Kconfig
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright 2025 NXP
+config P3H2X4X_I3C_HUB
+    tristate "NXP P3H2X4X I3C HUB support"
+    depends on MFD_P3H2X4X
+    select I3C_HUB
+    help
+      This enables support for NXP P3H244x/P3H284x I3C HUB. These hubs
+      connect to a host via I3C/I2C/SMBus and allow communication with
+      multiple downstream peripherals. Say Y or M here to enable the
+      P3H2x4x I3C HUB driver.
diff --git a/drivers/i3c/hub/Makefile b/drivers/i3c/hub/Makefile
new file mode 100644
index 000000000000..9dbd8a7b4184
--- /dev/null
+++ b/drivers/i3c/hub/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright 2025 NXP
+p3h2840_i3c_hub-y := p3h2840_i3c_hub_common.o p3h2840_i3c_hub_i3c.o p3h2840_i3c_hub_smbus.o
+obj-$(CONFIG_P3H2X4X_I3C_HUB)	+= p3h2840_i3c_hub.o
diff --git a/drivers/i3c/hub/p3h2840_i3c_hub.h b/drivers/i3c/hub/p3h2840_i3c_hub.h
new file mode 100644
index 000000000000..e7ab243bbfff
--- /dev/null
+++ b/drivers/i3c/hub/p3h2840_i3c_hub.h
@@ -0,0 +1,327 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2025-2026 NXP
+ * Private definitions for the NXP P3H2X4X I3C hub driver.
+ */
+
+#ifndef P3H2840_I3C_HUB_H
+#define P3H2840_I3C_HUB_H
+
+#include <linux/bitfield.h>
+#include <linux/i2c.h>
+#include <linux/i3c/device.h>
+#include <linux/i3c/hub.h>
+#include <linux/i3c/master.h>
+#include <linux/regulator/consumer.h>
+#include <linux/regmap.h>
+
+/* I3C HUB REGISTERS */
+
+/* Device Information Registers */
+#define P3H2X4X_DEV_INFO_0					0x00
+#define P3H2X4X_DEV_INFO_1					0x01
+#define P3H2X4X_PID_5						0x02
+#define P3H2X4X_PID_4						0x03
+#define P3H2X4X_PID_3						0x04
+#define P3H2X4X_PID_2						0x05
+#define P3H2X4X_PID_1						0x06
+#define P3H2X4X_PID_0						0x07
+#define P3H2X4X_BCR						0x08
+#define P3H2X4X_DCR						0x09
+#define P3H2X4X_DEV_CAPAB					0x0a
+#define P3H2X4X_DEV_REV						0x0b
+
+/* Device Configuration Registers */
+#define P3H2X4X_CP_CONF						0x11
+#define P3H2X4X_TP_ENABLE					0x12
+
+#define P3H2X4X_DEV_CONF					0x13
+#define P3H2X4X_IO_STRENGTH					0x14
+#define P3H2X4X_TP0145_IO_STRENGTH_MASK				GENMASK(1, 0)
+#define P3H2X4X_TP0145_IO_STRENGTH(x)	\
+		FIELD_PREP(P3H2X4X_TP0145_IO_STRENGTH_MASK, x)
+#define P3H2X4X_TP2367_IO_STRENGTH_MASK				GENMASK(3, 2)
+#define P3H2X4X_TP2367_IO_STRENGTH(x)	\
+		FIELD_PREP(P3H2X4X_TP2367_IO_STRENGTH_MASK, x)
+#define P3H2X4X_CP0_IO_STRENGTH_MASK				GENMASK(5, 4)
+#define P3H2X4X_CP0_IO_STRENGTH(x)	\
+		FIELD_PREP(P3H2X4X_CP0_IO_STRENGTH_MASK, x)
+#define P3H2X4X_CP1_IO_STRENGTH_MASK				GENMASK(7, 6)
+#define P3H2X4X_CP1_IO_STRENGTH(x)	\
+		FIELD_PREP(P3H2X4X_CP1_IO_STRENGTH_MASK, x)
+#define P3H2X4X_IO_STRENGTH_MASK					GENMASK(7, 0)
+
+#define P3H2X4X_TP_IO_MODE_CONF					0x17
+#define P3H2X4X_TP_SMBUS_AGNT_EN				0x18
+
+#define P3H2X4X_LDO_AND_PULLUP_CONF				0x19
+
+#define P3H2X4X_TP0145_PULLUP_CONF_MASK				GENMASK(7, 6)
+#define P3H2X4X_TP0145_PULLUP_CONF(x)	\
+		FIELD_PREP(P3H2X4X_TP0145_PULLUP_CONF_MASK, x)
+#define P3H2X4X_TP2367_PULLUP_CONF_MASK				GENMASK(5, 4)
+#define P3H2X4X_TP2367_PULLUP_CONF(x)	\
+		FIELD_PREP(P3H2X4X_TP2367_PULLUP_CONF_MASK, x)
+#define P3H2X4X_PULLUP_CONF_MASK					GENMASK(7, 4)
+
+#define P3H2X4X_CP_IBI_CONF					0x1a
+
+#define P3H2X4X_TP_SMBUS_AGNT_IBI_CONFIG			0x1b
+
+#define P3H2X4X_IBI_MDB_CUSTOM					0x1c
+#define P3H2X4X_JEDEC_CONTEXT_ID				0x1d
+#define P3H2X4X_TP_GPIO_MODE_EN					0x1e
+
+/* Device Status and IBI Registers */
+#define P3H2X4X_DEV_AND_IBI_STS					0x20
+#define P3H2X4X_TP_SMBUS_AGNT_IBI_STS				0x21
+#define P3H2X4X_SMBUS_AGENT_EVENT_FLAG_STATUS			BIT(4)
+
+/* Controller Port Control/Status Registers */
+#define P3H2X4X_CP_MUX_SET					0x38
+#define P3H2X4X_CONTROLLER_PORT_MUX_REQ				BIT(0)
+#define P3H2X4X_CP_MUX_STS					0x39
+#define P3H2X4X_CONTROLLER_PORT_MUX_CONNECTION_STATUS		BIT(0)
+
+/* Target Ports Control Registers */
+#define P3H2X4X_TP_SMBUS_AGNT_TRANS_START			0x50
+#define P3H2X4X_TP_NET_CON_CONF					0x51
+
+#define P3H2X4X_TP_PULLUP_EN					0x53
+
+#define P3H2X4X_TP_SCL_OUT_EN					0x54
+#define P3H2X4X_TP_SDA_OUT_EN					0x55
+#define P3H2X4X_TP_SCL_OUT_LEVEL				0x56
+#define P3H2X4X_TP_SDA_OUT_LEVEL				0x57
+#define P3H2X4X_TP_IN_DETECT_MODE_CONF				0x58
+#define P3H2X4X_TP_SCL_IN_DETECT_IBI_EN				0x59
+#define P3H2X4X_TP_SDA_IN_DETECT_IBI_EN				0x5a
+
+/* Target Ports Status Registers */
+#define P3H2X4X_TP_SCL_IN_LEVEL_STS				0x60
+#define P3H2X4X_TP_SDA_IN_LEVEL_STS				0x61
+#define P3H2X4X_TP_SCL_IN_DETECT_FLG				0x62
+#define P3H2X4X_TP_SDA_IN_DETECT_FLG				0x63
+
+/* SMBus Agent Configuration and Status Registers */
+#define P3H2X4X_TP0_SMBUS_AGNT_STS				0x64
+#define P3H2X4X_TP1_SMBUS_AGNT_STS				0x65
+#define P3H2X4X_TP2_SMBUS_AGNT_STS				0x66
+#define P3H2X4X_TP3_SMBUS_AGNT_STS				0x67
+#define P3H2X4X_TP4_SMBUS_AGNT_STS				0x68
+#define P3H2X4X_TP5_SMBUS_AGNT_STS				0x69
+#define P3H2X4X_TP6_SMBUS_AGNT_STS				0x6a
+#define P3H2X4X_TP7_SMBUS_AGNT_STS				0x6b
+#define P3H2X4X_ONCHIP_TD_AND_SMBUS_AGNT_CONF			0x6c
+
+/* buf receive flag set */
+#define P3H2X4X_TARGET_BUF_CA_TF				BIT(0)
+#define P3H2X4X_TARGET_BUF_0_RECEIVE				BIT(1)
+#define P3H2X4X_TARGET_BUF_1_RECEIVE				BIT(2)
+#define P3H2X4X_TARGET_BUF_0_1_RECEIVE				GENMASK(2, 1)
+#define P3H2X4X_TARGET_BUF_OVRFL				GENMASK(3, 1)
+#define BUF_RECEIVED_FLAG_MASK					GENMASK(3, 1)
+#define BUF_RECEIVED_FLAG_TF_MASK				GENMASK(3, 0)
+
+#define P3H2X4X_TARGET_AGENT_LOCAL_DEV				0x11
+#define P3H2X4X_TARGET_BUFF_0_PAGE				0x12
+#define P3H2X4X_TARGET_BUFF_1_PAGE				0x13
+
+/* Special Function Registers */
+#define P3H2X4X_LDO_AND_CPSEL_STS				0x79
+#define P3H2X4X_CP_SDA1_LEVEL					BIT(7)
+#define P3H2X4X_CP_SCL1_LEVEL					BIT(6)
+
+#define P3H2X4X_CP_SEL_PIN_INPUT_CODE_MASK			GENMASK(5, 4)
+#define P3H2X4X_CP_SEL_PIN_INPUT_CODE_GET(x)	\
+		(((x) & P3H2X4X_CP_SEL_PIN_INPUT_CODE_MASK) >> 4)
+#define P3H2X4X_CP_SDA1_SCL1_PINS_CODE_MASK			GENMASK(7, 6)
+#define P3H2X4X_CP_SDA1_SCL1_PINS_CODE_GET(x)	\
+		(((x) & P3H2X4X_CP_SDA1_SCL1_PINS_CODE_MASK) >> 6)
+#define P3H2X4X_VCCIO1_PWR_GOOD					BIT(3)
+#define P3H2X4X_VCCIO0_PWR_GOOD					BIT(2)
+#define P3H2X4X_CP1_VCCIO_PWR_GOOD				BIT(1)
+#define P3H2X4X_CP0_VCCIO_PWR_GOOD				BIT(0)
+
+#define P3H2X4X_BUS_RESET_SCL_TIMEOUT				0x7a
+#define P3H2X4X_ONCHIP_TD_PROTO_ERR_FLG				0x7b
+#define P3H2X4X_DEV_CMD						0x7c
+#define P3H2X4X_ONCHIP_TD_STS					0x7d
+#define P3H2X4X_ONCHIP_TD_ADDR_CONF				0x7e
+#define P3H2X4X_PAGE_PTR					0x7f
+
+/* Paged Transaction Registers */
+#define P3H2X4X_CONTROLLER_BUFFER_PAGE				0x10
+#define P3H2X4X_CONTROLLER_AGENT_BUFF				0x80
+#define P3H2X4X_CONTROLLER_AGENT_BUFF_DATA			0x84
+
+#define P3H2X4X_TARGET_BUFF_LENGTH				0x80
+#define P3H2X4X_TARGET_BUFF_ADDRESS				0x81
+#define P3H2X4X_TARGET_BUFF_DATA				0x82
+
+#define P3H2X4X_TP_MAX_COUNT					0x08
+#define P3H2X4X_CP_MAX_COUNT					0x02
+#define P3H2X4X_TP_LOCAL_DEV					0x08
+
+/* LDO Disable/Enable DT settings */
+#define P3H2X4X_LDO_VOLT_1_0V					0x00
+#define P3H2X4X_LDO_VOLT_1_1V					0x01
+#define P3H2X4X_LDO_VOLT_1_2V					0x02
+#define P3H2X4X_LDO_VOLT_1_8V					0x03
+
+#define P3H2X4X_LDO_DISABLED					0x00
+#define P3H2X4X_LDO_ENABLED					0x01
+
+#define P3H2X4X_IBI_DISABLED					0x00
+#define P3H2X4X_IBI_ENABLED					0x01
+
+#define P3H2X4X_TP_PULLUP_DISABLED				0x00
+#define P3H2X4X_TP_PULLUP_ENABLED				0x01
+
+#define P3H2X4X_TP_MODE_I3C					0x00
+#define P3H2X4X_TP_MODE_SMBUS					0x01
+#define P3H2X4X_TP_MODE_GPIO					0x02
+#define P3H2X4X_TP_MODE_I2C					0x03
+
+#define ONE_BYTE_SIZE						0x01
+
+/* holding SDA low when both SMBus Target Agent received data buffers are full.
+ * This feature can be used as a flow-control mechanism for MCTP applications to
+ * avoid MCTP transmitters on Target Ports time out when the SMBus agent buffers
+ * are not serviced in time by upstream controller and only receives write message
+ * from its downstream ports.
+ * SMBUS_AGENT_TX_RX_LOOPBACK_EN/TARGET_AGENT_BUF_FULL_SDA_LOW_EN
+ */
+
+#define P3H2X4X_TARGET_AGENT_DFT_IBI_CONF			0x20
+#define P3H2X4X_TARGET_AGENT_DFT_IBI_CONF_MASK			0x21
+
+/* Transaction status checking mask */
+#define P3H2X4X_SMBUS_TRANSACTION_FINISH_FLAG		1
+#define P3H2X4X_SMBUS_CNTRL_STATUS_TXN_SHIFT		4
+
+#define P3H2X4X_SMBUS_CNTRL_STATUS_TXN_OK		0
+#define P3H2X4X_SMBUS_CNTRL_STATUS_TXN_ADDR_NAK		1
+#define P3H2X4X_SMBUS_CNTRL_STATUS_TXN_DATA_NAK		2
+#define P3H2X4X_SMBUS_CNTRL_STATUS_TXN_WTR_NAK		3
+#define P3H2X4X_SMBUS_CNTRL_STATUS_TXN_SYNC_RCV		4
+#define P3H2X4X_SMBUS_CNTRL_STATUS_TXN_SYNC_RCVCLR	5
+#define P3H2X4X_SMBUS_CNTRL_STATUS_TXN_FAULT		6
+#define P3H2X4X_SMBUS_CNTRL_STATUS_TXN_ARB_LOSS		7
+#define P3H2X4X_SMBUS_CNTRL_STATUS_TXN_SCL_TO		8
+
+#define P3H2X4X_TP_BUFFER_STATUS_MASK				0x0f
+#define P3H2X4X_TP_TRANSACTION_CODE_MASK			0xf0
+
+/* SMBus transaction types fields */
+#define P3H2X4X_SMBUS_400kHz					BIT(2)
+
+/* SMBus polling */
+#define P3H2X4X_SMBUS_POLL_COUNT			10
+#define P3H2X4X_SMBUS_POLL_INTERVAL_MIN_US		20
+#define P3H2X4X_SMBUS_POLL_INTERVAL_MAX_US		150
+
+/* Hub buffer size */
+#define P3H2X4X_CONTROLLER_BUFFER_SIZE				88
+#define P3H2X4X_TARGET_BUFFER_SIZE				80
+#define P3H2X4X_SMBUS_DESCRIPTOR_SIZE				4
+#define P3H2X4X_SMBUS_PAYLOAD_SIZE	\
+		(P3H2X4X_CONTROLLER_BUFFER_SIZE - P3H2X4X_SMBUS_DESCRIPTOR_SIZE)
+#define P3H2X4X_SMBUS_TARGET_PAYLOAD_SIZE	(P3H2X4X_TARGET_BUFFER_SIZE - 2)
+
+/* Hub SMBus transaction time */
+#define P3H2X4X_SMBUS_400kHz_TRANSFER_TIMEOUT(x)		((20 * (x)) + 80)
+
+#define P3H2X4X_NO_PAGE_PER_TP					4
+
+#define P3H2X4X_MAX_PAYLOAD_LEN					2
+#define P3H2X4X_NUM_SLOTS					6
+
+#define P3H2X4X_HUB_ID						0
+
+#define P3H2X4X_SET_BIT(n)					BIT(n)
+
+#define P3H2X4X_TP_MASK						GENMASK(P3H2X4X_TP_MAX_COUNT - 1, 0)
+
+#define P3H2X4X_DFT_TP_PULLUP_OHMS				500
+#define P3H2X4X_DFT_IO_STRENGTH_OHMS				20
+enum p3h2x4x_tp {
+	TP_0,
+	TP_1,
+	TP_2,
+	TP_3,
+	TP_4,
+	TP_5,
+	TP_6,
+	TP_7,
+};
+
+enum p3h2x4x_rcv_buf {
+	RCV_BUF_0,
+	RCV_BUF_1,
+	RCV_BUF_OF,
+};
+
+struct tp_configuration {
+	bool pullup_en;
+	bool ibi_en;
+	bool always_enable;
+	int mode;
+};
+
+struct hub_configuration {
+	int tp0145_pullup;
+	int tp2367_pullup;
+	int cp0_io_strength;
+	int cp1_io_strength;
+	int tp0145_io_strength;
+	int tp2367_io_strength;
+	struct tp_configuration tp_config[P3H2X4X_TP_MAX_COUNT];
+};
+
+struct tp_bus {
+	bool is_registered;	    /* bus was registered in the framework. */
+	u8 tp_mask;
+	u8 tp_port;
+	struct mutex port_mutex;      /* per port mutex */
+	struct device_node *of_node;
+	struct i2c_client *tp_smbus_client;
+	struct i2c_adapter *tp_smbus_adapter;
+	struct i3c_hub_controller hub_controller;
+	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub;
+};
+
+struct p3h2x4x_i3c_hub_dev {
+	struct device *dev;
+	struct regmap *regmap;
+	struct mutex etx_mutex;      /* all port mutex */
+	struct i3c_device *i3cdev;
+	struct i2c_client *i2c_client;
+	struct hub_configuration hub_config;
+	struct tp_bus tp_bus[P3H2X4X_TP_MAX_COUNT];
+	struct i3c_hub *hub;
+};
+
+/**
+ * p3h2x4x_unregister_smbus_adapters() - unregister SMBus adapters
+ * @hub: P3H2x4x hub device
+ */
+void p3h2x4x_unregister_smbus_adapters(struct p3h2x4x_i3c_hub_dev *hub);
+
+/**
+ * p3h2x4x_tp_smbus_algo - add i2c adapter for target port configured as SMBus.
+ * @p3h2x4x_i3c_hub: P3H2x4x hub device.
+ *
+ * Return: 0 in case of success, negative error code on failure.
+ */
+int p3h2x4x_tp_smbus_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub);
+
+/**
+ * p3h2x4x_tp_i3c_algo - register i3c controller for target port configured as I3C.
+ * @p3h2x4x_i3c_hub: P3H2x4x hub device.
+ *
+ * Return: 0 in case of success, negative error code on failure.
+ */
+int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub);
+
+#endif /* P3H2840_I3C_HUB_H */
diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_common.c b/drivers/i3c/hub/p3h2840_i3c_hub_common.c
new file mode 100644
index 000000000000..2fd9723da60d
--- /dev/null
+++ b/drivers/i3c/hub/p3h2840_i3c_hub_common.c
@@ -0,0 +1,379 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025-2026 NXP
+ * This P3H2X4X driver file implements functions for Hub probe and DT parsing.
+ */
+
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/mfd/p3h2840.h>
+#include <linux/util_macros.h>
+
+#include "p3h2840_i3c_hub.h"
+
+/* LDO voltage DT settings */
+#define P3H2X4X_DT_LDO_VOLT_1_0V		1000000
+#define P3H2X4X_DT_LDO_VOLT_1_1V		1100000
+#define P3H2X4X_DT_LDO_VOLT_1_2V		1200000
+#define P3H2X4X_DT_LDO_VOLT_1_8V		1800000
+
+static const int p3h2x4x_pullup_tbl[] = {
+	250, 500, 1000, 2000
+};
+
+static const int p3h2x4x_io_strength_tbl[] = {
+	20, 30, 40, 50
+};
+
+static u8 p3h2x4x_pullup_dt_to_reg(int dt_value)
+{
+	return find_closest(dt_value, p3h2x4x_pullup_tbl,
+			  ARRAY_SIZE(p3h2x4x_pullup_tbl));
+}
+
+static u8 p3h2x4x_io_strength_dt_to_reg(int dt_value)
+{
+	return find_closest(dt_value, p3h2x4x_io_strength_tbl,
+			  ARRAY_SIZE(p3h2x4x_io_strength_tbl));
+}
+
+static int p3h2x4x_configure_pullup(struct device *dev)
+{
+	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = dev_get_drvdata(dev);
+	u8 pullup;
+
+	pullup = P3H2X4X_TP0145_PULLUP_CONF(p3h2x4x_pullup_dt_to_reg
+						(p3h2x4x_i3c_hub->hub_config.tp0145_pullup));
+
+	pullup |= P3H2X4X_TP2367_PULLUP_CONF(p3h2x4x_pullup_dt_to_reg
+						(p3h2x4x_i3c_hub->hub_config.tp2367_pullup));
+
+	return regmap_update_bits(p3h2x4x_i3c_hub->regmap, P3H2X4X_LDO_AND_PULLUP_CONF,
+							  P3H2X4X_PULLUP_CONF_MASK, pullup);
+}
+
+static int p3h2x4x_configure_io_strength(struct device *dev)
+{
+	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = dev_get_drvdata(dev);
+	u8 io_strength;
+
+	io_strength = P3H2X4X_CP0_IO_STRENGTH(p3h2x4x_io_strength_dt_to_reg
+						(p3h2x4x_i3c_hub->hub_config.cp0_io_strength));
+
+	io_strength |= P3H2X4X_CP1_IO_STRENGTH(p3h2x4x_io_strength_dt_to_reg
+						(p3h2x4x_i3c_hub->hub_config.cp1_io_strength));
+
+	io_strength |= P3H2X4X_TP0145_IO_STRENGTH(p3h2x4x_io_strength_dt_to_reg
+						(p3h2x4x_i3c_hub->hub_config.tp0145_io_strength));
+
+	io_strength |= P3H2X4X_TP2367_IO_STRENGTH(p3h2x4x_io_strength_dt_to_reg
+						(p3h2x4x_i3c_hub->hub_config.tp2367_io_strength));
+
+	return regmap_update_bits(p3h2x4x_i3c_hub->regmap, P3H2X4X_IO_STRENGTH,
+							  P3H2X4X_IO_STRENGTH_MASK, io_strength);
+}
+
+static int p3h2x4x_configure_ldo(struct device *dev)
+{
+	static const char * const supplies[] = {
+		"vcc1",
+		"vcc2",
+		"vcc3",
+		"vcc4"
+	};
+	int ret, i;
+
+	for (i = 0; i < ARRAY_SIZE(supplies); i++) {
+		ret = devm_regulator_get_enable_optional(dev, supplies[i]);
+		if (ret == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
+		if (ret && ret != -ENODEV)
+			dev_warn(dev, "Failed to enable %s (%d)\n",
+				 supplies[i], ret);
+	}
+
+	/* This delay is required for the regulator to stabilize its output voltage */
+	fsleep(5000);
+
+	return 0;
+}
+
+static int p3h2x4x_configure_tp(struct device *dev)
+{
+	struct p3h2x4x_i3c_hub_dev *hub = dev_get_drvdata(dev);
+	u8 mode = 0, smbus = 0, pullup = 0, target_port = 0;
+	int tp, ret;
+
+	for (tp = 0; tp < P3H2X4X_TP_MAX_COUNT; tp++) {
+		pullup |= hub->hub_config.tp_config[tp].pullup_en ? P3H2X4X_SET_BIT(tp) : 0;
+		mode |= (hub->hub_config.tp_config[tp].mode != P3H2X4X_TP_MODE_I3C) ?
+			P3H2X4X_SET_BIT(tp) : 0;
+		smbus |= (hub->hub_config.tp_config[tp].mode == P3H2X4X_TP_MODE_SMBUS) ?
+			 P3H2X4X_SET_BIT(tp) : 0;
+		target_port |= (hub->tp_bus[tp].tp_mask == P3H2X4X_SET_BIT(tp)) ?
+			       hub->tp_bus[tp].tp_mask : 0;
+	}
+
+	ret = regmap_update_bits(hub->regmap, P3H2X4X_TP_PULLUP_EN, P3H2X4X_TP_MASK, pullup);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(hub->regmap, P3H2X4X_TP_IO_MODE_CONF, P3H2X4X_TP_MASK, mode);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(hub->regmap, P3H2X4X_TP_SMBUS_AGNT_EN, P3H2X4X_TP_MASK, smbus);
+	if (ret)
+		return ret;
+
+	if (target_port & ~smbus) {
+		ret = regmap_write(hub->regmap, P3H2X4X_CP_MUX_SET,
+				   P3H2X4X_CONTROLLER_PORT_MUX_REQ);
+		if (ret)
+			return ret;
+	}
+
+	return regmap_update_bits(hub->regmap, P3H2X4X_TP_ENABLE, P3H2X4X_TP_MASK, target_port);
+}
+
+static int p3h2x4x_configure_hw(struct device *dev)
+{
+	struct p3h2x4x_i3c_hub_dev *hub = dev_get_drvdata(dev);
+	struct p3h2x4x *p3h2x4x = dev_get_drvdata(dev->parent);
+	int ret, ret2;
+
+	ret = p3h2x4x_configure_ldo(dev);
+	if (ret)
+		return ret;
+
+	/* Protect the unlock-modify-lock sequence with the shared MFD lock */
+	mutex_lock(&p3h2x4x->protected_reg_lock);
+
+	ret = regmap_write(hub->regmap, P3H2X4X_DEV_REG_PROTECTION_CODE,
+			   P3H2X4X_REGISTERS_UNLOCK_CODE);
+	if (ret)
+		goto out_unlock_mutex;
+
+	ret = p3h2x4x_configure_pullup(dev);
+	if (ret)
+		goto out_lock;
+
+	ret = p3h2x4x_configure_io_strength(dev);
+	if (ret)
+		goto out_lock;
+
+	ret = p3h2x4x_configure_tp(dev);
+	if (ret)
+		goto out_lock;
+
+out_lock:
+	ret2 = regmap_write(hub->regmap, P3H2X4X_DEV_REG_PROTECTION_CODE,
+			    P3H2X4X_REGISTERS_LOCK_CODE);
+	if (!ret && ret2)
+		ret = ret2;
+
+out_unlock_mutex:
+	mutex_unlock(&p3h2x4x->protected_reg_lock);
+	return ret;
+}
+
+static void p3h2x4x_get_target_port_dt_conf(struct device *dev,
+					    const struct device_node *node)
+{
+	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = dev_get_drvdata(dev);
+	u64 tp_port;
+
+	for_each_available_child_of_node_scoped(node, dev_node) {
+		if (of_property_read_reg(dev_node, 0, &tp_port, NULL))
+			continue;
+
+		if (tp_port < P3H2X4X_TP_MAX_COUNT) {
+			if (p3h2x4x_i3c_hub->tp_bus[tp_port].of_node) {
+				dev_warn(dev, "Duplicate target port %llu in DT\n", tp_port);
+				continue;
+			}
+
+			p3h2x4x_i3c_hub->tp_bus[tp_port].of_node = of_node_get(dev_node);
+			p3h2x4x_i3c_hub->tp_bus[tp_port].tp_mask = P3H2X4X_SET_BIT(tp_port);
+			p3h2x4x_i3c_hub->tp_bus[tp_port].p3h2x4x_i3c_hub = p3h2x4x_i3c_hub;
+			p3h2x4x_i3c_hub->tp_bus[tp_port].tp_port = tp_port;
+		}
+	}
+}
+
+static void p3h2x4x_parse_tp_dt_settings(struct device *dev,
+					 const struct device_node *node,
+					 struct tp_configuration tp_config[])
+{
+	u64 id;
+
+	for_each_available_child_of_node_scoped(node, tp_node) {
+		if (of_property_read_reg(tp_node, 0, &id, NULL))
+			continue;
+
+		if (id >= P3H2X4X_TP_MAX_COUNT) {
+			dev_warn(dev, "Invalid target port index found in DT: %lli\n", id);
+			continue;
+		}
+
+		if (strcmp(tp_node->name, "i3c") == 0)
+			tp_config[id].mode = P3H2X4X_TP_MODE_I3C;
+
+		if (strcmp(tp_node->name, "i2c") == 0)
+			tp_config[id].mode = P3H2X4X_TP_MODE_I2C;
+
+		if (strcmp(tp_node->name, "smbus") == 0)
+			tp_config[id].mode = P3H2X4X_TP_MODE_SMBUS;
+
+		tp_config[id].pullup_en =
+			of_property_read_bool(tp_node, "nxp,pullup-enable");
+	}
+}
+
+static void p3h2x4x_get_hub_dt_conf(struct device *dev,
+				    const struct device_node *node)
+{
+	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = dev_get_drvdata(dev);
+
+	of_property_read_u32(node, "nxp,tp0145-pullup-ohms",
+			     &p3h2x4x_i3c_hub->hub_config.tp0145_pullup);
+	of_property_read_u32(node, "nxp,tp2367-pullup-ohms",
+			     &p3h2x4x_i3c_hub->hub_config.tp2367_pullup);
+	of_property_read_u32(node, "nxp,cp0-io-strength-ohms",
+			     &p3h2x4x_i3c_hub->hub_config.cp0_io_strength);
+	of_property_read_u32(node, "nxp,cp1-io-strength-ohms",
+			     &p3h2x4x_i3c_hub->hub_config.cp1_io_strength);
+	of_property_read_u32(node, "nxp,tp0145-io-strength-ohms",
+			     &p3h2x4x_i3c_hub->hub_config.tp0145_io_strength);
+	of_property_read_u32(node, "nxp,tp2367-io-strength-ohms",
+			     &p3h2x4x_i3c_hub->hub_config.tp2367_io_strength);
+
+	p3h2x4x_parse_tp_dt_settings(dev, node, p3h2x4x_i3c_hub->hub_config.tp_config);
+}
+
+static void p3h2x4x_default_configuration(struct device *dev)
+{
+	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = dev_get_drvdata(dev);
+	int tp_count;
+
+	p3h2x4x_i3c_hub->hub_config.tp0145_pullup = P3H2X4X_DFT_TP_PULLUP_OHMS;
+	p3h2x4x_i3c_hub->hub_config.tp2367_pullup = P3H2X4X_DFT_TP_PULLUP_OHMS;
+	p3h2x4x_i3c_hub->hub_config.cp0_io_strength = P3H2X4X_DFT_IO_STRENGTH_OHMS;
+	p3h2x4x_i3c_hub->hub_config.cp1_io_strength = P3H2X4X_DFT_IO_STRENGTH_OHMS;
+	p3h2x4x_i3c_hub->hub_config.tp0145_io_strength = P3H2X4X_DFT_IO_STRENGTH_OHMS;
+	p3h2x4x_i3c_hub->hub_config.tp2367_io_strength = P3H2X4X_DFT_IO_STRENGTH_OHMS;
+
+	for (tp_count = 0; tp_count < P3H2X4X_TP_MAX_COUNT; ++tp_count)
+		p3h2x4x_i3c_hub->hub_config.tp_config[tp_count].mode =  P3H2X4X_TP_MODE_I3C;
+}
+
+static void p3h2x4x_unregister_smbus_adapters_action(void *data)
+{
+	p3h2x4x_unregister_smbus_adapters(data);
+}
+
+static void p3h2x4x_put_target_port_of_nodes(void *data)
+{
+	struct p3h2x4x_i3c_hub_dev *hub = data;
+	int tp;
+
+	for (tp = 0; tp < P3H2X4X_TP_MAX_COUNT; tp++) {
+		of_node_put(hub->tp_bus[tp].of_node);
+		hub->tp_bus[tp].of_node = NULL;
+	}
+}
+
+static int p3h2x4x_i3c_hub_probe(struct platform_device *pdev)
+{
+	struct p3h2x4x *p3h2x4x = dev_get_drvdata(pdev->dev.parent);
+	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub;
+	struct device *dev = &pdev->dev;
+	struct device_node *node;
+	int ret, i;
+
+	p3h2x4x_i3c_hub = devm_kzalloc(dev, sizeof(*p3h2x4x_i3c_hub), GFP_KERNEL);
+	if (!p3h2x4x_i3c_hub)
+		return -ENOMEM;
+
+	p3h2x4x_i3c_hub->regmap = p3h2x4x->regmap;
+	p3h2x4x_i3c_hub->dev = dev;
+
+	platform_set_drvdata(pdev, p3h2x4x_i3c_hub);
+	device_set_of_node_from_dev(dev, dev->parent);
+
+	p3h2x4x_default_configuration(dev);
+
+	ret = devm_mutex_init(dev, &p3h2x4x_i3c_hub->etx_mutex);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < P3H2X4X_TP_MAX_COUNT; i++) {
+		ret = devm_mutex_init(dev, &p3h2x4x_i3c_hub->tp_bus[i].port_mutex);
+		if (ret)
+			return ret;
+	}
+
+	/* get hub node from DT */
+	node = dev_of_node(dev);
+	if (!node)
+		return dev_err_probe(dev, -ENODEV, "No Device Tree entry found\n");
+
+	p3h2x4x_get_hub_dt_conf(dev, node);
+	p3h2x4x_get_target_port_dt_conf(dev, node);
+
+	ret = devm_add_action_or_reset(dev,
+				       p3h2x4x_put_target_port_of_nodes,
+				       p3h2x4x_i3c_hub);
+	if (ret)
+		return ret;
+
+	ret = p3h2x4x_configure_hw(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to configure the HUB\n");
+
+	/* Register virtual I3C master controllers for I3C target ports */
+	if (p3h2x4x->i3cdev) {
+		p3h2x4x_i3c_hub->i3cdev = p3h2x4x->i3cdev;
+		i3cdev_set_drvdata(p3h2x4x->i3cdev, p3h2x4x_i3c_hub);
+		ret = p3h2x4x_tp_i3c_algo(p3h2x4x_i3c_hub);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to register i3c bus\n");
+	}
+
+	/* Register virtual I2C adapters for SMBus target ports */
+	ret = p3h2x4x_tp_smbus_algo(p3h2x4x_i3c_hub);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add i2c adapter\n");
+
+	ret = devm_add_action_or_reset(dev,
+				       p3h2x4x_unregister_smbus_adapters_action,
+				       p3h2x4x_i3c_hub);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct platform_device_id p3h2x4x_i3c_hub_id[] = {
+	{ "p3h2x4x-i3c-hub" },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, p3h2x4x_i3c_hub_id);
+
+static struct platform_driver p3h2x4x_i3c_hub_driver = {
+	.driver = {
+		.name = "p3h2x4x-i3c-hub",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.probe = p3h2x4x_i3c_hub_probe,
+	.id_table = p3h2x4x_i3c_hub_id,
+};
+module_platform_driver(p3h2x4x_i3c_hub_driver);
+
+MODULE_AUTHOR("Aman Kumar Pandey <aman.kumarpandey@nxp.com>");
+MODULE_AUTHOR("Vikash Bansal <vikash.bansal@nxp.com>");
+MODULE_AUTHOR("Lakshay Piplani <lakshay.piplani@nxp.com>");
+MODULE_DESCRIPTION("P3H2X4X I3C HUB driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
new file mode 100644
index 000000000000..0e5bf7eb3cf7
--- /dev/null
+++ b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025-2026 NXP
+ * This P3H2X4X driver file contain functions for I3C virtual Bus creation, connect/disconnect
+ * hub network and read/write.
+ */
+#include <linux/i3c/hub.h>
+#include <linux/mfd/p3h2840.h>
+#include <linux/regmap.h>
+
+#include "p3h2840_i3c_hub.h"
+
+static inline struct tp_bus *
+p3h2x4x_bus_from_controller(struct i3c_master_controller *controller)
+{
+	struct i3c_hub_controller *hub_controller;
+
+	hub_controller = container_of(controller, struct i3c_hub_controller, controller);
+
+	return container_of(hub_controller, struct tp_bus, hub_controller);
+}
+
+static void p3h2x4x_hub_enable_port(struct i3c_master_controller *controller)
+{
+	struct tp_bus *bus = p3h2x4x_bus_from_controller(controller);
+	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = bus->p3h2x4x_i3c_hub;
+
+	if (p3h2x4x_i3c_hub->hub_config.tp_config[bus->tp_port].always_enable)
+		return;
+
+	regmap_set_bits(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP_NET_CON_CONF, bus->tp_mask);
+}
+
+static void p3h2x4x_hub_disable_port(struct i3c_master_controller *controller)
+{
+	struct tp_bus *bus = p3h2x4x_bus_from_controller(controller);
+	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = bus->p3h2x4x_i3c_hub;
+
+	if (p3h2x4x_i3c_hub->hub_config.tp_config[bus->tp_port].always_enable)
+		return;
+
+	regmap_clear_bits(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP_NET_CON_CONF, bus->tp_mask);
+}
+
+static const struct i3c_hub_ops p3h2x4x_hub_ops = {
+	.enable_port = p3h2x4x_hub_enable_port,
+	.disable_port = p3h2x4x_hub_disable_port,
+};
+
+static void p3h2x4x_unregister_i3c_master(void *data)
+{
+	struct i3c_master_controller *controller = data;
+
+	i3c_master_unregister(controller);
+}
+
+/**
+ * p3h2x4x_tp_i3c_algo - Register I3C virtual masters for I3C target ports.
+ * @p3h2x4x_hub: p3h2x4x device structure.
+ * Return: 0 in case of success, negative error code on failure.
+ */
+int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_hub)
+{
+	struct i3c_master_controller *parent = i3c_dev_get_master(p3h2x4x_hub->i3cdev->desc);
+	u8 tp, ntwk_mask = 0;
+	int ret;
+
+	p3h2x4x_hub->hub = devm_kzalloc(p3h2x4x_hub->dev,
+					sizeof(*p3h2x4x_hub->hub),
+					GFP_KERNEL);
+
+	if (!p3h2x4x_hub->hub)
+		return -ENOMEM;
+
+	i3c_hub_init(p3h2x4x_hub->hub,
+		     &p3h2x4x_hub_ops,
+		     p3h2x4x_hub->i3cdev);
+
+	for (tp = 0; tp < P3H2X4X_TP_MAX_COUNT; tp++) {
+		if (!p3h2x4x_hub->tp_bus[tp].of_node ||
+		    p3h2x4x_hub->hub_config.tp_config[tp].mode != P3H2X4X_TP_MODE_I3C)
+			continue;
+
+		struct i3c_hub_controller *hub_controller =
+				&p3h2x4x_hub->tp_bus[tp].hub_controller;
+		struct i3c_master_controller *controller = &hub_controller->controller;
+
+		hub_controller->parent = parent;
+		hub_controller->hub = p3h2x4x_hub->hub;
+
+		dev_set_drvdata(&controller->dev, hub_controller);
+
+		ret = i3c_hub_reserve_parent_addrslots_from_dt(hub_controller,
+							       p3h2x4x_hub->tp_bus[tp].of_node);
+		if (ret)
+			return ret;
+
+		ret = i3c_master_register_fwnode(controller,
+						 p3h2x4x_hub->dev,
+						 of_fwnode_handle(p3h2x4x_hub->tp_bus[tp].of_node),
+						 i3c_hub_master_ops(),
+						 false);
+
+		if (ret)
+			return ret;
+
+		ret = devm_add_action_or_reset(p3h2x4x_hub->dev,
+					       p3h2x4x_unregister_i3c_master,
+					       controller);
+		if (ret)
+			return ret;
+
+		ntwk_mask |= p3h2x4x_hub->tp_bus[tp].tp_mask;
+		p3h2x4x_hub->tp_bus[tp].is_registered = true;
+		p3h2x4x_hub->hub_config.tp_config[tp].always_enable = true;
+	}
+	return regmap_write(p3h2x4x_hub->regmap, P3H2X4X_TP_NET_CON_CONF, ntwk_mask);
+}
diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
new file mode 100644
index 000000000000..b991c46f3ed5
--- /dev/null
+++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
@@ -0,0 +1,322 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025-2026 NXP
+ * This P3H2X4X driver file contain functions for SMBus/I2C virtual Bus creation and read/write.
+ */
+#include <linux/mfd/p3h2840.h>
+#include <linux/regmap.h>
+
+#include "p3h2840_i3c_hub.h"
+
+enum p3h2x4x_smbus_desc_idx {
+	P3H2X4X_DESC_ADDR,
+	P3H2X4X_DESC_TYPE,
+	P3H2X4X_DESC_WRITE_LEN,
+	P3H2X4X_DESC_READ_LEN,
+};
+
+static int p3h2x4x_read_smbus_transaction_status(struct p3h2x4x_i3c_hub_dev *hub,
+						 u8 target_port_status,
+						 u8 data_length)
+{
+	unsigned int timeout_us, sleep_us;
+	u32 status_read;
+	u8 status;
+	int ret;
+
+	timeout_us = P3H2X4X_SMBUS_400kHz_TRANSFER_TIMEOUT(data_length);
+	sleep_us = clamp(timeout_us / P3H2X4X_SMBUS_POLL_COUNT,
+			 P3H2X4X_SMBUS_POLL_INTERVAL_MIN_US,
+			 P3H2X4X_SMBUS_POLL_INTERVAL_MAX_US);
+
+	ret = regmap_read_poll_timeout(hub->regmap, target_port_status,
+				       status_read,
+				       status_read & P3H2X4X_SMBUS_TRANSACTION_FINISH_FLAG,
+				       sleep_us,
+				       timeout_us);
+	if (ret)
+		return ret;
+
+	status = (u8)status_read;
+
+	status = (status & P3H2X4X_TP_TRANSACTION_CODE_MASK)
+		  >> P3H2X4X_SMBUS_CNTRL_STATUS_TXN_SHIFT;
+
+	switch (status) {
+	case P3H2X4X_SMBUS_CNTRL_STATUS_TXN_OK:
+		return 0;
+	case P3H2X4X_SMBUS_CNTRL_STATUS_TXN_ADDR_NAK:
+		return -ENXIO;
+	case P3H2X4X_SMBUS_CNTRL_STATUS_TXN_DATA_NAK:
+		return -EIO;
+	case P3H2X4X_SMBUS_CNTRL_STATUS_TXN_SCL_TO:
+		return -ETIMEDOUT;
+	case P3H2X4X_SMBUS_CNTRL_STATUS_TXN_ARB_LOSS:
+		return -EAGAIN;
+	default:
+		return -EIO;
+	}
+}
+
+/*
+ * p3h2x4x_tp_i2c_xfer_msg() - This starts a SMBus write transaction by writing a descriptor
+ * and a message to the p3h2x4x registers. Controller buffer page is determined by multiplying the
+ * target port index by four and adding the base page number to it.
+ */
+static int p3h2x4x_tp_i2c_xfer_msg(struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub,
+				   struct i2c_msg *xfers,
+				   u8 target_port,
+				   int nxfers_i, u8 rw)
+{
+	u8 controller_buffer_page = P3H2X4X_CONTROLLER_BUFFER_PAGE + 4 * target_port;
+	u8 target_port_status = P3H2X4X_TP0_SMBUS_AGNT_STS + target_port;
+	u8 desc[P3H2X4X_SMBUS_DESCRIPTOR_SIZE] = { 0 };
+	u8 transaction_type = P3H2X4X_SMBUS_400kHz;
+	int write_length, read_length;
+	u8 addr = xfers[nxfers_i].addr;
+	u8 rw_address = 2 * addr;
+	int ret, ret2;
+
+	if (rw == 2) { /* write and read */
+		write_length = xfers[nxfers_i].len;
+		read_length =  xfers[nxfers_i + 1].len;
+	} else if (rw == 1) {
+		rw_address |= P3H2X4X_SET_BIT(0);
+		write_length = 0;
+		read_length =  xfers[nxfers_i].len;
+	} else {
+		write_length = xfers[nxfers_i].len;
+		read_length = 0;
+	}
+
+	desc[P3H2X4X_DESC_ADDR] = rw_address;
+	if (rw == 2)
+		desc[P3H2X4X_DESC_TYPE] = transaction_type | P3H2X4X_SET_BIT(0);
+	else
+		desc[P3H2X4X_DESC_TYPE] = transaction_type;
+	desc[P3H2X4X_DESC_WRITE_LEN] = write_length;
+	desc[P3H2X4X_DESC_READ_LEN] = read_length;
+
+	ret = regmap_write(p3h2x4x_i3c_hub->regmap, target_port_status,
+			   P3H2X4X_TP_BUFFER_STATUS_MASK);
+	if (ret)
+		goto out;
+
+	ret = regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_PAGE_PTR, controller_buffer_page);
+
+	if (ret)
+		goto out;
+
+	ret = regmap_bulk_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_CONTROLLER_AGENT_BUFF,
+				desc, P3H2X4X_SMBUS_DESCRIPTOR_SIZE);
+
+	if (ret)
+		goto out;
+
+	if (!(rw % 2) && xfers[nxfers_i].len) {
+		ret = regmap_bulk_write(p3h2x4x_i3c_hub->regmap,
+					P3H2X4X_CONTROLLER_AGENT_BUFF_DATA,
+					xfers[nxfers_i].buf, xfers[nxfers_i].len);
+		if (ret)
+			goto out;
+	}
+
+	ret = regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP_SMBUS_AGNT_TRANS_START,
+			   p3h2x4x_i3c_hub->tp_bus[target_port].tp_mask);
+
+	if (ret)
+		goto out;
+
+	ret = p3h2x4x_read_smbus_transaction_status(p3h2x4x_i3c_hub,
+						    target_port_status,
+						    (write_length + read_length));
+	if (ret)
+		goto out;
+
+	if (rw) {
+		if (rw == 2)
+			nxfers_i += 1;
+
+		if (xfers[nxfers_i].len) {
+			ret = regmap_bulk_read(p3h2x4x_i3c_hub->regmap,
+					       P3H2X4X_CONTROLLER_AGENT_BUFF_DATA + write_length,
+					       xfers[nxfers_i].buf, xfers[nxfers_i].len);
+			if (ret)
+				goto out;
+		}
+	}
+out:
+	ret2 = regmap_write(p3h2x4x_i3c_hub->regmap,
+			    P3H2X4X_PAGE_PTR, 0x00);
+	if (!ret && ret2)
+		ret = ret2;
+
+	return ret;
+}
+
+/*
+ * This function will be called whenever you call I2C read, write APIs like
+ * i2c_master_send(), i2c_master_recv() etc.
+ */
+static s32 p3h2x4x_tp_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+{
+	int ret_sum = 0, ret, msg_count;
+	u8 rw;
+
+	struct tp_bus *bus = i2c_get_adapdata(adap);
+	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = bus->p3h2x4x_i3c_hub;
+
+	guard(mutex)(&p3h2x4x_i3c_hub->etx_mutex);
+	guard(mutex)(&bus->port_mutex);
+
+	for (msg_count = 0; msg_count < num; msg_count++) {
+		if (msgs[msg_count].len > P3H2X4X_SMBUS_PAYLOAD_SIZE) {
+			dev_err(p3h2x4x_i3c_hub->dev,
+				"Message nr. %d not sent - length over %d bytes.\n",
+				msg_count, P3H2X4X_SMBUS_PAYLOAD_SIZE);
+			return -EINVAL;
+		}
+
+		rw = (msgs[msg_count].flags & I2C_M_RD) ? 1 : 0;
+		if (!rw) {
+			/* If a write message is immediately followed by a read message to
+			 * the same address,  consider combining them into a single transaction.
+			 */
+			if (msg_count + 1 < num &&
+			    msgs[msg_count].addr == msgs[msg_count + 1].addr &&
+			    (msgs[msg_count + 1].flags & I2C_M_RD)) {
+				if (msgs[msg_count].len + msgs[msg_count + 1].len >
+				    P3H2X4X_SMBUS_PAYLOAD_SIZE)
+					return -EINVAL;
+
+				rw = 2;
+				msg_count += 1;
+				ret_sum += 1;
+			}
+		}
+
+		ret = p3h2x4x_tp_i2c_xfer_msg(p3h2x4x_i3c_hub,
+					      msgs,
+					      bus->tp_port,
+					      (rw == 2) ? (msg_count - 1) : msg_count,
+					       rw);
+		if (ret)
+			return ret;
+
+		ret_sum++;
+	}
+	return ret_sum;
+}
+
+static u32 p3h2x4x_tp_smbus_funcs(struct i2c_adapter *adapter)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_BLOCK_DATA;
+}
+
+/*
+ * I2C algorithm Structure
+ */
+static struct i2c_algorithm p3h2x4x_tp_i2c_algorithm = {
+	.master_xfer    = p3h2x4x_tp_i2c_xfer,
+	.functionality  = p3h2x4x_tp_smbus_funcs,
+};
+
+void p3h2x4x_unregister_smbus_adapters(struct p3h2x4x_i3c_hub_dev *hub)
+{
+	u8 tp;
+
+	for (tp = 0; tp < P3H2X4X_TP_MAX_COUNT; tp++) {
+		if (!hub->tp_bus[tp].tp_smbus_adapter)
+			continue;
+
+		i2c_del_adapter(hub->tp_bus[tp].tp_smbus_adapter);
+
+		guard(mutex)(&hub->etx_mutex);
+		hub->tp_bus[tp].tp_smbus_adapter = NULL;
+		hub->tp_bus[tp].is_registered = false;
+	}
+}
+
+/**
+ * p3h2x4x_tp_smbus_algo - Register I2C adapters for SMBus target ports.
+ * @hub: p3h2x4x device structure.
+ * Return: 0 in case of success, negative error code on failure.
+ */
+int p3h2x4x_tp_smbus_algo(struct p3h2x4x_i3c_hub_dev *hub)
+{
+	struct p3h2x4x *p3h2x4x = dev_get_drvdata(hub->dev->parent);
+	int ret, ret2;
+	u8 tp;
+
+	mutex_lock(&p3h2x4x->protected_reg_lock);
+
+	ret = regmap_write(hub->regmap, P3H2X4X_DEV_REG_PROTECTION_CODE,
+			   P3H2X4X_REGISTERS_UNLOCK_CODE);
+	if (ret)
+		goto out_unlock_mutex;
+
+	ret = regmap_write(hub->regmap, P3H2X4X_TP_SMBUS_AGNT_IBI_CONFIG, P3H2X4X_IBI_DISABLED);
+
+	ret2 = regmap_write(hub->regmap, P3H2X4X_DEV_REG_PROTECTION_CODE,
+			    P3H2X4X_REGISTERS_LOCK_CODE);
+	if (!ret && ret2)
+		ret = ret2;
+
+out_unlock_mutex:
+	mutex_unlock(&p3h2x4x->protected_reg_lock);
+	if (ret)
+		return ret;
+
+	for (tp = 0; tp < P3H2X4X_TP_MAX_COUNT; tp++) {
+		if (!hub->tp_bus[tp].of_node ||
+		    hub->hub_config.tp_config[tp].mode != P3H2X4X_TP_MODE_SMBUS)
+			continue;
+
+		/* Allocate adapter */
+		struct i2c_adapter *smbus_adapter =
+			devm_kzalloc(hub->dev, sizeof(*smbus_adapter), GFP_KERNEL);
+		if (!smbus_adapter) {
+			p3h2x4x_unregister_smbus_adapters(hub);
+			return -ENOMEM;
+		}
+
+		/* Initialize adapter */
+		smbus_adapter->owner = THIS_MODULE;
+		smbus_adapter->class = I2C_CLASS_HWMON;
+		smbus_adapter->algo = &p3h2x4x_tp_i2c_algorithm;
+		smbus_adapter->dev.parent = hub->dev;
+		smbus_adapter->dev.of_node = hub->tp_bus[tp].of_node;
+		snprintf(smbus_adapter->name, sizeof(smbus_adapter->name),
+			 "p3h2x4x-i3c-hub.tp-port-%d", tp);
+
+		i2c_set_adapdata(smbus_adapter, &hub->tp_bus[tp]);
+
+		/* Register adapter */
+		ret = i2c_add_adapter(smbus_adapter);
+		if (ret) {
+			p3h2x4x_unregister_smbus_adapters(hub);
+			return ret;
+		}
+
+		hub->tp_bus[tp].is_registered = true;
+		hub->hub_config.tp_config[tp].ibi_en = false;
+		hub->tp_bus[tp].tp_smbus_adapter = smbus_adapter;
+	}
+
+	/*
+	 * holding SDA low when both SMBus Target Agent received data buffers are full.
+	 * This feature can be used as a flow-control mechanism for MCTP applications to
+	 * avoid MCTP transmitters on Target Ports time out when the SMBus agent buffers
+	 * are not serviced in time by upstream controller and only receives write message
+	 * from its downstream ports.
+	 */
+	ret = regmap_update_bits(hub->regmap, P3H2X4X_ONCHIP_TD_AND_SMBUS_AGNT_CONF,
+				 P3H2X4X_TARGET_AGENT_DFT_IBI_CONF_MASK,
+				 P3H2X4X_TARGET_AGENT_DFT_IBI_CONF);
+	if (ret) {
+		p3h2x4x_unregister_smbus_adapters(hub);
+		return ret;
+	}
+
+	return 0;
+}
-- 
2.25.1

