Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296670;
	b=4HG5KRipyzZQ8Da4wentJNVAjK15JlfUePgZ2gFu5cf03WUNFb8Kp80q+Zs7w81rb3X4
	 pWU2z/YBeRWykwSRPgZkQb7JR307xQi+0cLyEK5TDoOgPOpPYAZVCIGWYXQDxAF6NSwXW
	 kPWFrQVuv2IgvSBe4PIzwPuR+EZHEN8Gk44Wanm5ZPQ3lmhX9Q1loNnhDvkC+HZrVIf/W
	 o/xzWrjAOFxqgZbI0eHIn6jmtvOQPLa1WcrMmjsahvoOtLztJ7uqRiuOqlfMtUlHgimfK
	 nlA3xvfLd0ZKjyjpG5VMFlY0LDs7VZGKtbyxcPuKhZy+koCxtC3TnOwaJiFVQTaP40g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296670;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C+F8/1p75HYEZHBswFtAlcyaqYd9D+So8Def5x5vSUU=;
	b=vKOQRfacccTGEcMqudipqBdVvH6L9s8QZoQYQXZfJbcG7v9ZbqboR5DJo43phYEP/QjI
	 ah1TKVNWMSQSVFhjMD5IsMuOgvYzL07kC14HULz6JV10JZoMxF2AASg6d0Q0Gswf1+RoZ
	 O9UnPXQJ8RkToNc6XBFxX94OJxil1iILikar24Sxmpl+8OXiiKMeNB3PqpyZOVePO5RlS
	 kelFG3Q4g2iJIJ/kWQemXWJaM+BbKBgcxK63aluvRdQscSj9lAxBa9Gc8rtTv6Ji9D7or
	 dNtnvp+Qw9pbWl5I9SapwI61peAcaNbPbXX5fB37LwSh0xNqiypSRpMvk+X6qyozhUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319D1606A687
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 21:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 319D1606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490d59c3edaso1383276f8f.1
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 13:31:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296668; x=1795901468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C+F8/1p75HYEZHBswFtAlcyaqYd9D+So8Def5x5vSUU=;
        b=S9vGlMvbpEie9w0EFIduB4PdMftEMSCuu5O9LQcQXMEquVqbqWieTH2dx+lW+Vy6ma
         YvX+/+41EIQSGmk0FvwbBjLrToAVDJ9WOt5FaHd1+X9nBAqfsuxPQvrCZaEJeuHqrqj4
         pkoU+SHqFBe7fWoXM7g8P2MTp2Uhm6jp1VscATlqt4Cg8hKz7NYbp4TljvbHKERSU9p3
         w56Ig/ghew9D75EBXnyH2O6yrpUniBrE/m0BR8DymHMVMSuWyiqg4cjKQnnpWpZdE7TO
         lgSujuvVqq7v48xLBjpod5zdK8zRH8/tFFQsm9GygXpHb1oD20MK/FaE8SlmC8jBeIei
         Fiew==
X-Forwarded-Encrypted: i=1; AL+hErFZM2cTc2aLZbzNm+9pCpktfvj14mVlPlEBZ6b9lzVP6SPThuaz7+3vOFlENyuQDz2i0fpCkY3REEyn@vger.kernel.org
X-Gm-Message-State: APuU4Z+avTrDdXWF02UNZyIY4mAuUILQ/BsHRZGFy5xfSnAfpVJ5m/0t
	7Yva/oPMvv47fJzllRTXsdSI4TcgXAqj0R0STYXYRTfB8XuR4MyUrQ1J
X-Gm-Gg: AZFdTZdtNGH9QtOar2oY0G8WW7KclZMaSC7RYYobpGsZIVjZ4PqLFtYjR040zU1Bir6
	jMdjQGXNilwmWUJydljbtv+MtYStpfYvMflwxpKt+yIsLiMANNibKQsZyRQmsPMXEf+uQfGaKCM
	8inp/qL/sNOjPnxYCYbE17p2Ppk/xFe49qsbBrdBGmdgt5KCLNsBX9UoHobXoOY6MJPxoVhTZNT
	mHjwjxV091PePH7FowAo7LSgbCRSNA4MTWC5lZJZMOkeOxpN1EmrHr5WwEYqxF74bW8tbT2YC07
	nAIX56JQkB0hsK7YXFuy8ooRFfCuTVTCIVMYuMuCsm4GjCawKgvwYL4kVJ54qRY0iGeaflLKPMc
	CB25RsyYp5BD+Dlr819Dpdjd90GqzDUBzQu6R3Gg6SPzd4LdkMpjDAW1s33wcFKNUlrCjrJWbgK
	wRculGcWfWdAcLg8x+e7XMr9QIErdTuTymaLp/b2XhWOzMa70qyp0ogoHQLKmZ9uicEL1le+2JD
	tBJ27LKKtQBclBZ4chGsMDZ4V3AXBg96guP1UNedrHq2PlWxO8NWlOz0+Pqd2vpuM8zP+/awARQ
	UKJF4Ye+av0t131hF6z9IFvUwu7nYQt6RZyV5fnnl5uloV5NJUExCEz3FXF/vjbFbS+iZU+y/3o
	eFKO6BHPxuGTToOHZMnpxER4=
X-Received: by 2002:a05:6000:2681:b0:4a7:dcc2:a36f with SMTP id ffacd0b85a97d-4aa5a2dc7bfmr22665106f8f.26.1795296668557;
        Sat, 21 Nov 2026 13:31:08 -0800 (PST)
Received: from threads.localdomain ([84.70.136.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm12445954f8f.26.2026.11.21.13.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:31:07 -0800 (PST)
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
Subject: [PATCH v8 2/4] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Sat, 21 Nov 2026 21:31:00 +0000
Message-ID: <20261121213102.143130-3-tanure@linux.com>
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

The SoC brings its ethernet interface out on bank Z, but no pin groups
were described, so a board had no way to hand those pins over to the
MAC.

Describe them as the two sets a board actually needs: the nine pins the
interface always uses, and the five extra ones RGMII adds for its wider
data path.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 30 +++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6894c06a836b..7bd53ec16607 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -376,6 +376,36 @@
 					};
 				};
 
+				eth_pins: eth {
+					mux {
+						groups = "eth_mdio",
+							 "eth_mdc",
+							 "eth_rgmii_rx_clk",
+							 "eth_rx_dv",
+							 "eth_rxd0",
+							 "eth_rxd1",
+							 "eth_txen",
+							 "eth_txd0",
+							 "eth_txd1";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
+				eth_rgmii_pins: eth-rgmii {
+					mux {
+						groups = "eth_rxd2_rgmii",
+							 "eth_rxd3_rgmii",
+							 "eth_rgmii_tx_clk",
+							 "eth_txd2_rgmii",
+							 "eth_txd3_rgmii";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
 				i2c0_ao_d_pins: i2c0-ao-d {
 					mux {
 						groups = "i2c0_ao_sck_d",
-- 
2.56.1

