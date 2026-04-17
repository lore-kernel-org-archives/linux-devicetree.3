Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3311D3B4EA3;
	Fri, 17 Apr 2026 09:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417929; cv=none; b=eb1/I5pDAHbX3LXmioqApMe8HkrFrr3fXCB0awXcBdXhTXGs/JLmPmMAeWdndYwKZg9bwPCTXOgSiutyp2/ap+AxGs3dKMA9fsZM33LNjJxT1j4+d2g1osLrLSX7jdezUcTDqhCXnIdGHlMTqkKW2MkGLRvgGcaoTlbgMJx2Tvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417929; c=relaxed/simple;
	bh=jtQEyQGL2Fv4pcwOJtIEqissSCpIvy9rVx/FpMLP1Sg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mMKXe9m7aMDtc+Cm8us8Q74mIjFcn4duVzNjU1aDzd4bqBwR8i/mLntdVCq+tp/pe5uw9/tqLfmpP9ChM3vb8fXD8iJ+8CBGgd9/HDH5tG+G+Tl1ZfJZGD6UJMPcK3abJ7d7OJd3OjU8FD4GYchb9PFh0elEKgl9kJQBgYqh/TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=n5jTS8VS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="n5jTS8VS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417926;
	bh=jtQEyQGL2Fv4pcwOJtIEqissSCpIvy9rVx/FpMLP1Sg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n5jTS8VShKH5ZnbIkeCJKFIbl3pdZ6Yle17DPFwUlmuUm6teilQOIE3XHfsRvdrkA
	 Q0dBFfIv9fMwP0xwFMzJ+Z3U3UT6dngqenrNDSpCCPU1KP+kCIftIGjIacA2PXWP7f
	 7Gh+EPujUQYiDwUWytVHRRKv/o/VOXKwPo95e40SP8zIskO9FJN2z+Os1jwcAud3sF
	 vW2eWV5cVvzDp4hzn+H1rnfFpIV18U8CxIJ1wCHQpEoBq+0Fjqq5f1JzGeopCB5/Zx
	 xhnJcVHYXVC52Aq6OFz5Y68OTKVcboOuGqmMWIYy62xLrTBxECah1LKqWFQi/OxqGh
	 6WActtVH2xq7A==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A488117E0CA9;
	Fri, 17 Apr 2026 11:25:26 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:57 +0300
Subject: [PATCH 23/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588-orangepi-5-plus
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-23-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_B1 and GPIO4_B2 lines to control the voltage
bias on the data lines for the HDMI0 and HDMI1 ports.  These lines must
be asserted when operating in HDMI 2.1 FRL mode and deasserted for HDMI
1.4/2.0 TMDS mode.

Wire up both HDMI ports to their respective GPIO lines using the
frl-enable-gpios property to allow adjusting the bias when transitioning
between TMDS and FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
index 9950d1147e12..3a8d19ec8bd8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
@@ -121,6 +121,9 @@ &fan {
 };
 
 &hdmi0 {
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -141,6 +144,9 @@ hdmi0_out_con: endpoint {
 };
 
 &hdmi1 {
+	pinctrl-0 = <&hdmim2_tx1_cec &hdmim0_tx1_hpd
+		     &hdmim1_tx1_scl &hdmim1_tx1_sda &hdmi1_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -278,6 +284,16 @@ &pcie2x1l2 {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		hdmi1_frl_en: hdmi1-frl-en {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.53.0

