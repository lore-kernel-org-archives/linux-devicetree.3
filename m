Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699615;
	b=1BzRA3IAnvjcOGsyUUuIGeF13q0huoYtF4VXNBx7HCl4KsAXgIy3d+GicKUMLZvMaUO8
	 JMoZC08qogPRDQVQ4B0LyKyy69qbDR5wB7O3yDQvOHyjWZ1O+BERUx1BzYmcmiTpf44Gp
	 U2ceNcxTkuJwEGY6H5/sAbIgGCFusDgvdxX7h9WqWBk2XuslAcI1JqypMzDo55w/cI1vO
	 t24v2uBXR+OpOIlPlVXAwbTM8rCXiQzq2svzH4worueQygd/6H1LmQ2lVzzEby1zuGdzZ
	 5UiGvrYZMQy8jGDHIShA6mLmsccneNHBwrbAqjPctH/JP733Zi2oa1ELkutXc+aIQsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699615;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=B88mpadYYWmyEssRGoyIfGe+/tgPvAtSdH5NBRIaaYg=;
	b=w9SpqltpPr3eq6pilMuPgZSI5f9TPvVSf9/2pnJNHlqTfDd1gMpeAxopNEq8zk8/XyCt
	 Fp9+F5OSf6RKb2DDl27XC7+c00hxVk/aRrFlIYcnnMgCmG81CFvlTSdSW2KcM7CrDGYpr
	 VvOZ+0cWjQvcAF0zIlHLO7LKkzeWhIcX4FzwWsG4Z/03OcFyfH6Gr+uPCQr91DOOv142+
	 OarurUiwCbkIDL/EZ9YLfyU0+AMwj6aU7INlo0chfEp9QCqm0MS7L1dYYQf6AtD0/eo8F
	 E1fAONSTobjUOQDnJHQFOGUZObChBZLOsglRogEk6A8RY0ZEjLt9a1ADb6HOfY7nPAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A6360A3839
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 20:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06A6360A3839
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso8424485e9.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699613; x=1793304413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B88mpadYYWmyEssRGoyIfGe+/tgPvAtSdH5NBRIaaYg=;
        b=EuteBoHjjxvVO7uwmarWt3OfasD6tsxKoraAkAUmcu71WNOQRXv2W7cSJisjjR3At9
         beO271SA5jmPnga9gn3EpvzFysZrBrYgj7LNg1IaP/4ne8mpbHfWZGzpmd+4tUlGu/df
         Vfk+BcsRrfxcfu7FsweOKh0p6CbnvCz6RHRM8PQwz1Zs9oV8l7ltQ2lbDaLnNsRAoPIx
         CWPeqZ3jFR3YM+JtLercZAXJw+Jlkf9SfxYqk1qFIkDCRFbw2G0ZUBcwHtULT1/CeUiR
         D5+5brAuiOmtFa+0loxd5fEyemttqSyPB/KlV1BlWjNBVVD5an9DSVigYSvvHVq64pd+
         ripw==
X-Forwarded-Encrypted: i=1; AKwUvBzPe/tisuzKAZnBcGdU9q22QGujDT/xqPSmu//ojHo1300525Bdu2qFHgGaqheuC5F6r12PkgpUBr+M@vger.kernel.org
X-Gm-Message-State: AFq9FYIN9Emiy8rysfyy+CwXi78OvLPAGRtBqIOuZ1EQbguUWwyNLn3F
	xPMWWIIENsdKuv0CiK5JezYkDEpzKTYv9cGH1p77S5obQ+cZwQESXig3
X-Gm-Gg: AYBFou1zvgNEMZuYtaIxlt/+qL3pT8jiCbJNlPYN+WryhyvED+MwVPvmreIw2juXquY
	Abv2+EJsz2pxXx2r3fTIDLqpdPYdtNoSbIsrD3czMS6vlT44mGgBsqipD4IR0UuTywGuhJAIrLd
	X49pkyoZF/LuW5MCL1EKIlwqHOhBtVf94Ba9nFkHyIl15deHM6a8rW6lWpFbNp4GAGnn0KD0PGT
	Hd3d9CmKIvwtd2fPaqegjyTcvN9cjKTrIVC7xS3Iqja9mXxVIlRON0sx9WTXqBPkelQV+AMw8Lz
	+swbI3507xmIDMV6NFe/YDCCd5LwzIkdRdXvBkVyN+2iY6faTeGdTjKdV2XMrt29X30FeFqhptw
	TUyk09CvFzxDVt72FY63h5X/4d8ilP5LmMJ0ULEfRIqfGPkqJUKqMXYC4jq0eOn5DuZ/eoSN6i8
	PeQAXuxAXGwy4DDlRGdSLnC3CUeMITEMrk2/LFgBwL/QN2bvzXnzAhiS+p9bPFwerJ+zOgmk1Aw
	0n9K4KAy8KLZuLCbKq8lL8CEi7uXlGIMD+u8MKRXQgGLa23ARFAMURPL6HQkfFv/vaVl2KKN8+l
	3dOyGKszgTSHSVU=
X-Received: by 2002:a05:600c:3b0a:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a211c869d9mr2350165e9.16.1792699613390;
        Thu, 22 Oct 2026 13:06:53 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:52 -0700 (PDT)
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
Subject: [PATCH v4 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Thu, 22 Oct 2026 21:06:40 +0100
Message-ID: <20261022200640.3101932-8-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022200640.3101932-1-tanure@linux.com>
References: <20261022200640.3101932-1-tanure@linux.com>
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

Enable the controller, hand it the ethernet pins and point it at the
PHY. RGMII needs a delay on each of its two clocks. The board traces
add none, so the PHY adds both, which is what rgmii-id asks of it.

The PHY interrupt output is wired to GPIOH_6, so link changes are
reported instead of polled. The PHY reset is an RC network on the
board, not a SoC pin, so there is no reset line to describe.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..4914b0dff8a8 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,24 @@ xtal: xtal-clk {
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

