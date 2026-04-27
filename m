Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0502136D517;
	Mon, 27 Apr 2026 21:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777327067; cv=none; b=HfgYpk/Z8GAvRaO8rj1BTao0eTwwo+Lik/L5Ck3zC35xD52Bitb5A321WN/MpIILew+GSTYobgqm7h1ecU+awxR1p2zkHCplIjNc7roL/NcnqNHqbsqTEDcsvl7absXxQUcrbH5jn5tNYiB81FLu2ogxSGNqKCf/Lmv3Aq9bl44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777327067; c=relaxed/simple;
	bh=zhyJCoZrrjcFXrqebOcpw3bjPfuh5lPY066+qDv72rI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OMXbqxzf2OCb/D/RraAVXIm5mtglrF++vU7cT9MTCqYDKEpXgUkje4hbYImSuinoIHrrZ9PDxTSjw2yyeLq31YwM8bdEHidjKHHLR+hBrrYazAy2tF2PrQKDT3ppIgNHGwkgnQG3MsECFQ9uPevEFD4H1EDXKAsy5N7Vk1gQiCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dYqZN9A5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dYqZN9A5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777327064;
	bh=zhyJCoZrrjcFXrqebOcpw3bjPfuh5lPY066+qDv72rI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dYqZN9A5MNQw5/2Ml1+Wz98fulhnNPfA/3X/bpIe2n3tpwG4oaPoQJ8F016R0dChn
	 gXkO7r0qi3CoP8HJzZXbodXjZ5wnFaPwn8tMXjYJQEKyNm12I5F29kO/d5cfJmJPSk
	 og/7Z7rKEM4F8r2SS2z76BnHKgCBdGiO5vdBsqtEJQMmFq4k5auD0blWpyJWEj6S4S
	 i907OGNh7HCcaAxx89YpGKLw/2fS0XD/IOVuY7nMoSCRJeLeTro4S7h/+RUGyDXiXv
	 rRe4HZRpTkCvJe+Z+S9HiCR+oxw20JxX8MBCWN8SrqAs85x0I7cMIQu5hlVuX/LTN2
	 PmrssxhUX2PtQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4DE2517E1274;
	Mon, 27 Apr 2026 23:57:44 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 28 Apr 2026 00:57:20 +0300
Subject: [PATCH v2 02/13] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3576-luckfox-core3576
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-dts-rk-frl-enable-gpios-v2-2-924df9db884a@collabora.com>
References: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
In-Reply-To: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_C6 pin to control the voltage bias on the
HDMI data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the hdmi node to its dedicated GPIO via frl-enable-gpios to
allow adjusting the bias when transitioning between TMDS and FRL modes.

Additionally, remove the now unnecessary workaround of using
vcc_5v0_hdmi as hdmi-pwr-supply solely to drive the GPIO into its
default state.

Also rename the hdmi_con_en pinctrl to hdmi_tx_on_h to match the
schematic naming.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 .../boot/dts/rockchip/rk3576-luckfox-core3576.dtsi | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
index 749f0a54b478..4fc8496828f8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
@@ -26,7 +26,6 @@ chosen {
 
 	hdmi-con {
 		compatible = "hdmi-connector";
-		hdmi-pwr-supply = <&vcc_5v0_hdmi>;
 		type = "a";
 
 		port {
@@ -138,22 +137,6 @@ regulator-state-mem {
 		};
 	};
 
-	vcc_5v0_hdmi: regulator-vcc-5v0-hdmi {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&hdmi_con_en>;
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		regulator-name = "vcc_5v0_hdmi";
-		vin-supply = <&vcc_5v0_sys>;
-
-		regulator-state-mem {
-			regulator-off-in-suspend;
-		};
-	};
-
 	vcc_5v0_host: regulator-vcc-5v0-host {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -231,6 +214,9 @@ &gpu {
 };
 
 &hdmi {
+	frl-enable-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -655,7 +641,7 @@ &pcie0 {
 
 &pinctrl {
 	hdmi {
-		hdmi_con_en: hdmi-con-en {
+		hdmi_tx_on_h: hdmi-tx-on-h {
 			rockchip,pins = <4 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};

-- 
2.53.0

