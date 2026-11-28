Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850179;
	b=HmU17XVehUJi/D4ByefQljKHdBhdJ+AB/vPP09ouX1xougGL63o/gQh3zzwDF2o6nr6K
	 tiDrC/xo2lmdeH7bVPU8BKazHBBgdngOFa6dbmKXtWPhbm20HKJuXygXad+t6Lm6Crysc
	 PRYUBac8efFte3kYoco4O12rZ/MaGB7GyNJMNN0Uus9R8Tkbuhjd4Ws4B6qBfIZm1qQpA
	 0/17Fj5j1S/Dy4eTN3b2nwJxGKb+cM10A59wpwDPXYkWDhV+2tjHZ2dR6yMwjiFUM7rB6
	 MnetO+IKgz+iUVQHqm1t0qkTuOGZACX70wJiAuGn+xDu7430glpHFSL4LDSGvviciqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850179;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2vhAuAVpa8bLQKhZqhfpCnxxLm6mtOuKgnkVHvsFWxs=;
	b=IAIFQgQi9hpw7QdeGdMmRAU6tNTibJcnVoizmXZZMt4NFww3ryey0tXNPNCU8p5xFqbS
	 9Lw9oUvToaluk5yqWkbyexf1x3gZoX+l+O83mPBuCsBDI+qr+IORF2JVHRDGxKzvAnoBc
	 D9ZtOO377RLeMdoLq8s20wrhgm4jVoHWJC0XUpNiu5SK8Wjw/2VALUgp2A2zp7HEBbur0
	 Y4oN4+OwqwUR7dl2zNuSSNy3qIEikh65b9s57fR3lESy9k61X27viXVO2bl9qbWbtTtWD
	 MBEyuv88cFUEih+qBHO9a+fGwnzmQEz1Wu7ZntPWIE85BBcUpHkRkvqSGfbYYLB6HYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6C9606A6B3
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 07:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F6C9606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so90028635e9.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 23:16:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795850177; x=1796454977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vhAuAVpa8bLQKhZqhfpCnxxLm6mtOuKgnkVHvsFWxs=;
        b=O7bS3cOUvZr++fKyGxm205gmfpGysjGdBQDMzxinaJTBh4BqLcne6B1ObIcIZOuyG+
         /CcVeqy9OIpxn/uwbTC1mAEPOO9UMsQ7ALdO5LHAspGLc9vU0OX5DC/S1CA6GF4dKRIo
         qC0EacGlMTfeYOzJtcyMExGMwQyd4JAc5MAYBoBGlsdzg9T3paoBhDzXnQLNCYiKx+pD
         r1837Zc91tHmXM0gA6OibAdNgRrFK/UFElwu5yqqS10sMrfSweKTGyI3kDJfi/MUJsDM
         rVXoDgDQch0sHTgqW6SjU5PSaXhyL02rKrjS4/AtfhMtUO1PjtR9sg8A5GolaImlADeh
         vr+w==
X-Forwarded-Encrypted: i=1; AL+hErE50WOYms5Tx6hi3cL2Wgob4v6skWyPxy2TCBye80HxBJMWdT8SJprFjCjjaxoziUfDFPqsn0shIHMW@vger.kernel.org
X-Gm-Message-State: APuU4Z9CZvhRLaAulm8wvB2ukMLMlkZbj0gBGou5cZO6t2a5sPgM9taA
	zOntCAee10bWfjFaC/sPtbOmeo8af8APOt8WQxCxrrzSUCiDJvNf/Cfo
X-Gm-Gg: AZFdTZcKVo+0K9R4yiDAMRjG47CZX9Cvqc/Mi9bdHYNJuOwgt2VlO3FdJR4VjqPPz3k
	4/NhJBzXiJz4/YypaaEsZgAPGbfVtCbCXQFsEw4+DDcJRbXdw0bbou9iLy3eRMaLsIt8BfNTAPU
	cWZ3Mj4MZbkImAOlNCfwwWm12TG+YGNrU4ATtmmIdLaVsnTvW2FZiEi6y1fsYF/gpBL3Qvj7Aak
	PgHMj70i0KbQO5Eo9Fep6ty2MiDHEQV6vEjQ6ozSmgF474xgqkpYiNlEj3KxYG5irytbjnCG7Zs
	2dnjoZNnbQ0H8CtS/rl/94q8rTufKS9QoLatEGeHKJL6lIGl5W3qUURtJsYa+Ugd7vFm17kX6xN
	YtTfnN7zsKL5XR1mvDCZ4mvFRwURGiBQOu3pPZ9CuFjGcvkOzkuD01scS/0aPwzouCZBWt21g/V
	fXsdO+9rI3/0nMikUYHGyeT2b1m3ge3cMLatAJcxFD0EonCCE2j+CMuiqboYNU8zXRjIOPOvBCP
	hahrfsIJyDTFGNJU0Lsd1oun8J2Lsx7sj+zbwUoNMluUQwZRC2kfHJWVKLwrpdg8qCayOblVoNs
	l/rJo91gzkIo12SGHABrg+JQq6GLzDZrhl88g2SeFA7WuMG4FMkiRh0FhvBM+9Msznq6ycBfxFt
	nO11ZXO5idZ+Sv/y0hSGjeh0=
X-Received: by 2002:a05:600c:3b9e:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4bb88820687mr615051875e9.29.1795850176695;
        Fri, 27 Nov 2026 23:16:16 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm729509045e9.15.2026.11.27.23.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:16:15 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Igor Velkov <iav@iav.lv>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 4/4] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Sat, 28 Nov 2026 07:16:10 +0000
Message-ID: <20261128071610.27855-5-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128071610.27855-1-tanure@linux.com>
References: <20261128071610.27855-1-tanure@linux.com>
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

The board carries a Realtek RTL8211F gigabit PHY on the external
management bus, connected to the MAC over RGMII. Its address pins
strap it to 1; it also answers on 0, the RTL8211F broadcast address,
so the vendor tree lists 0.

Enable the controller and the management bus multiplexer, hand the
controller the ethernet pins and point it at the PHY. RGMII needs a
delay on each of its two clocks. The board traces add none, so the PHY
adds both, which is what rgmii-id asks of it.

The PHY interrupt is on GPIOH_6, so link changes are reported, not
polled. The reset is an RC network on the board, not a SoC pin: no
reset line.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..7b86ab2579aa 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,28 @@
 	};
 };
 
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
+	pinctrl-names = "default";
+	phy-mode = "rgmii-id";
+	phy-handle = <&external_phy>;
+};
+
+&eth_phy {
+	status = "okay";
+};
+
+&ext_mdio {
+	external_phy: ethernet-phy@1 {
+		/* Realtek RTL8211FD-CG */
+		reg = <1>;
+
+		interrupt-parent = <&gpio_intc>;
+		interrupts = <GPIOH_6 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &i2c_m_ao_a {
 	status = "okay";
 	pinctrl-0 = <&i2c0_ao_d_pins>;
-- 
2.56.1

