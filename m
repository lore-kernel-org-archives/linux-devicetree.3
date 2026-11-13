Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567959;
	b=3qHMt0qO2kq9pXch3SRm/fXMA79y6HMMnjAQ34KcfwkyQTaeLwXBxihraMnDGJ+SFUhW
	 4pnUiCKbb/1ses/YZINFaDIN64lxpoZtblZiXDo8tdKjwIu2GCldMP6MdsMRGpGWDexWE
	 GtaBuGnpuLFFKpDPwnLQGq8K5pTW2l0VcfwhldQlHvjPFWWAMVkcE6q5o4iol3ltqHYpj
	 5hZxG0f6QLwKRb4Yt7sf6n8M8zRsC9wP9QCupnRnDXWkteaTI2Ps8OXe4w0M+cVGfOOvB
	 nhBAHbmsvbXBammtEnWUbSDgV5S117Rc6rGUCwkqwzWQevXddwdRuf5FYaSxw9S8ORA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fGy3fk2PNTyq1ZP7o+ORh4l1Cj7wsngy9KPccoulCEw=;
	b=Wq8BBCtkHEMmX/ekIORkL3ovFbz+cDtugV9FePbIBj6DmHZvPLB6boE7FzX8jK1kW5aP
	 trE+DLuv8xnFZPcVfDx2B9GlvvBbfQe5QoGe+uJbK+mYnZ6xaAR0Y2ta2ueDoInMT105c
	 W2Wiy6F/o2bNWov1tOvUcZF+cWbtHMO/iYkNpjdBQm6ganFebsLJ3rGJpzyPbp/IELdE/
	 O5r1xi3fn+VPU8PBMA5cpo9cXSdt3hjB9t7ZkxYEZjapRIPYQgqSJpwjDDE4MPVv7dyFF
	 ZwPFmI9EyRuUPd4mTh5IalDZhdO1afO261AGbnYPCelwrdaluaLpW6K41r+IA7naryA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aAtt9VMj;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB7060A2634
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 11:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EB7060A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aAtt9VMj
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c151178f0cso1087362e87.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 03:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794567957; x=1795172757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fGy3fk2PNTyq1ZP7o+ORh4l1Cj7wsngy9KPccoulCEw=;
        b=aAtt9VMjTwUE37fnnDAy+oP7nfOznnCxn2paqNjiXAzrSfUOZAw/P5GLaSy/cs+Kar
         OOsr3r9/paH8Cmjwb7y8HlrHppbsHB4g0vGahN842F7Zi2qn0DP/XKkKb7ZFOFad4E9a
         8eytMgUOVLDM6NfdVi7RBZrOVlLsbSFtF7gO70Ghm4DFMMK1UrLgDVLIRXdpwPVYqryz
         ynWQkow9lX0SdxmiSOPc7Cv6AJYUHWrHyVvrn3wkw0O9+tbkGPMhSsPpdXtUuwHjVM38
         s0wP/0dhJvu1TuuIEve78fHAoddCKxo5EIqJM805vB9hhc32aLrGCT30GeViQyY9Uuhw
         A0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567957; x=1795172757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fGy3fk2PNTyq1ZP7o+ORh4l1Cj7wsngy9KPccoulCEw=;
        b=HpdQk8L45GZTEY3dBAgjzTqXyv45I6BovLoxRM1osWM4gh0hgANKLy/fszjJq6+H4u
         M8nQ/lzDkAFWhN7ygcc7tZspeGhHQ/3CUGxpaf1QipdYncScF0+7AvFF647g4HlNJqp/
         HYn5FI1G1KhFDf9Tba2CihdrGgsBlK+0wo9LA14t8f5E3wpgO3wjEpQYteEoLlm7yHz3
         lXBR9/oB3ZOdX1iLnjhtYyhouuVZ1l0PK7UqC5VqlnssgjIEh6vvesTqdf3SU2tHc634
         ZdUWOc3aPbAGYyeq8XIPbAYA6QbhliI2P0ikufktxsJsgDxKVy8ksBT2i+6VBWSft9cY
         vMXQ==
