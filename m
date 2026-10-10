Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA163BB68F
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 10:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629955; cv=none; b=q8M04LbWRf845EqezHvPCC57L6aEazbWomoo+SwZuE5bWpMdpbrenTnmb4krIY78GzVo9C1PD3WCq8OpsBtRGK4DlxMSkYn4E9ImlXWOkk2wWUo5A0UXGd5SsHwI3qZhbbXVh3a6dNmIhEHAZUSWP5gNRRL2naVqqtACaWf5FHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629955; c=relaxed/simple;
	bh=7MCaBFOuVYPL3cfUtOVX6nxdRkEKoiQe3MsLZtFLwkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dJNJ/BHhatkCCtSTkzpbWXYx0R0nMYhrq3UsUyw5J6QkET7iBDJLEe/d6IOzJNLSQEpXRm2dK3ODXaWfJQ7wMPsdPb5V/RVQNIy5NeUQ2YI5f1qMDV6Xuqd3XAUr4YJiHDi7r/fzqCnGK79ppSHpIcEScN/9ykHjS0T8dCE1A6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b042c0759so352562f8f.2
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 03:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629949; x=1792234749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=;
        b=LZf7XSzCOFaq0KyeNtb+OrmWHo8SolhFuIz7VBbzT93m2OXBmP2LFePkWW7qaNEKR0
         t6Xvd5DXfD800D7QJRSzbXhrK0CEsFP4sSLlB7TVlopN6kVsKCFlTp8DwTJtP6+nWhzQ
         SBSxy1uSTjdSanMFdBhZS+ckJN+9KXchAJdGneEY8eAVXv+vJfJplsk8faCXNXzpTh5/
         IAX8ob4Q5PEoCMwpQXlV5/ILJwbaNX2HOEIsyqW8yVx4BBqdTXKBOUtQ74bVqW3JKILJ
         JOK0Jvsfm0UQb++DWXWLOE6L0NYoWP0t2zGL/HXEws6Mb8z8ZGvHIfzN3BrwEtOxBPgb
         h9gQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFJiuJg6jf16FtRwQx9AGYn7rko2AOZZbhRg/vwUdm6mXfBRojOc8yx++oC2J5y+7sfLoeuW8dQbHz@vger.kernel.org
X-Gm-Message-State: AFq9FYIIBvPJN/NHaIC9/dyrGVA8DlBoCrGHjVya5ghiimBwmutRJ50i
	xm05SBXtzpymcJTeK/7zinC2XVZYudoxhp9i+yyV8y67oc1waRGfY5ey
X-Gm-Gg: AYBFou2EGHUWJOwSVVW008B+qtpMP7xNrvFWqgJ6qSKWqZIbbN08cTmGpyHLH64FeOJ
	sU2ChynWxXjXVvXJ55b72BoUdTw6H8k1dFrKZYnMtgY7175Y2KR9cAIAiqeiNWozJhu1FraGsqj
	2ZM6Z5qb4ipCQvkrLeElkauEFCJ9/vcvZ7T7MkCaeCJ2tX48O49vteq+PPoSFQFcWhp6XhmktA2
	pAaEmXwPZUVTEMXQe9OwfCx0tW67QJyX6EhFEJk7WFkfph/EDhKi0p05CDnIZO1bCzpJ6+Q1SIu
	cge173qO4KFSW8bYFZmsOfHlJFa08i9y0N1hDbjD2QUXDfQtCkHoZ5pZ+2GYCeer/LtCSEyUGMD
	sdTnLf7xAIt2L6ZZf8CggE9aZmmAvQzBZ0FRjE7cVPg1P3X9ZXTfIpenPfChJYiO+cuK79GuJPc
	m0M69KXUzzrf4qxmGnS3Z59CLsQ8MHTGfF1CPmjQ6e+78sYcGKjpOsu4SvAxpXGH733sv2ElWEx
	RVSzi45ocS59A2YqMnQ+M3bqdO/qVG6PQE=
X-Received: by 2002:a05:6000:22c2:b0:48b:1a0:5630 with SMTP id ffacd0b85a97d-48dbacf3275mr7157743f8f.41.1791629949021;
        Sat, 10 Oct 2026 03:59:09 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ae17e9sm8709526f8f.57.2026.10.10.03.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:59:07 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/8] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Sat, 10 Oct 2026 11:58:57 +0100
Message-ID: <20261010105900.247342-6-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010105900.247342-1-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
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

