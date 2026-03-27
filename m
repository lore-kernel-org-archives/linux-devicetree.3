Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1169D3C1979;
	Fri, 27 Mar 2026 06:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774594763; cv=none; b=XyIYUUq+OamkZxjf0vwt6dgsJWuyOFObOmTfaUVUBswkUH9A8bWjwkZP435RCPrsA3+aekQOceaVc4ijmcqfXFvcSoh5kgMXonZq9lvoqgntPvFyUQd6zsHbHkMv0pf6/55lwgb2p7lVfcMWVfKmQL6o4VmBV/eGF3pHGetu/Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774594763; c=relaxed/simple;
	bh=+uYAGgoOPo8bLq2pJEoGgnHWXNq5+Y92SxzPmrm3lx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cM5gJbzRDunK2OMEZ4LurgSLxzYf8o7Y5z+pSa6QtUzlqcWHydyGhWhYa3T1kXf2Vofa4wFdyadZItDTTVPM91rhYqXH+Qkuib+nxYovtl3n9oGCLkCRdQAYfKdsFOqlig09n/npV9Rg2hBXh8/2CgD0BgW/PTcLHXM++lKKLeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rUIMEOJR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rUIMEOJR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71901C19423;
	Fri, 27 Mar 2026 06:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774594762;
	bh=+uYAGgoOPo8bLq2pJEoGgnHWXNq5+Y92SxzPmrm3lx0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=rUIMEOJRSYCB7RucQGG4PaxxD/Gxp+WS5WI2qbdgQUR2Tezsv5UaPTu5Sccjew3BX
	 /STHbYE7fN8R2g8rR/pcnMiqRXxf2EEhaqdzOyCCgBt2XP7lxC+8yh/N1f9oXGJr/5
	 dscnBFVUJrH1CyUTBjLG0OqxI+Vgs/9eEgtVn0zoxpDmQ8MBd+9Q9FCB2GE4cyIPlt
	 HERoddZgvkEx2+vGkrdfTxBaIFLj7XQ+k8K6tGE1mFvY1E/fGMwDNqDZwX7hLh7n+o
	 qLemUUVgm38RIIn76yV/h9dcnjRaXAmDvvjzhhORqyMhSDW6LXLWIosxV7zJJ7/4Xy
	 S+yHbeaC+gZvw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6098610BA435;
	Fri, 27 Mar 2026 06:59:22 +0000 (UTC)
From: Andy Chung via B4 Relay <devnull+Andy.Chung.amd.com@kernel.org>
Date: Fri, 27 Mar 2026 14:59:16 +0800
Subject: [PATCH] ARM: dts: aspeed: anacapa: Enable MCTP and FRU for NIC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-dts_enable_nic_mctp-v1-1-5b5c05f4442c@amd.com>
X-B4-Tracking: v=1; b=H4sIAMMqxmkC/yXMQQrCMBBG4auUWRtoU5KAVxEJSfqrIxpLJopQe
 ndTu/wW7y0kKAyhY7dQwYeFX7lhOHSUbiFfoXhqJt1r24/aqamKRw7xAZ85+Weqs8JognHWxMF
 ZauVccOHv/3o675Z3vCPVbUXr+gP88bJ9dwAAAA==
X-Change-ID: 20260327-dts_enable_nic_mctp-e35a5765b176
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Andy Chung <andy.chung@amd.com>, Andy Chung <Andy.Chung@amd.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774594761; l=3825;
 i=Andy.Chung@amd.com; s=20260327; h=from:subject:message-id;
 bh=nPjZUWkxYiROesPBYSRnJtyY+ooYKRCOwqAAXx0E5II=;
 b=426Yu7gf6eNtDB2/x526jYc4Z1JqYnU4txLYevBKxAhEn8zHWmwRTqtXFJAuEiVW5EmT0Xyud
 qS5QpdP/rNHDPpoqYK3BCbkLuAfO8zBi5AI7c0GwHoMl+hQ/Ps7C6nE
X-Developer-Key: i=Andy.Chung@amd.com; a=ed25519;
 pk=X2gaHRnhU2q5hvMjkC6xmIcC03vKNvHY9CQRdsj9ecM=
X-Endpoint-Received: by B4 Relay for Andy.Chung@amd.com/20260327 with
 auth_id=696
X-Original-From: Andy Chung <Andy.Chung@amd.com>
Reply-To: Andy.Chung@amd.com

From: Andy Chung <Andy.Chung@amd.com>

Add the mctp-controller property to enable frontend NIC management
via PLDM over MCTP.
Also add EEPROM device for NIC FRU.

Signed-off-by: Andy Chung <Andy.Chung@amd.com>
---
Add the mctp-controller property to enable frontend NIC management
via PLDM over MCTP.
Also add EEPROM device for NIC FRU.
---
 .../dts/aspeed/aspeed-bmc-facebook-anacapa.dts     | 67 +++++++++++++++++++++-
 1 file changed, 65 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
index 221af858cb6b..138b081be049 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
@@ -584,38 +584,67 @@ eeprom@56 {
 // R Bridge Board
 &i2c10 {
 	status = "okay";
+	multi-master;
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
 
 	i2c-mux@71 {
 		compatible = "nxp,pca9548";
 		reg = <0x71>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		i2c-mux-idle-disconnect;
 
 		i2c10mux0ch0: i2c@0 {
 			reg = <0>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			mctp-controller;
 		};
 		i2c10mux0ch1: i2c@1 {
 			reg = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			mctp-controller;
+			// BE NIC FRU
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
 		};
 		i2c10mux0ch2: i2c@2 {
 			reg = <2>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			mctp-controller;
+			// BE NIC FRU
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
 		};
 		i2c10mux0ch3: i2c@3 {
 			reg = <3>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			mctp-controller;
+			// BE NIC FRU
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
 		};
 		i2c10mux0ch4: i2c@4 {
 			reg = <4>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			mctp-controller;
+			// BE NIC FRU
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
 		};
 		i2c10mux0ch5: i2c@5 {
 			reg = <5>;
@@ -661,38 +690,72 @@ i2c10mux0ch7: i2c@7 {
 // L Bridge Board
 &i2c11 {
 	status = "okay";
+	multi-master;
+	mctp@10 {
+		compatible = "mctp-i2c-controller";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+	};
 
 	i2c-mux@71 {
 		compatible = "nxp,pca9548";
 		reg = <0x71>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		i2c-mux-idle-disconnect;
 
 		i2c11mux0ch0: i2c@0 {
 			reg = <0>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			mctp-controller;
+			// FE NIC FRU
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
 		};
 		i2c11mux0ch1: i2c@1 {
 			reg = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			mctp-controller;
+			// BE NIC FRU
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
 		};
 		i2c11mux0ch2: i2c@2 {
 			reg = <2>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			mctp-controller;
+			// BE NIC FRU
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
 		};
 		i2c11mux0ch3: i2c@3 {
 			reg = <3>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			mctp-controller;
+			// BE NIC FRU
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
 		};
 		i2c11mux0ch4: i2c@4 {
 			reg = <4>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			mctp-controller;
+			// BE NIC FRU
+			eeprom@50 {
+				compatible = "atmel,24c32";
+				reg = <0x50>;
+			};
 		};
 		i2c11mux0ch5: i2c@5 {
 			reg = <5>;

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260327-dts_enable_nic_mctp-e35a5765b176

Best regards,
--  
Andy Chung <Andy.Chung@amd.com>


