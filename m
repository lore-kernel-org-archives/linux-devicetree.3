Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795558220;
	b=abq/4AXZ7XjciU62bik5Qedn/hDYL8NG0U2eurbMSs+HSwuVqs6uiegsKVs2+B7G5hlj
	 HNMSocFHI7AoEHoJPwR9uhPKuVQcsXx4DF1Ymuqx2KuhM5NQuiqs9keCuHd23Y+/Jy6/R
	 XOWuLvuPZFlqwn2kTdXz/da1OLd9Bln7gmZ6GuNCsgraVelVzIYP+WRl2mtgpblytWDgD
	 EvWrUXATuHBCISefuK88UlCzTZwUYx7CKkjgCwOVRkeWhM3LCTmIeUFXgD2OdEkXJe2ME
	 /jTNoqNcdybt5kmfVlpVMId1VD1NA6zB4FcqeTq1EBNGayWLNAo/HXT30/jYP8Xmh+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558220;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nswBVZdCxLMglHPqDPCiGmN98qoPf819Vz94uZ+XzpA=;
	b=Q7WaF0KgOgQ5hgI5KIiS4yaghvcKvx82ErZaNQ9onwD7oIllxTc3Ok63V3FJbITbhTom
	 Z1xRP26UUm6YtnL3v8Qznf7pEknyYTYPiptt7GKckaz5Y1NUNWXaYvu7rIyripnz+gGdC
	 pVkcdExLwC1ZmbqIzcF/cW/IOUAD9tkqTW7pCCbj3mW4UZN3iXoFlzQhxaep7Ilhioylu
	 zv8xksXCYMYcUUWTAU7tzITuu4ims7uMOa/g+PVfopOWoOXTawehNg0JIDEYZK2JlIL0+
	 +bv8n6PFz5R8aRFDBENhCGkKalSGaAnTpG4O5a9g7yUMt046cOzPwXosTRtMlME1kdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kf1TRmmw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D6D606A6A7;
	Tue, 24 Nov 2026 22:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kf1TRmmw
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795558219;
	b=baIQk22ui7f83ewjJ6mhfjIEBh9XoqlT20xDlrfa2d346yGDYgRSXkneLe6OFi2sYCfB
	 ZK+dMMLj2bn1NCTM7RNLCkF7fbunJE+4dkXuIusFjFb9bt/1d0MXLU1wo6Cnib4wv7dDQ
	 mVAAmKHDRnFW+1pedEO+2favUmT9u+RG1Ak9GhxSgxfYQN+DyyubARpRYaQdZCbImUMVs
	 kQkkLd1cxxD1p73vAsPGFkUInVn+WpRbqsoqPQQdVG+DIR4Yq7AaDjYcY94r3u54AwLJJ
	 VomvFnx8TnLX+e4jzuMsYN46QXqUsPS8RCxju9ZmstA5TDCyLLNcq4QWGgYOpL53nDw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795558219;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nswBVZdCxLMglHPqDPCiGmN98qoPf819Vz94uZ+XzpA=;
	b=HNTAQpP2RdF5QjtjiLzxWupgcfETVp4rYUAjX63pyq9OatHldi3eXJ1OXmguVcSddYje
	 gZI6JmmHFxD0c6N4KDPjrM4wKPXdGxKYudn1Qr6z4N4YOzIXvH2tJvwyi1FTUKSUhc1un
	 twa4hizrtVHmJI6cvUO+4S8V1UgrvKcvvs/HDrf6RwbxsiP3M8AGvjGB39DgnuxqOFzay
	 LfhaE+b+G82xmt4+wcufOa7ChhHJQtGemQfIzhHFKz3mh5IFAl0skArHoA9dde8f/mVeb
	 pmDMuu37U4EhrVTujwGr16U8FUHZImSu8ruWCUnOnrGi6hPCDEdo8c1o8GW9mnIRFag==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 629C11F000ED;
	Tue, 24 Nov 2026 22:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795558219;
	bh=nswBVZdCxLMglHPqDPCiGmN98qoPf819Vz94uZ+XzpA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Kf1TRmmwqcqN7jk4wXSDNUAWVjmfirCpADEbs20fGQOzgrvgfBjyPAy+F7pIHyR8e
	 P8v7q+XFmtMZX6ZwNDG/yddFY7DY5BDPK1lLBnSzHXvS/Tm2BeqE7thfOTwMWsr1Ec
	 Z8I4GG+1CsrqpdYJySGRh7zx5w3d8VX2ObfCWdgULbJkzqcU78QZ1lGaRSuWROoEaN
	 WLbV97Rdyts+RyHJsPba9zrM62/72Nxghg43apO7e8PiGgmX+13K0dvpciFEGI1NoN
	 O0RQuNpwsJQNzGsIAV8DTPrXtmJoOaO7SmpN4rKxDkg+SyTW43oqYhp8iucmugXJgJ
	 fQtx74Xm/20wA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ACE9A4CBE9;
	Tue, 24 Nov 2026 22:09:57 +0000 (UTC)