X-Forwarded-Encrypted: i=1; AL+hErFNBtqASj53R8/vfPDlZzFXSrNcLhCFgZ2o6UhvoKhjlisC8ARiyZGkHV+Zb4CSvTKlb78+NOGSPhR4@vger.kernel.org
X-Gm-Message-State: APuU4Z/JiIVOLIBuyrlpBADz781xPDfEL4At2FVneamiVy94rTJJncUB
	qphVuv8QFDGKYzohSZMtCIAyj94l3tLqIcW4NgwiwjQtO1pAtVG6vJ4T
X-Gm-Gg: AYBFou3i1X6ZRPzMk/mFDVY3B+XTWIlrukHfkZH9TdLa98E5k4zUcsJZ6PFPD4AAjhn
	r6QL8w3NafXgv1IJq+Mp9BPKOnDr5ui1dmnIAqD2JeYw5XaLbAYHIinqvEINIl1l3AcIfv5cFbe
	GQwi8zRMdNlKjCMs5vBys0iOpnjPVu5neHE8GjDDFMRNZxpTl9or438Zl4LB0a3QbWSWIG0NJ7o
	M4VxxzbQ7XaN5PzFzYoRLvI9wFz9guhR6yn3MNLHUA3/zlJHS+QLajvp5/4g7CQffct/xCvXp5l
	kKMRnqVsd6aVD19qCz5NiWslUe9OsWMe1/l/o9xh01+0V6dLnclzg9HQOzGWP9oyOyC2KaJ6iwl
	18DtQStzMx7uSKKWR/PCzOZ1JO5WL5o3iGbHQ+LM8kcnWug9ojXcew+I4KENcdwfzzZIajF1YDF
	8UIOnTJ8Slx5aEbldDBWEInA1la2aFBPmpu4Vf8+mWCTbU4R9kcWncJ8MjgzwdE+05MId6mZv5w
	vvbgmNbVWtTvfoGKvHlQEQ/43thbO/7qWAEldWiE++OAkKNfOWuS1+b8L8a1ESlbpDFXzotDk7T
	5NMGb9NPuYgdrOkg2X0mKgNdxkwfZFsBu35CJungV+diA/4=
X-Received: by 2002:a05:6512:1091:b0:5c1:4bd2:df30 with SMTP id 2adb3069b0e04-5c170b86315mr879416e87.60.1794567956492;
        Fri, 13 Nov 2026 03:05:56 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133371asm610997e87.21.2026.11.13.03.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:05:56 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH net-next 3/3] net: phy: dap8211r: add led hardware control support
Date: Fri, 13 Nov 2026 14:05:45 +0300
Message-ID: <20261113110546.173624-4-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113110546.173624-1-a.shimko.dev@gmail.com>
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for hardware-controlled leds on the dap8211r phy. The chip
exposes three led that can be programmed to react to link, speed,
duplex, and tx/rx activity.

Implement callbacks for led_hw_is_supported(), led_hw_control_set()
led_hw_control_get().

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 drivers/net/phy/dap8211r.c | 181 +++++++++++++++++++++++++++++++++++++
 1 file changed, 181 insertions(+)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index 4eb50c26397f..2e371c231d32 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/errno.h>
 #include <linux/ethtool.h>
 #include <linux/kernel.h>
@@ -57,6 +58,33 @@
  */
 #define DAP8211R_DEFAULT_DEL_SEL	0xD
 
