Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402EB3E169E;
	Tue,  2 Jun 2026 13:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405267; cv=none; b=Ep3B6Uc6lrTObrDdPrqsscgn6Vym4dmVSUIu1mVlrOgfMXqGUH6pdacJ+6IM09yVYUnOylQK7iNXVyT17P3NMvau/no9mBTQrDggbfGfFfW1JFqrOBUV2f41wglqglZUaxeiLNBjser+OUcms2/wKVApsCSYdBUd29hewYspACQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405267; c=relaxed/simple;
	bh=v7755meFUFiWE6PwyqlAe5/lehT63GnEEOjlQC2nS84=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pbj0rF7oXogBybFeTzdMQUemvgDEBOfI60+CWvybJf5WlNMMYvaOqhAFxe9vRdZ9TcAdaCHdakJx769M7JZm7qadVls4DEAaXqeV4TUXqB3ps79ttqleiRD/VQZUWR/1eeNEijbzHDSak/4qg1KFLiaAn6NPEczMMbKqO5aN4aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ucU35nGJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ucU35nGJ"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:476d:c684:fe78:389f:7375])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3EA1A1112;
	Tue,  2 Jun 2026 15:00:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780405241;
	bh=v7755meFUFiWE6PwyqlAe5/lehT63GnEEOjlQC2nS84=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ucU35nGJRbJQBwUocrpGMuffWKtfjl9XnbqqghCNZ0k7OT1Mr7wUinIMb2CyHaMIb
	 ZznvQPFL/75QHYnbarm3vbWIeaPXBLOiciSk8QrmM14MRZnvnFEcdtvi2g856C0AHC
	 C+reiUWyQlRdDCxQqdPk1IRdf0tHJL3fZ5FCP00I=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 02 Jun 2026 18:29:27 +0530
Subject: [PATCH v3 1/4] arm64: dts: ti: k3-am67a-beagley-ai: Setup I2C for
 CSI/DSI connectors
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-beagley-cameras-v3-1-fe6ae35b7eda@ideasonboard.com>
References: <20260602-beagley-cameras-v3-0-fe6ae35b7eda@ideasonboard.com>
In-Reply-To: <20260602-beagley-cameras-v3-0-fe6ae35b7eda@ideasonboard.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Nelson <robertcnelson@gmail.com>, Andrew Davis <afd@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1925;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=v7755meFUFiWE6PwyqlAe5/lehT63GnEEOjlQC2nS84=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqHtQCFmZIPyCttYXqvit17B7FIjh834IO8RDMd
 BFX2oQ5+uKJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCah7UAgAKCRBD3pH5JJpx
 RQxKEACJHOKe3oA8dNtb3UIMKSacXP0v2u5GJ6em/Q1+3/Et8ZjaGXdXBRA1ExAQ08+mFEVL3uw
 bvieKfUKK24cYzLSn4tVdv/VXkuPKJXjqv4QNTFOc0w/y0gWTqeFoIjvqpNhvDno+39LKnN6AZD
 G3FdFVweswX5dsdaEyrGveq4wmTSvln5PigmC5CgWcv5ztfnd6H/9D1egYgRSLk9B2HvZ/97WQU
 TmlWaNWWH1zc9RfRD6o/AtWbzwpkYrQObuRHnr1wDypTr8wXG4HPElPjiH37NCiHlBiZUHuhMbO
 237okjhjOKX+j9rcGODjSsiFhrx0D2n3HDm7Sz9EYyttEosC9FWfX8bbqcrmpQKtFsMEh2cJBT4
 NkiHizL8KWk5yEkGPhhQR8Ys3pzacPaaMX01fkEoQxN2w/s1NANPcLNdqi9X6cBO7wCIMb3yjWU
 XOd5w3pqGIzThraCeiDT5E7pSvA8dZywvMk7VWiB3bY09Fd/neUisOQKotX8RlTcDLEZW5cJahm
 9yuMYDzw++7s1T7X8JtJMU80kMFSreLdOyYqMg5MPrIQxMoIhiClG04fO217Pg92gBsL7SROjaK
 Dm70eEn/mKfhofsdwMnsobd/crv0lyud2HfDNaGWvE73mVYEHWsq0u1xIVLKZ/SWg/JrhIOUFH1
 bmFUt2ho6z2LpOA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

I2C0 is used by the 22-pin CSI1/DSI0 connector and I2C2 is used by the
22-pin CSI0 connector.

Add the missing pinmux definition for the I2C2, and setup both nodes but
keep them disabled. They will be enabled by the camera and display
overlays.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v3:
- Also add disabled nodes for I2C0 and I2C2
- Earlier this commit was only adding pinctrl for I2C2, so update the
  commit message accordingly
---
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
index 5255e04b9ac7..890d3a745375 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
@@ -157,6 +157,13 @@ J722S_IOPAD(0x01e4, PIN_INPUT_PULLUP, 0) /* (B22) I2C0_SDA */
 		bootph-all;
 	};
 
+	main_i2c2_pins_default: main-i2c2-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x00b0, PIN_INPUT_PULLUP, 1) /* (P22) GPMC0_CSn2.I2C2_SCL */
+			J722S_IOPAD(0x00b4, PIN_INPUT_PULLUP, 1) /* (P23) GPMC0_CSn3.I2C2_SDA */
+		>;
+	};
+
 	main_uart0_pins_default: main-uart0-default-pins {
 		pinctrl-single,pins = <
 			J722S_IOPAD(0x01c8, PIN_INPUT, 0)	/* (A22) UART0_RXD */
@@ -399,4 +406,22 @@ &sdhci1 {
 	status = "okay";
 };
 
+&main_i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c0_pins_default>;
+	clock-frequency = <400000>;
+
+	/* Only used by the CSI1/DSI0 connector; enable it in the overlay */
+	status = "disabled";
+};
+
+&main_i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&main_i2c2_pins_default>;
+	clock-frequency = <400000>;
+
+	/* Only used by the CSI0 connector; enable it in the overlay */
+	status = "disabled";
+};
+
 #include "k3-j722s-ti-ipc-firmware.dtsi"

-- 
2.54.0

