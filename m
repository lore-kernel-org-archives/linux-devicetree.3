Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572340;
	b=S0m5aNUosNKXT12gHcG4FJSSet6cxXcD30fYlJSx57HO4ZwDzaTZFP4GcI1gqcxr5JgR
	 +XGfijQMWS+hANLtQDMk+PP++OaANQMvDRx18KH0c2COP1Z3j/yGlcuqFxniRJ9EeUC3i
	 YAWnul2dHT7r+ritt9XwIEdlLL4QW7RaSgQwQz3f10NPgZtfBQeIIc89K7/vfrV+vstN8
	 QwfwFAhcPyCk7otDmhd7ErfQtuQHJ0t1yQ2pUDxO3/UlH3IpjQuBw92F2j0vgMKCsEgT+
	 aTGZRirYHR1nFioimtHli+D5q3wX3QyzZ9WcOyel+mv7m5j/2DzvO8sQn327fseqU8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572340;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9GQJLLepWwoaxFgy0WwYMme3cDh2Nvdn33ep+PsXVNo=;
	b=mQRRbd7qQULQRA1HcIzLFwiOFUWfEbwy9eFpOLxzQaaktD/NdL4L84zZiR6rxBhGHsDN
	 yWzB/87oxEWWFdNYwpHzA49u3UeHsGRZvyknOixOfUrMO5ZWoBPYRgEAy83T4JavAGt8+
	 AjjIxmi5o5ak3kCzlkxkiSv4nbWHCSM6XzCLO2yAe092LuBCo4njWVshrDLnxdLKRfvbh
	 q+0d2QNX5EByW7++VB+vxVSF+P0EyQWQUAlcSVaCo46dJp0gnIECurqPU5zMOmQ28WvGg
	 M2X6XaRZguY47MlgWIdz8/nOulJWZqmSgnKhYdfVN7A9ZXGSVWi7Csq6d4dXZed58mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0769160A2615
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0769160A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4922dbcee23so393740f8f.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:18:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572338; x=1795177138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9GQJLLepWwoaxFgy0WwYMme3cDh2Nvdn33ep+PsXVNo=;
        b=EcJBaNGwGaTlP+RPCV4p8So1cJn0F2v0rsTTShF7g+jTqC5SZI8xFo4ETlkK+S5XVs
         gBp+e4SAjyUJsW/d+xQNWKPT4+mIsrWgzpzXrhFfpxMWHCQjao1LDWNWhGsX0afeOk/3
         IBP1Ff2ffnAYK1b9p7YeNkJ/NAXqh+PrAbV31OhwXnuPX0pjJLhILeOHF+rDkRSIxsCt
         hitfPtt18X+kLWKFPpHx2SjMD88QXbnvjv02a9h/Osf0aoW/J+FK8ZtUMPxy72tJ3AjX
         99wvup4F+SIerQkl6d0a/UzAV+6jLTcGAtKhE5Q3eJ8RY8QbN0lMVpW/6wtpIo5xm5xG
         sfEQ==
X-Forwarded-Encrypted: i=1; AL+hErGiSqSqz7tpYCusNAvH0gpiQsxHfkcEL4c83d2AtCGxhMR/RtGgZUJQUzTTpem1BIEFMUjYz8yx2VpT@vger.kernel.org
X-Gm-Message-State: APuU4Z9pedpiL+dlWBKK7clDKFsh8+SdB0jfrd84tm7Te/6wbxhESvCm
	+es7RbWJAyfWmW9AERMfuGLocBKjrPfAzeHSRMNmm0fkot9AY1Z3P0Ke
X-Gm-Gg: AYBFou0PIxbHzeMLiUB6UVRRI0U5VaB/9akHTZLvZYfCSYOlIwbgqQPdsuailnLLZB4
	YreYKDHQKs2d25gpjbX0anNZpHhcyF6gGT9++1DTZF9srpJOBrVXs1kjponvNHEk7vTVJUf/3/y
	JlyfDOMOaERArTeEXdWXS2OZw+yeuz0cYVK+/xy6q2IAdOgQ0xpC0E7x/+gDmPXTdJvpxcGgnWe
	GbgMm695pTUtc/U4efeAjuwHBLcHj8aV7kCHpVTHpsozO+CYatYY6w4UVjKhI06u08uKk2b0C3v
	V6bteto95JzQn7f5Qs0ZfgUF00zicVO8iTXeLab4OPxL3zJpF11Zk3AHIHG8/MU0yWnuWqVh640
	zZH5A/BiWyIGJqGg0MfvueHeZAjYg8LHj0lObncidyCTL+XQ53vvlI0724wv54+mfOHCiqmcyUJ
	1V4XOD8BqzqLNj2/ipbeSjzQHEHu7EXM1UZT4T6FJ1Ojl/haIVAs7F4csoGtr4OAF7I5/S6NU7C
	FUYyxDJ393PDd7178Gw7DN+nNGTIRJPg96992wrUyMXh6jhaI69H5gYEdJmP6dRqRK+A6u4dFyL
	XlIMbtwkNlVmKsoDJLCXcdfO8HAXu5+YArITUBVXUPhaYt1YN8WYezAocU6N7+5MX+5vWjhnU5V
	/7eCUkZ2uPyy6rxzl7HJsZ22gFfS+9ttOM+BczeDosSKLGJM=
X-Received: by 2002:a05:6000:2c04:b0:491:3fdd:af42 with SMTP id ffacd0b85a97d-49c72c9c049mr5208825f8f.37.1794572338269;
        Fri, 13 Nov 2026 04:18:58 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:57 -0800 (PST)
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
Subject: [PATCH v7 5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Fri, 13 Nov 2026 12:18:50 +0000
Message-ID: <20261113121852.334604-6-tanure@linux.com>
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

The SoC brings its ethernet interface out on bank Z, but no pin groups
were described, so a board had no way to hand those pins over to the
MAC.

Describe them as the two sets a board actually needs: the nine pins the
interface always uses, and the five extra ones RGMII adds for its wider
data path.

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
2.56.1

