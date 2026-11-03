Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723845;
	b=QsFVPQDkdzSu7J4xI5k9o/3jKFCIPZjuz4IJDcWYmPEfC0iOyQqLMcpFhnqRW2uC7p/y
	 yVWlrCK/Ead8fYo/heNhiRYDiscNR3dK0eD8Nyr7GUVg7fBJ1edTqRZuFRI+70rk3foxu
	 9HZc7/H986T3xgbiMIt6obHpSgWuKvt6WeMURuxSntuZ7lexRDkTc2em0uGSQjCtiWd3r
	 IfSGw54CI0WVutPl1WF995x3OpKC0iFeihlN/3+/KsQyFtzqk69V+zyFIezpL6SuNqm/K
	 WNMP6hfIPpuDMt70INCjdmVIz3V0Fmdoo3kWid+uMZle1lyrDZ/Sc10tYWAMVEOpQwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723845;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=;
	b=zJQl3QBYrRF9vEYXE/YsD+Vb0VaA7q32PI+cEtdofH7l261mm7dAiLfZxqDzDu01R5D4
	 dsDt0Mi4YsouF3U4xzAAJtkRoa3+a1CaRf7USsHK8d1bW1CGBO1zOKJFsgMLwI5hDdrEa
	 1cUNg01jLHXd4b54/hrrCLo7+a2iWIAtA86+VII/c4jW8GBkS9kpLxSciAAgyfSagptCf
	 rplttLcCH0HyBY/VlrWjcbcOGgg58y+zs5DsoOOMtrU05JoMYC9ulhXGOl4XSXVwmo2Zt
	 uaM7EEl4zagY8mYl72CIkB+bDUSZcChsD7BfxI5ZlDMw5j5Jk9Hlq4mfla3oWa4mr+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E759606EEBA
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E759606EEBA
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso549021f8f.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:37:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723843; x=1794328643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=;
        b=o+E72nY5mlAyf/Hp6lqsxAVAEvGuYHNE/NMtxHiDR+sBzyvFlR8q4nlL6Ydb3DVJNO
         d/9AjLLQImgMlr03NKKzWQ5GfAvFdsoH8YURBnIRNC8TBIF3yJj+z3ReNbDHUyefYBVk
         aqNQ4f+UVtW4n45jBvAlYQgq2rNXlIn/Mp0tZVfvn2I/PkrM6QPwD5oVk4s3toZ+yuNU
         sWwkN5MJAk8ZJb50xQxiELtbRerXJP095WFYxnf1qcbk4OfPSs7+cMiMU4FlmsNpeJh7
         lHB/gJ2qrVjuWmLo/cW7tALLoCF0cldNya6JK1Ca5oa/2S3KECtUWHRwIeETdX+daZp+
         fU4w==
X-Forwarded-Encrypted: i=1; AKwUvBwHQbhOVQErPieZOW2QOyMlS+yPPOxwLHugu/TgdLt7buLNqguzf8lkqMmJddX+sxvzEw+hpN3fZjuV@vger.kernel.org
X-Gm-Message-State: APuU4Z85E2Dsm0sXygDnG2Dpx+gYvOMxayyHFUilgL7QCsVwUSzvYBiC
	UiVkF0+UGU6pxv5gKpXdUSJ5mqeT4qkC4SyL6GFMgMxCCQQDzBlZG102
X-Gm-Gg: AYBFou2SgPIitlUSUKl5LtDJ4FlMhrwkbQE/drKBYS/r7+j7udWrBmzYs0FCbfZJHuk
	IFxBsav4uuJr7LHivHStUQrXnobXDkwXBsUnrD6HAeEf4W9lWKwiPg6UaFrorXuaoagvWNZaQOR
	cnl5aIYTP1kE5+bFqDTRmcOznJ0P7BB5kmL2k9M6Mn0boI3O5vnSTVVMoipFEz7hEEzml+rgD/s
	WxY/9bLxjStx93qxNA+dstzxnYntQtBSOBxc6nYZjiA1znNcA9sL+b7cDbZ11SvHZdmcvTI2anr
	uV3cP1QcGIZijud0Ux1r4bHZDmkbT1CSUqolbQlA1v+4fw1ZWK9MCv7iSnt3yi2+/tgv2mY3+O1
	xy2fKPIBGb+UrvBd3w/CotV5YRNNs3fkBhGqgHyRPwzFXYzXXMNeSwgFk6masHhLnHi6Gq4uuC/
	gVrLHkfBzEs5a+NvPleJoAEGQVxDJEsFo6KECoMKg5ZWn36i0v25Ea351Tknm1qfg05fuysdSnB
	QM35jwnKHLUVWc+o9icTpoAyhetz4lBNq37FmNFYT0oD9rLRdo3waX71x7p0dG7ACFNjCa2VhtB
	tXCmPReUfs1BYU5tULLlWQy0Ioz/NhiqVBTEyaiKGeZKgU6WjFrvn8y5L5qvxsT1JSt5lmNhwkZ
	J+TfkErFUuzLgQXk63wCF1/wqRg==
X-Received: by 2002:a05:6000:2c0d:b0:48e:661e:8766 with SMTP id ffacd0b85a97d-48e661e88c5mr40422568f8f.17.1793723842657;
        Tue, 03 Nov 2026 08:37:22 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:21 -0800 (PST)
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
Subject: [PATCH v5 5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Tue,  3 Nov 2026 16:37:13 +0000
Message-ID: <20261103163715.385394-6-tanure@linux.com>
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

