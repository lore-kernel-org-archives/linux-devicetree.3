Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723847;
	b=MWCcvxvlAUBcOghP1mGUdeyICPgeHHSAsqbid2GsZMlDrGlilN2yNoVZwdmDAPf8+Fdx
	 Cv+bliRwcMwVCvfQjoXp6z+NXErKsdZJOH7Shc24nRa4BCPlSPxRVkwuVA4uWshPS4f/Y
	 p/4WzIZp95gz0edxXYfbUTa9iyDYSkAAxHl0kEpZ8hIrPl/zXAcpOKmtCIFZpMODKbb3W
	 a7RQvmZk+3V+zP7h7oLq52W62aLt2992NtkAgjFh1Y1U4JHUcJ/jTORwIAeHTbkRGwSFv
	 drAPIyjCs+gF2MTSYWZeVRc2FCp0Y5IZa8V0rUk0sb3yXmE77IiPUY7FNS1r+neT0+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723847;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rvhYGG2+F5DLhHvBXxyAZN8hokDea2WGLIFovieWgBM=;
	b=ywG6CB/tSR1BpIXSy/pMvYEvTPOg2VxoGYDS7mQO0qoSCho01yQ83Pr8aFbFOFPRDqMv
	 QHbbH2cVEQyOJhNTOHkZlVEr+7Hy93Ok9FJdvN2tt/tSTlY87jbM3oGtyZYdXR2ZkuDGC
	 s3PX8s0RUovzSMRdwNRwzoa20a0BzM22Ij4hPcDuF+J437h6qN996fuzfbnq2CrhwNIjC
	 3CYcV6LFkkKhMmmtNPnXHRoxoJe3RDOfbqdBQdbyfoMHQOQsNikA+U8IBSzOrxje/0x5M
	 VnqqphwgPk1fZGixqtRXI85IgARk5SmidVJIeyRmzQxEAzvzOvo8ozpJRCV0i4fvOIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A166082BFC
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90A166082BFC
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e46e449e8so2691950f8f.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:37:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723845; x=1794328645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rvhYGG2+F5DLhHvBXxyAZN8hokDea2WGLIFovieWgBM=;
        b=cosTyyClT47YGt2yyiSue59cLXO8IkU5HIzFenzOLLDSFxFWvqZeZvl/4IGvVlxyfN
         /jrqqoR44T7DUtVDteC9YyIpv/vSL7dZAUbSLq0b38zxRA6PX1WUPhE4WFWnhfHnFp86
         h2mN3NTxpu3uNORDRql+yAo/Ujl0pngUSoj7WzHRX/kWVNiKKowSwfb5yzjFw/qU1rja
         3RtvR1ChcmzFVNPpYdP0ZTB+6aZEBpkeobnXH+jkANn41ZkeeeOsGebYAckIFsnwf0yp
         sNyt8HiJUlrRj+Q7Jv3Y8Scdlv+ggBLroT94N4XMqu8hKJDbkTuTtBtcaN4NqLc2s51x
         vhkg==
X-Forwarded-Encrypted: i=1; AKwUvBz1at5fNon2sHJTyaRurX/7maXW+t0Cz1VtCknINn7OHW76cBSonWIEMGh8kuVf6mlqK49ddvT61kKL@vger.kernel.org
X-Gm-Message-State: APuU4Z/mIIo++shusxW3+Zuu4qPNzebVH7xeTJIFj95yc+c2md7e0IvN
	nQ8FlxylED2ZiiIKDiwEMfhVbkFwpaV/8R0bm+45aNxUg+YfAj5Dj2Bg
X-Gm-Gg: AYBFou3gHCbTuCanclIZgc/6gZpxXoAn9XgfKIPpJRac+zw1KbE5MSg4lwsxmPE+T0B
	fLURWIH+dBo3VcJCp9yxZEvlTE0EgmW78oYV3wn7/ykV5GCAmyszMf2Erv+rF4R6uMZqxszc1nb
	HouQcYvcIgaZOIeI/qYC7l2+oLViIh9F/7bU8TkIpHlyPT/tUOwjBKZPQsscWCBhVhj/2StObTu
	zSwpmq6Dg/8Djhhi6YbrixSt+uZ82I6qHFxDLIbRRz+wD8FcXkStKwOh2wUydFPTUEqxawjOn8U
	0cSFqDVuREGlFQc8uikwY7c41aqJcZSHQOFY4wbFW+Zb0/WtJi0A3oL+3eBqBv6YAiYMYwDiIa2
	rmu2LHLijhPMEVx03TSHH2ZpU874Ui5tmXNoxdgJE29vFZ7JnDyOTGNHMWT3Okd4noikDKDClGL
	FKBBogpdnHr/vyfwf5NfelEAbMu3Y2KsVpK9M8TXlB6jhtOaUSV5+x/aMa9ijA2cG7ntnrO5Vii
	ZStQc4TG2kVEIUQ9RRK2bzbAGnwI0tBbeLKqELu4okZJnil3isemjI3qCdl6foSsEIUG+qQcvOP
	k4maQVebkp6BO7T8iWw207YpRPy2ucTx9f9/KNprmqtQAmBzh6O2TfTA7jkc3qCF67PSoMUCvYK
	OvnAqTB+LaFG/zuWnjD/ajAT3Z8Eieua6j7x9tT5nLk8yuTs=
X-Received: by 2002:a05:6000:2611:b0:48e:4e00:b72f with SMTP id ffacd0b85a97d-48e6e50c8ecmr28996710f8f.32.1793723844739;
        Tue, 03 Nov 2026 08:37:24 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:24 -0800 (PST)
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
Subject: [PATCH v5 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Tue,  3 Nov 2026 16:37:15 +0000
Message-ID: <20261103163715.385394-8-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103163715.385394-1-tanure@linux.com>
References: <20261103163715.385394-1-tanure@linux.com>
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

