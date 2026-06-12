Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C1E39934D;
	Fri, 12 Jun 2026 11:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781263121; cv=none; b=UoS4/elaVPAj7oDuCcZOk3/ZFhtE1oABeYmgtZHKEOuBfkQzs8IKnkKD0BqgoJspYfG1Hh5lAD5hjBiPUQ69JuYQE0tsshYKa2uRt4GG6GB2mK/3Y/IqZho0feBO2kV8IuEFGYxMzjpFa31VYLPXi451iPeyHTMwNGuTNvJ/Vy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781263121; c=relaxed/simple;
	bh=2kK6qFBAaJxOrEHIWNCv35i2NsXxf0DKy14bJ/Durtk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q/zxjEYEYIxigibuTc1gWgtKTM+RT9NCLS+LKidJPjWTQ8L/En4upz2ZvIcZoneY2QXjb8UIwpUDhcapUHN1f1ANJgLbvgFWO+MpZ1QhFuLxxikvpHP2cCxaKkSCzuaaesN9om/9NXvj35pnpAYgIPdgQNScmaBMHTU4Z3k+QGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9A147200820;
	Fri, 12 Jun 2026 13:18:34 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 622FC2007F9;
	Fri, 12 Jun 2026 13:18:34 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 67EE9180007B;
	Fri, 12 Jun 2026 19:18:33 +0800 (+08)
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
Subject: [PATCH v11 9/9] i3c: hub: p3h2x4x: Add SMBus slave mode support
Date: Fri, 12 Jun 2026 16:48:16 +0530
Message-Id: <20260612111816.3688240-10-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260612111816.3688240-1-lakshay.piplani@nxp.com>
References: <20260612111816.3688240-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Add SMBus slave mode support for the P3H2x4x hub SMBus target ports.

The hub SMBus slave agent can receive downstream payloads into target
buffers and report receive events through IBI. Add CONFIG_I2C_SLAVE
to support the receive path and forward the received payloads to the
registered I2C slave client through i2c_slave_event().

Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>

---
Changes in v11:
 - Improve SMBus slave mode payload validation and parsing

Changes in v10:
 - Split SMBus slave mode support into a separate patch
---
---
 drivers/i3c/hub/p3h2840_i3c_hub.h        |  10 ++
 drivers/i3c/hub/p3h2840_i3c_hub_common.c |   7 +
 drivers/i3c/hub/p3h2840_i3c_hub_i3c.c    |  29 +++-
 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c  | 192 +++++++++++++++++++++++
 4 files changed, 237 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/hub/p3h2840_i3c_hub.h b/drivers/i3c/hub/p3h2840_i3c_hub.h
index d69fafbac584..84d9c66547c6 100644
--- a/drivers/i3c/hub/p3h2840_i3c_hub.h
+++ b/drivers/i3c/hub/p3h2840_i3c_hub.h
@@ -324,4 +324,14 @@ int p3h2x4x_tp_smbus_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub);
  */
 int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub);
 
+/**
+ * p3h2x4x_ibi_handler - IBI handler.
+ * @i3cdev: i3c device.
+ * @payload: two byte IBI payload data.
+ */
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+void p3h2x4x_ibi_handler(struct i3c_device *i3cdev,
+			 const struct i3c_ibi_payload *payload);
+#endif
+
 #endif /* P3H2840_I3C_HUB_H */
diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_common.c b/drivers/i3c/hub/p3h2840_i3c_hub_common.c
index fedcb978f07e..ca173afe1fa9 100644
--- a/drivers/i3c/hub/p3h2840_i3c_hub_common.c
+++ b/drivers/i3c/hub/p3h2840_i3c_hub_common.c
@@ -318,6 +318,13 @@ static void p3h2x4x_i3c_hub_remove(struct platform_device *pdev)
 	struct p3h2x4x_dev *p3h2x4x = dev_get_drvdata(pdev->dev.parent);
 	u8 i;
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	if (p3h2x4x->i3cdev) {
+		i3c_device_disable_ibi(p3h2x4x->i3cdev);
+		i3c_device_free_ibi(p3h2x4x->i3cdev);
+	}
+#endif
+
 	for (i = 0; i < P3H2X4X_TP_MAX_COUNT; i++) {
 		if (p3h2x4x_i3c_hub->tp_bus[i].is_registered) {
 			if (p3h2x4x_i3c_hub->hub_config.tp_config[i].mode ==
diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
index 38505dda0e81..9bef8b8e557f 100644
--- a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
+++ b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
@@ -10,6 +10,14 @@
 
 #include "p3h2840_i3c_hub.h"
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static const struct i3c_ibi_setup p3h2x4x_ibireq = {
+	.handler = p3h2x4x_ibi_handler,
+	.max_payload_len = P3H2X4X_MAX_PAYLOAD_LEN,
+	.num_slots = P3H2X4X_NUM_SLOTS,
+};
+#endif
+
 static inline struct tp_bus *
 p3h2x4x_bus_from_controller(struct i3c_master_controller *controller)
 {
@@ -120,5 +128,24 @@ int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_hub)
 		p3h2x4x_hub->tp_bus[tp].is_registered = true;
 		p3h2x4x_hub->hub_config.tp_config[tp].always_enable = true;
 	}
-	return regmap_write(p3h2x4x_hub->regmap, P3H2X4X_TP_NET_CON_CONF, ntwk_mask);
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	ret = i3c_device_request_ibi(p3h2x4x_hub->i3cdev, &p3h2x4x_ibireq);
+	if (ret)
+		return ret;
+
+	ret = i3c_device_enable_ibi(p3h2x4x_hub->i3cdev);
+	if (ret) {
+		i3c_device_free_ibi(p3h2x4x_hub->i3cdev);
+		return ret;
+	}
+#endif
+	ret = regmap_write(p3h2x4x_hub->regmap, P3H2X4X_TP_NET_CON_CONF, ntwk_mask);
+
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	if (ret) {
+		i3c_device_disable_ibi(p3h2x4x_hub->i3cdev);
+		i3c_device_free_ibi(p3h2x4x_hub->i3cdev);
+	}
+#endif
+	return ret;
 }
diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
index edb75f790e92..fba4345f86a7 100644
--- a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
+++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
@@ -15,6 +15,146 @@ enum p3h2x4x_smbus_desc_idx {
 	P3H2X4X_DESC_READ_LEN,
 };
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static void p3h2x4x_read_smbus_agent_rx_buf(struct i3c_device *i3cdev, enum p3h2x4x_rcv_buf rfbuf,
+					    enum p3h2x4x_tp tp, bool is_of)
+{
+	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = i3cdev_get_drvdata(i3cdev);
+	u8 slave_rx_buffer[P3H2X4X_SMBUS_TARGET_PAYLOAD_SIZE] = { 0 };
+	u8 target_buffer_page, flag_clear = 0x0f, temp = 0, i, addr;
+	u32 packet_len, slave_address, ret;
+	struct i2c_client *client;
+
+	target_buffer_page = (((rfbuf) ? P3H2X4X_TARGET_BUFF_1_PAGE : P3H2X4X_TARGET_BUFF_0_PAGE)
+				+  (P3H2X4X_NO_PAGE_PER_TP * tp));
+	ret = regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_PAGE_PTR, target_buffer_page);
+	if (ret)
+		goto ibi_err;
+
+	/* read buffer length */
+	ret = regmap_read(p3h2x4x_i3c_hub->regmap, P3H2X4X_TARGET_BUFF_LENGTH, &packet_len);
+	if (ret)
+		goto ibi_err;
+
+	if (packet_len)
+		packet_len = packet_len - 1;
+
+	if (packet_len > P3H2X4X_SMBUS_TARGET_PAYLOAD_SIZE) {
+		dev_err(&i3cdev->dev, "Received message too big for p3h2x4x buffer\n");
+		goto ibi_err;
+	}
+
+	/* read slave  address */
+	ret = regmap_read(p3h2x4x_i3c_hub->regmap, P3H2X4X_TARGET_BUFF_ADDRESS, &slave_address);
+	if (ret)
+		goto ibi_err;
+
+	/* read data */
+	if (packet_len) {
+		ret = regmap_bulk_read(p3h2x4x_i3c_hub->regmap, P3H2X4X_TARGET_BUFF_DATA,
+				       slave_rx_buffer, packet_len);
+		if (ret)
+			goto ibi_err;
+	}
+
+	if (is_of)
+		flag_clear = BUF_RECEIVED_FLAG_TF_MASK;
+	else
+		flag_clear = (((rfbuf == RCV_BUF_0) ? P3H2X4X_TARGET_BUF_0_RECEIVE :
+				P3H2X4X_TARGET_BUF_1_RECEIVE));
+
+	/* notify slave driver about received data */
+	if ((p3h2x4x_i3c_hub->tp_bus[tp].tp_smbus_client->addr & 0x7f) == (slave_address >> 1)) {
+		client = p3h2x4x_i3c_hub->tp_bus[tp].tp_smbus_client;
+		if (!client)
+			goto ibi_err;
+
+		addr = slave_address >> 1;
+		i2c_slave_event(client,
+				I2C_SLAVE_WRITE_REQUESTED, &addr);
+		for (i = 0; i < packet_len; i++) {
+			temp = slave_rx_buffer[i];
+			i2c_slave_event(client,
+					I2C_SLAVE_WRITE_RECEIVED, &temp);
+		}
+		i2c_slave_event(client, I2C_SLAVE_STOP, &temp);
+	}
+
+ibi_err:
+	regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_PAGE_PTR, 0x00);
+	regmap_write(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP0_SMBUS_AGNT_STS + tp, flag_clear);
+}
+
+/**
+ * p3h2x4x_ibi_handler - IBI handler.
+ * @i3cdev: i3c device.
+ * @payload: two byte IBI payload data.
+ *
+ */
+void p3h2x4x_ibi_handler(struct i3c_device *i3cdev,
+			 const struct i3c_ibi_payload *payload)
+{
+	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub;
+	u8 payload_byte_one, payload_byte_two;
+	u32 target_port_status, ret, i;
+	const u8 *data;
+
+	if (!payload || payload->len < P3H2X4X_MAX_PAYLOAD_LEN)
+		return;
+
+	data = payload->data;
+	payload_byte_one = data[0];
+
+	if (!(payload_byte_one & P3H2X4X_SMBUS_AGENT_EVENT_FLAG_STATUS))
+		return;
+
+	p3h2x4x_i3c_hub = i3cdev_get_drvdata(i3cdev);
+
+	if (!p3h2x4x_i3c_hub || !p3h2x4x_i3c_hub->regmap)
+		return;
+
+	payload_byte_two = data[1];
+	guard(mutex)(&p3h2x4x_i3c_hub->etx_mutex);
+
+	for (i = 0; i < P3H2X4X_TP_MAX_COUNT; ++i) {
+		if (p3h2x4x_i3c_hub->tp_bus[i].is_registered && (payload_byte_two >> i) & 0x01) {
+			ret = regmap_read(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP0_SMBUS_AGNT_STS + i,
+					  &target_port_status);
+			if (ret) {
+				dev_err(&i3cdev->dev, "target port read status failed %d\n", ret);
+				return;
+			}
+
+			/* process data receive buffer */
+			switch (target_port_status & BUF_RECEIVED_FLAG_MASK) {
+			case P3H2X4X_TARGET_BUF_CA_TF:
+				break;
+			case P3H2X4X_TARGET_BUF_0_RECEIVE:
+				p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_0, i, false);
+				break;
+			case P3H2X4X_TARGET_BUF_1_RECEIVE:
+				p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_1, i, false);
+				break;
+			case P3H2X4X_TARGET_BUF_0_1_RECEIVE:
+				p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_0, i, false);
+				p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_1, i, false);
+				break;
+			case P3H2X4X_TARGET_BUF_OVRFL:
+				p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_0, i, false);
+				p3h2x4x_read_smbus_agent_rx_buf(i3cdev, RCV_BUF_1, i, true);
+				dev_err(&i3cdev->dev, "Overflow, reading buffer zero and one\n");
+				break;
+			default:
+				regmap_write(p3h2x4x_i3c_hub->regmap,
+					     P3H2X4X_TP0_SMBUS_AGNT_STS + i,
+					     BUF_RECEIVED_FLAG_TF_MASK);
+				break;
+			}
+		}
+	}
+}
+#endif
+
 static int p3h2x4x_read_smbus_transaction_status(struct p3h2x4x_i3c_hub_dev *hub,
 						 u8 target_port_status,
 						 u8 data_length)
