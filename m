Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0287D3A75BB
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 05:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734155; cv=none; b=AQfLjzJMRKiKULvJO3VfObznlbp+V1iLt4WWInMeEki/BM0O2v4giRnIqRvKJ2d3VTVWrcskPlNGDtnriKx/7BIkM2xrFAnzKWssR35mKJkgYiPWmVAGf3y6o00o8Xf5u/VDZ3p0n4iBLBWaIkm/lp/lufVsCfIcz3aWTeDa/m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734155; c=relaxed/simple;
	bh=gC2dTirWRvmFzKHVs4SyB39x7wyh/gb+c26PdnYQrvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LPgGilhvy8+jwZscdudW077tgw/raHpBKf5hbXdU8xZeUO5zpuUknNm1en6ZupBD8NxtRJ4UvVst/FqMSm1Yn2j5gPcdh7DdJoMmWvjtITJ6KSXDn1X66eiQN0c7RPYNeRQbd47F17TwRN4k7OQIAU8U66PpchpmFPkM+SCgQLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJhRDaH1; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJhRDaH1"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7eb6573bd52so2068234a34.3
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 22:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734153; x=1786338953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1CvTLJea6zWTpGRaWOgZzRKuhjdqcAVM/Zr8VD5aTmI=;
        b=CJhRDaH17sZ+f6WEkcNxZPkH95uufIyaLG4shHeV+yq5C6bXlvM68L7BmJXYwLlBpe
         6/0Y7ryzQmm4lvq4h5S0TEyWNtp/1GzE1c07glZ0xxUa00sh0VeM57HXQ+g+YJe7t90P
         bth6hkrfQ1N/dFyJaHFgziVlKQv7D4tDWIvSc4H47MjC+Okd0pggJ99LNkPPK6W62oqe
         ibBCUiBXObLLdzyHEwgWIxzXXY0fol+hlUmQ3Hc20Ih8139E4IUZqcxC1qrSfD1DnQy/
         VpsZbeAQdIGTuzO/2CzK9O/yRFxSbZBVtBF+raf/LAUnwSNc0tx2wWosOLXk61HTbnwc
         rxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734153; x=1786338953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1CvTLJea6zWTpGRaWOgZzRKuhjdqcAVM/Zr8VD5aTmI=;
        b=eVHM5Uei9zf5Je0gfn/kSq4S8+AtBcsbkLf8CkQG7mW3Cuwnacb6RrUEnu6c1lofJp
         WN9URdIUkXxxAtL9drzLEFY9yb9UGJoKPE/iwTemr1XY9z/gn+0seZdu9sXQQhmF4V6k
         VjChc7BOlhzYXyKu63kigcFwcSfQZoozW+gRUdr1HTnliXzZ43my1ETgFiALtnABLvh+
         ZZZYYU7hiTxFtDu0gu9ZPdPq3eO1sHR4aWMiCABWqbXxJgaTlQm2KHa/LwAgT07/oOyh
         wywfB7TJ8lM8Oz15oYOcgT+WsokJvISGgXrw5t1FatMTpGmT8Z3AMR1dxryZL2LvZ73x
         siOw==
X-Forwarded-Encrypted: i=1; AHgh+Rrshg8Gk0GFsMIYbpGdnP20kvOG16yJnQJu36sWR0w4Kk3m0GF2Zk6rutPSn2TeNMyGnihBjLK/QcuV@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu9/2W/bp8W4fxUvfinp00ZtncHZX71YDOzjsensSIOt4unQsT
	41/WsLm8+lsqIozPUpHxbGJKWXASSiza5Y9JqWYhpyAMa/wFahpwb7Tn
