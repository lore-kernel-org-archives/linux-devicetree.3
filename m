Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75B83CF69B;
	Fri, 17 Apr 2026 09:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417932; cv=none; b=PCea3nlk6njfs99V4RH+Kl2XHtYEx16PY5kx0a1IfYEQloAEnl0rhHSMA2+O4ehOjJbUvsfvYCAwR7jLuustQnzJ4GcBM9MtEXZudQKnzbz8QUBNyCLRbTq2AqDnsCcqG3Zgtuu2GjygEk89zV1OBV1+FueZsgv196+KSnAtce4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417932; c=relaxed/simple;
	bh=Y4Y7VbsW5TifY4+vjA71M9IRvPES5OLSFIKw/ni17Ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q46Uec+9C1whCUGZtZQRNVzllSmChWRl/oeUDMu5sunPILro2nd58KikKfzvf7mNEa2fk5cVJ5NjGYCewY/VHZtZjRy27urMa7B1hkj2UkzFt+3B5YRzG/s7NlBExFagDmY/iKKmzBC+/6ubR+Kw+9fTCE0EKEPIqIrsDxU/3EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nXIEsiTm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nXIEsiTm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417929;
	bh=Y4Y7VbsW5TifY4+vjA71M9IRvPES5OLSFIKw/ni17Ng=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nXIEsiTmsgTFtkztQlyfSFzXMaiZmOsE+o6PgPRrX+BormzVo0Z7rAc7DoDBidcjt
	 Ir/EF6G3556SWi8bE2IB6vIakU0BPXQL6nJJXaVfH+X3b/AvwPG2ae/sKPO0cjCAtG
	 QNRHIAxbJUKSiPVG3J2isZ5xcUVUVaJ7DUjUWHxaHWcgGrNMv0I8jMFmVCyRG3mBti
	 gTZgY+QTTF3fVZxc6klSS5BXJu7PRlmrsByx1lZIYAYx8dDt+YazcgdHUzsNrKgwvV
	 ol7WrJcyWchHfjoxvpvQeKwG79+RSiFGZoP20iCmF2eI3r8Dlerzgs0s05f0UXmK2K
	 9oHI75vtl2dPA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 23DEA17E1274;
	Fri, 17 Apr 2026 11:25:29 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:25:00 +0300
Subject: [PATCH 26/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588-rock-5-itx
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-26-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_B1 line to control the voltage bias on the
HDMI1 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI1 node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
index f7dd01d6fa0a..1f4c1eb7a8c6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
@@ -347,7 +347,8 @@ &gpu {
 
 &hdmi1 {
 	pinctrl-0 = <&hdmim0_tx1_cec &hdmim0_tx1_hpd
-		     &hdmim1_tx1_scl &hdmim1_tx1_sda>;
+		     &hdmim1_tx1_scl &hdmim1_tx1_sda &hdmi1_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -696,6 +697,12 @@ &pd_gpu {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi1_frl_en: hdmi1-frl-en {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		rtc_int: rtc-int {
 			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.53.0