From: Selvamani Rajagopal via B4 Relay <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Date: Tue, 24 Nov 2026 14:09:58 -0800
Subject: [PATCH net-next v12 10/15] net: ethernet: oa_tc6: APIs to
 customize CONFIG0 settings
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-s2500-mac-phy-support-v12-10-3575855d99f9@onsemi.com>
References: <20261124-s2500-mac-phy-support-v12-0-3575855d99f9@onsemi.com>
In-Reply-To: <20261124-s2500-mac-phy-support-v12-0-3575855d99f9@onsemi.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, 
 Selva Rajagopal <selvamani.rajagopal@onsemi.com>, 
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Eric Dumazet <edumazet@kernel.org>, 
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>, 
 Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Jerry Ray <jerry.ray@microchip.com>, 
 Ciprian Regus <ciprian.regus@analog.com>, 
 Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795558193; l=7885;
 i=Selvamani.Rajagopal@onsemi.com; s=20260531; h=from:subject:message-id;
 bh=Tn4qWJ+KFSw9aGl6Q6VzMJbvXt57m8JvDM/gl/PybZM=;
 b=p7j4SSbr4p/WbELw+XYJSjjMFLeABk2s9XCiDfhFcNKoYqAwNPwXE/okv24Q9uKPEARIlmr4P
 bEwG/ORqH3yC94obRhUP1MvaBfZk8m8PzWvxjTnVTgcCBjkOPvpxKdq
X-Developer-Key: i=Selvamani.Rajagopal@onsemi.com; a=ed25519;
 pk=5QRdM0HS/LGWWcUZZ9hVfZ+qbPQGZCumcTXOiN7Fyug=
X-Endpoint-Received: by B4 Relay for
 Selvamani.Rajagopal@onsemi.com/20260531 with auth_id=803
X-Original-From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
Reply-To: Selvamani.Rajagopal@onsemi.com
Content-Transfer-Encoding: 7bit

From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

Add oa_tc6_tx_credit_threshold_set() to let a vendor driver set the
minimum transmit credits the MAC-PHY needs before it asserts the
interrupt.

Add the OA_TC6_CONFIG_RX_CUT_THROUGH quirk flag. When set,
oa_tc6_init() enables receive cut-through before the SYNC bit is set.
This can't be done after oa_tc6_init(), which sets the SYNC bit.
The flag is ignored if the MAC-PHY does not report cut-through
capability.

Existing drivers are not affected: the default credit threshold is
unchanged and cut-through stays disabled unless the quirk is set.

Signed-off-by: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

---
changes in v12
  - Moved the TX credit threshold API and the RX cut-through
    quirk out of the S2500 driver patch.
  - New patch in v12.
---
 Documentation/networking/oa-tc6-framework.rst | 20 +++++++++
 drivers/net/ethernet/oa_tc6/oa_tc6_main.c     | 62 +++++++++++++++++++++++++++
 drivers/net/ethernet/oa_tc6/oa_tc6_std_def.h  |  1 +
 include/linux/oa_tc6.h                        |  7 +++
 4 files changed, 90 insertions(+)

diff --git a/Documentation/networking/oa-tc6-framework.rst b/Documentation/networking/oa-tc6-framework.rst
index 558dc25038d3..2ce95ae58923 100644
--- a/Documentation/networking/oa-tc6-framework.rst
+++ b/Documentation/networking/oa-tc6-framework.rst
@@ -476,6 +476,9 @@ The quirk_flags field supports:
 
 - OA_TC6_BROKEN_PHY: Leave MDIO bus registration and PHY connection to the
   vendor driver instead of the framework.
+- OA_TC6_CONFIG_RX_CUT_THROUGH: Enable receive cut-through in the CONFIG0
+  register. It is ignored if the MAC-PHY does not report cut-through
+  capability.
 
 A zero value for vend1_mms means no Clause 45 ``MDIO_MMD_VEND1``
 mapping is requested; it does not select MMS 0. For any nonzero value