+#define DAP8211R_LED_ID_0		0
+#define DAP8211R_LED_ID_1		1
+#define DAP8211R_LED_ID_2		2
+#define DAP8211R_LED_0			0xA00C
+#define DAP8211R_LED_1			0xA00D
+#define DAP8211R_LED_2			0xA00E
+#define DAP8211R_LED_ACT_BLINK		BIT(13)
+#define DAP8211R_LED_FULL_DUPLEX	BIT(12)
+#define DAP8211R_LED_HALF_DUPLEX	BIT(11)
+#define DAP8211R_LED_TX			BIT(10)
+#define DAP8211R_LED_RX			BIT(9)
+#define DAP8211R_LED_LINK_1000		BIT(6)
+#define DAP8211R_LED_LINK_100		BIT(5)
+#define DAP8211R_LED_LINK_10		BIT(4)
+
+#define DAP8211R_LED_LINK		(DAP8211R_LED_LINK_10	| \
+					DAP8211R_LED_LINK_100	| \
+					DAP8211R_LED_LINK_1000)
+
+#define DAP8211R_LED_SUPPORTED_TRG	(BIT(TRIGGER_NETDEV_LINK_10)	| \
+					BIT(TRIGGER_NETDEV_LINK_100)	| \
+					BIT(TRIGGER_NETDEV_LINK_1000)	| \
+					BIT(TRIGGER_NETDEV_TX)		| \
+					BIT(TRIGGER_NETDEV_RX)		| \
+					BIT(TRIGGER_NETDEV_HALF_DUPLEX)	| \
+					BIT(TRIGGER_NETDEV_FULL_DUPLEX))
+
 static const int dap8211r_internal_delay[] = {0, 150, 300, 450, 600, 750, 900,
 					      1050, 1200, 1350, 1500, 1650, 1800,
 					      1950, 2100, 2250};
@@ -142,6 +170,156 @@ static int dap8211r_modify_ext(struct phy_device *phydev, u16 reg, u16 mask, u16
 	return ret;
 }
 
