Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792637950;
	b=UewM3s16kDnw93E2klk0OFAXIAoJGGndX5iNzOWU4co8trphDp06t1dgd5SOSJsC3qxz
	 NCTIOFu0PaCy/QoNSWl9dqdqx6SD14DNJ7zjPIKvzSsFGj1+DpLlG42NbElkaPiFhfnbV
	 MXxzB9aXfaIBPhXfpsfOBfgjHFWuEf1ABMy8sq4zj06IOrH9UZr3463V2uC9cvTp7Nf3L
	 /Kq8CU9QrgLmumB4y5mBWlifQ2Yp0/P3IL2/oJkQziAOk1OsYLS0isaNgWEkRR4V3E/1A
	 H7rKSGGHCBV5O8PlRfMjp2iF89GDBUvXz64cXpgfJBp8uXIIt/ZN6+2rmekDnkgyA6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792637950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kapioonxhfRQWTN60e84l0FnMPJ/xo6q07mXjt2TXY8=;
	b=x5e7g3dBj2sm9nhFgNy9BSMnu1fJAfdZijvdbt7KeBdoj3aUn/Za87nAoqhBjMqvQZpn
	 BYkTkzbUOOM2pF67ZzI5I936eMatlqorKQrleBaJwThbxvrPZ2iFRLxX9TgIsge29Pjnz
	 njDGGNPPNQ4po//i4BHq3KFKtEYHgwxSN5gSh6HOon5zBNCVHObygijKJu6K6OU4pW29I
	 /z+rdqOMwt29DF6yQ0Thjqn/Sq/pTvtZgi00B5/M6OnRrA/aTB/7wcrsleXe5PDLQvOQ+
	 zBxj+onMEHGC66Hvd/yfpGnCoIpup1fxvOfjM4hUAYQiOw+rWQ1iMMbMpkktU5mrpIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R1JDXXUW;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0C2606A31B
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED0C2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R1JDXXUW
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-368c26de2e0so74920eec.1
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 19:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792637949; x=1793242749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kapioonxhfRQWTN60e84l0FnMPJ/xo6q07mXjt2TXY8=;
        b=R1JDXXUWGp8xblmicfnnKaFFhfcJbI3R4dCopQMMP0zEG9uSxIYgfKPrOAVT+kCYBb
         62oAoPtoErqAdRIVyCbgEcBWv8eoc+rT1MV4V5kHybnuFUd0aLKyLvnG7y9RUCKrQ+X+
         ZBmXTK34HvtsVa2Qtz1xjVAGwLWMt8pAabX9IdXroII7yRa1H8V9eTNrUnYoWa6u+wOs
         gnEhtNNwOJfoyEJQCZdZKe++ZB8QC36C+Ap5uzXVGbJlJFOYFYOKHHWirfUswe/Fcmhr
         vCc5ZDC14UiWDJIfBI4G1O5iq4YuTWHjvXAYcSrtjSHKFZYj7p4XUSoJ7M9Iq4KV0IYi
         ZDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637949; x=1793242749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kapioonxhfRQWTN60e84l0FnMPJ/xo6q07mXjt2TXY8=;
        b=VJPvnRfwxtr5rrEVDOP7dX1Fa9VODJiLKb6sWnhmCAquV8RuNxDtNT5rYZ0JBaLk+W
         4s+SKLlRXnNA6QVxByZODnQi9KUvaCbK0p9UDI3MtshOHs4rMbIdzL7H19VIJS1POKrq
         aMBaN9q5LM5lv/tlFWSG6d9iJ5ncXzSSl1tsUMvVTPgMFIvdMipOjFwLn8kWRO7d3n5g
         Z1kuN7y75kVkr7lYyCjn9dIh2Dyryv4etfGfYsLU6YrwuNVNnnbaVU44mTiIb52Hoo6Y
         Ow2+SZBT+hqE71qza0ww3dXDPeeC+JY50Tz0UnyHnSFLw93JLW99Pi4Kvk+ooWZK/34n
         /1kg==
X-Forwarded-Encrypted: i=1; AKwUvBxVmXkSBoVScGw3EEa7LMaEd4yqdtlndmXmSjj9DORiWB44VsvBhG3CRi/zjNj5mBVVEPN38KJt8B1s@vger.kernel.org
X-Gm-Message-State: AFq9FYLQ54x97NMW+Lr4wRRLDVzyjVuZFu6Jjp5sRk14nyeYZzZta4uY
	vXZJcHtzd4b8VSNrA5uAODWhn5ZiQtNQRZtvJq9Vj7iHu2g7aOuJJMTS
