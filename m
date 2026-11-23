Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795453084;
	b=L4A5pcW3kmEeAJr45T8BSQmUrVAWEtE9LwMbJ8uRkB2k3jEjVnHuMwViblqNnmPpDHcM
	 mGTSp4VSgdOTHOYuZoJH091tgCLiMI34WQpc2Y3Z3yEbkgb5JzIJ2vu24b+CBw8QuEReG
	 PRdDEzjbfEsLLHhrM8RN5iue+xXVsU2h4jwQ5QI9xSZaKVvDZek2J7IH1Y14ThOadbMPy
	 mnVRFrNs9bQ3QyXOOSkJA1+o3AZ9f2vMiTZlQxj8q75rso7tosMnvD96OLADrVzg7MuWX
	 tq9hMrXJGTE6wrrsirLrdh7LFDQy21ZsOmC+E4whzdwscSo149E9CunOkaPhKPX5hhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1w51x/PKCtrb5fNAPvfXEuoWbCAe37FjN4HnJ6V/8YM=;
	b=0pX6fqFkIXj0F3GhLUVyZKypTVW0odCvf/3nGCfVZvcK/sZoMtTbn3scczQ7Ex33KBrW
	 9vliqs1FLd3zVQsCHWMNBy3GwgTy8gYkjEDMN2ofIu9jGAw66Wjt80YKq+AgFDu20vuzw
	 ZSmv+Lc/UaJNiFV+p5nrgEBK/sIvFEB5Z/y3vH0gWg6788ma1A3v8FH3hTvXfAlotmBo/
	 saAyay33kDEoNIDWmoXwai93sceqcIJeA/aZoUt3hcEb26jT3VHny2nJqrWShurEwN8Tm
	 rIR4MxRzQ7TolcQsnf8PjqRqAPKftw26YB8Vnth0F2suu1GdIce6NG5KKblmWeVAerw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s1e57lll;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDBF606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DDBF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s1e57lll
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-382afece6d8so653873eec.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 08:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795453084; x=1796057884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1w51x/PKCtrb5fNAPvfXEuoWbCAe37FjN4HnJ6V/8YM=;
        b=s1e57lllSYyixclFJA/1JSgfaaJfFhtyp+eK2KYdlQkFONvSq1XOQ82P6ED7m0sP13
         zgH9V2mUlwdZCtmkvuC+Ps48NGYnjO5gVBX2Krp3mcWqUNl+BMIOohwY+PUoq6ierkts
         ozPdGA2KoF2dbTE5DWkdJTtaHUkwD83TD5wz1Ft5or6zyOMD9siXR+42ucpMv1RFnNn/
         L2LMGVF3vVHoljLTTMnObXWNm2qBuHmRci/DWLbHYNKhCKpv8VdeSAVCCF6iWboPqT4Z
         TDqQJ5dpMU/06IL+xo/ne86f64r5bLeC8eP0mALrWyHBkvPEh/1JwYqslBcWjCN/rBoL
         Np3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453084; x=1796057884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1w51x/PKCtrb5fNAPvfXEuoWbCAe37FjN4HnJ6V/8YM=;
        b=wprQs2Z2Z3ydJ+6EzuNHPbT+GoFz0ezJeuraHwIUPOsEPEtoa2vY+toVKKsSkrwKPw
         Aelcon9qYNa4KAFvS0p157oOc9kgj6jCnZYeZJKavrDMnSGiGE5AWUrDpdDuDCEDPUd8
         lJ1eP+SFAxJVJUhaXNPYbl5LTRSdJnCmvtsVZ00ejC4oQDZNlhf0fbRkiQCI0+IwM/+q
         2LGx7kgb8n0WB/YEa+2UaXoSCHtnItByn2+1MwIrJQgQPUfqpLkwqLYGZeDZ/c0FqUCs
         g5KZpE2h056pwqLhkh4tfG3P8912xQAhVJOf5mKrjTjHk34aodbltvacaX/66VMXLDZo
         Jifg==
