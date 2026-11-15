Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762717;
	b=YVAYX4aXDdTP9B/bpfIdPsEjZehNmZ5fTpTdpXaxkbSMNtiuQEuMv4ISP917K6Ch0Qop
	 9dNtJRZYxJ5wmsWCUhXzFjXuwLw0zQeUJKJog0X1yMDEkBxGxLWZVxdeopL0+ZEiTKzba
	 C4Kj0S61BJ788IuiO7ihBO81wNccDhc0MJNLq9O7zn5QK3Cd7lQWjJVv7q0IjqtH9O0Rk
	 HCC6Xp608k/i3Iq44MPW3pTMt3cF7CtSVjWf7JGqJqFeoaCVRD0lYHxxbUqoT34QKDzTs
	 ygPu3aftcgZJ7R4VWVU/EUGM4B+0A5tHV5GYJZG6/G2ZLhrCarJWJdvbdaAFGFwXgrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I8oI0tJ5P964EKpbze+zNelHoKVoVfC9/uaM3xB8TdE=;
	b=TKYeRqXJQ6yGx/LiU6s7AlC786URMUcbT2EgIGlx8OeA8UxS7D96Se2QPcIhg7vjur3H
	 C0p4MNVArQHDopXFeArryc50eww9pASBo8rgWCVCe7vnumubNdr/8Wgbr0x8vpdjpIT6X
	 z6MTVZwL5YUu6ItZ/x2QOH/ixlGwMPWTSCMgTSJ9r1V0J621ZQw58OfUCvWEDOPP+YS4l
	 2BUZ+qmFc02Ag9Nsey1WksK3UrRQsJ2vWcwyNv1dm2EE+Giuk2dzno0LfsP5qjnMCcIy+
	 PXoH+3hXCMo9J76zqkq9uBLsK/eBX0jl1Kl+inSxl/vPI0fueSdsuoZ/O7NzSsFBMNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iLu/u/Oc";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E609F60A2617
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 17:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E609F60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iLu/u/Oc
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so26560365e9.1
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762715; x=1795367515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I8oI0tJ5P964EKpbze+zNelHoKVoVfC9/uaM3xB8TdE=;
        b=iLu/u/Ocdy7uhlfbDWXL+IB3I0snvaovLpYg0pTcJm/H7IaRQaGPQlfsZvTkHjsJP+
         lVudbYO1rHvTY2zeJi/A6MLyFhOmlLfXcu0Guk5vVeVtCwgScZprwqbpxTlT9rYcdief
         bw0Vu4EqsTaSktrDyTOq0oIynr14snJ/z/1lfWkgncDcUIVf54rp+fLcWOOeuyMQmOaL
         hX+fB+ODF49UDWlRNm8o4JBumiXHSEXrozbdwbjQHnDMdgO/pbetdkwIzvJdqeFmqen1
         InjtYSd4kRof+leQY/F18TrIrC9Hrl7NaqJCVChrYKPOWLcDwwK1FuQj+8ZediI3LUfM
         DAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762715; x=1795367515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I8oI0tJ5P964EKpbze+zNelHoKVoVfC9/uaM3xB8TdE=;
        b=No6z2KFT8EapSFhN+3FmfR0MLTcMzxpL0TqRlcLz+tfNqx4belFLJpLaqO7czp8ZQb
         231qgK+X+E4FNuylZimp+8TLdrWnexlO434CypzeWfYhAEMfShyBmUInV/RTqChVn6GB
         FeV8+ZrPbztzZhNRTob/BtUERIf66NY8bViSjxWCpUlvprF7cj1u3HD2SW618EN6Zi0V
         PdPrNdxGysC+fvQzRb+rcq3104RL/chws8sVP1jpmPFyR2N3ETMqc9sG5TLpyvvZ+p6O
         UuaY8v2lAmyxLvnomv8i6691FzlQ+4hp5GJ66+ImwdJacbJp4wWGCOX9qYv/ilamb4o0
         9Z/g==
X-Forwarded-Encrypted: i=1; AL+hErEkFlg6sezkeSkcrOM2GZyDenUg8z4pNVNZw3y7CLyYgllp563k1yhPafVjy80EOAiEoNLbfw8YBmsP@vger.kernel.org
X-Gm-Message-State: APuU4Z++YBZWfgdrnyKF6AEWiDfpNV4/03Zr3yXFtC/IU2wt+BXN49AX
	pn1cN8zynff4faiVgahE5TtVBUvbYrS6i6PNk61C6/uO+y8POk9xuXJP
