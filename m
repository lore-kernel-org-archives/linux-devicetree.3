Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609903BB13A
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 17:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778608242; cv=none; b=A6Q/r6zuZh7saPQRzuCPhjmFkBwUHhUVFO9uPE1pNb9DIdoYJaA3+T0Cdi2RbwAVgFd9t/utryl6s3z1+abHgC9rX7r9tIIhA1BODfEpwUUSjSFgRqufEkm7y1Z+SAzWdT85lRiCQgjOff0wX/rTJGQEDxbAX3i/BxyK1HQaDDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778608242; c=relaxed/simple;
	bh=BCesiif9cohZ69lyA7AVVqI9w4S5LQJ8GNBKABhF4wI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nEDZ9vVl8vVn+FOrfF3GW8ksvK9QQet+k1ihEkmwlRBebHnCHAVj7UrOp/lbQKeC3qaVP7OvN4kqi74hea7b87fKXbJKal2MNMAiHLpkOVX4rIzShqUoGnxarqP8qcRkXsW2JLU5Ts8F/OHYmoas33LuzM5iqHODkHieaDo3a2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0kHqxDP; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0kHqxDP"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c795f441ff7so4281826a12.2
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 10:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778608240; x=1779213040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwNscldXuAtscs8D5M0IBqKy8TvTXmFs8KiInOYeroc=;
        b=E0kHqxDPCPn6uoEynAWGr3KykXAameuVcvHUEUHZi7S8TAety5/vqOCdpFrvBMzjLS
         KqJgMRsP2zg4AEMIxPaXJdqlqAn1sTTDEeouMTgOm6V8yw+V4+X6YZj+SCGmWTsWxJD/
         IgTR0vXOc9Pkn8phSEV2zu0GfzkdnZs3b5RDcWXJJBNWtABcmyWr4G5K5Rr8OPWieRv7
         3hwDkHDJg44+s76IUOmJa5M7dojeroVcM1wkZCacqfMKjJEDvPIqKKwoke1plg/A3CU4
         Dh1JFKvrxOKfcxXRPqHxw2ES4fU9dOlUJrMzoKT7tuPEyG8fL6g90u/LjG2u+7p4Ax8a
         dKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778608240; x=1779213040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mwNscldXuAtscs8D5M0IBqKy8TvTXmFs8KiInOYeroc=;
        b=IoBPg6ALkNXJn/vGBmoAuzIUw0tOa7oLa0jW/xl9qcWYY0NhwuZUfu+LjRXF25AJMJ
         qZ5JxNwPiMRuiYS8qkWDv+a+U5LekC+TX9lVioaygeYZ1XA1gX6CJtrqDGv1Dc+/JzWl
         4iEMvl4EX6GyXFsCOK/OFZG3Fa7MX7fAImIhjqf504xMcCVSnjw5eIN3HeTWgnvAsU4r
         Jf8Ep/tLqWJO2qCaoAg//PI8vQ1lRurJ9Pz+EWxd9w63AeiIaa6payu/jcTFSgh+M4ln
         gRewu2RdwFQCSpMWMZyUyZDheXUUY/9qRTsQIAMNCF4R/3rrQcrCWVxnINP2D6UR7lLd
         9oDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+byOelQDeBr0mNDoijUD0ZMLqQC9OMpVWO11Utrbi2br1N9grpJJBcb47nwneivoHK1YGLC5tD6S/c@vger.kernel.org
X-Gm-Message-State: AOJu0YzpcJnQgeIurvVgwI+PRG1haAj+VXpWE353Gkv79TiuO1Agkml2
	BOEnqvsbJvLCvjr1twGCELJbwaFj4g7XorbmVVLuBOFJU2W/3BbOoxHZ
X-Gm-Gg: Acq92OFmbgQ4fHmHmNmivxTPQVCln6HKj0YCf9HxUTQPGxIo6qQJ20mmnP9hYsFwbPI
	amZoyQ7sALAhX1+blG/5uLpAcy/u0Nh/OOdT4nMV5I3Xz5uGSG3Pu6fCcXKPZaTht764mHOf3ri
	WjfgvJHLWzUimWmCACcf0rkDNYLJYbUz8Gn0L661ARGWa16DOcONvdlAZWonnEAVmBr4W9JsI8c
	/dqj0ZZcmVUY5UiJ/8+86gxx9xhwg4QohXcONgT/Vjm6WhC6pdV1JNzAkW+64Dov2PZC0gBqufH
	dD3h+rQ3x4dEfIvuelgtZFDyk+MKlmSCiRqfH7oOSx0uBEPbHwcULkIYzOthjvG7wLKHi2xiUAM
	hQXLALgFT5GSyWgGQPwk5qQheYjYWErJVvzQufrN8J/CQ4Rdj0mAKXnBB39VV0d9oBrU9SwLqmr
	QYWmmXY798SHmpvI+8zq/HJu/ec2YUdxwRGIawP5aH
X-Received: by 2002:a05:6a20:748a:b0:38b:eadd:449a with SMTP id adf61e73a8af0-3aa5ab66e31mr33083918637.38.1778608240549;
        Tue, 12 May 2026 10:50:40 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.138])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682a20ebsm24838732b3a.53.2026.05.12.10.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 10:50:40 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Tue, 12 May 2026 23:20:19 +0530
Message-ID: <20260512175019.47548-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260512175019.47548-1-prasanth.padarthi10@gmail.com>
References: <20260512175019.47548-1-prasanth.padarthi10@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial device tree support for the ASRock Rack B650D4U BMC.
The B650D4U is a server motherboard utilizing the ASPEED AST2600
SoC for management.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 61 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index c4f064e4b..124d4f8f8 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-asrock-romed8hm3.dtb \
 	aspeed-bmc-asrock-spc621d8hm3.dtb \
 	aspeed-bmc-asrock-x570d4u.dtb \
+	aspeed-bmc-asrock-b650d4u.dtb \
 	aspeed-bmc-asus-x4tf.dtb \
 	aspeed-bmc-bytedance-g220a.dtb \
 	aspeed-bmc-delta-ahe50dc.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
new file mode 100644
index 000000000..d0b9c1e1f
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h> // Recommended for GPIO mapping
+
+/ {
+	model = "ASRock Rack B650D4U BMC";
+	compatible = "asrock,b650d4u-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial4 = &uart5;
+	};
+
+	chosen {
+		stdout-path = "serial4:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+};
+
+/* BMC Console UART */
+&uart5 {
+	status = "okay";
+};
+
+/* SPI Flash Management */
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+	};
+};
+
+/* Dedicated Management LAN */
+&mac0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
+};
+
+/* I2C Bus for FRU/EEPROM Storage */
+&i2c7 {
+	status = "okay";
+	eeprom@57 {
+		compatible = "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+};
+
+/* System Watchdog */
+&wdt1 {
+	status = "okay";
+	aspeed,reset-type = "soc";
+};
-- 
2.47.3