@@ -519,6 +522,23 @@ Zero align receive frame feature can be enabled to align all receive ethernet
 frames data to start at the beginning of any receive data chunk payload with a
 start word offset (SWO) of zero.
 
+.. c:function:: int oa_tc6_tx_credit_threshold_set(struct oa_tc6 *tc6, \
+                                                   u8 thresh)
+
+Sets the minimum number of free transmit credits that must be available
+before the MAC-PHY asserts the interrupt. The default is one credit
+according to OPEN Alliance 10BASE-T1x MAC-PHY Serial Interface specification.
+
+The thresh argument is the encoded TXCTHRESH field value of the CONFIG0
+register, not the credit count:
+
+- 0: one or more credits (default)
+- 1: four or more credits
+- 2: eight or more credits (OA_TC6_CONFIG0_TXCTHRESH_8)
+- 3: sixteen or more credits
+
+A value above 3 does not fit the field and fails with -EINVAL.
+
 .. c:function:: int oa_tc6_ptp_register(struct oa_tc6 *tc6, \
                                         struct ptp_clock_info *info)
 
diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6_main.c b/drivers/net/ethernet/oa_tc6/oa_tc6_main.c
index 228cc2a3dc2d..c078f22c32d6 100644
--- a/drivers/net/ethernet/oa_tc6/oa_tc6_main.c
+++ b/drivers/net/ethernet/oa_tc6/oa_tc6_main.c
@@ -289,9 +289,29 @@ static int oa_tc6_update_standard_capability(struct oa_tc6 *tc6)
 		return ret;
 	if (regval & OA_TC6_STDCAP_FTSC_CAPABILITY) /* Timestamp */
 		tc6->ftsc_capable = true;
+	if (regval & OA_TC6_STDCAP_CTC_CAPABILITY) /* Cut-through */
+		tc6->ctc_capable = true;
 	return 0;
 }
 
+static int oa_tc6_rx_cut_through_enable(struct oa_tc6 *tc6)
+{
+	u32 regval;
+	int ret;
+
+	if (!tc6->ctc_capable)
+		return 0;
+
+	ret = oa_tc6_read_register(tc6, OA_TC6_REG_CONFIG0, &regval);
+	if (ret)
+		return ret;
+
+	/* Set Receive Cut-Through Enable */
+	regval |= OA_TC6_CONFIG0_RXCTE;
+
+	return oa_tc6_write_register(tc6, OA_TC6_REG_CONFIG0, regval);
+}
+
 static __be32 oa_tc6_prepare_ctrl_header(u32 addr, u8 length,
 					 enum oa_tc6_register_op reg_op)
 {
@@ -1618,6 +1638,36 @@ int oa_tc6_zero_align_receive_frame_enable(struct oa_tc6 *tc6)
 }
 EXPORT_SYMBOL_GPL(oa_tc6_zero_align_receive_frame_enable);
 
