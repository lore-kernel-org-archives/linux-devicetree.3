Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB3C36E497;
	Fri, 17 Apr 2026 09:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417916; cv=none; b=g/exqYdG6AJiElFHcrgwbqdWkMiZzYl73q+fxR+iHQUpi9kTuJ7hyfp2q9oLQeymaRl5iLrzvzvtAlKSVIcJTg6nF4FO041DkW+w5r+ReSb6x7OOv0d0kZTzp+Q5IODXN9spheaBldKJTZpf9zKW75Da+XBijNchjccAmvZSoS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417916; c=relaxed/simple;
	bh=rDeLASuf6S/38jdj7aN4u4jd/aPT+H0uZg6VSl5OLJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NtIrJRAstn5GmXMdPyJuWqS95lAkJztMDpSfdI/n8ZmR89i7u88pnDnCleIOL21tnfD0WcL1DAc8DII+6CA8UkN22f9nKwLauh+JULwttKPBcVJZuon9zhiWOi10HP66/rTmTTpviCSaLTQXVNjvdObcUvbC4tGVz+6mwyqblrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oNRkQAD1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oNRkQAD1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417913;
	bh=rDeLASuf6S/38jdj7aN4u4jd/aPT+H0uZg6VSl5OLJ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oNRkQAD16ZOokCkSZUBvSPJfobAw5NCe+t0VcZhVzAieoEP6q6Ptj9MS2RzzfSef5
	 1+PlEjKf/LKpneBV6TSqskkbT9HtZCTJxK+D/5Q1W3UAuBVj+y7mj9rnZ+6Dy4656E
	 xlWcsUK5VptG8QJ+HKQUqOMxuPFTJKGrWZvnGyU+5XgQmTb5/EsrLL7zJa8BVyVIWp
	 VmsSuCHUl2Wu7SyfZ0CHarS/0iTl9yZhHWBUfkJv47Rty4XtrPfuBRZ2I6cm/zoaMW
	 xXaspjYzMdZvaBTNloK8yPWVf6o1pmMwBXqfiYKwx+2qR071hvR37ZstjmfgDJbatS
	 meEUdfz0k3bvQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8CE0417E1412;
	Fri, 17 Apr 2026 11:25:13 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:41 +0300
Subject: [PATCH 07/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3576-nanopi-r76s
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-7-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_C6 line to control the voltage bias on the
HDMI data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI node to the GPIO line using the frl-enable-gpios
property and drop the line from the vcc5v_hdmi_tx regulator to allow
adjusting the bias when transitioning between TMDS and FRL operating
modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
index 7ec27b05ff10..21ef369c478c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts
@@ -111,10 +111,7 @@ vcc5v_dcin: regulator-vcc5v-dcin {
 
 	vcc5v_hdmi_tx: regulator-vcc5v-hdmi-tx {
 		compatible = "regulator-fixed";
-		enable-active-high;
-		gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&hdmi_tx_on_h>;
+		regulator-always-on;
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-name = "vcc5v_hdmi_tx";
@@ -252,6 +249,8 @@ &gpu {
 };
 
 &hdmi {
+	pinctrl-0 = <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -717,7 +716,7 @@ led2_h: led2-h {
 	};
 
 	hdmi {
-		hdmi_tx_on_h: hdmi-tx-on-h {
+		hdmi_frl_en: hdmi-frl-en {
 			rockchip,pins = <4 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};

-- 
2.53.0

