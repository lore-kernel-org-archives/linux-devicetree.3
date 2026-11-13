Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572342;
	b=f512Tm99yVYPMu4LUyi3+h39n0QpW9cjJW3UgM3Q2NUDvHPb2pXz6hDiGTp92xvXXey+
	 uYC/xNEZyjDZwPPDDR1YLid4/9QTflbMFDw+Xr9P7VtfbsEw37KRKtf1RzatBBHiWZevX
	 xmW18UKnfbmACC1+ohJY//7BGmdBAunI57Kk4cvAxho6/NKF4reFGQzdxM71c1dus4eRi
	 lP5Tb78z75SqMB9VMjkU5BLQJ9R/xenTPIMtbsoBz43KJ94QHCDe4nfONRW2JK861Je3G
	 NysL9hXYyiH7RquIuC2TqtrH9SSjasK7KiCkCYX80WnqgscthflJNSpXonb4aT174Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572342;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2m5S/wNdPReWyWmhpeHcOzCcQyN3wK0mfC0jmWIgfok=;
	b=h0n6OwOgoLS50BfKb7QVsxj2YkkQdyGx+Z0mqUGruS1XuSX0IjccT5LIOvl66u2gJLOQ
	 yzRJanr/3tAQh2j6iPgXB6+ZjCnWUsklyWMN1CxR6qEyMgvRTrhnwQeZQxpXXJ5h5n6xT
	 xuchzPcE99uaKZEke5Lm5oZw4Jgv5zBPS1yyMlkxHOpmqWNl65BMNskgHUXD7MAUoOwDL
	 oDiy3HrULEtq3vNV8vtr/M0cLnkvsZfzbAd3pE3AeghzIbSOdpTP4R5SmBg6yHLUVbOLA
	 ehRk30nz4EckTFAvnIMOR3wO1j/ttSQaZczLNhtZsEszL6A4FM7yC6ffH6lWiF3w26A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A3F60A3832
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5A3F60A3832
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so375799f8f.2
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:19:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572340; x=1795177140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2m5S/wNdPReWyWmhpeHcOzCcQyN3wK0mfC0jmWIgfok=;
        b=Eq/6hdLYC+UNDfNTgNWy7zTBbBSwjciPNQ36jMSc5rGNu8rNHAvtq8VTBUD3WjN+Up
         Sr6WObPO9O5PjaIYeP4bThyREexcs1CqaWmWiErMAwP20/YBAonu8Ze/zW9YwzVqSsY/
         g1cah0O7do0N6Dvl6Vsy78zm4Ozge3stANmHvXbltmT1VqeT3Jlqcq+9aYwwyxUbGHvZ
         eC5okf4bxe07uTgNF5hSypmkd1bWHfNd/5OSmVD13V9RT6wpj08bLcgxrR21d/Gbi14J
         U3khFNLQB40yfzTl/Dh1tvdj54Q/6okNuCCT5XdiQQIHdb8N0FLpI7mbnXrirsHX3cFz
         P57w==
X-Forwarded-Encrypted: i=1; AL+hErEUYvgeRWTy7f1mrzqAIy4Nl2CcrMFBrolaTRfB50Hn13mk/F/7qfF5pM8DVrvTqcKczFnvngaTGxbm@vger.kernel.org
X-Gm-Message-State: APuU4Z9shFczxydIoipSNK+jUglX8c/NnAboNhxk5o1Srp17re5nDbPs
	vQ0OETjiLODnQNQlzYBcv4mniC1AnwV9uUQ5O6bP1z5EahB1NStCKz0q
X-Gm-Gg: AYBFou0zYqOB0lk72H1dNGPhRWICGz01oj+LhF1GXjnK7mzOuwZtnTdYYuKQg0xFnga
	9xLIz+A32SMPyQ3mr9/gFISw/q2CjK+vTODkHOriGaG/6nDTWhkJ2nZ4GTD9yJl9o3fu4Hjy1L9
	N3lpuKMin+x1uoUK8NQJhv4DNHZpqUL4biiJ+UG33zIyKD9/WMtDI/3dg7rLvlGZcHv2xUGSc7Q
	8gYXn5WaydxoSlNWIGMqX2IO3lkiNAT4vrggYE50jJBiycNuwNc5bUrpAycdFM2QYUhCLUQIut+
	H7GT2ULRwejWMznMC1OiDVWhTeAeXlR87tJOR/DqqrZyFAEL0w1Ulekgw2lrx5IPdoJqQg6rFu/
	MuiGckzg+ntU6IYaXj2TMK9t/641eTNZcrnzwxdV4Mblejb7eVgYhLmQqtPIFwojuV76ZRezc+e
	i20TLMY0fFg0V3lzwZBP3xcCAJxSDHQJEnpA1AMdqpgPF403iJHI8V5qTBdEiOtbemkRVBdZzGn
	JBRrDJv9AOQPBzPOPfpwDZ8wIIItn+e1f+yIIlbdP1ZzpQLPE3vVfZIbHSx/9sMaC0627eiOkm4
	iXihdWoS2/mGih1+1V+6Rtbh3svoRtcEDZCltd4CXitziS4VUEJiKoPnvgAwkDg8MA7yyM06Su6
	WNKwLWKmlQjAeA1yV2PAir2eNSQ==
X-Received: by 2002:a5d:584c:0:b0:493:c0a:5087 with SMTP id ffacd0b85a97d-49c72e85557mr6076606f8f.51.1794572340085;
        Fri, 13 Nov 2026 04:19:00 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:59 -0800 (PST)
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
Subject: [PATCH v7 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Fri, 13 Nov 2026 12:18:52 +0000
Message-ID: <20261113121852.334604-8-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
References: <20261113121852.334604-1-tanure@linux.com>
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
2.56.1