X-Gm-Gg: AYBFou2dLK5gX0Bq9rLWFnrVB6KOrxlco198THBTM23NVmdN2JK3EES7eO4Auw9+sCp
	oZCfXhdnuGgOJDx+CQMcn4sSPxH9eFjeOfSbHNjIuGsJfihXKaITQrNu2j5L+pZCTu5CK1K6fjq
	HoV8ARWB0vCDwvIsdpbel20B5du8uG/nkt6bRZ+dlAXS/N2HlmZ+mr/ub5tiMFNbrYhDW7Gy9Yf
	hsHgV8CD9yPO1Vw6A384KqrA70LtRvHuRHT5PnDkpD4A3cyQ0EQhQRF9J7EwRIQxDlUPp32SFXB
	+j9XO1SRJgT/RewrDdeFN9NLvNDf+m2I/M4XWcdya8vR+F4gllpTXxwKN70UerwL4onFuWDL/BH
	9cm/2YiyXZ8PIQL3MSZK+QKxCZ0+gF4SwIP50G11iDX6uus1dzDYCmEkqX7+UAqgDOZrTjf/PSZ
	Tlr2Tl3hEt3lYJ5zuIK/vJ9BOfqkF0+afJRET/SK+965nba+SWgQndsGjDQ26EJWCSg/IiiZXCY
	FP9sJzyShpBVu6/yBakgiXWRVfIo7n+S+LthEQ8e5WiGgPsVLhuMgw=
X-Received: by 2002:a05:7023:a8b:b0:185:fd0c:4585 with SMTP id a92af1059eb24-190a67f9f08mr5252274c88.33.1792637948939;
        Wed, 21 Oct 2026 19:59:08 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm13029572eec.12.2026.10.21.19.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:59:08 -0700 (PDT)
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
Subject: [PATCH v11 3/3] arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
Date: Thu, 22 Oct 2026 10:58:44 +0800
Message-ID: <20261022025844.150320-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022025844.150320-1-coiaprant@gmail.com>
References: <20261022025844.150320-1-coiaprant@gmail.com>
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

The Ariaboard Photonicat has a Motorcomm YT8521SC Gigabit Ethernet PHY
connected to GMAC0 via XPCS SGMII.  Enable the necessary nodes to make
this port functional.

Enable the xpcs node, referencing combphy2 as the SerDes PHY.

The rockchip,sgmii-mac-sel property on combphy2 is not set here.  The
property is tri-state: when absent, the driver leaves the routing
unchanged.  If the bootloader has already routed combphy2 SGMII to
GMAC0, the link works without the explicit property.  A follow-up will
add rockchip,sgmii-mac-sel = <0> once the PHY binding lands in
linux-next, removing the dependency on the bootloader default.

RK3568 has three Combo PHYs that can carry SGMII; which one is wired
to the XPCS is a board-level choice, and Photonicat uses combphy2.

Add the mdio0 node with the YT8521SC PHY at address 3, including its
reset GPIO and LED configuration.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 48 ++++++++++++++++++-
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 12ae9159bea87..d9015dbfb9f5c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -261,9 +261,18 @@ &cpu3 {
 	cpu-supply = <&vdd_cpu>;
 };
 
-/* Motorcomm YT8521SC LAN port (require SGMII) */
+/* Motorcomm YT8521SC LAN port */
 &gmac0 {
-	status = "disabled";
+	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>;
+	assigned-clock-parents = <&clk_gmac0_xpcs_mii>;
+	managed = "in-band-status";
+	pcs-handle = <&xpcs>;
+	phy-handle = <&sgmii_phy>;
+	phy-mode = "sgmii";
+	phy-supply = <&vcc_3v3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_miim>;
+	status = "okay";
 };
 
 /* Motorcomm YT8521SC WAN port */
@@ -342,6 +351,36 @@ &i2s0_8ch {
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
@@ -606,3 +645,8 @@ &xin32k {
 	pinctrl-names = "default";
 	pinctrl-0 = <&clk32k_out1>;
 };
+
+&xpcs {
+	phys = <&combphy2 PHY_TYPE_SGMII>;
+	status = "okay";
+};
-- 
2.47.3

