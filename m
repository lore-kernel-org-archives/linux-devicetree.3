Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BE23BD65D;
	Fri, 17 Apr 2026 09:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417921; cv=none; b=O2ssj9jb90PpnHBcRPrYqH0qtIZw9Jtp4XPUwhW8cy/+Zb0vNXoBhvfZ8hONLpSD4OrcQEBqdrUHyXy0lYaRNm1oQ0NH/KF2gtWpbhlGZaqSRIgUaYtlMAjVvBR682cUhdaZgKI6a4e7i8+oHIcQchelM/yIWslmRWiSmS8kUYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417921; c=relaxed/simple;
	bh=i03QSgsLF5E/yusWvTVjnxAqa+mB23IghlD4UnOHuk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kib8804W5N40IJAjdUZFIviq7SyQf+wA6c0Sd0hhNM2CxpIpcifsXxki8SOl1u92N0hgchzAyCBaSyyOIf1mg/mIbyktOUoBQ7cjqBJnvRImDJcf9tl2vkvJ3XDKDxvyA/MU3VZZ0v/HA0kjAdm98kV9oQilUzhmrCNg1KXbLWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JqUzC2nH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JqUzC2nH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417918;
	bh=i03QSgsLF5E/yusWvTVjnxAqa+mB23IghlD4UnOHuk0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JqUzC2nH6HZf3cI1bqTLB1XtP6kqy2ALJV+ytdwbeZN0Cn46g3QBOYQJkOzNM0HIb
	 k6xqI2KC4nFtj9UwoNCQm1I+ihp0SNJ+z9qNWiSBUhjrHWJKHA9tp0kJEi4T7kco6Y
	 n02auH7ygiv034WKia4kSDOmPPMfoprYba1NPRZjQCbAAZXqF4HT0jnWeN3KCDtAbZ
	 MFbb6PieVoBDrv/kiSyDbn5Wdr46BjsdZI8eDizwiMDMnEHgNMT6vi0iDvNYaNmANy
	 PoSwomIILM0FkvJSMv2wIC5UX73k9PPSE4I9oXZoyhIxTmjovtPJctxk0Yv0LhZoDJ
	 fbCly3T2UbTrQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6ED7517E1380;
	Fri, 17 Apr 2026 11:25:18 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:47 +0300
Subject: [PATCH 13/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588-coolpi-cm5-genbook
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-13-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_B0 line to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI0 node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
index 738637ecaf55..2d6f268aa096 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts
@@ -184,7 +184,9 @@ edp_out_panel: endpoint {
 
 /* HDMI CEC is not used */
 &hdmi0 {
-	pinctrl-0 = <&hdmim0_tx0_hpd &hdmim0_tx0_scl &hdmim0_tx0_sda>;
+	pinctrl-0 = <&hdmim0_tx0_hpd &hdmim0_tx0_scl &hdmim0_tx0_sda
+		     &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -277,6 +279,12 @@ &pcie3x4 {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	lcd {
 		lcdpwr_en: lcdpwr-en {
 			rockchip,pins = <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_down>;

-- 
2.53.0