+/**
+ * oa_tc6_tx_credit_threshold_set - function to set the minimum number of free
+ * transmit credits needed before the MAC-PHY asserts the interrupt.
+ * @tc6: oa_tc6 struct.
+ * @thresh: transmit credit threshold field value, e.g.
+ *	OA_TC6_CONFIG0_TXCTHRESH_8.
+ *
+ * Return: 0 on success, -EINVAL if @thresh does not fit the TXCTHRESH
+ * field, otherwise a negative error code from the register access.
+ */
+int oa_tc6_tx_credit_threshold_set(struct oa_tc6 *tc6, u8 thresh)
+{
+	u32 regval;
+	int ret;
+
+	if (thresh > OA_TC6_CONFIG0_TXCTHRESH_16)
+		return -EINVAL;
+
+	ret = oa_tc6_read_register(tc6, OA_TC6_REG_CONFIG0, &regval);
+	if (ret)
+		return ret;
+
+	/* Set Transmit Credit Threshold */
+	regval &= ~OA_TC6_CONFIG0_TXCTHRESH_MASK;
+	regval |= FIELD_PREP(OA_TC6_CONFIG0_TXCTHRESH_MASK, thresh);
+
+	return oa_tc6_write_register(tc6, OA_TC6_REG_CONFIG0, regval);
+}
+EXPORT_SYMBOL_GPL(oa_tc6_tx_credit_threshold_set);
+
 /**
  * oa_tc6_start_xmit - function for sending the tx skb which consists ethernet
  * frame.
@@ -1779,6 +1829,18 @@ struct oa_tc6 *oa_tc6_init(struct spi_device *spi, struct net_device *netdev,
 		return ERR_PTR(ret);
 	}
 
+	/* Cut-through bits must be configured before SYNC bit is set
+	 * in CONFIG0 register.
+	 */
+	if (tc6->quirks.quirk_flags & OA_TC6_CONFIG_RX_CUT_THROUGH) {
+		ret = oa_tc6_rx_cut_through_enable(tc6);
+		if (ret) {
+			dev_err(&tc6->spi->dev,
+				"Failed to enable RX cut-through: %d\n", ret);
+			return ERR_PTR(ret);
+		}
+	}
+
 	ret = oa_tc6_unmask_macphy_error_interrupts(tc6);
 	if (ret) {
 		dev_err(&tc6->spi->dev,
diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6_std_def.h b/drivers/net/ethernet/oa_tc6/oa_tc6_std_def.h
index cc7cda673f1b..245a1b316395 100644
--- a/drivers/net/ethernet/oa_tc6/oa_tc6_std_def.h
+++ b/drivers/net/ethernet/oa_tc6/oa_tc6_std_def.h
@@ -140,6 +140,7 @@ struct oa_tc6 {
 	struct list_head ttsc_skb_list;
 	struct ptp_clock *ptp_clock;
 	bool ftsc_capable; /* Timestamp capability */
+	bool ctc_capable;  /* cut-through capability */
 	u64 tx_hwtstamp_pkts;
 	u64 tx_hwtstamp_lost;
 	u64 tx_hwtstamp_err;
diff --git a/include/linux/oa_tc6.h b/include/linux/oa_tc6.h
index f34ed8218a7c..35b536741d01 100644
--- a/include/linux/oa_tc6.h
+++ b/include/linux/oa_tc6.h
@@ -20,6 +20,7 @@
 /* Standard Capabilities Register */
 #define OA_TC6_REG_STDCAP			0x0002
 #define OA_TC6_STDCAP_DIRECT_PHY_REG_ACCESS	BIT(8)
+#define OA_TC6_STDCAP_CTC_CAPABILITY		BIT(7)
 #define OA_TC6_STDCAP_FTSC_CAPABILITY		BIT(6)
 
 /* Reset Control and Status Register */
@@ -30,6 +31,10 @@
 #define OA_TC6_REG_CONFIG0			0x0004
 #define OA_TC6_CONFIG0_SYNC			BIT(15)
 #define OA_TC6_CONFIG0_ZARFE_ENABLE		BIT(12)
+#define OA_TC6_CONFIG0_TXCTHRESH_MASK		GENMASK(11, 10)
+#define OA_TC6_CONFIG0_TXCTHRESH_8		2	/* 0b10: >=8 credits */
+#define OA_TC6_CONFIG0_TXCTHRESH_16		3	/* 0b11: >=16 credits */
+#define OA_TC6_CONFIG0_RXCTE			BIT(8)
 #define OA_TC6_CONFIG0_FTSE_ENABLE		BIT(7)
 #define OA_TC6_CONFIG0_FTSS_64BIT_TSTAMP	BIT(6)
 #define OA_TC6_CONFIG0_PROTE			BIT(5)
@@ -82,6 +87,7 @@ struct oa_tc6;
 
 enum oa_tc6_quirk_flag {
 	OA_TC6_BROKEN_PHY = BIT(0),
+	OA_TC6_CONFIG_RX_CUT_THROUGH = BIT(1),
 };
 
 struct oa_tc6_quirks {
@@ -104,6 +110,7 @@ int oa_tc6_read_registers(struct oa_tc6 *tc6, u32 address, u32 value[],
 			  u8 length);
 netdev_tx_t oa_tc6_start_xmit(struct oa_tc6 *tc6, struct sk_buff *skb);
 int oa_tc6_zero_align_receive_frame_enable(struct oa_tc6 *tc6);
+int oa_tc6_tx_credit_threshold_set(struct oa_tc6 *tc6, u8 thresh);
 int oa_tc6_mdiobus_read_c45(struct mii_bus *bus, int addr, int devnum,
 			    int regnum);
 int oa_tc6_mdiobus_write_c45(struct mii_bus *bus, int addr, int devnum,

-- 
2.43.0