X-Gm-Gg: AR+sD10kCYFXc7TRDx9arHp8B/+bYnmzaReShPuDiJHKZpNs1kK0YGAzB++I0YE8vWg
	ZnUJLqq7yHOtTmes/v73Q/lxwu4/SRuVIMQpgjHYedKYmEAp/xv7dzIj4j2JH7bEXNDQDT/0NAB
	sgqvkZaG1C5jaVJf3LsDDppqErd2iz5BvZCElQ1Hmvobr+RyRppWdDlJYAXitv+jqnZZuggGFDq
	8wG872NcOcZzeymATNjkdn79Y9gKjae6znb3VyS1cf3+bTnqDiC4XuqdpcZOzkvvDtd3pKLfa/P
	nKKWHGQ/UVXA30K3Oc1ZNlPvLbYihVw7H+cY3qW0f320SF0r9oFK694pnf9nbDIlTMtPZYhgxw6
	CUcWvoUXmaCMigUQ7Re8pJnhulpw8brhPWPBycWx5kZimyBAVzs3egZiGnYUoz6lHKK7gRP4Psy
	ZEDUx37Q7+V5pIzuvJOcL84kp/ht6x7kJ656ZsE5E+nEE0bDHxFtYtGibrUGXOm1Tu3M4YGGAf5
	yhvJZ6o0FM3guPKAowgPoM0fQ7wvpIuKCoPTAAfCx/3Km4iY8rvFU67SY+iJUtHEmFK0OlZgs0V
	KkYGrezMf3+BGtUyK5fFUKoKDPCaBqhrIMqho2hLB4cWH9o4eiAKqcWviFLL6Hos48kv5xcwkLk
	y95nYeMaPwJ8Qbr+y
X-Received: by 2002:a05:6830:398d:b0:7dc:e090:68a with SMTP id 46e09a7af769-7f1969181f7mr14873339a34.0.1785734152850;
        Sun, 02 Aug 2026 22:15:52 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:30 -0600
Subject: [PATCH 20/21] arm64: dts: allwinner: h6: tanix: enable AC200 EPHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-20-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Enable the AC200 control path and RMII Ethernet link on the Tanix TX6
family, and provide the board's 3.3 V rail to the AC200 function supplies.

Route the PHY interrupt through the AC200 interrupt controller and mark
it as a wakeup source for link interrupts and magic-packet wake.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
index bb7de37c0d58..6cd75961e3cc 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi
@@ -7,9 +7,11 @@
 #include "sun50i-h6-cpu-opp.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/mfd/x-powers,ac200.h>
 
 / {
 	aliases {
+		ethernet0 = &emac;
 		serial0 = &uart0;
 	};
 
@@ -84,6 +86,22 @@ wifi_pwrseq: wifi-pwrseq {
 	};
 };
 
+&ac200 {
+	ac-ldoin-supply = <&reg_vcc3v3>;
+	ephy-vcc-supply = <&reg_vcc3v3>;
+	rtc-vcc-supply = <&reg_vcc3v3>;
+	tv-vcc-supply = <&reg_vcc3v3>;
+	status = "okay";
+};
+
+&ac200_ephy_ctl {
+	status = "okay";
+};
+
+&ac200_pwm_clk {
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&reg_vdd_cpu_gpu>;
 };
@@ -104,6 +122,14 @@ &ehci3 {
 	status = "okay";
 };
 
+&emac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ext_rmii_pins>;
+	phy-mode = "rmii";
+	phy-handle = <&ac200_ephy>;
+	status = "okay";
+};
+
 &gpu {
 	mali-supply = <&reg_vdd_cpu_gpu>;
 	status = "okay";
@@ -119,6 +145,21 @@ hdmi_out_con: endpoint {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+};
+
+&mdio {
+	ac200_ephy: ethernet-phy@1 {
+		compatible = "ethernet-phy-id0044.1400";
+		reg = <1>;
+		interrupts-extended = <&ac200 AC200_IRQ_EPHY>;
+		wakeup-source;
+		x-powers,ac200-control = <&ac200_ephy_ctl>;
+		x-powers,xmii-rx-clock-inverted;
+	};
+};
+
 &mmc0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc0_pins>;
@@ -162,6 +203,10 @@ &pio {
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
2.53.0

