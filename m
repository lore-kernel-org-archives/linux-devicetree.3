Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296673;
	b=WtgWkfm1abcxksGzdBIhPZNWlQZ6hxmr6CYGqye8EkmhbvXv5xUiJw8CL9BQoMua3vmH
	 MLwWppSY3gOcO4Rr/+l59whjf1YwHFumlX0s10HiES7xQZpILN1jXkMa60fqJMyEK9JIV
	 WAGxuBb90SK7H4o3WOrsyOVflmJw50Rm16n01F0jdmbEABCdRne0m0iXUQ5rHqNOlkhV7
	 K+0RMabRDnPU/Q/uFn9YdssS3jO2MOm9jenKvlq8R2l3zBNZvROG1wQWWqeF4mNJhci9A
	 tiifuKoOH7m9ZAakwoZc6Tm6winsyf/q1Sz/o3gz3AxuJXw4l0966Y0RPGElDMSVZNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296673;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2vhAuAVpa8bLQKhZqhfpCnxxLm6mtOuKgnkVHvsFWxs=;
	b=zh3Vev03kge+1nM1ttL526nm7xqLzyIrzXreW/6ENLSAI0y1aNnGSXlvxcIcoQVsCDje
	 pFbJDx7zXEVoMeQS6syzL2uTqkzeZU3YtAITUKd51Yddcf7+zPJrrsx0EgCk8+ZGUMsp3
	 t86JG+DZ5iKZTn/vDFTnawzeCPk2e+xNadJDk74MbkK8OKZpjd093GUqz9tMFz9ANhVQh
	 iECIWuWm4SSzM6wnJihqY1xDgVHTxe4TmGtqYiwqUqKeRLERaM3q66xW+EQcdX6J3Ay8W
	 rUqGnTSKxnUd6CTK39dm3CMuNc0HH2gqRZ47C/MQ2EHHdFhHol/rWvAbxBnT3R9yKwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E126C606A6AF
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 21:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E126C606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-49465892f7bso1561100f8f.1
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 13:31:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296671; x=1795901471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vhAuAVpa8bLQKhZqhfpCnxxLm6mtOuKgnkVHvsFWxs=;
        b=Z8x6e6t2qElbXNSqUiZFrraEzqcjTdRaMfHC4dI1CaptSYrlYfh+vZ4iGPrIHU2CKU
         jfX9XwiXHRosHy4AvHFARLvkWPn2y3n0sUWsVeY1SKAO7TwrwDmWq+eyzIXK5/E2s/u8
         HdIy3ignkOMGBREoprOmwY8CwdgKIIbAEgSIaKx8LyGXfKQBEtsubPR/RxrzAw8hGNcY
         Ekp0jmQZpvceUyvVgEEHbr4HaRk2xCYfKHC3TOjDB3hU1tvjEDjlsJiFG9DYx9f5L4Yw
         GsE7hdxZg5fHWLG0SRr/Z9/NNv5y86UsfWyHE8bInYIv+7/9I5uA/enTjAU13wb5kqlS
         5nxQ==
X-Forwarded-Encrypted: i=1; AL+hErFAOen9ztc9hK9hCwD2J4ACFXurhwxfM86hR7BxKzHWLlUl3YZPrVtXDaT46EZBVVyqq6B4gy4OzIUs@vger.kernel.org
X-Gm-Message-State: APuU4Z8mXwzOJRMWZw/+FuGxxVAONeCN9JUHZIjO15nYjvP2wQvLOl2M
	WuQ9OAGj8n1TVIGAthbBitrNpYs5x3PPG7jqXc5i+yY/oJe7WwczAaVg
X-Gm-Gg: AZFdTZcN+/t5l5FhTUbqlb/m6QC3OxIvhWKmlCh4JDgKicZXuNx189GzoC7ndd43nv0
	lMw+TquA21bqBJdeClYcXaxi37H+Cf0PLJ6dJe3kzB3v+muQJ92xmebEQcNycfFg5QW6xdxUzxl
	yBpbdKvKIWxNHPNupjc+0m78N3hSLPtRBwVs993sr2ctDRDsNeEg4YMvK7TVyz8Dnvf6r15nERw
	Y+uWsERLkM6WIb68iC6RMPiSLgotNSJGMrdB+kvnLtAp18JRl9b3TVkakTmweNZ05lZ+wdEUhak
	HnlEMwYqsV97vJYAzZTNfW8yk+3k8UTTqua/t0f8j0XGXNWORZws6BXeNb1cA7Qqo6xyRrJHTFs
	4bGcTtb5FMk21NbFwj6kDJxJHWEOdmOwKcRFo+QA/oXYDJy3fg+YPm+0R0LOSPdjP2lEcK6xncT
	J3G4t4rNTqafTykahWJ/VauXqmpTn3HDUYbwjq0Fl/tXRPv0kP/cOHXktIrYoArWhT/LTBDx7ZY
	vukbGMWjhpFS5bu2B+IWqNqhYUDR1vEgh4fBpTZhZlz05o6EMztlHMw8ixjYegqvuQFowzvhrga
	VevtpUoWLsN/irUClQHPpURTyJVTOIHVNehOUX77V0YwBwofpLfE4K8zAZ6aQ/W/I/cn9q5gkSr
	qYLXvKmL3NnmlVgin9Pborm0=
X-Received: by 2002:a05:6000:4617:b0:487:27f9:840 with SMTP id ffacd0b85a97d-4abb59e2898mr14146074f8f.53.1795296671234;
        Sat, 21 Nov 2026 13:31:11 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm12445954f8f.26.2026.11.21.13.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:31:10 -0800 (PST)
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
Subject: [PATCH v8 4/4] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Sat, 21 Nov 2026 21:31:02 +0000
Message-ID: <20261121213102.143130-5-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121213102.143130-1-tanure@linux.com>
References: <20261121213102.143130-1-tanure@linux.com>
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

