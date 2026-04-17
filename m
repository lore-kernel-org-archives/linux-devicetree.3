Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AB13BC669;
	Fri, 17 Apr 2026 09:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417920; cv=none; b=b88TpJlCAcsrgEC4H0dvv75ew7zr1leQHlLiHAOGSQlyWMcu1f9grMrOcppc7AzeTszHZRP0IUfzK6Vsa5khJsJYCAnzwITjABRAChQlAwU0ezOHvWZGnsVfSbhN9YRghlCGKyvyPiiZTV1JvlXsh1BDqQrcEGSzAv9TFmgmlFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417920; c=relaxed/simple;
	bh=8T7IXqJd/oqNIWmMu1eOW8FnXvJVDkiLGNcSjdNuvv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TFI8hkj2h8ycxoWdL4+EjQpitzqE/lMeLS9HdfPenAFnfFJ3+11uDIlPBlZ8M8FM1NtdygXq09hCZOXKzVKLrdofaWeKGMRYanBsuclT3KQJna4crxHGiLkjD+yXdcZEnYakdshhQtFSHrENF/sTGZa2ACNQfZ1iw3uAXP/ih+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cEs4a7yh; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cEs4a7yh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417917;
	bh=8T7IXqJd/oqNIWmMu1eOW8FnXvJVDkiLGNcSjdNuvv4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cEs4a7yhO1loD5WSoNm51MVMr+ZB80XoT/1nRvDe/4e6w2SuAdzG/r7cKpoJVEkxh
	 r+6+axKYD+yXZIi23YsYuaT1gZTU0b103qhcYDwF5kjZYlPZm3SlevXEQvLDkYaQIr
	 DkjxQic2RV6Rt48BCth7u6GkAN2EtKnBgtNgI1JBkRBOYyBPY+M2rKG7T0oAagNc7c
	 UesZ1Keh+KVE/0JRIoCthn2yuPEYr5akyrGYSY4/uwPHio5HQ4gclaL4twzzYfcNcp
	 U4RAaDwhzLLsc0rCMiyrBgoxsFD30QV/Il4BNxBuZ+MzeStXHl7EyXO6NnD6LE/kWu
	 nWgG+dTUkVEcA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 95EBA17E137E;
	Fri, 17 Apr 2026 11:25:17 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:46 +0300
Subject: [PATCH 12/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588-coolpi-cm5-evb
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-12-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_B0 and GPIO4_B2 lines to control the voltage
bias on the data lines for the HDMI0 and HDMI1 ports.  These lines must
be asserted when operating in HDMI 2.1 FRL mode and deasserted for HDMI
1.4/2.0 TMDS mode.

Wire up both HDMI ports to their respective GPIO lines using the
frl-enable-gpios property to allow adjusting the bias when transitioning
between TMDS and FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
index 3d5c8b753208..9555df43f339 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts
@@ -125,6 +125,9 @@ vcc5v0_usb30_otg: regulator-vcc5v0-usb30-otg {
 };
 
 &hdmi0 {
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -146,7 +149,9 @@ hdmi0_out_con: endpoint {
 
 &hdmi1 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&hdmim2_tx1_cec &hdmim0_tx1_hpd &hdmim1_tx1_scl &hdmim1_tx1_sda>;
+	pinctrl-0 = <&hdmim2_tx1_cec &hdmim0_tx1_hpd &hdmim1_tx1_scl &hdmim1_tx1_sda
+		     &hdmi1_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -211,6 +216,16 @@ &pcie3x4 {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		hdmi1_frl_en: hdmi1-frl-en {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	lcd {
 		lcdpwr_en: lcdpwr-en {
 			rockchip,pins = <1 RK_PC4 RK_FUNC_GPIO &pcfg_pull_down>;

-- 
2.53.0

