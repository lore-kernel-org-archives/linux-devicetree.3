Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795558222;
	b=Ti+QHM5d2fuwB9DOH2IrKayEkhiClnOB+chEvkDYYFy88s0YzC1aQWyePjBMXaKNIN7V
	 Xb0ajdxYQREJNKMgZRa6QpWd03yxD3nUFkQ/gzZ1EsJi0R5NlTa4KIfGyuWnaAJIagAUc
	 yrcGIZT5C7p9eHQKAcmnxMOPf1dNANTh/TGXCOiNbwZmUQDQtGavwO88Ny1yxqHVbehX/
	 0+rPD0JcPKjvzLwAKlciWEu01DnijrxI9U6WKg8mjrnwXblnC7OGi8T0Hhqd/F6C4rLdN
	 a2iZHwinYiS9eDD2zeYFND9m8FC5fV41VVboWN6dQf5F8RAhcAjVkigY3wdOJypEZEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558222;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1pspu/1j0VfO+MpxjeItr0EX3K7hNHhPnXhNqflS3og=;
	b=tTLFW/kTEfzAD34pmyCTz6+YA7f7JTR9q6yFTbu37tOqNsN+WcVRDBtPj7Y0UuuJZbe9
	 DRL496I6MpKRdjdknTn3pjingvVoVdivfMRbzu+0rdZmQqEBHeLXO1AU6i8nUiJ8I3yt5
	 KOezVvMtZwZ2OFiHljR/1/G3mjR60WDmIMUqSPXpCEGZs+dazMfGl/6hUVxYcypouOrrM
	 yUYKB+E3DS0ckYmfEPVDJPQxT1dv5qWJ7CjBRN3mA5I5GxWXKhC/o8HtzeeGa9Z5Bee04
	 OJXGnlVlJStxmMJ2NJ00UEVZMFVhrRYvDe2R2OWv0qVJy96zvzCDjQo6ohRKWCmAwKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ekazWHYy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F37F60A380E;
	Tue, 24 Nov 2026 22:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ekazWHYy
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795558222;
	b=uyMnAx2sTEYpLk9iZGnJFRu1nqq0vUISUYdLuuoYDyVCAnv6zeprgWurY34IHLHlcNXp
	 FSyz/o7pObWBikvD3oxIx36aggHVtdzZEV5iSRPF+oneITZhHp0eF0dKTAnI3RT6k9Riq
	 1EBrbWtTyVAlDYWSOnv/MswhQDMXfrDBqeqz1cilRjmMBp+DB2akHP7QfjU6Z+VSuICaV
	 su+OvMKueDdxqWrl2mtjG86U+ZbAPgBJZr4m7Y95nmqR3LCb6l4/2PdjSdoFHKXpowgf4
	 WdjSeWpLU3kaLTvX0a3Uc/qq6wlSRS6Ds5XHQR0zuSUcbFJ5mz6syNRI3wkohFPf61A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795558222;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1pspu/1j0VfO+MpxjeItr0EX3K7hNHhPnXhNqflS3og=;
	b=0oU4s5FiPtw3zMt2DLYcJa9dcdTwaYWL8F3luwtfpNjfahECv4B97GzQuXAlUmiqWgQo
	 2XHupGS6A25MtJ6VGa0t6t4eqrZmG36hfi01XTXxAXGqmQWTtDtynggGWfHTfBTcaIE3w
	 HM8vqw6uLjye4vHUM+1C8P9tiyQE/e9F6Ro/TiJUA74WBIhKqG5YlI2ZzFsvKSlmGS9Xn
	 pZtBklAkF/XidqTOfOC5Sf8D2t/bn2XvksCHWq2Wj+OvBjePJiT5gKHm0sC52Wxsc9F8D
	 biuOfI3djG7ktK1BtKCHYiyse0dTN3DM+4bD0sOwwfWlek1XYU8HYP39VvGvV6+UxWw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5D7531F000EB;
	Tue, 24 Nov 2026 22:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795558222;
	bh=1pspu/1j0VfO+MpxjeItr0EX3K7hNHhPnXhNqflS3og=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ekazWHYyFc59pXp+kon4GfNXsq4FZ2stsajqT7G2hayo5QKBDsElr4sLtL5NQ+Rq6
	 t9zYWfMN9t5gno63Xz7ZjTvoXXaVvTevYjhgHlui7zoy6rihUW/BV3vqhgPi3lU/Ru
	 hyoI30JRfSXquN7mF5mGBRWdxT8fcuw41w+E6M8ku5ngrlKn371T5Ls2wXRPflZNOJ
	 uJODzV51IvAtvUc6enlk8+dn86p3QFyvkDMK/ooQYyu0XVmZdkHiUw6xDdK0BDx5ir
	 PmkkL3iluzBdlmnlR7kktcCqNZo0NRnOgB1CpFZ3boUdwyw449qnE69wcrySeNTN//
	 8APBaMtqP3IBA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8F85E4CBE5;
	Tue, 24 Nov 2026 22:09:57 +0000 (UTC)
