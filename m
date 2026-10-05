Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B803543F4A7
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 22:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791240053; cv=none; b=grl+5hWpq1xDeeWcekRxrlG9TxBEpgJjAuKdrH75Eig0uKcSoey7/B8NDFEu6hdnVBoTR6t6ksOUD3mYl8dtkjNbl7gwpmufCZlt0gPpEthDHZ9fwvvf3DjL48SYQtI3pd1OqcoyRVHTYwW7NQFnuKvyJUFnedin5hKH9FDiiuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791240053; c=relaxed/simple;
	bh=EAepGZi5JJgVl5A2Zgbnsm82y7MavVep4jBcaMjh1U4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QKTNf1NKmiJ0QyseMZ0BM8bY3tGaIW03Ny2wbAPbkRUI2ibZ2KtF8chdAes+oDrFM3+yTJoi6jcf4kfyv4jmIKd2s7RFr9UsUr5jM7oJBmbIVUnE3mS8Tb6Fv0ks+3buiUuINDRBQoZFyvlskeLC7Me8KWzKgRalcEc4TuXBYI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsBO70I1; arc=none smtp.client-ip=74.125.227.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsBO70I1"
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-3a4fe110578so1518748a91.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 15:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791240047; x=1791844847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IeBd/f+KYPaUD3mTxXbAK7RiokjVClr9ke91eN5DQPw=;
        b=BsBO70I1RqrhnXeNwZRsH2G7LscW9tmceTEhks8FzZSeSvxeuXqQWTuAw07qDAwuN4
         NaeQE5JBdHnb8SHszF+vRloH9oWTHtsAetdifi4Jj6jcRjUmyfGD82bDzXRvFy1bm+fK
         EVMH6W00Cj7yk/uNlrEgvAdByon0F3NgM6p5egd1MN/8OA32F32BTCVKfUnAgzCbyWf/
         3L1ky+22JRZ3Zrrn/rm9ih0gZiwwTBTTwgDPiFjODShb+pKuIMvP498HhAnM4cP1nTEX
         om8BQOz4giDCREp0OtiKmkpejMjTHGmRdFnUrAGi9EO+c34GtdnTqywnTEANUus5NDeV
         ZTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791240047; x=1791844847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IeBd/f+KYPaUD3mTxXbAK7RiokjVClr9ke91eN5DQPw=;
        b=BvPdy60s+auqXund0yuOdCJoIKV+LxKgCWFP2rY0D0Mi1db5Kq8PQrPD8KAOYtu9GU
         C9Mk00fP4+69ccFYGg8/A8tDZamZco6HH+vw47o+5iEaTk5RGHw01Hclng8fVmIg0bCw
         z3kLI6sxQYMspHKrvr2At5MLFeUPmhVyRIp9WNhexfYNMgbuCLuVJJc4ttn1tBckquKM
         C75CEosGaBwlkMid3etYPMgmkx579jSXL7llGwwmYgIQ9MDyqfLdAdlv9xyGkbbF7C48
         4jwlo7gIcGdDUobxz6jC7XIChbxYNZIdgHGzQeNZ2ZJTUakMqt8VZU+q0JGrfov3WTAj
         eC3w==
X-Forwarded-Encrypted: i=1; AKwUvBz06dw3ePLN8SLEjwWmIZ7Hcga8ru02W7OCIyAVFLZ9nqUsNh4V//i0f8dOhuR61gLXj1jCWMhnqmir@vger.kernel.org
X-Gm-Message-State: AFq9FYLGZHJp3BWfDFq8KwbcSbVP6sV8KRmGaYxAPc6mbZP+x1lW3p6N
	EDHaCQnyvwMvqtwfnRlvkQCOY4ULo1dARMnhaj0HyJMce07y7dcqiXW6