@@ -205,11 +345,63 @@ static u32 p3h2x4x_tp_smbus_funcs(struct i2c_adapter *adapter)
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_BLOCK_DATA;
 }
 
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+static int p3h2x4x_tp_i2c_reg_slave(struct i2c_client *slave)
+{
+	struct tp_bus *bus = i2c_get_adapdata(slave->adapter);
+	struct p3h2x4x_i3c_hub_dev *hub = bus->p3h2x4x_i3c_hub;
+	int ret;
+
+	guard(mutex)(&hub->etx_mutex);
+
+	if (bus->tp_smbus_client)
+		return -EBUSY;
+
+	ret = regmap_set_bits(hub->regmap,
+			      P3H2X4X_TP_SMBUS_AGNT_IBI_CONFIG,
+			      bus->tp_mask);
+	if (ret)
+		return ret;
+
+	bus->tp_smbus_client = slave;
+	hub->hub_config.tp_config[bus->tp_port].ibi_en = true;
+
+	return 0;
+}
+
+static int p3h2x4x_tp_i2c_unreg_slave(struct i2c_client *slave)
+{
+	struct tp_bus *bus = i2c_get_adapdata(slave->adapter);
+	struct p3h2x4x_i3c_hub_dev *hub = bus->p3h2x4x_i3c_hub;
+	int ret;
+
+	guard(mutex)(&hub->etx_mutex);
+
+	if (bus->tp_smbus_client != slave)
+		return -EINVAL;
+
+	ret = regmap_clear_bits(hub->regmap,
+				P3H2X4X_TP_SMBUS_AGNT_IBI_CONFIG,
+				bus->tp_mask);
+	if (ret)
+		return ret;
+
+	bus->tp_smbus_client = NULL;
+	hub->hub_config.tp_config[bus->tp_port].ibi_en = false;
+
+	return 0;
+}
+#endif
+
 /*
  * I2C algorithm Structure
  */
 static struct i2c_algorithm p3h2x4x_tp_i2c_algorithm = {
 	.master_xfer    = p3h2x4x_tp_i2c_xfer,
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	.reg_slave = p3h2x4x_tp_i2c_reg_slave,
+	.unreg_slave = p3h2x4x_tp_i2c_unreg_slave,
+#endif
 	.functionality  = p3h2x4x_tp_smbus_funcs,
 };
 
-- 
2.25.1