+/**
+ * dap8211r_led_hw_is_supported() - Check if the requested LED rules are supported
+ * @phydev: PHY device structure
+ * @index: LED index
+ * @rules: Bitmask of requested netdev trigger rules
+ *
+ * Validates the requested combination of rules which can be represented in the
+ * hardware register.
+ *
+ * Return: 0 on success, -EINVAL for an invalid LED index,
+ *         or -EOPNOTSUPP if any requested rule is not supported by the PHY
+ */
+static int dap8211r_led_hw_is_supported(struct phy_device *phydev, u8 index, unsigned long rules)
+{
+	switch (index) {
+	case DAP8211R_LED_ID_0:
+		fallthrough;
+	case DAP8211R_LED_ID_1:
+		fallthrough;
+	case DAP8211R_LED_ID_2:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return (rules & ~DAP8211R_LED_SUPPORTED_TRG) ? -EOPNOTSUPP : 0;
+}
+
+/**
+ * dap8211r_led_hw_control_set() - Program the LED control register
+ * @phydev: PHY device structure
+ * @index: LED index
+ * @rules: Bitmask of requested netdev trigger rules
+ *
+ * Translates the requested trigger rules into the corresponding bit
+ * positions of the LED control register and writes the resulting value
+ * to the PHY.
+ *
+ * Note that the ACT_BLINK bit (13) must be set together with TX/RX rules,
+ * otherwise the LED will not blink on traffic if no other rule (such as
+ * link or duplex) is active.
+ *
+ * Return: 0 on success, -EINVAL for an invalid LED index, or a negative error code
+ */
+static int dap8211r_led_hw_control_set(struct phy_device *phydev, u8 index, unsigned long rules)
+{
+	u16 led_mode = 0, led_reg;
+
+	switch (index) {
+	case DAP8211R_LED_ID_0:
+		led_reg = DAP8211R_LED_0;
+		break;
+	case DAP8211R_LED_ID_1:
+		led_reg = DAP8211R_LED_1;
+		break;
+	case DAP8211R_LED_ID_2:
+		led_reg = DAP8211R_LED_2;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (test_bit(TRIGGER_NETDEV_LINK, &rules))
+		led_mode |= DAP8211R_LED_LINK;
+
+	if (test_bit(TRIGGER_NETDEV_LINK_10, &rules))
+		led_mode |= DAP8211R_LED_LINK_10;
+
+	if (test_bit(TRIGGER_NETDEV_LINK_100, &rules))
+		led_mode |= DAP8211R_LED_LINK_100;
+
+	if (test_bit(TRIGGER_NETDEV_LINK_1000, &rules))
+		led_mode |= DAP8211R_LED_LINK_1000;
+
+	if (test_bit(TRIGGER_NETDEV_RX, &rules))
+		led_mode |= DAP8211R_LED_RX | DAP8211R_LED_ACT_BLINK;
+
+	if (test_bit(TRIGGER_NETDEV_TX, &rules))
+		led_mode |= DAP8211R_LED_TX | DAP8211R_LED_ACT_BLINK;
+
+	if (test_bit(TRIGGER_NETDEV_HALF_DUPLEX, &rules))
+		led_mode |= DAP8211R_LED_HALF_DUPLEX;
+
+	if (test_bit(TRIGGER_NETDEV_FULL_DUPLEX, &rules))
+		led_mode |= DAP8211R_LED_FULL_DUPLEX;
+
+	if (!led_mode)
+		return -EOPNOTSUPP;
+
+	return dap8211r_write_ext(phydev, led_reg, led_mode);
+}
+
+/**
+ * dap8211r_led_hw_control_get() - Read the current LED configuration
+ * @phydev: PHY device structure
+ * @index: LED index
+ * @rules: Pointer to a bitmask where the current rules will be stored
+ *
+ * Reads the LED control register and translates the hardware bit
+ * positions back into the corresponding netdev trigger rules bitmask.
+ *
+ * Return: 0 on success, -EINVAL for an invalid LED index, or a negative error code
+ */
+static int dap8211r_led_hw_control_get(struct phy_device *phydev, u8 index, unsigned long *rules)
+{
+	u16 led_reg;
+	int led_mode = 0;
+
+	switch (index) {
+	case DAP8211R_LED_ID_0:
+		led_reg = DAP8211R_LED_0;
+		break;
+	case DAP8211R_LED_ID_1:
+		led_reg = DAP8211R_LED_1;
+		break;
+	case DAP8211R_LED_ID_2:
+		led_reg = DAP8211R_LED_2;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	led_mode = dap8211r_read_ext(phydev, led_reg);
+	if (led_mode < 0)
+		return led_mode;
+
+	if (led_mode & DAP8211R_LED_LINK_10)
+		__set_bit(TRIGGER_NETDEV_LINK_10, rules);
+
+	if (led_mode & DAP8211R_LED_LINK_100)
+		__set_bit(TRIGGER_NETDEV_LINK_100, rules);
+
+	if (led_mode & DAP8211R_LED_LINK_1000)
+		__set_bit(TRIGGER_NETDEV_LINK_1000, rules);
+
+	if (led_mode & DAP8211R_LED_RX)
+		__set_bit(TRIGGER_NETDEV_RX, rules);
+
+	if (led_mode & DAP8211R_LED_TX)
+		__set_bit(TRIGGER_NETDEV_TX, rules);
+
+	if (led_mode & DAP8211R_LED_HALF_DUPLEX)
+		__set_bit(TRIGGER_NETDEV_HALF_DUPLEX, rules);
+
+	if (led_mode & DAP8211R_LED_FULL_DUPLEX)
+		__set_bit(TRIGGER_NETDEV_FULL_DUPLEX, rules);
+
+	return 0;
+}
+
 /**
  * dap8211r_config_init() - Initialize PHY
  * @phydev: PHY device structure
@@ -230,6 +408,9 @@ static struct phy_driver dap8211r_driver[] = {
 		.config_aneg	= genphy_config_aneg,
 		.suspend	= genphy_suspend,
 		.resume		= genphy_resume,
+		.led_hw_is_supported	= dap8211r_led_hw_is_supported,
+		.led_hw_control_set	= dap8211r_led_hw_control_set,
+		.led_hw_control_get	= dap8211r_led_hw_control_get,
 	},
 };
 module_phy_driver(dap8211r_driver);
-- 
2.43.0

