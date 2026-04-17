Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EA93D091F;
	Fri, 17 Apr 2026 09:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417934; cv=none; b=IEYQH8J0gi34TMNOurvAsmbEo3W91Fo080Z7OqucBAYcEXrYX/atoxltezqLKdjQtMmgbBnETkf2lRpjVaHDqIaBOm1FhbrzXmx/sdf1zlfD0efpq5gScs77rW9Qtk4D0Jm9s12Su0U3y9ADFihQv86njR/mCip3eWmclG4P+T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417934; c=relaxed/simple;
	bh=sIRKXMueFzrkzlpoeuajGnJ/98eQezXWQwjtfTPs/QU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kzD9BCMeIWoQiIn/0GuK750OkpQjyWC2jcC4wgdsS5QONX3W3WZK8vJflClqEmf2tOcAkZb5Khv7m5utvtgLClNIBzimL48QulWi3R73lfH/oJdqlpgYdjUstr/z3QTQnJjjW8Ry3CGp+uugt2v+HU8DbIX16eIX/Qu6RUMg5Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Kw9FyWBB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Kw9FyWBB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417930;
	bh=sIRKXMueFzrkzlpoeuajGnJ/98eQezXWQwjtfTPs/QU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Kw9FyWBBO9sjMpwOQnvwhnblcB1qFLlEXPUPu3rh9/z33qUywiVeGQ0NAi6oM6Gi6
	 lW1FQndBafI/kXeWQLBoLGjdaNG2bU3KorLAKgqJgW5Gka4L7J+nKH5f58bwPMawyZ
	 a0QMp9XCP4pVAyUPAcGyLWb/t3dJq90TPaGZZecIsOa+4kZb7L4QFX1dFahauj0yK9
	 BMHVtnwbD0mnKn/0X11OeIA76g1svCLQJO+4HQ+QpjxKIJqpvPphR3qz12Nf3BGv1K
	 BUu13n4lUAzvmsxXQt7d4+vs0MLNOAP1QN6Bq0hHb+AhFpsRGl94S/9HxqsS9CwZzw
	 g2ZrMIAxyAmIw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C215A17E1380;
	Fri, 17 Apr 2026 11:25:30 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:25:02 +0300
Subject: [PATCH 28/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588-tiger
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-28-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO0_D3 line to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI0 node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts | 3 ++-
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi       | 9 ++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
index caa43d1abf17..8401f7bebe86 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
@@ -173,7 +173,8 @@ &hdmi0 {
 	 * connected on Haikou itself.
 	 */
 	pinctrl-names = "default";
-	pinctrl-0 = <&hdmim0_tx0_hpd &hdmim1_tx0_scl &hdmim1_tx0_sda>;
+	pinctrl-0 = <&hdmim0_tx0_hpd &hdmim1_tx0_scl &hdmim1_tx0_sda
+		     &hdmi0_frl_en>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
index a0e97481afb7..ea0be7b6c935 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
@@ -150,7 +150,8 @@ &gpu {
 &hdmi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&hdmim1_tx0_cec &hdmim0_tx0_hpd &hdmim1_tx0_scl
-		     &hdmim1_tx0_sda>;
+		     &hdmim1_tx0_sda &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio0 RK_PD3 GPIO_ACTIVE_LOW>;
 };
 
 &i2c1 {
@@ -349,6 +350,12 @@ eth_reset: eth-reset {
 		};
 	};
 
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	leds {
 		module_led_pin: module-led-pin {
 			rockchip,pins = <1 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.53.0

