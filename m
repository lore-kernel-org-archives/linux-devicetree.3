Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BCD3C2788;
	Fri, 17 Apr 2026 09:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417924; cv=none; b=hDRorcLIteu5h6b7itvsWGsVa800CO/5yvSm/hRrUDtOJtpOJGHhFbV8593Cp04OgJ1alLKJhe1SwQu/dbWld+yGT3SaILJMJ2oBjQ5jcOPGsn3m/23cyF+owwm03i8CdsEYV82SOyE8Ark6aKKXS1UeVyWWo3Ri8TItIDzM7/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417924; c=relaxed/simple;
	bh=dODct5ZTEt1U0C+bhZoqRmjB2yv71i9hUQmCsByHC1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NTAGyXfeJgVvORzsB36YX9GWYaAdXUpmc82qMWa5b32j+0Y/o0YFv1DI7t2gfia/vPMq5yWNqXdeodcbIh6UaHu8A7HVH+RAOXobiRpxzEu3M5BnQb9bzYPHCdd0lICG4AVVSiWUit2iObkukiUTRhLbLuXModDLOpJJHtX/3NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gdRd3yvF; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gdRd3yvF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417921;
	bh=dODct5ZTEt1U0C+bhZoqRmjB2yv71i9hUQmCsByHC1k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gdRd3yvFWQOWoG4WvYju8rjAkYA2qU/W6KkCRZV9p7QFS39iIOHX5UDYIq5L1MSDt
	 oRa6GPbdIr56WrY1E6cKSzekhG3TnFAYJb4ruA5Z3LhmZD3ofWe2r0UuUCVBUoiZIz
	 3yz8QJn6j5/9QxXNLKSIYC3M28jeyahqOXdVHWnEkYL1a9E0G6H4qpGyJlhGBofU0F
	 X1KMVEIFZBrv+0Rxm5dMNk1ZbsX/rNy8kjxZ16NhAeO6qLM4baBS3QGSZVWrqr0wBx
	 h402LohIFNk3x9eSpE+9I5qNKoHBYzgoezy5q2lgquH+vvD13+wxBOY5IpvSkqyk8B
	 i9qovk2HIjMZQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D853617E140E;
	Fri, 17 Apr 2026 11:25:20 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:50 +0300
Subject: [PATCH 16/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588-firefly-itx-3588j
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-16-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_A0 line to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI0 node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts b/arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts
index e086114c7634..00a2bebcabcb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts
@@ -322,6 +322,9 @@ &gpu {
 };
 
 &hdmi0 {
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PA0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -487,6 +490,12 @@ dp1_hpd: dp1-hpd {
 		};
 	};
 
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <4 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;

-- 
2.53.0

