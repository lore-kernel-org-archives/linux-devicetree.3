Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEEA3C0604;
	Fri, 17 Apr 2026 09:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417924; cv=none; b=H0NkWFbjQBM/eJhq5os/9CaU5iXcq4s8Kz3rzAKF0bVouO5EZ5H2BETZPmnbCCU1pqy5HVWkF1uy5AYSqTd1zTSRrh2cYSjAGkurKkWEygubW7bHPPjHdOeoLsofaKILtx2jE1qDH6DLaLAdHO23llR8M7eUGFkhm+lIatzB0Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417924; c=relaxed/simple;
	bh=4yKcJfVZyqqO/Lr0Vn8gGg8pIxqYUH/CVJ1JBGl9sfg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bs2U2wnXfGZr7K+N1qb4RByUCnaZi2mNLNlGzYaEy0aPtP/VAw8rk+HxUO+3fZhvCcfYJhV3DFvy9rRHei3RPXLiBav5BBIrvrtaRRPfiOsSa7XFrepHIwgHy5qjYl/vWG638S2pYVgOwnRMRQK51nhgolYYzWpY3PY675S2Wxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CqgmB/eC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CqgmB/eC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417920;
	bh=4yKcJfVZyqqO/Lr0Vn8gGg8pIxqYUH/CVJ1JBGl9sfg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CqgmB/eC2y0HjZev8B9T/yDf9xL/yrSb08aJ8O3L6wvyjdYGxbMcfNnO9YsMBdm8b
	 tBn9c3VGlz0wbZLZBCVvkbay77ymo/Zs2U5kCFABLEPTy249ofBkGN71xTT7eRJgm/
	 3vUTlsyAwPZt96zZqWifRZFSEBw8EX0SP6Iv5SGsxoB+hYSKChdgGZi1EF1QZ/9G56
	 SR4scSniroHgXP1szOuJT0JfapKqSAQxNjtuB4nB2hiap7MAfKDaSR6lp1lkov3s7b
	 J1VB2ss/mmgxTcirU1vVgFDuUdmMAmhQyXg87vR4Eeyu9gyYt5eLy9PdZ4G12Yaijo
	 N3KAyxx1Q92lw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1074917E1396;
	Fri, 17 Apr 2026 11:25:20 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:49 +0300
Subject: [PATCH 15/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588-evb2-v10
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-15-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO3_C5 line to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI0 node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts b/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts
index 60ba6ac55b23..42f46b61c585 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts
@@ -143,6 +143,9 @@ &gpu {
 };
 
 &hdmi0 {
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio3 RK_PC5 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -183,6 +186,12 @@ &pd_gpu {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <3 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up>;

-- 
2.53.0

