Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4463B635E;
	Fri, 17 Apr 2026 09:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776417947; cv=none; b=gsEApWlVWFitL2/paCCo2eMIlNOYDbVBc1/7lF/xTLBcotDzd0NOU+73vJUcX4/Q6Wy+bcMe+WcuXX8ABfTsP0olGoj/4FNJk+3jcAVdCIr2BP6u6TNnAai4kp1ypLYRhds4kWW4X1kRqoe+No5JlDz/SupBmEMviGEES2xAlgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776417947; c=relaxed/simple;
	bh=gFEJIrYziDLBP9dS1yxAoPLX4J+gmrbNB9JWEfrd7hU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iRcTopvM6Rnwz7cM9Ll1bz/09Yz5La4mEYPZPPkOFHQG/aXsQhdQH8sjrah2yI0ahfDugFzJqltFesZuIN15Ly2SYbgfPOF5OiWqXFQtGiPmVFw8It+sri7y3wnTM5DA8Z8/xpDpidBK/MetwoldaU+BVionAl+dMoZXhDT1duE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AEFPWBnM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AEFPWBnM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417940;
	bh=gFEJIrYziDLBP9dS1yxAoPLX4J+gmrbNB9JWEfrd7hU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AEFPWBnMnE9Y5DILJnzY1gpb8N35IZ2HvJuDBkqTRlmTBV2qZq4BmnYexvcd/a8TS
	 sFq6KgAKXrd65JtC9DTCNH3fOH8n7AfCns64qj2dQQbi44T2RljWx2BC8o9Tuq2/sC
	 md7XGFpPwJPdXKrCXT2gKOfpXJ+YdzD5os9W94T9k4LQq9d1vw9A79USnSGMQ66x1v
	 wzg+uD/v/NcnrrS4HImN9mPrmDnKNgiiW/fun9wq3Q6kWK8XrFkEOEkglnGTcVGKF/
	 ujDlwqc1fkcYi/yYfCTB1CqawtQprV9FeVRClgtMljna8hHOqvm+82Zni54m3Ya8Hf
	 +syC8OMEsI02A==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9090217E0F7F;
	Fri, 17 Apr 2026 11:25:40 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:25:14 +0300
Subject: [PATCH 40/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588s-rock-5c
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-40-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1

The board exposes the GPIO4_B6 line to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI0 node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
index 7fe42f4ff827..8ffbbc5f9b6c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
@@ -262,7 +262,9 @@ &hdmi0 {
 	pinctrl-0 = <&hdmim0_tx0_cec
 		     &hdmim1_tx0_hpd
 		     &hdmim0_tx0_scl
-		     &hdmim0_tx0_sda>;
+		     &hdmim0_tx0_sda
+		     &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -461,6 +463,12 @@ &pd_gpu {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	leds {
 		led_pins: led-pins {
 			rockchip,pins = <3 RK_PC4 RK_FUNC_GPIO &pcfg_pull_none>,

-- 
2.53.0