From: Selvamani Rajagopal via B4 Relay <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Date: Tue, 24 Nov 2026 14:09:57 -0800
Subject: [PATCH net-next v12 09/15] net: ethernet: oa_tc6: Support for
 vendor specific MMS
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
Message-Id: <20261124-s2500-mac-phy-support-v12-9-3575855d99f9@onsemi.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795558193; l=6195;
 i=Selvamani.Rajagopal@onsemi.com; s=20260531; h=from:subject:message-id;
 bh=1MjkVLzuAaXBWXeuv00U8/V6OxD8o95U9vnwuGPge64=;
 b=FcqtpJ+3NRkXbSM9r/N2qDysZnvI1/tbj89cQiQvYctPz8CGCZDj3s6BHH+Hl79/RQ1x3weiD
 7H406ZSmjnrC29rwzFRx/xHc2/DoGa4cvmf2WkVAgx0jJqXYEd5FqaR
X-Developer-Key: i=Selvamani.Rajagopal@onsemi.com; a=ed25519;
 pk=5QRdM0HS/LGWWcUZZ9hVfZ+qbPQGZCumcTXOiN7Fyug=
X-Endpoint-Received: by B4 Relay for
 Selvamani.Rajagopal@onsemi.com/20260531 with auth_id=803
X-Original-From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
Reply-To: Selvamani.Rajagopal@onsemi.com
Content-Transfer-Encoding: 7bit

From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

Add vend1_mms to struct oa_tc6_quirks to let a vendor driver
map MDIO_MMD_VEND1 to one of the vendor specific MMS values,
10 to 15, in table 6 of the OPEN Alliance 10BASE-T1x MAC-PHY
Serial Interface specification.

The mapping must be known when oa_tc6_init() scans for the PHY,
which can access MMD VEND1.

A zero vend1_mms keeps the current behavior. A value outside 10 to 15
makes oa_tc6_init() fail with -EINVAL.

Signed-off-by: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

---

changes in v12
  - Dropped Reviewed-by from Andrew Lunn as the code has changed.
  - MMD VEND1 mapping is now part of the quirks, not an API.
changes in v11
  - Accidentally patch got removed
changes in v10
  - No change
changes in v9
  - No change
changes in v8
  - No change
changes in v7
  - No change
changes in v6
  - No change
changes in v5
  - no change
changes in v4
  - no change
changes in v3
  - no change
changes in v2
  - Moved the handling of vendor specific MMS mapping to separate patch
  - new patch
---
 Documentation/networking/oa-tc6-framework.rst | 12 +++++++++++-
 drivers/net/ethernet/oa_tc6/oa_tc6_main.c     | 22 ++++++++++++++++------
 drivers/net/ethernet/oa_tc6/oa_tc6_std_def.h  |  6 +++++-
 include/linux/oa_tc6.h                        |  1 +
 4 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/Documentation/networking/oa-tc6-framework.rst b/Documentation/networking/oa-tc6-framework.rst
index 390529419133..558dc25038d3 100644
--- a/Documentation/networking/oa-tc6-framework.rst
+++ b/Documentation/networking/oa-tc6-framework.rst
@@ -469,7 +469,17 @@ The include/linux/oa_tc6.h defines the following functions:
                                            struct net_device *netdev, \
                                            struct oa_tc6_quirks *quirks)
 
-Initialize OA TC6 lib.
+Initialize the OA TC6 lib. Pass ``NULL`` for quirks if no device-specific
+settings are needed.
+
+The quirk_flags field supports:
+
+- OA_TC6_BROKEN_PHY: Leave MDIO bus registration and PHY connection to the
+  vendor driver instead of the framework.
+
+A zero value for vend1_mms means no Clause 45 ``MDIO_MMD_VEND1``
+mapping is requested; it does not select MMS 0. For any nonzero value
+outside the range 10 through 15, ``oa_tc6_init()`` fails with ``-EINVAL``.
 
 .. c:function:: void oa_tc6_exit(struct oa_tc6 *tc6)
 
diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6_main.c b/drivers/net/ethernet/oa_tc6/oa_tc6_main.c
index c69ed576b41d..228cc2a3dc2d 100644
--- a/drivers/net/ethernet/oa_tc6/oa_tc6_main.c
+++ b/drivers/net/ethernet/oa_tc6/oa_tc6_main.c
@@ -619,7 +619,7 @@ static int oa_tc6_mdiobus_write(struct mii_bus *bus, int addr, int regnum,
 				     val);
 }
 