X-Forwarded-Encrypted: i=1; AL+hErHd53WM2hCNbORaha/B+FzbTDJ7dal5dblTa2OyUmaj765f1iKnhpjmA03dJhT4Q36onaeVPHf8lzRp@vger.kernel.org
X-Gm-Message-State: APuU4Z+1xgMVTvHsftpZUAT4k45k+D3779l3rQdPOYnO1oWFzuu+JpiK
	j5gTHtE3i3bO5DskLKUQzsdMdIDgM9F/HQR5qK713Z/M4KtP8p1FQx9+
X-Gm-Gg: AZFdTZe6ht4HFajBhkGKNPbj5IoOOhYv8T0PEnyVhJxJ1SrvZqRzWo1bb0Qf4SGtgqP
	5I6kOop0xhBi94vbwY2vHIYQQQMYQc4BUiju9UBP++Hf6O2v2Df9/q6gu2o8WORce3pzRctDwW5
	Lo8qyWkjRleJLnJnssQ1IL4LWx3nyWcW1TY8NM362LtP3V3FFi4xfzYm93p3yZqcCFlPGggD7xY
	cvCPeQwAitmG2zEG2nKmnOEuEy5IcdcRsGcwux/fOt9HlbxmLT9/+ftx8uc4eD/VwIpBoSxR/Sn
	O/IUCb/wuJa3CGsRFrbaNSDxt84HLwKt/l+R10oCzfkE/9noHUY73jDREoJdAsUsfQkU4wLGUN6
	vWVNe1QynJx8CWdH1i/a+IuvG4i2E3x1BeErxX4y/Lz32pLA6966EsTLnGS9f6tt1rVyFLXJWks
	PNDq3Ugy5slarwe5/Cvsmin8GXxuU8HU4aQixrF0x9/r2KXi+5BnwHgO/7VVBP7qoldHrghkzYE
	J28RAjrjp4arviZpu6rS2zUSaY96UgSwdCrTc56c4Q5GMq4pGVmALzQxb/L/GCXWqY3MgVtSzBT
	d6MVLfMolUCFi5DtG2zQ1pCGwVM9+hnDWLzaMoQZTr8oPJ3soRFMKCDZXPE=
X-Received: by 2002:a05:693c:88cd:20b0:386:a16d:1bce with SMTP id 5a478bee46e88-386a16d1cb0mr6943823eec.36.1795453083560;
        Mon, 23 Nov 2026 08:58:03 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm13315280eec.0.2026.11.23.08.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:58:03 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v13 3/3] arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
Date: Tue, 24 Nov 2026 00:57:03 +0800
Message-ID: <20261123165703.667564-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123165703.667564-1-coiaprant@gmail.com>
References: <20261123165703.667564-1-coiaprant@gmail.com>
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

The Ariaboard Photonicat connects a Motorcomm YT8521SC Gigabit Ethernet
PHY to GMAC0 through the RK3568 XPCS using an SGMII link. Enable the
required DT nodes to make this port operational.

The 125 MHz GMAC reference clock is generated internally by combphy2 and
is modelled as a board-level fixed-clock, since it is specific to this
board's SGMII wiring. Configure GMAC0 to use it as the RX/TX reference
clock.

Enable the XPCS node, route combphy2 to GMAC0 through
rockchip,sgmii-mac-sel, and reference combphy2 as the SerDes PHY.

Add the MDIO description for the YT8521SC PHY, including its reset GPIO
and LED configuration.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 55 ++++++++++++++++++-
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 3cc05f08f429..522778a36423 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -41,6 +41,13 @@ chosen: chosen {
 		stdout-path = "serial2:1500000n8";
 	};
 
+	clk_gmac0_xpcs_mii: clock-xpcs-gmac0 {
+		compatible = "fixed-clock";
+		clock-frequency = <125000000>;
+		clock-output-names = "clk_gmac0_xpcs_mii";
+		#clock-cells = <0>;
+	};
+
 	hdmi_con: hdmi-con {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -283,6 +290,7 @@ &combphy1 {
 };
 
 &combphy2 {
+	rockchip,sgmii-mac-sel = <0>;
 	status = "okay";
 };
 
@@ -302,9 +310,18 @@ &cpu3 {
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
@@ -383,6 +400,35 @@ &i2s0_8ch {
 	status = "okay";
 };
 
+&mdio0 {
+	sgmii_phy: ethernet-phy@3 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x3>;
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
@@ -653,3 +699,8 @@ &xin32k {
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