X-Gm-Gg: AYBFou3G8/smJo2s64eaI3nNIeq4A5SKDLIKApFhHDwjFQeahm3np/0phXFwwAJicaY
	nyi+P8oXVaq+c9d3Ck0IKDwwBicnkF+1YCauMQ4jgr0TRG6YFSh09lRbXw27dT8oMQ02WIsDokW
	psgnggDjTrwUbWBrI4FkdYauin2PhHyphO1hIPLh0idkCUe7iiouQbpwjhORKPCe0OTlYZYk0YG
	my3Gx7x4H8WI4AksiovTcC1/eHAhDPyYltoeIzp28O/4PQ5NlCn69pNpdyw267SltPzpXycCisz
	NFXZ5GNnLuXXHcFp33goLfSzqj7TmPIk65Pidd41Zw0ZymSz6LLXIIIcZ6P4m3K/+3BONyIY6OL
	kKI4Zd49ZctFSjp9gLBM74z/Jyp/p8TeFysm2D3saYKvhAUvHTWZ94M5mo0aJaiyLz8syTOpGvF
	4T3nP3NVF/hxIpuSuCJ7XlOJ3aoYow5y9/gbvRDwVi6lhA5H6LQyIGrIiIE++y5hcfahUIKyTNu
	wotlCjhXVSPp5v8/iZTiRPQG/BauFXbt6dubbvFX7sXx6E+mUgKkXiuF/ThP9dLbcugOJ7e4bFl
	6dMHLZ9x2sDwx88Squo37rx7N4kYGz7//TeD0nrXHLiyPWMaR11Gmj6Vz3ePWiE4v7oPq7q+qfk
	kka1jmR9GXcup7GL2pRQuEKD3rll6hsIVXVzzXRH4rNHmPRwNb+Bgm4giAJWknw4TfA7tDiGqQE
	y9JS6sQIv/jxJ7wzKJW9dEIMpOXiLRspWKdtbWJmBr3lKY1vCaB2O+HYOKfK4zjG6eu+hcgV7UD
	gXQv04anYx2/w==
X-Received: by 2002:a05:600c:8b38:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4bb55a7b45bmr192615255e9.10.1794762715336;
        Sun, 15 Nov 2026 09:11:55 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm501415845e9.1.2026.11.15.09.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:11:54 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	James Hilliard <james.hilliard1@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 2/2] arm64: dts: allwinner: tanix: Enable Ethernet
Date: Sun, 15 Nov 2026 18:11:48 +0100
Message-ID: <20261115171148.37784-3-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115171148.37784-1-jernej.skrabec@gmail.com>
References: <20261115171148.37784-1-jernej.skrabec@gmail.com>
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

The Tanix TX6 and TX6 mini have a 100 Mbit Ethernet port connected to
the PHY in the AC200 companion chip that is co-packaged with the H6.

Enable the PWM controller and the pwm-clock it drives as the AC200
reference clock, enable the I2C bus to the AC200, and describe the
AC200 Ethernet PHY package on the EMAC MDIO bus, so that the EMAC can
use it over RMII.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../boot/dts/allwinner/sun50i-h6-tanix.dtsi   | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
index f08077175549..d101001b6f70 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
@@ -11,6 +11,7 @@
 
 / {
 	aliases {
+		ethernet0 = &emac;
 		serial0 = &uart0;
 	};
 
@@ -85,6 +86,10 @@ wifi_pwrseq: wifi-pwrseq {
 	};
 };
 
+&ac200_clk {
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&reg_vdd_cpu_gpu>;
 };
@@ -105,6 +110,14 @@ &ehci3 {
 	status = "okay";
 };
 
+&emac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&rmii_pins>;
+	phy-mode = "rmii";
+	phy-handle = <&ac200_ephy>;
+	status = "okay";
+};
+
 &gpu {
 	mali-supply = <&reg_vdd_cpu_gpu>;
 	status = "okay";
@@ -120,6 +133,29 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+};
+
+&mdio {
+	ethernet-phy-package@1 {
+		compatible = "x-powers,ac200-ephy-package";
+		reg = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		vcc-supply = <&reg_vcc3v3>;
+		nvmem-cells = <&ephy_calibration>;
+		nvmem-cell-names = "configuration";
+		x-powers,ac200 = <&ac200>;
+		x-powers,xmii-rx-clock-inverted;
+
+		ac200_ephy: ethernet-phy@1 {
+			compatible = "ethernet-phy-id0044.1400";
+			reg = <1>;
+		};
+	};
+};
+
 &mmc0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc0_pins>;
@@ -163,6 +199,10 @@ &pio {
 	vcc-pg-supply = <&reg_vcc1v8>;
 };
 
+&pwm {
+	status = "okay";
+};
+
 &r_ir {
 	status = "okay";
 };
-- 
2.43.0