-static int oa_tc6_get_phy_c45_mms(int devnum)
+static int oa_tc6_get_phy_c45_mms(struct oa_tc6 *tc6, int devnum)
 {
 	switch (devnum) {
 	case MDIO_MMD_PCS:
@@ -632,6 +632,8 @@ static int oa_tc6_get_phy_c45_mms(int devnum)
 		return OA_TC6_PHY_C45_AUTO_NEG_MMS5;
 	case MDIO_MMD_POWER_UNIT:
 		return OA_TC6_PHY_C45_POWER_UNIT_MMS6;
+	case MDIO_MMD_VEND1:
+		return tc6->quirks.vend1_mms;
 	default:
 		return -EOPNOTSUPP;
 	}
@@ -645,7 +647,7 @@ int oa_tc6_mdiobus_read_c45(struct mii_bus *bus, int addr, int devnum,
 	int mms;
 	int ret;
 
-	mms = oa_tc6_get_phy_c45_mms(devnum);
+	mms = oa_tc6_get_phy_c45_mms(tc6, devnum);
 	if (mms < 0)
 		return mms;
 
@@ -663,7 +665,7 @@ int oa_tc6_mdiobus_write_c45(struct mii_bus *bus, int addr, int devnum,
 	struct oa_tc6 *tc6 = bus->priv;
 	int mms;
 
-	mms = oa_tc6_get_phy_c45_mms(devnum);
+	mms = oa_tc6_get_phy_c45_mms(tc6, devnum);
 	if (mms < 0)
 		return mms;
 
@@ -722,7 +724,7 @@ static int oa_tc6_phy_init(struct oa_tc6 *tc6)
 {
 	int ret;
 
-	if (tc6->quirk_flags & OA_TC6_BROKEN_PHY)
+	if (tc6->quirks.quirk_flags & OA_TC6_BROKEN_PHY)
 		return 0;
 
 	ret = oa_tc6_check_phy_reg_direct_access_capability(tc6);
@@ -761,7 +763,7 @@ static int oa_tc6_phy_init(struct oa_tc6 *tc6)
 
 static void oa_tc6_phy_exit(struct oa_tc6 *tc6)
 {
-	if (tc6->quirk_flags & OA_TC6_BROKEN_PHY)
+	if (tc6->quirks.quirk_flags & OA_TC6_BROKEN_PHY)
 		return;
 
 	phy_disconnect(tc6->phydev);
@@ -1700,7 +1702,15 @@ struct oa_tc6 *oa_tc6_init(struct spi_device *spi, struct net_device *netdev,
 	init_completion(&tc6->ts_cfg_done);
 
 	if (quirks)
-		tc6->quirk_flags = quirks->quirk_flags;
+		tc6->quirks = *quirks;
+
+	if (!tc6->quirks.vend1_mms)
+		tc6->quirks.vend1_mms = -EOPNOTSUPP;
+	else if (tc6->quirks.vend1_mms < OA_TC6_VENDOR_MMS_MIN ||
+		 tc6->quirks.vend1_mms > OA_TC6_VENDOR_MMS_MAX)
+		return ERR_PTR(dev_err_probe(&spi->dev, -EINVAL,
+					     "Invalid VEND1 MMS: %d\n",
+					     tc6->quirks.vend1_mms));
 
 	/* Set the SPI controller to pump at realtime priority */
 	tc6->spi->rt = true;
diff --git a/drivers/net/ethernet/oa_tc6/oa_tc6_std_def.h b/drivers/net/ethernet/oa_tc6/oa_tc6_std_def.h
index 014b48e7e27d..cc7cda673f1b 100644
--- a/drivers/net/ethernet/oa_tc6/oa_tc6_std_def.h
+++ b/drivers/net/ethernet/oa_tc6/oa_tc6_std_def.h
@@ -32,6 +32,10 @@
 #define OA_TC6_CTRL_HEADER_LENGTH		GENMASK(7, 1)
 #define OA_TC6_CTRL_HEADER_PARITY		BIT(0)
 
+/* Vendor-specific MMS range from Table 6 of OA TC6 specification. */
+#define OA_TC6_VENDOR_MMS_MIN			10
+#define OA_TC6_VENDOR_MMS_MAX			15
+
 /* Data header */
 #define OA_TC6_DATA_HEADER_DATA_NOT_CTRL	BIT(31)
 #define OA_TC6_DATA_HEADER_DATA_VALID		BIT(21)
@@ -131,7 +135,7 @@ struct oa_tc6 {
 	bool int_flag;
 	bool disable_traffic;
 	bool prot_ctrl;
-	enum oa_tc6_quirk_flag quirk_flags;
+	struct oa_tc6_quirks quirks;
 	struct gpio_desc *reset_gpio;
 	struct list_head ttsc_skb_list;
 	struct ptp_clock *ptp_clock;
diff --git a/include/linux/oa_tc6.h b/include/linux/oa_tc6.h
index 32c25b5e2aa3..f34ed8218a7c 100644
--- a/include/linux/oa_tc6.h
+++ b/include/linux/oa_tc6.h
@@ -86,6 +86,7 @@ enum oa_tc6_quirk_flag {
 
 struct oa_tc6_quirks {
 	enum oa_tc6_quirk_flag quirk_flags;
+	int vend1_mms;
 };
 
 struct oa_tc6 *oa_tc6_init(struct spi_device *spi, struct net_device *netdev,

-- 
2.43.0


