Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873016;
	b=1dmPsRr5NzY2B3m5YDSYK2IJHtKIPt5akIpC2y5BVpXJHzFM6Q0CtOuSIkvsi8LJpI1B
	 0Et1fOJVI3QhfwA3aMDWLo4pk7mybjUbmdFjnSGNkJY5x1WRkMspwpLHqTs2hdEAMCnbD
	 JoDQRpduEeOMZq1MlEoCRrrxEyp50/RIMufjj9MOOitzke0gkD2lGg0fMO4GBxtqMubd0
	 FfD682McoNbvsUro37SSEp5d0IZttHkgivQVJP4JRguVBVpBEOxS9SMUW6Sy8rX2Qhd2R
	 8FEGjfjCU+VJ8nG+B0QXznI9jwcybit21TLJpUBg9SH8Ukew/Nt83P7cMy60uQCVBAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873016;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rvhYGG2+F5DLhHvBXxyAZN8hokDea2WGLIFovieWgBM=;
	b=s/24nnXazQHlMT35GemwU3P+cLGgvP4e/RZcaURUCRsuB7grTTx4V4TlCr89bBBDRQAm
	 orntT3KoYAAFLhdpTbwp3qu6F3VGchfohcUGBE01dTxBxgOtkfUfIYxAoJz1NiEoj+pgs
	 DKVOD++ELsyYdcfpEc+dXFP1tTh/h1+rg+z5JjFb/jEIuQSmhKa6oXepVnYWV/4iCohQc
	 DUo6lr320/L39gPvN8hDfkRbn4Rp/ARMrDcV5YA/iZN8ffQCNLxO6RGLzuK0tUqzk+nQh
	 BXJooiE7vyocM+IxfRn0yg0SFo3iz0Kb92u+Mcw/eLJ8RpYFTuB2PrwQesbNF5Qbd+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58AE606D81A
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E58AE606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so15362015e9.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 02:03:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873014; x=1794477814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rvhYGG2+F5DLhHvBXxyAZN8hokDea2WGLIFovieWgBM=;
        b=Itpp/YG9VvLna6Cwc3HMtZeVe42RbV7f9v5he6OLZl4trDbL4m5kB5MO6L665T6GXf
         Cp+QsNgfQmejcpeu6KGXVb5yUmAublpR3DV/dc4ut5EMddysQo4fsMXoMYhq1UMncTcK
         kvpM+IhY+kmpydXeWQNMpPO6VrAktMSwWTUcDI7Gx8Gry08eZ4kuP5uVIhbBmelBKLgD
         fISPfTJfsY0pyshBPTfz1E8dBMrUiGjdZiAiSUWg/hylAQhDX5814GfltFXxIh9fQSM0
         O1WXNPDSFO4zUaLRerbNyBLtY9m7bEhzZau4v/enh7o3GZBYCWjohC5b0cQIhnntC9XL
         x/8g==
X-Forwarded-Encrypted: i=1; AKwUvBy5iJciHCucuQZBA3A7vVpgNDFpOEotQ/65+j+h9abGj97N2rGZX9h1ohl867+oWU1lsXaEv3C/ALOP@vger.kernel.org
X-Gm-Message-State: APuU4Z81yzYguo4dU9lnf6XSZsgFGAP1NS6Btz2fuqiWvHQjwQCbyMra
	q+d+N4T3dF/K6R89gKs8yJXYC1EuVmJLpRCU3AmhSGt+B1UmERBrqrYB
X-Gm-Gg: AYBFou3ITsNSGP1T0MGp/sHTSyP6JxZ6Vd5JDp13yUSsDrdm7TSvRLhCe42IKmpp2/Q
	B22raNfwdYQbpGeJCMIyp/YmtqR8db/E4J+YxH9T/IE+4lmy6YS3RTfVOGsQ2i8rrbWXzRXJjtX
	uiXYWrl0bHrrON60oG1vvnHHsRY1W27nzfR+LDGGl85cUN0d5DtnQXaFxtNLB0enMK5QqNH3IBE
	swfBL0/gOYM3cKl1ej+gI8zxpLHAb8S9OfkF1VpmsT5/4uQ2ofhScYQnvCanHbaGzqZFBL7sap0
	KUwcCtt/3IiK8om37w/Td4AcKWYBxnxmIAFTfVNxFvGV8G/GaRLwmhR25MRFucQxaozicguok+p
	cE4m8TVteBAlpUhkrbb3uCxaf1J37aXWvMTNeFPhONHhIvR26bT+CcBIcskOOuiSP/p/s0WDr6Y
	TLgz2LFVChSnGj/k0jXCnlnJAIGFaydO8IMkmckwezz6pToUMuyNRikhycreB6ksloxOomQqOfO
	k+GsNh+/u1bOa5bmkkTc/AKtDqatOsqflpDwx5tT8QfQCBhtA6EZMolq6J82BEwyqf36fwK+9vY
	1LVW0bIXi8/vr30hrYu0IyyO0ItyX+RXdMXK/hiatJIziZPquR6TPuyQboKGLTwpMwMErUSYk0D
	IQbog0PS4cO3/Hb3pEroQWKsQgw==
X-Received: by 2002:a05:600c:3ba3:b0:4b5:2c72:651c with SMTP id 5b1f17b1804b1-4b52c7265a8mr45793945e9.5.1793873014390;
        Thu, 05 Nov 2026 02:03:34 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:33 -0800 (PST)
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
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Thu,  5 Nov 2026 10:03:22 +0000
Message-ID: <20261105100322.37816-8-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105100322.37816-1-tanure@linux.com>
References: <20261105100322.37816-1-tanure@linux.com>
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
management bus, connected to the MAC over RGMII.

Enable the controller and the management bus multiplexer, hand the
controller the ethernet pins and point it at the PHY on the external
bus. RGMII needs a delay on each of its two clocks. The board traces
add none, so the PHY adds both, which is what rgmii-id asks of it.

The PHY interrupt output is wired to GPIOH_6, so link changes are
reported instead of polled. The PHY reset is an RC network on the
board, not a SoC pin, so there is no reset line to describe.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..93327b993d39 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,28 @@ xtal: xtal-clk {
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
+	external_phy: ethernet-phy@0 {
+		/* Realtek RTL8211FD-CG */
+		reg = <0>;
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
2.56.0