X-Gm-Gg: AYBFou1nsNTJih9BaRdeDS4VQgwU1pbFWNqP/kJS+vp9bidP2U4Vg7tAqGVEJKFep3L
	CU0pwcFqvXNs7Yo5nI1bCcEuwIdBV/znO6fJOhKIuWKwCgZ/IoJumv/VS7vDHO8e7JS4+S17inY
	xWfX54x74yi0Ouppp53bEW/7OrFdY9ER7nnpfFYBmYdlQs8ze7yQ8caDxNHQ8pj1n2vYBnqK0cl
	EuJ12Zyx4ZZbqjjpm24kFf+cVZleteEJCEfYHxKCCc1MwK5TskYLWIV1pdoz/5FkGNupydWQhMJ
	yIPTryae1Gt6jZ+LDrxOOvuPEaONgsO+L1UhfppbwWpn2n00AYvXzqHRu8sBU1MgyeGqX99F+O8
	0nSaLCmYkvB5F/GB4nfHwlnxW80UUx+mr6ZEzUKyPRX8AOlWzgZDWIyxAIwwGOPoYeoD3XgSi3Y
	GzT+24mRl+QqpT2wnCO3iDh8SjzgAR1jrTU6JJizrcl1FJP5In2l4xP2lSwQSl80YCSCejTbL/A
	PGsf40=
X-Received: by 2002:a17:90b:2886:b0:3a8:2c7e:8986 with SMTP id 98e67ed59e1d1-3a82c7e90c0mr2473707a91.17.1791240046758;
        Mon, 05 Oct 2026 15:40:46 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853e66d7fsm1496243a91.5.2026.10.05.15.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:40:46 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v10 2/2] arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
Date: Tue,  6 Oct 2026 06:40:08 +0800
Message-ID: <20261005224008.1140250-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005224008.1140250-1-coiaprant@gmail.com>
References: <20261005224008.1140250-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Ariaboard Photonicat has a Motorcomm YT8521SC Gigabit Ethernet PHY
connected to GMAC0 via XPCS SGMII.  Enable the necessary nodes to make
this port functional.

Add rockchip,sgmii-mac-sel = <0> to the already enabled combphy2,
to route the SGMII interface to GMAC0.  RK3568 has three Combo PHYs
that can carry SGMII; which one is wired to the XPCS is a board-level
choice, and Photonicat uses combphy2.

Enable the xpcs node and its port 0 sub-node, referencing combphy2
as the SerDes PHY.

Add the mdio0 node with the YT8521SC PHY at address 3, including its
reset GPIO and LED configuration.  Also add LED configuration for the
existing RGMII PHY on mdio1 for consistency.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 74 ++++++++++++++++++-
 1 file changed, 72 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 58c1052ba8ef3..fdaa4a2a4328b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3568.dtsi"
@@ -241,6 +242,7 @@ &combphy1 {
 };
 
 &combphy2 {
+	rockchip,sgmii-mac-sel = <0>;
 	status = "okay";
 };
 
@@ -260,9 +262,18 @@ &cpu3 {
 	cpu-supply = <&vdd_cpu>;
 };
 
-/* Motorcomm YT8521SC LAN port (require SGMII) */
+/* Motorcomm YT8521SC LAN port */
 &gmac0 {
-	status = "disabled";
+	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>;
+	assigned-clock-parents = <&clk_gmac0_xpcs_mii>;
+	managed = "in-band-status";
+	pcs-handle = <&xpcs_mii0>;
+	phy-handle = <&sgmii_phy>;
+	phy-mode = "sgmii";
+	phy-supply = <&vcc_3v3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_miim>;
+	status = "okay";
 };
 
 /* Motorcomm YT8521SC WAN port */
@@ -341,6 +352,36 @@ &i2s0_8ch {
 	status = "okay";
 };
 
+&mdio0 {
+	sgmii_phy: ethernet-phy@3 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x3>;
+		max-speed = <1000>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio3 RK_PC6 GPIO_ACTIVE_LOW>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_LAN;
+				default-state = "keep";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+				default-state = "keep";
+			};
+		};
+	};
+};
+
 &mdio1 {
 	rgmii_phy: ethernet-phy@3 {
 		compatible = "ethernet-phy-ieee802.3-c22";
@@ -350,6 +391,25 @@ rgmii_phy: ethernet-phy@3 {
 		reset-gpios = <&gpio4 RK_PC0 GPIO_ACTIVE_LOW>;
 		rx-internal-delay-ps = <1500>;
 		tx-internal-delay-ps = <1500>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_WAN;
+				default-state = "keep";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_WAN;
+				default-state = "keep";
+			};
+		};
 	};
 };
 
@@ -586,3 +646,13 @@ &xin32k {
 	pinctrl-names = "default";
 	pinctrl-0 = <&clk32k_out1>;
 };
+
+&xpcs {
+	phys = <&combphy2 PHY_TYPE_SGMII>;
+	phy-names = "serdes";
+	status = "okay";
+};
+
+&xpcs_mii0 {
+	status = "okay";
+};
-- 
2.47.3

