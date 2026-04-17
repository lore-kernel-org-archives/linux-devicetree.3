Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D4C3CFF6A;
	Fri, 17 Apr 2026 09:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417937; cv=none; b=J2/o/VP3D5SHDcG0G7+fEiAlSBkbSiFVVlzNdF68kJdvKnpS+ejivrnhYT/DVo+E0I9hHJ6WQrwHMWFoT310VFpYLood0sLhIYsk1HFAnP6fBSnnx+/fReH9pjR3qNAFjfHt0pPm1drcacikFbwcR0/37QAiHtXpviN9LYF0BCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417937; c=relaxed/simple;
	bh=IyM686PtM7MWMxrrUm08VYL4hejq7yba1p/Jz+uu2+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RfLVq6hj02FACXWASXDnk3BpWI7LD8woxEzNwnhrmNuabZrzmOMFfQMSMq+m1dSXZSr4hM6ycTKZOtklylB25WS9XnUZtKkU5qn3QlO5GHJ+3Gj5qnQVHInbHUxY+Wu3fTml06jFctsCZaTE738O2D36hlmki7ZSY1Go8S7pIAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dwNSWemG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dwNSWemG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417934;
	bh=IyM686PtM7MWMxrrUm08VYL4hejq7yba1p/Jz+uu2+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dwNSWemG+TOskSB1TprQFZdoWCaDh3mhY5IUnuanXdL4m/ShKJKuKrlJ/c3PbzjOM
	 dW51pgC3VPZ+GDePy982CWnuBe+5rx1g1WiBJH6Eeju5bJfSb+9Kiqv93GH5HNMLXE
	 hgy7E2vSpuV0VkZe0tSybC3E0WwAnd0WdkmXvpTKWRPLSfnLle+imFLsibJ7CuC8eW
	 9R7ro1VuzQdO+6f9elTjwJHzzq3zNosry+Z6TzbsMLW2PMV408B4kkHtekZ/spBzeS
	 BQ2jczOHj1uGdBlIaj0iCWh7Bq7jVB5uIq34WkZr0UTXI+Uc6cRP1hZtaCyTVJmmwq
	 //sRyWf5O76QQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0D71317E140E;
	Fri, 17 Apr 2026 11:25:34 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:25:06 +0300
Subject: [PATCH 32/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588s-khadas-edge2
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-32-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_B1 line to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI0 node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

While at it, remove the duplicated &hdmi0_sound node.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
index 2c22abaf40a8..2076c050cd69 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
@@ -194,6 +194,9 @@ &gpu {
 };
 
 &hdmi0 {
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -217,10 +220,6 @@ &hdptxphy0 {
 	status = "okay";
 };
 
-&hdmi0_sound {
-	status = "okay";
-};
-
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0m2_xfer>;
@@ -282,6 +281,12 @@ &pd_gpu {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	vdd_sd {
 		vdd_sd_en: vdd-sd-en {
 			rockchip,pins = <1 RK_PB6 RK_FUNC_GPIO &pcfg_pull_up>;

-- 
2.53.0

