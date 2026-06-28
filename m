Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA792DC765
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 17:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782666424; cv=none; b=m/L+0BVMaHnN44qebFaGNFMuHrIQO7sK+H7YyJjdA/wf5QO2T+mLIEztoXsb+3vLOwo6MV1/dB+ajz2LCyPgE9qGrJT6KW8+ZfXHfPLJW3Z7eDgMYC6F9eTExzvhwFMPFsxCEAaCKQcxTy35NBZzIbSY3JX5WCWFpFUIWExDxwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782666424; c=relaxed/simple;
	bh=9W6n/WmcyY1zipRiiew+pW85ZVLeHbYsn5+LHDFiG+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nBLxNAOMRl6tQKM/Gc6D3P+sWOeTuTqkjXKSwVzuCuyyfvi/09FadHLsKzSPYVdlacRwEMY9c5hNgjJPJYbaeHJHjUMQBJawHGeaS+6tyJF5bEKVa4raGg6e7RoitRWMht1bp+nWhplmSEvBdq2T/XhvceOidp5pUb4tVr+b1CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gkx4uphS; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gkx4uphS"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493a440bc10so5019185e9.1
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 10:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782666421; x=1783271221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvJsYiQM+mJGanwjIrW9x1n983u+zy15a4QrJmtJhu0=;
        b=Gkx4uphSrZe+WAd9bbwkwox5AD0thgoeqyKkbp51vE+jibQtkw9HKBUCaCnrZBhEyB
         8+erLKrn+TxHpUq5fDBrXxiuhUoEYYXLk8yEWCWU9VS4W/MvQeHwcAMfDpWdNgQGI2/s
         +CHWoTdIUlIAbIN2pImhZJ9DUdkY3NHK9m2vDK2Rb5WZZzeuDhmvO234B2Lt+sxIOiow
         SsxmAoE4Fe0tgELVUnqMJj7By0KJTu1q86xI+v2oJ2AKiJDk9jrURUBiqnodri8XrVZn
         xgA74pPWWi6fCiGhpd9G59gHxw22CKdyPYt7SXI8SPY7V41BBoLush+I3u/JnAe2KVp/
         Y63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782666421; x=1783271221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qvJsYiQM+mJGanwjIrW9x1n983u+zy15a4QrJmtJhu0=;
        b=N61shrbf+6lJGMxRhKD7phKRP5qYVpvm6BG9nmjIZzvJeTJviJN9BOlVAaCNlzXo8s
         fFnO3ECEeeSOp54a5L+DmPJrAKrIcdUZZGjIhVWAxwKU1FvFw1KG3Fo0RO3e3HGuvNXq
         DxUW7t3OfOsneUx2Y+y9/zO6xmv7ZCQ1USSn0ZibnlCePzJp79ycr8ZEQCPDkDs2oSTm
         wSP0yqXfDVjUfSXpXUO5QFdhTbmuIIexshvSAdhYEQ6aEKCg8km34YDH1YOkmWuMXJoX
         lsvtnmveH7M3MppFinj6KTMAQRPw0zlDzYlmBbsLrw2YbtjvN0Z0J3lL64pobibIPTgz
         v2Jw==
X-Forwarded-Encrypted: i=1; AFNElJ88FAEUEqdN/8MI5x3z+zKYhOVNsAx3Cmvrl59bFbrCQM7aKVLQVkZMZg9YC+HccQcs5EJux2zQuTWs@vger.kernel.org
X-Gm-Message-State: AOJu0YwGhotiqG2C9AKrxwm8Ea73fXNTaZ5SH6IiLfBK1kpB2QVrWzP8
	govNscN7/tunKXi5cYkyVDrSESlaS5pe7LC7ie1aQu3G0HfYtdO1FcQV
X-Gm-Gg: AfdE7cl4wa7O3ailpfsKESliPZMcRSZb8k7cE4grY59zWgyZfIrc7knlpK3tWzIcuxM
	GD88LN2eOwL0Ejuu8etKG7uR5iTmJU8/+sLwcUTb6mcC5J2UaB2dfaWWRZfywUlLSV4920ZVZfV
	bkGUQiCFQUezRoWbLCM80kbHqmFa97Z9eeNspgPzIRShVu2TAae02jgMkb1v/VnuOcagTv3aAn3
	e8o8hymRbkSbvf2/T7rAj8BR9T86CKY7dVZea5aIwPWGTVYCRMaoWiuYudAgjF/569kwO2Lu2/u
	Oelix7k/vvhxHyNHlsWVAan/9C1TwOMxhblhCKLLARDz7p317Btjp9d49MyFe7tZbqBRJvZChXr
	LnlpGjuwM05us04Hinwxp4deEbb5HKUjjp8N6Z71NxQaGr67CIFCNknqGq8R1PEja6/xRWHfWvx
	dm87zuMgxRsTyuwXulDAVbN/gqKzKEcpyuKJMr0l4vOmPLue24a7UbHODHPXBUyWzR2GUFSlSbX
	8cXccKKfOzHbtPDnT4CITBtvw==
X-Received: by 2002:a05:600c:4f8f:b0:490:c2a3:3302 with SMTP id 5b1f17b1804b1-492668b7599mr219013735e9.35.1782666421372;
        Sun, 28 Jun 2026 10:07:01 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493a7fd1b0fsm54217195e9.1.2026.06.28.10.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 10:07:00 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 1/4] arm64: dts: ti: var-som-am62p: fix Ethernet PHY configuration
Date: Sun, 28 Jun 2026 19:06:46 +0200
Message-ID: <d89ea82a4bbba9b97c7128b4a1c0e5b857a921ed.1782665899.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782665899.git.stefano.r@variscite.com>
References: <cover.1782665899.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the Ethernet device tree description on the VAR-SOM-AM62P.

Enable the CPSW Ethernet controller and correct the Ethernet PHY
description by modelling the PHY power supply and adding the required
board-specific PHY properties.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index fc5a3942cde0..be19cbaffc4b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -113,6 +113,15 @@ reg_3v3_phy: regulator-3v3-phy {
 		regulator-always-on;
 	};
 
+	reg_eth_phy_vdd: regulator-eth-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_eth_phy_vdd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&main_gpio0 46 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&codec_dai>;
@@ -149,6 +158,7 @@ &audio_refclk1 {
 &cpsw3g {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rgmii1>;
+	status = "okay";
 };
 
 &cpsw3g_mdio {
@@ -159,9 +169,10 @@ &cpsw3g_mdio {
 	cpsw3g_phy0: ethernet-phy@4 {
 		compatible = "ethernet-phy-id0283.bc30";
 		reg = <4>;
-		reset-gpios = <&main_gpio0 46 GPIO_ACTIVE_LOW>;
-		reset-assert-us = <10000>;
-		reset-deassert-us = <100000>;
+		bootph-all;
+		enet-phy-lane-no-swap;
+		vdd-supply = <&reg_eth_phy_vdd>;
+		ti,min-output-impedance;
 	};
 };
 
-- 
2.47.3

