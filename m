Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD6344E65B
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 14:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791124863; cv=none; b=tlP4qvk8hK/e1tQ/3cN8OC4Gqp4JmTEtNPlOYJ1HQUIVSvci0Vo5Z9rRKJvUWZkvdrg34cTPRHs/rXogVEKnbXfI3YGa/iqVZrp+g+deq2gwvdfbKG58p+zTuOT5wn8EP5cA2fJ7qxmrUKpbFMFu0gkhZXLsJWEFt3BZC9KeQqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791124863; c=relaxed/simple;
	bh=rfMiWkHylBhX+ovpNY9ZQwJAEKZBaJQqTQ0QXxjiBH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=blsRmwgfvKtZ/Psx9Iz9Na/Pvmb6LHM5WzN4yN9sAnFmh28O6bMdiC7RgzxDAQcuHpwfXGspQBRaJT7vrR2tTPEQsUPN4M3fJBf2B6Sx//treAFxKdGkOaSoRDBB0Ol40d3BYIEYW/KJNY48FH1JGayZvG9tyr/uKtBCJ89rNUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so3639125e9.1
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 07:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124855; x=1791729655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GPOuNv0irDtQ/vuxlu7cI6Ij9jweTS2TW7/WIglbMeA=;
        b=SJmuDL+Agee1VFZFq1SlyQ6GLlGAwmybIoOYvh3kFhyZtPA6iz+vtAfI9bauwxlhkn
         q47p3FnXzvaqGiwhxtgJmq3lz/2b3z8/RYWtk0zzbOipEV9dpEEXFZDQBwob/JmoqsYX
         CxiVUyOPw8Z1gFBsabkDqKWCnxMcCr89KW23XkX7qJ2PqDWOP9ZWZx4Q2BQ6gxDN8DIl
         SYpYWk5qjjQ2z79PfECi0cUfj0gTiPSaof3+iqlmwCPUhB3TzkgeAHdHNwd2WHG7MBmh
         NR5lSX/TuBA+7j1bz60SSX9Nr8Zo+I4GM13GxjmDWf/bi9ywIJ7o580PVMvvzT3ioJYU
         tl9g==
X-Forwarded-Encrypted: i=1; AKwUvBw/inP503KSn7xwKsV6YVlVsODqPlv2B1c0EZoZWJnVsMLdWT+POw4zPE4zFJQu7tkA5PITo39cKL1H@vger.kernel.org
X-Gm-Message-State: AFuF++k2NSEWOk8KStnxtpXSxoGITgAgx6U2H9uYWnJYndTf0iLFUHkT
	UlK8IxJeU2g6fq4BZyiaHXxIkS78KMRoSN6t4oHcnXUZwCpLCc0pbvkZ
X-Gm-Gg: AYBFou1o/T6YG0+UBKEbFBoMxm5gmiM5tnHf0G8pL5w9uNb/00r991KLsYm8yVrDVY7
	L+qIOp7ASBoilrZgtZsXbYtwqdqMkY4YMyxRIvoMZl8N/Qab3X6lX12H07uKpuZBUCcg+fj3oye
	03U33OQRJpQN3oAL5uEidVLmlda61GgnfhsqAdNq62SEtFAhUoHJ3bVA7a8BV7pQyeX5YM1Y046
	eWEkl8fOqlz9At8ADpPfNnjPPmLzgbGoyEsQkVY3EPRwDFyFK0GBGGAw0C/HyMebtPrPil+6Ma7
	Q+z5orgSbA4D9jWVMZMe2GT1hcBPK6JvSS8EQYF7a7AmhCm4FhUMb6VtuTqrmkwZzohovFaEUef
	9ddbkJeUqI7vN+jH9TImVyqxWNM2Ago2AQRcfYaWuhNl6oB0kf1oGi0dhn+LoKbl1fsxmR3MPkd
	jZLa4CQSGpKth1UwFH7v6KQ4N+RhXNICx77C0LxLx2myufBY21/AOomosDJsCq2XXICnDh3yPbr
	TI0xc8+1kS98F4Fhu93V5m9RK+Pe5EPCQ==
X-Received: by 2002:a05:600c:530e:b0:49e:63cc:6324 with SMTP id 5b1f17b1804b1-4a027534c46mr153735405e9.6.1791124855450;
        Sun, 04 Oct 2026 07:40:55 -0700 (PDT)
Received: from threads.localdomain ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027740a2fsm298907685e9.13.2026.10.04.07.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:40:54 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
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
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 6/6] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Sun,  4 Oct 2026 15:40:46 +0100
Message-ID: <20261004144046.391444-7-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004144046.391444-1-tanure@linux.com>
References: <20261004144046.391444-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The board carries a Realtek RTL8211F gigabit PHY on the external
management bus, connected to the MAC over RGMII.

Enable the controller, hand it the ethernet pins and point it at the
PHY. The clock delays RGMII needs are supplied by the MAC rather than
the PHY: 2ns on transmit and 2000ps on receive, the values the vendor
kernel programs.

The PHY interrupt output is wired to GPIOH_6, so describe it and let
link changes be reported instead of polled. The PHY reset pin is driven
by an RC network on the board, not by the SoC, so there is no reset line
to describe.

Tested at 930Mbit/s sustained receive over a minute, with no MAC error
counters moving in either direction.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..5d0365ddde72 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,33 @@ xtal: xtal-clk {
 	};
 };
 
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
+	pinctrl-names = "default";
+
+	/*
+	 * The RGMII clock delays are added by the MAC, so the PHY is
+	 * asked for the mode that adds none.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&external_phy>;
+	amlogic,tx-delay-ns = <2>;
+	rx-internal-delay-ps = <2000>;
+};
+
+&ext_mdio {
+	external_phy: ethernet-phy@0 {
+		/* Realtek RTL8211FD-CG */
+		reg = <0>;
+		max-speed = <1000>;
+
+		interrupt-parent = <&gpio_intc>;
+		/* RGMII_INT on GPIOH_6 */
+		interrupts = <154 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &i2c_m_ao_a {
 	status = "okay";
 	pinctrl-0 = <&i2c0_ao_d_pins>;
-- 
2.56.0

