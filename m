Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ADB3B7B70;
	Fri, 17 Apr 2026 09:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417917; cv=none; b=mwsoDDhIMWsReJaT0LRldCpLOtfEMJ9Ho1s8YlISs5kETUupS7THv1a+oC6dbxZm0/C7yw/giOl++RHw4n9ITqVxmDO9FzBGYMIkMO/9TNxhmvfVNNdJLVY1oBYBbYJ/qBoEa7GIHK4xvaHWGXQX4cRcZcEBpw09imQUk3gAP1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417917; c=relaxed/simple;
	bh=Pablujz96KC0Tgnv68baDJ5r611x1sGWeQfpbQiSI+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZLgcqdbWxVJo4pTZA0ipjroTeumQR7/HIupgC8lQmIEZVvoZlwMzS+lphwIQ8W1s90SjT02v7GZUU4iyF6+ftj8tDeavTsLcjJ2Ba7SP4AjksCwTybrGSo5ox63O7nmsurZHzmkGqe8AQdX4ptePizpPJNoAkR+6GkY1wOtn/3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PbKfzn48; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PbKfzn48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417914;
	bh=Pablujz96KC0Tgnv68baDJ5r611x1sGWeQfpbQiSI+I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PbKfzn48iPK2Qw+L/xB8V+cRqQbiGzROt7kBwnXC0iPnlpvWZZzUCkSZClaOnVlBG
	 F0+dlaTV4Mhgfsyg4qcz7EY+NC7EsA0r8bLkSj2abK15DGUN6Bgo5tzWFAziS6Y4TC
	 JqEKvG1I1VPe4nFOYIeVPz/NLDxGPLnMODwYmVWESYlhU/Ne8o+i7hypoE5QuhYSEc
	 XOMIjDXM2f4OjmRTz5/uKApLGdZWvoIKwOjEXSvO+msopCw0VNvCT+TiXCRUNc/Jds
	 z8rU+wsmwZ1x88KY6e520vPfRWAw6rrwDSNZ3KZrzZWV7JA9RTieY86Pynjps2OWJB
	 yrC82oK63zzJg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B15C17E1418;
	Fri, 17 Apr 2026 11:25:14 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:42 +0300
Subject: [PATCH 08/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3576-roc-pc
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-8-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO2_B0 line to control the voltage bias on the
HDMI data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
index d0ab1d1e0e11..68f9911bf4d4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts
@@ -283,6 +283,8 @@ &eth0m0_rgmii_bus
 };
 
 &hdmi {
+	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_frl_en>;
+	frl-enable-gpios = <&gpio2 RK_PB0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -720,6 +722,12 @@ &sdmmc {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi_frl_en: hdmi-frl-en {
+			rockchip,pins = <2 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		rtc_int_l: rtc-int-l {
 			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;

-- 
2.53.0

