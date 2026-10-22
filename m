Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699613;
	b=fL/8pDYdxN/CfWZWt7/un+Abs5XU/lsA8z8dTx+zqbZdHb0btZ6NN7RJT8heXxGf5W1U
	 azBRV9Eiri7C/ZkM6A9MuyLoeIyEXz1YFISlvjpHIuKFNwwk1KvLI76XEZ4loUi7lrJns
	 4VYyg658mdL/nff9Sa+J68LRolwInFihCV53vDcOoSbzFLGVxHv8jn5dHcpjhMrCREMml
	 wOMJB6QNIlp26UEfBcTy0kmEgpVLJ02T5i9vdLgHbmfW+QSJUX9kISat0iGeE9qks1Ge0
	 h52b8I40F0xhYg3oInWDP3btfIvJ3idslX52aQ+MrFqNCrGhAPTjBoE7ozrw6aL/pzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699613;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=;
	b=rAC+0rMadFWTJomiyIzjsrR1jinbRqzvZLfs0pfbfvAGPOY3zj1nnkPMsRx0hvIeVbRE
	 MnFUTsR/dx1B9+Sgf1TlEwm/POn2f+oxbf7EwOh5/VRuFrwmtQIIi/N9ycln3f0Ua6fAN
	 TRiOO+vj4MzFBFh1ob98lrS+NQsIUnhYzdOVCwV0vmFfU2J1cpZ6Sc7CWszBMr/XnnL9A
	 G3mUmkLZD4yTUdwOJpOuiE2UdFdFhMuuCY3w/ZJXT88g5A5pNvBLPF4IMqxZKDyN2jorv
	 U0pCRi4R1gqevnfdfRwBNEMJ/9uV3XO3Tjk46HDSIbKu4FmIItwofKgbQAv6xlhxYNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A24160A3813
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 20:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A24160A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20b122af8so1742175e9.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699611; x=1793304411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=;
        b=zRr8DykeiyP3RMvFz+mG6n0C9f41pL/WQsXB7dwmexTTCItIHAcZ8ZQYSHHDzcAjI9
         vOeAHezviyAry93sb8VvuTPGa6uOJkB+Zll+PB5x6tfmwWtk0lzVi7gLq6U6HQSY51rv
         pePD3ZN/ykzgVbhwtPBkJgyN+imgGLxddosNU6uGc0ekx3JO2GNFzIWtfK9f3pFte5dt
         AXC6TolHCsGE8aHmXM9ie8zJEoMHFBIstvSXzeXXinL4HerwRip89LS7xlBuzcNXj2s0
         2siRnPFlX9fx9l8MpEe7OMSnrLyR1Ftm3naEZr9PByex0mnJtG2dCenGCAnZ66acsHgU
         ldNw==
X-Forwarded-Encrypted: i=1; AKwUvBy/src0tO9cXfDD7+9Xp3+Ris2G/qGYC1MLjNCfPJVFC7mLvOSmxkPljNn9LTeufR3RaP/1rSpkPtyJ@vger.kernel.org
X-Gm-Message-State: AFq9FYKxgxTqewtkO8flRfJ4dbYCZnzIkV3O/yHhEOp8+PmnVYtAN9CB
	R2qV07E8Qwb7xzqrU57xIvEQOInu9O9X573YQec2nEXq/cqmMwfXCTKX
X-Gm-Gg: AYBFou0L81EWXeFWWcGI2BQuHKYjRJ/OchvZJKVSNR3xmGnFbKskWtlslwXSwOjTb31
	NKMecDK/Y3zi8ck+QhQL68PbuXM4EaQFkz0ZPaNTgV1BxliIJq4SaJBXheJzeeO0WCkZsawt+L6
	W3PzOeS9niVN6Wh39LE3yV+5zpNpB3paOh9L5Vn2msZ6q5Nfx+354yg8mfIOl/tmtPMyblkMvZU
	yp5hvRgL5ea/ZQGQ2p/c0afY4Px/SD8OjM6wA9Nam4MjyoSLOB5hkJvq6Y1tX0mMdgLScHmbkdG
	G0HHinFeeRGiuywDM33tdEWi2lTgyiGmx2LvFGrQlQ4apMHUkwWMDWBZm8DrgQQ5hq7JXTN2OGU
	Vs4kGF99bJ2+fW0JUUaKmCDW8L7outjpafP3hPLb/k8q4pn+Dq7Up3zs9zOltkuQWyfRJO6Z6WZ
	lTyK8ZpkoA5zSklwudw5+Fidl9rSSTKjyCabkqjgbfc2X4dGQHePRzEkfmqGs0fyPaACjOxhHOU
	vWMTsVdZQOELwsk64xlzYLcOrLwUNGWx/vTZa0LMyjZhuutE9DHPmved79DHRetoGNYflgybCWt
	dspyxD2Ez3bXiRCSUyQizKJoIp3X0cc7dk+z
X-Received: by 2002:a05:600c:1d0a:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4a211f08fedmr1687545e9.24.1792699611517;
        Thu, 22 Oct 2026 13:06:51 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:50 -0700 (PDT)
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
Subject: [PATCH v4 5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Thu, 22 Oct 2026 21:06:38 +0100
Message-ID: <20261022200640.3101932-6-tanure@linux.com>
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

The SoC brings its ethernet interface out on bank Z, but no pin groups
were described, so a board had no way to hand those pins over to the
MAC.

Describe them as the two sets a board actually needs: the nine pins the
interface always uses, and the five extra ones RGMII adds for its wider
data path.

Assisted-by: LLM
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 30 +++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6894c06a836b..7bd53ec16607 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -376,6 +376,36 @@ mux {
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
2.56.0

